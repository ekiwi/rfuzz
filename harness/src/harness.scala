package pynq

import chisel3._
import chisel3.util._
import chisel3.experimental.withReset

import scala.collection.immutable.ListMap

// WARN: all circuts designed with 64bit AXIS interface in mind

object div2Ceil {
	def apply(dividend: Int, divisor: Int): Int = (dividend + divisor - 1) / divisor
}

class WrappingCounter(width : Int) extends Module {
	val io = this.IO(new Bundle {
		val enable = Input(Bool())
		val max = Input(UInt(width.W))
		val value = Output(UInt(width.W))
		val last = Output(Bool())
	})
	val count = RegInit(0.U(width.W))
	io.value := count
	io.last := count === io.max
	count := Mux(!io.enable, count, Mux(io.last, 0.U, count + 1.U))
}

class TestExecControl extends Bundle {
	val run_cycles = Input(UInt(16.W))
	val test_count = Input(UInt(16.W))
}

class DUTDriverInterface(input_width: Int) extends Bundle {
	// TODO: why does this fail when wrapped in Input(...)?
	val data = DeqIO(UInt(input_width.W))
	val start_next = Input(Bool())
	val ready_next = Output(Bool())
	override def cloneType: this.type = new DUTDriverInterface(input_width).asInstanceOf[this.type]
}

object Convert64BitEndianess {
	def apply(in : UInt) : UInt = {
		require(in.widthKnown)
		// TODO: how do we get the width?
		val width = 64
		// bytes from right to left
		val bytes = for(ii <- 0 until (width/8)) yield in(((ii+1) * 8) - 1, ii * 8)
		// concat bytes from left to right
		Cat(bytes)
	}
}

object HarnessGenerator extends App {
	require(args.length > 0, "Please provide the toml form the instrumentation pass as argument!")
	val conf = Config.loadToml(args(0))
	println(s"Conf: ${conf}")
	chisel3.Driver.execute(args, () => new VerilatorHarness(conf))
}

