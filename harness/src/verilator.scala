// Copyright 2017 Kevin Laeufer <laeufer@cs.berkeley.edu>
package pynq
import chisel3._
import chisel3.util._

// This file contains an adaptor to interface the DUT with our
// C++ verilator testbench.
// The adaptor works on a byte level and thus keeps us sane by not
// having to reason about endianess in the C++ toplevel.


class VerilatorHarness(dut_conf: DUTConfig) extends Module {
	// 64bit alignment
	val word_byte_count = 8
	def bits_to_words(bits: Int) = div2Ceil(div2Ceil(bits, 8), word_byte_count)
	def normalize_to_bytes(bits: Int) = bits_to_words(bits) * word_byte_count

	// select coverage generator
	//val cov_gen = new TrueCounterGenerator(1)
	val cov_gen = new TrueOrFalseLatchGenerator

	val coverage_bits = cov_gen.bits(dut_conf.coverageSignals)
	val coverage_byte_count = normalize_to_bytes(coverage_bits)
	val input_byte_count = normalize_to_bytes(dut_conf.inputBits)
	println(s"coverage_byte_count: $coverage_byte_count")
	println(s"input_byte_count: $input_byte_count")

	val io = this.IO(new Bundle {
		val input_bytes = Input(Vec(input_byte_count, UInt(8.W)))
		val coverage_bytes = Output(Vec(coverage_byte_count, UInt(8.W)))
	})
	val dut = Module(new DUT(dut_conf))

	// inputs
	val input_bytes = Cat(io.input_bytes)
	val input_width = input_byte_count * 8
	dut.io.inputs := input_bytes(input_width-1, input_width - dut_conf.inputBits)

	// coverage
	val connect_coverage = true.B
	val coverage = cov_gen.cover(connect_coverage, dut.io.coverage)
	println(s"coverage width: ${coverage.getWidth}")
	require(coverage.getWidth == coverage_bits)

	// TODO: clean up code
	var left = coverage.getWidth - 1
	io.coverage_bytes.map{ case(cov) =>
		val right = left - 8 + 1
		cov := { if(right >= 0) {        coverage(left, right)
		} else if(7 + right >= 0) {  Cat(coverage(left, 0), 0.U((-right).W))
		} else {                         0.U
		}}
		left = left - 8
	}
}
