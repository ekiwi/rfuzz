// Copyright 2017 Kevin Laeufer <laeufer@cs.berkeley.edu>
package pynq
import chisel3._
import chisel3.util._

// This file contains an adaptor to interface the DUT with our
// C++ verilator testbench.
// The adaptor works on a byte level and thus keeps us sane by not
// having to reason about endianess in the C++ toplevel.


class VerilatorHarness(dut_conf: DUTConfig) extends Module {

	val io = this.IO(new Bundle {
		val input_bytes = Input(Vec(16, UInt(8.W)))
		val coverage_bytes = Output(Vec(16, UInt(8.W)))
	})
	val dut = Module(new DUT(dut_conf))

	// inputs
	val input_bytes = Cat(io.input_bytes)
	val input_width = 16 * 8
	dut.io.inputs := input_bytes(input_width-1, input_width - dut_conf.inputBits)

	// coverage
	val coverage = {
		var left = dut_conf.coverageCounters.size - 1
		Cat(dut_conf.coverageCounters.map{ case(_,w) => {
			val counter = Module(new SaturatingCounter(w))
			counter.io.enable := dut.io.coverage(left)
			left = left - 1
			counter.io.value
		}}.toSeq)
	}
	// TODO: clean up code
	var left = dut_conf.coverageCounters.map{ case(_,w) => w }.reduce(_+_) - 1
	io.coverage_bytes.map{ case(cov) =>
		val right = left - 8 + 1
		cov := { if(right >= 0) {        coverage(left, right)
		} else if(7 + right >= 0) {  Cat(coverage(left, 0), 0.U((-right).W))
		} else {                         0.U
		}}
		left = left - 8
	}
}
