package pynq

import chisel3._
import chisel3.util._

import scala.collection.immutable.ListMap


class AxisConfig {
	val width = 64
	val bit_count = (width + 7) / 8
}

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

// class Coverage(conf: CoverageConfig) extends Module {
// 	val io = this.IO(new ListBundle {
// 		ListMap(""
// 	})
// }

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
	})

	val dut = Module (new DUT (new DUTConfig (new CoverageConfig) ) )

	// do NOT accept any data from producer
	io.s_axis_tready := false.B

	// produce constant value
	io.m_axis_tvalid := true.B
	//io.m_axis_tdata := "h19931993".U
	io.m_axis_tdata := dut.io.coverage
	io.m_axis_tkeep := ((1 << axis.bit_count) - 1).U
	// TODO: tlast @ true means that DMA will only copy one value ....
	io.m_axis_tlast := true.B
}

object HarnessGenerator extends App {
	chisel3.Driver.execute(args, () => new Harness())
}

