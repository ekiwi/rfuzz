
package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.annotations._
import firrtl.passes.wiring.SourceAnnotation
import firrtl.Mappers._
import firrtl.PrimOps._
import firrtl.Utils.{BoolType, get_info}

import ProfilingTransform._

import java.text.SimpleDateFormat
import java.util.Date

import scala.collection.mutable


// TODO: this is realtively decoupled from the instrumentation pass
//       -> maybe move into separate file
object TomlGenerator {
  case class TestInput(name: String, width: Int)
  case class DebugInfo(filename: String, line: Int, col: Int)
  def getWidth(port: Port) : Int = {
    port.tpe match {
      case gt: GroundType => {
        gt.width match {
          case iw: IntWidth => iw.width.intValue
          case _ => throw new Exception(s"Type of ${port.name} width is unexpected")
        }
      }
      case _ => throw new Exception(s"Type of ${port.name} is unexpected")
    }
  }
  def getFuzzingInputs(ports: Seq[Port]) : Seq[TestInput] = {
    val possible_inputs : Iterable[Option[TestInput]] =
    for(port <- ports) yield {
      port.direction match {
        case Input => {
          if(port.name != "clock" && port.name != "reset") {
            Some(TestInput(port.name, getWidth(port)))
          } else { None }
        }
        case _ => None
      }
    }
    // sort decending by width (TODO: is sortWith stable?)
    possible_inputs.flatten.toSeq.sortWith(_.width > _.width)
  }
  def parseFileInfo(info: FileInfo) : DebugInfo = {
    val pattern = raw":([^@:]+)@(\d+)\.(\d+)".r.unanchored
    info.info.string match {
      case pattern(filename, line, col) => DebugInfo(filename, line.toInt, col.toInt)
      case _ => throw new Exception(s"Unexpected FileInfo string: `${info.info.string}`")
    }
  }
  def getDebugInfo(info: Info) : Seq[Option[DebugInfo]] = {
    info match {
      case fi: FileInfo => Seq(Some(parseFileInfo(fi)))
      case mi: MultiInfo => mi.infos.flatMap(getDebugInfo)
      case _ => Seq()
    }
  }
  def getDebugInfo(stmt: Statement) : DebugInfo = {
    val infos = getDebugInfo(get_info(stmt)).flatten
    infos.headOption match {
      case Some(info) => info
      case None => DebugInfo("", -1, -1)
    }
  }
  def getDefinitions(mod: Module) : Map[String, IsDeclaration] = {
    val definitions = collection.mutable.HashMap[String, IsDeclaration]()
    def onStmt(stmt: Statement) : Statement = {
      stmt map onStmt
      stmt match {
        case d: DefNode     => definitions(d.name) = d
        case d: DefWire     => definitions(d.name) = d
        case d: DefRegister => definitions(d.name) = d
        case _ => None
      }
      stmt
    }
    for(port <- mod.ports) {
      definitions(port.name) = port
    }
    mod.body map onStmt
    definitions.toMap
  }
  def isGeneratedIdentifier(id: String) : Boolean = {
    // heuristic
    id.matches(raw"(_?(:?(:?T)|(:?GEN))_\d+(:?_\d+)?)")
  }
  def getHumanReadableExpression(definitions: Map[String, IsDeclaration], decl: IsDeclaration) : String = {
    decl match {
      case d: DefNode => getHumanReadableExpression(definitions, d.value)
      case d: DefWire => s"Wire(${d.name})"
      case d: DefRegister => s"Reg(${d.name})"
      case p: Port => {
        p.direction match {
          case Input => { s"In(${p.name})" }
          case Output => { s"Out(${p.name})" }
          case d => throw new Exception(s"Unexpected direction ${d}")
        }
      }
    }
  }
  def getHumanReadableExpression(definitions: Map[String, IsDeclaration], cond: Expression) : String = {
    // this is a *heuristic*
    // TODO: minimize expressions ....
    cond match {
      case ref: Reference => {
        if(isGeneratedIdentifier(ref.name)) {
          definitions.get(ref.name) match {
            case Some(d) => getHumanReadableExpression(definitions, d)
            case None => ref.name
          }
        } else { ref.name }
      }
      case ref: WRef => {
        if(isGeneratedIdentifier(ref.name)) {
          definitions.get(ref.name) match {
            case Some(d) => getHumanReadableExpression(definitions, d)
            case None => ref.name
          }
        } else { ref.name }
      }
      case lit: Literal => { s"${lit.value}" }
      case doprim: DoPrim => {
        // lot's of code similar to the Verilog Emitter .... hm
        def a0 = getHumanReadableExpression(definitions, doprim.args.head)
        def a1 = getHumanReadableExpression(definitions, doprim.args(1))
        def c0 = doprim.consts.head.toInt
        def c1 = doprim.consts(1).toInt
        doprim.op match {
          case Add  => s"(${a0} + ${a1})"
          case Addw => s"(${a0} + ${a1})"
          case Sub  => s"(${a0} - ${a1})"
          case Subw => s"(${a0} - ${a1})"
          case Mul  => s"(${a0} * ${a1})"
          case Div  => s"(${a0} / ${a1})"
          case Rem  => s"(${a0} % ${a1})"
          case Lt   => s"(${a0} < ${a1})"
          case Leq  => s"(${a0} <= ${a1})"
          case Gt   => s"(${a0} > ${a1})"
          case Geq  => s"(${a0} >= ${a1})"
          case Eq   => s"(${a0} == ${a1})"
          case Neq  => s"(${a0} != ${a1})"
          case Dshlw => s"(${a0} << ${a1})"
          case Dshl => s"(${a0} << ${a1})"
          case Dshr => s"(${a0} >> ${a1})"
          case Shlw => s"(${a0} << ${c0})"
          case Shl => s"(${a0} << ${c0})"
          case Shr => s"(${a0} >> ${c0})"
          case Neg  => s"-${a0}"
          case Not  => s"(not ${a0})"
          case And  => s"(${a0} and ${a1})"
          case Or   => s"(${a0} or ${a1})"
          case Xor  => s"(${a0} xor ${a1})"
          case Bits => s"${a0}[${c0}:${c1}]"
          case other => s"Todo(${other})"
        }
      }
      case mux: Mux => {
        val cond = getHumanReadableExpression(definitions, mux.cond)
        val tval = getHumanReadableExpression(definitions, mux.tval)
        val fval = getHumanReadableExpression(definitions, mux.fval)
        s"(${cond}? ${tval} : ${fval})"
      }
      case wsf: WSubField => {
        val expr = getHumanReadableExpression(definitions, wsf.expr)
        s"(${expr}).${wsf.name}"
      }
      case other => {
        s"Todo(${other})"
      }
    }
  }
  def apply(circuit: Circuit, profiledSignals: Map[ProfileConfig, Seq[SourceAnnotation]]) = {
  //def apply(mod: Module, coverage: Seq[(WRef,Statement)]) = {
    val top = circuit.modules.find(_.name == circuit.main).get
    val moduleDefinitions = circuit.modules.collect {
      case m: Module => m.name -> getDefinitions(m)
    }.toMap

    val output = s"${top.name}.toml"
    val out = new java.io.PrintWriter(output)

    val instrumented = s"${top.name}.v" // TODO: fix heuristic
    val filename = getDebugInfo(top.info).flatten.head.filename
    val timestamp = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX").format(new Date())
    val q = "\"" // Workaround for Vim Scala syntax highlighting
    out.println("# This file was generated by the AutoCoverage pass.")
    out.println("# It contains all information needed by the fuzzer and")
    out.println("# to generate the FPGA as well as the C++ test harness.")
    out.println(s"""[general]""")
    out.println(s"""filename = "${filename}$q""")
    out.println(s"""instrumented = "${instrumented}$q""")
    out.println(s"""top = "${top.name}$q""")
    out.println(s"""timestamp = ${timestamp}""")
    out.println()
    for(inp <- getFuzzingInputs(top.ports)) {
      out.println(s"""[[input]]""")
      out.println(s"""name = "${inp.name}$q""")
      out.println(s"""width = ${inp.width}""")
      out.println()
    }
    out.println()

    val muxConds = mutable.LinkedHashSet.empty[Expression]
    for ((config, annos) <- profiledSignals) {
      // this information helps us integrate the DUT as a BlackBox in the harness
      val portWidth = annos.size
      val portName = config.topPortName
      out.println(s"""[[port]]""")
      out.println(s"""name = "$portName$q""")
      out.println(s"""width = $portWidth""")
      out.println()

      for ((anno, index) <- annos.zipWithIndex) {
        val (mname, cond) = (anno.target: @unchecked) match {
          case ComponentName(cname, ModuleName(mname, _)) => (mname, AnnotationUtils.toExp(cname))
        }

        val definitions = moduleDefinitions(mname)
        val name = cond.serialize
        val decl = definitions(name)

        // Very hacky way to get the original mux condition
        // (instead of the node pointing to it)
        // This will break soon, but (hopefully) not tonight!
        val origMuxCond = decl.asInstanceOf[DefNode].value

        // skip reset, as it is not fuzzed at the moment
        val skip = origMuxCond.serialize == "reset" ||
        // also skip duplicate conditions
          (muxConds contains origMuxCond)

        if(!skip) {
          muxConds += origMuxCond
          val dbg = getDebugInfo(decl.asInstanceOf[Statement])
          val human = getHumanReadableExpression(definitions, cond)
          out.println(s"""[[coverage]]""")
          out.println(s"""port = "${config.topPortName}$q""")
          out.println(s"""name = "$name$q""")
          out.println(s"""index = $index""")
          out.println(s"""filename = "${dbg.filename}$q""")
          out.println(s"""line = ${dbg.line}""")
          out.println(s"""column = ${dbg.col}""")
          out.println(s"""human = "$human$q""")
          out.println()
        }
      }
    }
    out.close
  }
}

