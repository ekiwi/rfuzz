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

class DUTConfig(cov: CoverageConfig) {
	val src = "gcdcov.v"
	val name = "gcdcov"
	val input: ListMap[String, Int] = ListMap(
		"io_in_valid"  ->  1,
		"io_out_ready" ->  1,
		"io_in_bits_a" -> 32,
		"io_in_bits_b" -> 32)
	val coverage_counters = cov.counters.map{case(k,_) => k}
}

class CoverageConfig {
	val counters: ListMap[String, Int] = ListMap(
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

class DUTBlackBox(conf: DUTConfig) extends HasBlackBoxInline {
	override def desiredName = conf.name
	val io = this.IO(ListBundle( {
		ListMap("clock" -> Input(Bool()), "reset" -> Input(Bool())) ++
		conf.input.map{ case(n,w) => n -> Input(UInt(w.W)) } ++
		conf.coverage_counters.map{ case n => n -> Output(Bool()) }
		// TODO: is it ok to just ignore the output?
	}))
	setInline(conf.src,
		scala.io.Source.fromFile("../build/" + conf.src).mkString)
}

class DUT(conf: DUTConfig) extends Module {
	val input_bits = conf.input.map{case(_,w) => w}.reduce(_+_)
	val coverage_bits = conf.coverage_counters.size
	val io = this.IO(new Bundle {
		val inputs = Input(UInt(input_bits.W))
		val coverage = Output(UInt(coverage_bits.W))
	})
	val bb = Module(new DUTBlackBox(conf))

	// extract inputs
	val pins = bb.io.elements
	var left = input_bits - 1
	conf.input.map{ case(n,w) =>
		pins(n) := io.inputs(left, left - w + 1)
		left = left - w
	}
	// concatenate coverage wires
	io.coverage := Cat(conf.coverage_counters.map{ case n => pins(n).asUInt() }.toSeq)
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

