// Copyright 2017 Kevin Laeufer <laeufer@cs.berkeley.edu>
package pynq
import chisel3._
import chisel3.util._

import scala.collection.mutable

// This file contains an adaptor to interface the DUT with our
// C++ verilator testbench.
// The adaptor works on a byte level and thus keeps us sane by not
// having to reason about endianess in the C++ toplevel.

class VerilatorHarnessIO(input_byte_count: Int, coverage_byte_count: Int) extends Bundle {
	val input_bytes = Input(Vec(input_byte_count, UInt(8.W)))
	val coverage_bytes = Output(Vec(coverage_byte_count, UInt(8.W)))
	// FIXME: remove cloneType with new chisel
	override def cloneType =
          new VerilatorHarnessIO(input_byte_count, coverage_byte_count).asInstanceOf[this.type]
}

class VerilatorHarness(dut_conf: DUTConfig, counters: collection.mutable.ArrayBuffer[Config.Counter]) extends Module {
	// 64bit alignment
	val word_byte_count = 8
	def bits_to_words(bits: Int) = div2Ceil(div2Ceil(bits, 8), word_byte_count)
	def normalize_to_bytes(bits: Int) = bits_to_words(bits) * word_byte_count

	// select coverage generator
	//val cov_gen = new NGramCounterGenerator(2, 8)
	//val cov_gen = new ChangeCounterGenerator(8)
	//val cov_gen = new TrueCounterGenerator(8)
	val cov_gen = new TrueOrFalseLatchGenerator

	val coverage_bits = cov_gen.bits(dut_conf.coverageSignals.size)
	// the cycles count in front of every coverage item takes 16bit
	val coverage_byte_count = normalize_to_bytes(coverage_bits + 2 * 8) - 2
	val input_byte_count = normalize_to_bytes(dut_conf.inputBits)
	println(s"coverage_byte_count: $coverage_byte_count")
	println(s"input_byte_count: $input_byte_count")

	val io = this.IO(new VerilatorHarnessIO(input_byte_count, coverage_byte_count))
	val dut = Module(new DUT(dut_conf))

	// inputs
	val input_bytes = Cat(io.input_bytes)
	val input_width = input_byte_count * 8
	dut.io.inputs := input_bytes(input_width-1, input_width - dut_conf.inputBits)

	// coverage
	val connect_coverage = true.B
	val coverage = (dut_conf.coverageSignals zip dut.io.coverage).flatMap {
		case (cov, sig) => {
			cov_gen.cover(connect_coverage, sig)
		}
	}
	require(coverage.forall(_.getWidth == 8))
	val coverageWidth = coverage.map(cov => cov.getWidth).reduce(_+_)
	println(s"coverage width: ${coverageWidth}")
	require(coverageWidth == coverage_bits)
	val zero_bytes = io.coverage_bytes.length - coverage.size
	io.coverage_bytes := coverage ++ (0 until zero_bytes).map(_ => 0.U(8.W))

	// coverage counter metadata
	val counter_info = dut_conf.coverageSignals.zipWithIndex.flatMap {
		case (_, ii) => {
			cov_gen.meta(ii)
		}
	}
	require(counter_info.forall(_.width == 8))
	require(coverage.size == counter_info.size)
	counters ++= counter_info
}
