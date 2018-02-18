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

class DUTBlackBox(conf: DUTConfig) extends HasBlackBoxInline {
	override def desiredName = conf.name
	val io = this.IO(ListBundle( {
		ListMap("clock" -> Input(Clock()), "reset" -> Input(Bool())) ++
		conf.input.map{ case(n,w) => n -> Input(UInt(w.W)) } ++
		ListMap("coverageOut" -> Output(UInt(conf.coverageSignals.W)))
		// TODO: is it ok to just ignore the output?
	}))
	setInline(conf.src,
		scala.io.Source.fromFile("../build/" + conf.src).mkString)
}

class DUT(conf: DUTConfig) extends Module {
	val coverage_bits = conf.coverageSignals
	val io = this.IO(new Bundle {
		val inputs = Input(UInt(conf.inputBits.W))
		val coverage = Output(UInt(coverage_bits.W))
	})
	val bb = Module(new DUTBlackBox(conf))
	val pins = bb.io.elements

	// connect clock and reset
	pins("clock") := this.clock
	pins("reset") := this.reset.toBool

	// extract inputs
	var left = conf.inputBits - 1
	conf.input.map{ case(n,w) =>
		pins(n) := io.inputs(left, left - w + 1)
		left = left - w
	}
	// connect coverage
	io.coverage := pins("coverageOut")
}
