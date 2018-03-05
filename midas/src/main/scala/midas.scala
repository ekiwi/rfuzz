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
  require(args.length == 4, "[usage] <DUT prefix> <build dir> <benchmark file> <output toml>")
  val dut = args(0)
  val dir = args(1)
  val benchmark = args(2)
  val outToml = args(3)

  val ir = Parser.parse(
    io.Source.fromFile(benchmark).getLines,
    Parser.AppendInfo(benchmark))
  val xforms = Seq(
    new hardwareafl.firrtltransforms.SplitMuxConditions,
    new hardwareafl.firrtltransforms.ProfilingTransform,
    new firrtl.passes.wiring.WiringTransform)
  val state = (new LowFirrtlCompiler).compile(CircuitState(ir, ChirrtlForm), xforms)

  val verilog = new FileWriter(new File(dir, s"${dut}.v"))
  (new CustomVerilogCompiler).compile(state, verilog)
  verilog.close

  val inToml = (new File(s"${dut}.toml")).toString
  val conf = Config.loadToml(inToml)
  println(s"Conf: ${conf}")
  // super hacky "out parameter" to get list of counters from Harness design
  val counters = collection.mutable.ArrayBuffer[Config.Counter]()
  MidasCompiler(
    new VerilatorHarness(conf, counters),
    new File(dir),
    customTransforms = Seq(new FuzzTransforms(state.circuit)))(
    Parameters.root(new midas.ZynqConfig))
  Config.writeAugmentedToml(inToml, outToml, counters.toSeq)
}
