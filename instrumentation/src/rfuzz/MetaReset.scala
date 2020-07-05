
package rfuzz

import firrtl.Mappers._
import firrtl.Utils.throwInternalError
import firrtl._
import firrtl.analyses.InstanceGraph
import firrtl.ir._
import firrtl.passes.RemoveValidIf

// Add a meta-reset to all registers
class AddMetaResetTransform extends Transform {
  def inputForm = LowForm
  def outputForm = LowForm

  val metaResetPort = Port(NoInfo, "metaReset", Input, Utils.BoolType)
  val metaResetInput = WRef(metaResetPort.name, metaResetPort.tpe, PortKind, SourceFlow)
  def metaResetInstPort(inst: WDefInstance) = {
    val instRef = WRef(inst.name, inst.tpe, InstanceKind, DuplexFlow)
    WSubField(instRef, metaResetPort.name, metaResetPort.tpe, SourceFlow)
  }
  val metaResetSinkRef = metaResetInput.copy(flow = SinkFlow)

  // Make a firrtl util
  private def getZero(tpe: Type): Literal = tpe match {
    case gtpe: GroundType =>
      RemoveValidIf.getGroundZero(gtpe).map { w: Width => gtpe.width }.asInstanceOf[Literal]
    case other => throwInternalError(s"Unexpected non-GroundType $other")
  }

  private def onStmt(modType: Map[String, Type])(stmt: Statement): Statement =
    stmt.map(onStmt(modType)) match {
      case reg: DefRegister =>
        if (reg.reset != Utils.zero) {
          throwInternalError(s"Resets must have been removed! Got ${reg.serialize}")
        }
        val zero = getZero(reg.tpe)
        reg.copy(reset = metaResetInput, tpe = zero.tpe, init = zero)
      case inst: WDefInstance if (modType.contains(inst.module)) =>
        val instx = inst.copy(tpe = modType(inst.module))
        val con = Connect(NoInfo, metaResetInstPort(instx), metaResetInput)
        Block(Seq(instx, con))
      case other => other
    }
  private def onMod(modType: Map[String, Type])(m: Module): Module = {
    val portsx = metaResetPort +: m.ports
    val bodyx = onStmt(modType)(m.body)
    m.copy(ports = portsx, body = bodyx)
  }
  def cleanup: Seq[Transform] = Seq(firrtl.transforms.RemoveReset)

  def execute(state: CircuitState): CircuitState = {
    val modSet = state.circuit.modules.collect({ case m: Module => m }).toSet
    val modsLeafToRoot = (new InstanceGraph(state.circuit)).moduleOrder.reverse
    val (modsUpdate, _) =
      modsLeafToRoot.foldLeft((Map.empty[String, DefModule], Map.empty[String, Type])) {
        case ((acc, types), m) => m match {
          case mod: Module =>
            val modx = onMod(types)(mod)
            (acc + (modx.name -> modx), types + (modx.name -> Utils.module_type(modx)))
          case ext: ExtModule => (acc, types)
        }
      }
    // Maintain order
    val modsx = state.circuit.modules.map(m => modsUpdate.getOrElse(m.name, m))
    val res = state.copy(circuit = state.circuit.copy(modules = modsx))
    cleanup.foldLeft(res) { case (in, xform) => xform.runTransform(in) }
  }
}

