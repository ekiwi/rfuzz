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


// 1) reset with DUT
// 2) assert `do_collect` in first cycle after test, keep asserted!
// 3) wait for `collect_done` to be asserted
// 4) goto (1)
class Coverage(conf: CoverageConfig) extends Module {
	val out_width = 64
	// all counter output values concatenated
	val coverage_width = conf.counters.map{ case(n,w) => w }.reduce(_+_)
	// output(0) is the test id!
	val output_count = div2Ceil(coverage_width, out_width) + 1
	val test_id_width = 64

	val io = this.IO(new Bundle {
		// from DUT
		val coverage_signals = Input(UInt(conf.counters.size.W))
		// from input module
		val test_id = Input(UInt(test_id_width.W))
		val test_id_valid = Input(Bool())
		// internal control
		val do_collect = Input(Bool())
		val collect_done = Output(Bool())
		// simple axi stream producer
		val ready = Input(Bool())
		val valid = Output(Bool())
		val data  = Output(UInt(out_width.W))
		val last  = Output(Bool())
	})
	val collecting = io.do_collect

	val connect_coverage = !collecting
	val coverage = {
		var left = conf.counters.size - 1
		Cat(conf.counters.map{ case(n,w) => {
			val counter = Module(new SaturatingCounter(w))
			counter.io.enable := Mux(connect_coverage, io.coverage_signals(left), false.B)
			left = left - 1
			counter.io.value
		}}.toSeq)
	}

	val test_id = RegInit(0.U(test_id_width.W))
	when(io.test_id_valid) { test_id := io.test_id }

	val output_ii = RegInit(0.U(log2Ceil(output_count).W))
	val output_next = io.valid && io.ready
	output_ii := Mux(output_next, output_ii + 1.U, output_ii)
	io.last := output_ii === (output_count - 1).U
	val done = RegInit(false.B)
	when(io.last && output_next) { done := true.B }
	io.collect_done := done
	io.valid := collecting && !done
	io.data := MuxLookup(output_ii, 0.U, Seq( 0.U -> test_id ) ++ {
		var left = coverage_width - 1
		(1 until output_count).map{ case(ii) => ii.U -> {
			val right = left - out_width + 1
			val out = if(right >= 0) { coverage(left, right) } else {
				Cat(coverage(left, 0), 0.U((-right).W)) }
			left = left - out_width
			out }}
	})
}

