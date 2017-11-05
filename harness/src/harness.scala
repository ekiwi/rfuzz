package pynq

import chisel3._
import chisel3.util._

import scala.collection.immutable.ListMap

object ListBundle {
	def apply(el: ListMap[String, Data]): Record = {
		new Record {
			val elements: ListMap[String, Data] = el
			override def cloneType : this.type = {
				throw new Exception(s"Cloning not supported until someone explains to me what it's for!")
				this
			}
		}
	}
}

class DUT extends BlackBox {
	val io = IO(ListBundle(ListMap("io_in_ready" -> Input(Bool()))))
}

class Harness() extends Module {
	val width = 64
	val bit_count = (width + 7) / 8

	val io = this.IO(new Bundle {
		// TODO: split up into separate producer / consumer boundles
		val s_axis_tvalid = Input(Bool())
		val s_axis_tready = Output(Bool())
		val s_axis_tdata = Input(UInt(width.W))
		val s_axis_tkeep = Input(UInt(bit_count.W))
		val s_axis_tlast = Input(Bool())
		val m_axis_tvalid = Output(Bool())
		val m_axis_tready = Input(Bool())
		val m_axis_tdata = Output(UInt(width.W))
		val m_axis_tkeep = Output(UInt(bit_count.W))
		val m_axis_tlast = Output(Bool())
	})

	val dut = Module (new DUT)

	// do NOT accept any data from producer
	io.s_axis_tready := false.B

	// produce constant value
	io.m_axis_tvalid := true.B
	io.m_axis_tdata := "h19931993".U
	io.m_axis_tkeep := ((1 << bit_count) - 1).U
	// TODO: tlast @ true means that DMA will only copy one value ....
	io.m_axis_tlast := true.B
}

object HarnessGenerator extends App {
	chisel3.Driver.execute(args, () => new Harness())
}

