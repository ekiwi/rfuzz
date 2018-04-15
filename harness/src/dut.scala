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
		ListMap("clock" -> Input(Clock()), "reset" -> Input(Bool()),
		        "metaReset" -> Input(Bool())) ++
		conf.input.map{ case inp => inp.name -> Input(UInt(inp.width.W)) } ++
		conf.coveragePorts.map{ case port => port.name -> Output(UInt(port.width.W)) }
		// TODO: is it ok to just ignore the output?
	}))
	setInline(conf.src,
		scala.io.Source.fromFile("../build/" + conf.src).mkString)
}

class DUT(conf: DUTConfig) extends Module {
	val io = this.IO(new Bundle {
		val meta_reset = Input(Bool())
		val inputs = Input(UInt(conf.inputBits.W))
		val coverage = Output(Vec(conf.coverageBits, Bool()))
	})
	val bb = Module(new DUTBlackBox(conf))
	val pins = bb.io.elements

	// connect clock and reset
	pins("clock") := this.clock
	pins("reset") := this.reset.toBool
	pins("metaReset") := this.io.meta_reset

	// extract inputs
	var left = conf.inputBits - 1
	conf.input.map{ case Config.Input(n,w) =>
		pins(n) := io.inputs(left, left - w + 1)
		left = left - w
	}

	// connect coverage
	val coverage = for(sig <- conf.coverageSignals) yield {
		val port = pins(sig.port)
		val bit = port.getWidth - 1 - sig.index
		port.asInstanceOf[UInt](bit)
	}
	for((cov, ii) <- coverage.zipWithIndex) {
		io.coverage(ii) := cov
	}
}
