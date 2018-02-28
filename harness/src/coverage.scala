package pynq

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
		val counter = Module(new SaturatingCounter(counter_width))
		val last = RegInit(false.B)
		last := cover_point
		val change = cover_point =/= last
		counter.io.enable := Mux(connect, change, false.B)
		Seq(counter.io.value)
	}
	def bits(cover_points: Int) : Int = cover_points * (1 * 8)
	def meta(signal_index: Int) : Seq[Config.Counter] = {
		Seq(Config.Counter("Change", counter_width, 255, true, signal_index, signal_index))
	}
}

class TrueOrFalseLatchGenerator {
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