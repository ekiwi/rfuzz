
package hardwareafl
package firrtltransforms

import logger._
import firrtl._
import firrtl.ir._
import firrtl.annotations._
import firrtl.passes.wiring.{WiringTransform, SourceAnnotation, SinkAnnotation}
import firrtl.transforms.RemoveWires
import firrtl.Mappers._
import firrtl.PrimOps._
import firrtl.Utils.{BoolType, get_info}

// Annotations stuff
import net.jcazevedo.moultingyaml._
import firrtl.annotations.AnnotationYamlProtocol._

import scala.collection.mutable

// All of this is to workaround https://github.com/freechipsproject/firrtl/issues/547
// We remove VerilogMemDelays from the basic flow and then run it at the end
object CustomTop {
    // Mostly copied and modified from firrtl.Driver.execute
  def main(args: Array[String]): Unit = {
    val optionsManager = new ExecutionOptionsManager("custom") with HasFirrtlOptions
    assert(optionsManager.parse(args), "Something went wrong with the command-line options!")

    def firrtlConfig = optionsManager.firrtlOptions

    Logger.makeScope(optionsManager) {
      val firrtlSource = firrtlConfig.firrtlSource match {
        case Some(text) => text.split("\n").toIterator
        case None =>
          if (optionsManager.topName.isEmpty && firrtlConfig.inputFileNameOverride.isEmpty) {
            val message = "either top-name or input-file-override must be set"
            Driver.dramaticError(message)
            throw new Exception(message)
          }
          if (
            optionsManager.topName.isEmpty &&
              firrtlConfig.inputFileNameOverride.nonEmpty &&
              firrtlConfig.outputFileNameOverride.isEmpty) {
            val message = "inputFileName set but neither top-name or output-file-override is set"
            Driver.dramaticError(message)
            throw new Exception(message)
          }
          val inputFileName = firrtlConfig.getInputFileName(optionsManager)
          try {
            io.Source.fromFile(inputFileName).getLines()
          }
          catch {
            case _: java.io.FileNotFoundException =>
              val message = s"Input file $inputFileName not found"
              Driver.dramaticError(message)
              throw new Exception(message)
          }
      }

      val annos = Driver.loadAnnotations(optionsManager)

      val parsedInput = Parser.parse(firrtlSource, firrtlConfig.infoMode)

      // Does this need to be before calling compiler?
      optionsManager.makeTargetDir()

      val compiler = new CustomVerilogCompiler
      val finalState = compiler.compile(
        CircuitState(parsedInput,
                     ChirrtlForm,
                     Some(AnnotationMap(annos))),
        firrtlConfig.customTransforms
      )

      // Do emission
      // Note: Single emission target assumption is baked in here
      // Note: FirrtlExecutionSuccess emitted is only used if we're emitting the whole Circuit
      val emittedRes = firrtlConfig.getOutputConfig(optionsManager) match {
        case SingleFile(filename) =>
          val emitted = finalState.getEmittedCircuit
          val outputFile = new java.io.PrintWriter(filename)
          outputFile.write(emitted.value)
          outputFile.close()
          emitted.value
        case OneFilePerModule(dirName) =>
          val emittedModules = finalState.emittedComponents collect { case x: EmittedModule => x }
          if (emittedModules.isEmpty) throw new Exception()
          emittedModules.foreach { module =>
            val filename = optionsManager.getBuildFileName(firrtlConfig.outputSuffix, s"$dirName/${module.name}")
            val outputFile = new java.io.PrintWriter(filename)
            outputFile.write(module.value)
            outputFile.close()
          }
          "" // Should we return something different here?
      }

      // If set, emit final annotations to a file
      optionsManager.firrtlOptions.outputAnnotationFileName match {
        case "" =>
        case file =>
          val filename = optionsManager.getBuildFileName("anno", file)
          val outputFile = new java.io.PrintWriter(filename)
          finalState.annotations.foreach {
            finalAnnos => outputFile.write(finalAnnos.annotations.toYaml.prettyPrint)
          }
          outputFile.close()
      }
    }
  }
}

class CustomLowFirrtlOpt extends LowFirrtlOptimization {
  override def transforms: Seq[Transform] = {
    // Lets do this programmatically
    super.transforms.filterNot(_ == passes.memlib.VerilogMemDelays)
  }
}

class CustomVerilogCompiler extends VerilogCompiler {
  override def transforms: Seq[Transform] = {
    // Lets do this programmatically
    super.transforms.map {
      case _: LowFirrtlOptimization => new CustomLowFirrtlOpt
      case other => other
    }
  }

  // Copied from firrtl.Utils
  private def time[R](block: => R): (Double, R) = {
    val t0 = System.nanoTime()
    val result = block
    val t1 = System.nanoTime()
    val timeMillis = (t1 - t0) / 1000000.0
    (timeMillis, result)
  }

  // We ensure VerilogMemDelays only runs at the very end
  override def compile(state: CircuitState, customTransforms: Seq[Transform]): CircuitState = {
    val allTransforms = CompilerUtils.mergeTransforms(transforms, customTransforms) ++ 
      Seq(new LowFirrtlOptimization, emitter)

    logger.warn("Running transforms:" + allTransforms.map(_.name).mkString("\n  ", "\n  ", ""))

    val (timeMillis, finalState) = time {
      allTransforms.foldLeft(state) { (in, xform) => xform.runTransform(in) }
    }

    logger.error(f"Total Custom FIRRTL Compile Time: $timeMillis%.1f ms")

    finalState
  }
}
