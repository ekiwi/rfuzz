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

class DUTConfig(cov: CoverageConfig) {
	val src = "gcdcov.v"
	val name = "gcdcov"
	val input: ListMap[String, Int] = ListMap(
		"io_in_valid"  ->  1,
		"io_out_ready" ->  1,
		"io_in_bits_a" -> 32,
		"io_in_bits_b" -> 32)
	val coverage_counters = cov.counters.map{case(k,_) => k}
	val input_bits = input.map{case(_,w) => w}.reduce(_+_)
}

class DUTBlackBox(conf: DUTConfig) extends HasBlackBoxInline {
	override def desiredName = conf.name
	val io = this.IO(ListBundle( {
		ListMap("clock" -> Input(Clock()), "reset" -> Input(Bool())) ++
		conf.input.map{ case(n,w) => n -> Input(UInt(w.W)) } ++
		conf.coverage_counters.map{ case n => n -> Output(Bool()) }
		// TODO: is it ok to just ignore the output?
	}))
	setInline(conf.src,
		scala.io.Source.fromFile("../build/" + conf.src).mkString)
}

class DUT(conf: DUTConfig) extends Module {
	val coverage_bits = conf.coverage_counters.size
	val io = this.IO(new Bundle {
		val inputs = Input(UInt(conf.input_bits.W))
		val coverage = Output(UInt(coverage_bits.W))
	})
	val bb = Module(new DUTBlackBox(conf))
	val pins = bb.io.elements

	// connect clock and reset
	pins("clock") := this.clock
	pins("reset") := this.reset.toBool

	// extract inputs
	var left = conf.input_bits - 1
	conf.input.map{ case(n,w) =>
		pins(n) := io.inputs(left, left - w + 1)
		left = left - w
	}
	// concatenate coverage wires
	io.coverage := Cat(conf.coverage_counters.map{ case n => pins(n).asUInt() }.toSeq)
}
