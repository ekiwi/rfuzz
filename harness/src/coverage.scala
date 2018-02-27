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
	def cover(connect: Bool, cover_points: UInt) : UInt = {
		Cat(
			for(ii <- (0 until cover_points.getWidth).reverse) yield {
				val counter = Module(new SaturatingCounter(counter_width))
				counter.io.enable := Mux(connect, cover_points(ii), false.B)
				counter.io.value
			})
	}
	def bits(cover_points: Int) : Int = cover_points * (1 * 8)
}

class TrueOrFalseLatchGenerator {
	def cover(connect: Bool, cover_points: UInt) : UInt = {
		Cat({
			for(ii <- (0 until cover_points.getWidth).reverse) yield {
				val pos = Module(new SaturatingCounter(1))
				pos.io.enable := Mux(connect, cover_points(ii), false.B)
				val neg = Module(new SaturatingCounter(1))
				neg.io.enable := Mux(connect, ~cover_points(ii), false.B)
				Seq(0.U(7.W), pos.io.value, 0.U(7.W), neg.io.value)
			}}.flatten)
	}
	def bits(cover_points: Int) : Int = cover_points * (2 * 8)
}