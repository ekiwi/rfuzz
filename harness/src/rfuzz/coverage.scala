package rfuzz

import chisel3._
import chisel3.util._

class SaturatingCounter(width : Int) extends Module {
	val io = this.IO(new Bundle {
		val enable = Input(Bool())
		val value = Output(UInt(width.W))
	})
	val count = RegInit(0.U(width.W))
	io.value := count
	val max = ((1 << width) - 1).U
	count := Mux(!io.enable || count === max, count, count + 1.U)
}

class CoverageControl extends Bundle {
	val start_next = Input(Bool())
	val done_next = Output(Bool())
}

// Coverage Generators:
// * given a set of cover points
// * generate a set of 8bit counter outputs with TOML description

class TrueCounterGenerator(counter_width: Int) {
	def cover(connect: Bool, cover_point: Bool) : Seq[UInt] = {
		val counter = Module(new SaturatingCounter(counter_width))
		counter.io.enable := Mux(connect, cover_point, false.B)
		Seq(counter.io.value)
	}
	def bits(cover_points: Int) : Int = cover_points * (1 * 8)
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		Seq(Config.Counter("True", counter_width, 255, true, signal_index, signal_index))
	}
}

class ChangeCounterGenerator(counter_width: Int) {
	def cover(connect: Bool, cover_point: Bool) : Seq[UInt] = {
		// the counter input is only valid after one cycle!
		val valid = RegInit(false.B)
		valid := connect

		val last = RegInit(false.B)
		last := cover_point

		val counter = Module(new SaturatingCounter(counter_width))
		val change = cover_point =/= last
		counter.io.enable := Mux(valid, change, false.B)
		Seq(counter.io.value)
	}
	def bits(cover_points: Int) : Int = cover_points * (1 * 8)
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		Seq(Config.Counter("Change", counter_width, 255, true, signal_index, signal_index))
	}
}

class NGramCounterGenerator(N: Int, counter_width: Int) {
	require(N > 1)

	def delay_chain(cycles: Int, sig: Bool) : Seq[Bool] = {
		require(cycles > 0)
		val regs = for(_ <- 0 until cycles) yield { RegInit(false.B) }
		regs.head := sig
		for(ii <- 1 until cycles) {
			regs(ii) := regs(ii-1)
		}
		Seq(sig) ++ regs
	}

	def delay(cycles: Int, sig: Bool) : Bool = {
		delay_chain(cycles, sig).last
	}

	def cover(connect: Bool, cover_point: Bool) : Seq[UInt] = {
		val valid = delay(N-1, connect)

		val signal = Cat(delay_chain(N-1, cover_point))
		require(signal.getWidth == N)
		val counters = for(ii <- 0 until (1 << N)) yield {
			val counter = Module(new SaturatingCounter(counter_width))
			val cmp = (ii.U === signal)
			counter.io.enable := Mux(valid, cmp, false.B)
			counter.io.value
		}

		counters
	}
	def bits(cover_points: Int) : Int = cover_points * ((1 << N) * 8)
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		val base_i = signal_index * (1 << N)
		for(ii <- 0 until (1 << N)) yield {
			Config.Counter(s"$ii",  counter_width, 255, true, base_i+ii, signal_index)
		}
	}
}

// the output of the true or false latch has three different states
// (after running for at least one cycle):
// - 01 -> always False
// - 10 -> awlays True
// - 11 -> toggled
class TrueOrFalseLatchGenerator {
	def cover(connect: Bool, cover_point: Bool) : Seq[UInt] = {
		val pos = Module(new SaturatingCounter(1))
		pos.io.enable := Mux(connect, cover_point, false.B)
		val neg = Module(new SaturatingCounter(1))
		neg.io.enable := Mux(connect, ~cover_point, false.B)
		val count = Cat(0.U(6.W), pos.io.value, neg.io.value)
		Seq(count)
	}
	def bits(cover_points: Int) : Int = cover_points * 8
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		Seq(Config.Counter("TF", 8, 3, false, signal_index, signal_index))
	}
}

class FailCheckGenerator(fail_value: Boolean) {
	def cover(connect: Bool, cover_point: Bool) : Seq[UInt] = {
		val is_fail = cover_point === fail_value.B
		val count = Module(new SaturatingCounter(1))
		count.io.enable := Mux(connect, is_fail, false.B)
		Seq(Cat(0.U(7.W), count.io.value))
	}
	def bits(cover_points: Int) : Int = cover_points * 8
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		Seq(Config.Counter("Fail", 8, 1, false, signal_index, signal_index, true))
	}
}

// the legacy version treats the true and false counts as independent counters
class LegacyTrueOrFalseLatchGenerator {
	def cover(connect: Bool, cover_point: Bool) : Seq[UInt] = {
		val pos = Module(new SaturatingCounter(1))
		pos.io.enable := Mux(connect, cover_point, false.B)
		val pos_count = Cat(0.U(7.W), pos.io.value)
		val neg = Module(new SaturatingCounter(1))
		neg.io.enable := Mux(connect, ~cover_point, false.B)
		val neg_count = Cat(0.U(7.W), neg.io.value)
		Seq(pos_count, neg_count)
	}
	def bits(cover_points: Int) : Int = cover_points * (2 * 8)
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		val ii = signal_index * 2
		Seq(Config.Counter("True",  8, 1, false,   ii, signal_index),
		    Config.Counter("False", 8, 1, false, ii+1, signal_index))
	}
}