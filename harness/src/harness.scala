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

class DUT(conf: DUTConfig) extends HasBlackBoxInline {
	override def desiredName = conf.name
	val io = IO(ListBundle( {
		ListMap("clock" -> Input(Bool()), "reset" -> Input(Bool())) ++
		conf.input.map{ case(n,w) => n -> Input(UInt(w.W)) } ++
		conf.coverage_counters.map{ case(n,_) => n -> Output(Bool()) }
		// TODO: is it ok to just ignore the output?
	}))
	setInline(conf.src,
		scala.io.Source.fromFile("../build/" + conf.src).mkString)
}

class DUTConfig {
	val src = "gcdcov.v"
	val name = "gcdcov"
	val input = ListMap(
		"io_in_valid"  ->  1,
		"io_out_ready" -> 32,
		"io_in_bits_a" -> 32,
		"io_in_bits_b" ->  1)
	val coverage_counters = ListMap(
		"io_in_ready"          -> 8,
		"io_out_valid"         -> 8,
		"cov_valid"            -> 8,
		"cov_bits_T_43_true"   -> 8,
		"cov_bits_T_43_false"  -> 8,
		"cov_bits_T_45_true"   -> 8,
		"cov_bits_T_45_false"  -> 8,
		"cov_bits_T_54_true"   -> 8,
		"cov_bits_T_54_false"  -> 8,
		"cov_bits_start_true"  -> 8,
		"cov_bits_start_false" -> 8
	)
}

class AxisConfig {
	val width = 64
	val bit_count = (width + 7) / 8
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
	})

	val dut = Module (new DUT (new DUTConfig) )

	// do NOT accept any data from producer
	io.s_axis_tready := false.B

	// produce constant value
	io.m_axis_tvalid := true.B
	io.m_axis_tdata := "h19931993".U
	io.m_axis_tkeep := ((1 << axis.bit_count) - 1).U
	// TODO: tlast @ true means that DMA will only copy one value ....
	io.m_axis_tlast := true.B
}

object HarnessGenerator extends App {
	chisel3.Driver.execute(args, () => new Harness())
}

