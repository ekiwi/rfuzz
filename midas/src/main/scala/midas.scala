package rfuzz

import pynq._
import midas._
import firrtl._
import firrtl.ir._
import freechips.rocketchip.config.Parameters
import java.io.{File, FileWriter}

private[rfuzz] class ReplaceDUT(dut: Circuit) extends firrtl.passes.Pass {
  override def name = "[rfuzz] Replace DUT"
  
  def run(c: Circuit): Circuit = {
    c.copy(modules = dut.modules ++ (c.modules flatMap {
      case m: ExtModule if m.name == dut.main => None
      case m => Some(m) 
    }))
  }
}

private[rfuzz] class FuzzTransforms(dut: Circuit) extends SeqTransform {
  def inputForm = HighForm
  def outputForm = HighForm
  def transforms = Seq(
    new ReplaceDUT(dut),
    new IRToWorkingIR,
    firrtl.passes.InferTypes,
    firrtl.passes.CheckTypes,
    firrtl.passes.InferWidths,
    firrtl.passes.CheckWidths
  )
}

class CustomVerilogCompiler extends Compiler {
  def emitter = new VerilogEmitter
  def transforms = Seq(new LowFirrtlOptimization)
}

object MidasGenerator extends App {
  require(args.length == 4, "[usage] <build dir> <firrtl> <input toml> <output toml>")
  val dir = args(0)
  val benchmark = args(1)
  val inToml = args(2)
  val outToml = args(3)

  /*
  val state = hardwareafl.firrtltransforms.CustomTop.compile(Array(
    "-i", benchmark,
    "-o", (new File(dir, s"${dut}.v")).toString,
    "-X", "verilog",
    "-ll", "info",
    "-fct", Seq(
      "hardwareafl.firrtltransforms.SplitMuxConditions",
      "hardwareafl.firrtltransforms.ProfilingTransform",
      "firrtl.passes.wiring.WiringTransform") mkString ","))
  */

  val ir = Parser.parse(io.Source.fromFile(benchmark).getLines)
  val conf = Config.loadToml(inToml)
  println(s"Conf: ${conf}")
  // super hacky "out parameter" to get list of counters from Harness design
  val counters = collection.mutable.ArrayBuffer[Config.Counter]()
  MidasCompiler(
    new VerilatorHarness(conf, counters),
    new File(dir),
    customTransforms = Seq(new FuzzTransforms(ir)))(
    Parameters.root(new midas.ZynqConfig))
  Config.writeAugmentedToml(inToml, outToml, counters.toSeq)
}
