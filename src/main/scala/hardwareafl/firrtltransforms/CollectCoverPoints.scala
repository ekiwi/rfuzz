
package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.annotations._
import firrtl.passes.wiring.{SourceAnnotation, SinkAnnotation}
import firrtl.Mappers._
import firrtl.PrimOps._
import firrtl.Utils.{BoolType, get_info}

import scala.collection.mutable

/** Uses Firrtl's Wiring Transform to wire cover points from rocket-chip to the top
  *
  * Cover points are expected to be of the form: printf(..., "COVER:..." signal")
  */
class CollectCoverPoints extends Transform {
  def inputForm = MidForm
  def outputForm = MidForm
  // Hardwired constants
  val coveragePortName = "funcCoverOut"
  val coverPointPrefix = "_COV"
  val tempNodePrefix = "_REF"
  val coverPointName = "coverPoint"

  //// Helper functions that probably should be in Firrtl itself
  private def Cat(exprs: Expression*) = {
    require(exprs.size > 0)
    exprs.tail.foldLeft(exprs.head) { case (next, acc) =>
      DoPrim(PrimOps.Cat, List(next, acc), List.empty, CatTypes(next.tpe, acc.tpe))
    }
  }
  private def CatTypes(tpe1: Type, tpe2: Type): Type = (tpe1, tpe2) match {
    case (UIntType(w1), UIntType(w2)) => UIntType(w1 + w2)
    case (SIntType(w1), SIntType(w2)) => UIntType(w1 + w2)
    case other => throw new Exception(s"Unexpected Types $other!")
  }
  private def And(exprs: Expression*) = {
    require(exprs.size > 0)
    exprs.tail.foldLeft(exprs.head) { case (next, acc) =>
      require(acc.tpe == BoolType)
      DoPrim(PrimOps.And, List(next, acc), List.empty, BoolType)
    }
  }

  // This namespace is based on the ports that exist in the top
  private def onModule(mod: Module, top: String, namespace: Namespace): (Module, Seq[Annotation]) = {
    val wiringAnnos = mutable.ArrayBuffer.empty[Annotation]
    val localNS = Namespace(mod)

    def onStmt(stmt: Statement): Statement = stmt.map(onStmt) match {
      case Print(_, slit, Seq(pred), _, en) if slit.string.startsWith("COVER:") =>
        // We need to and the predicate with the enable signal
        val node = DefNode(NoInfo, localNS.newName(tempNodePrefix), And(pred, en))
        val named = ComponentName(node.name, ModuleName(mod.name, CircuitName(top)))
        val pinName = namespace.newName(coverPointPrefix)
        assert(!localNS.contains(pinName), s"Name collision with $pinName in ${mod.name}!")
        val anno = SourceAnnotation(named, pinName)
        wiringAnnos += anno
        node
      case other => other
    }

    val bodyx = onStmt(mod.body)
    (mod.copy(body = bodyx), wiringAnnos)
  }

  // Create sinks for all the cover points in top and cat them to a bitvector output
  def onTop(mod: Module,
            namespace: Namespace,
            sourceAnnos: Seq[Annotation]): (Module, Seq[Annotation]) = {
    val modName = ModuleName(mod.name, CircuitName(mod.name))
    // Create wires and sink annos
    val (wires, sinkAnnos) = (sourceAnnos.map { case SourceAnnotation(_, pin) =>
      val w = DefWire(NoInfo, namespace.newName(coverPointName), BoolType)
      (w, SinkAnnotation(ComponentName(w.name, modName), pin))
    }).unzip
    assert(namespace.tryName(coveragePortName))

    // Wire cover points to top
    val numCovs = wires.size
    val covport = Port(NoInfo, coveragePortName, Output, UIntType(IntWidth(numCovs)))
    val covconnect = Connect(NoInfo,
      WRef(covport.name, covport.tpe, PortKind, MALE),
      Cat(wires.map(w => WRef(w.name, BoolType, NodeKind, MALE)): _*)
    )

    val bodyx = Block(wires :+ mod.body :+ covconnect)
    val portsx = mod.ports :+ covport
    val modx = mod.copy(body = bodyx, ports = portsx)
    (modx, sinkAnnos ++ sourceAnnos)
  }

  def execute(state: CircuitState): CircuitState = {

    val top = state.circuit.modules.find(_.name == state.circuit.main).get
    val topNameS = Namespace(top)

    val (modsx, sourceAnnos) = (state.circuit.modules.map {
      case mod: Module => onModule(mod, top.name, topNameS)
      case ext: ExtModule => (ext, Seq.empty)
    }).unzip
    val sourceAnnosx = sourceAnnos.flatten

    val (Seq(topx: Module), otherMods) = modsx.partition(_.name == state.circuit.main)
    val (newTop, fullAnnos) =
      if (sourceAnnosx.size > 0) onTop(topx, topNameS, sourceAnnosx)
      else (topx, sourceAnnosx)

    val circuitx = state.circuit.copy(modules = newTop +: otherMods)
    val annosx = state.annotations.getOrElse(AnnotationMap(Seq.empty)).annotations ++ fullAnnos

    state.copy(circuit = circuitx, annotations = Some(AnnotationMap(annosx)))
  }
}
