package pynq

import chisel3._
import chisel3.util._

import scala.collection.immutable.ListMap


object div2Ceil {
	def apply(dividend: Int, divisor: Int): Int = (dividend + divisor - 1) / divisor
}

// WARNING: do not edit! circuits are not designed to deal with different values!
class AxisConfig {
	val width = 64
	val bit_count = div2Ceil(width, 8)
}


class Harness() extends Module {
	val axis = new AxisConfig

	val io = this.IO(new Bundle {
		// TODO: split up into separate producer / consumer boundles
		val s_axis_tvalid = Input(Bool())
		val s_axis_tready = Output(Bool())
		val s_axis_tdata = Input(UInt(axis.width.W))
		val s_axis_tkeep = Input(UInt(axis.bit_count.W))
		val s_axis_tlast = Input(Bool())
		val m_axis_tvalid = Output(Bool())
		val m_axis_tready = Input(Bool())
		val m_axis_tdata = Output(UInt(axis.width.W))
		val m_axis_tkeep = Output(UInt(axis.bit_count.W))
		val m_axis_tlast = Output(Bool())

		// debug signals
		val dbg_do_collect = Input(Bool())
	})
	val cov_conf = new CoverageConfig
	val dut_conf = new DUTConfig(cov_conf)
	val dut = Module (new DUT(dut_conf) )

	val cov = Module (new Coverage(cov_conf))
	cov.io.coverage_signals := dut.io.coverage
	cov.io.do_collect := io.dbg_do_collect
	io.m_axis_tvalid := cov.io.valid
	io.m_axis_tdata  := cov.io.data
	io.m_axis_tkeep  := ((1 << axis.bit_count) - 1).U
	io.m_axis_tlast  := cov.io.last
	cov.io.ready     := io.m_axis_tready

	// do NOT accept any data from producer
	io.s_axis_tready := false.B



}

object HarnessGenerator extends App {
	chisel3.Driver.execute(args, () => new Harness())
}

