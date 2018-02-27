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

	val coverage_bits = cov_gen.bits(dut_conf.coverageSignals.size)
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
	val coverage = (dut_conf.coverageSignals zip dut.io.coverage).flatMap {
	case (cov, sig) => {
		// TODO: generate TOML
		cov_gen.cover(connect_coverage, sig)
	}
	}
	require(coverage.forall(_.getWidth == 8))
	val coverageWidth = coverage.map(cov => cov.getWidth).reduce(_+_)
	println(s"coverage width: ${coverageWidth}")
	require(coverageWidth == coverage_bits)
	io.coverage_bytes := coverage
}
