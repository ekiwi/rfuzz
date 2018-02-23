
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

/** Uses Firrtl's Wiring Transform to wire profiling signals in rocket-chip to the top
  *
  * Cover points are expected to be of the form: printf(..., "COVER:..." signal)
  * Assertions are expected to be of the form: printf(..., "Assertion...")
  */
class ProfilingTransform extends Transform {
  def inputForm = MidForm
  def outputForm = MidForm

  case class ProfileConfig(topPortName: String)(
      // Returns the optionally mutated input statement and any expressions
      // that should be extracted to the top for profiling
      val processStmt: PartialFunction[Statement, (Statement, Seq[Expression])]
  )

  def containsMux(stmt: Statement): Boolean = {
    var muxFound = false
    def containsMux(expr: Expression): Expression = expr.map(containsMux) match {
      case m: Mux =>
        muxFound = true
        m
      case other => other
    }
    stmt.map(containsMux)
    muxFound
  }
  def extractMuxConditions(stmt: Statement): Seq[Expression] = {
    val conds = mutable.ArrayBuffer.empty[Expression]
    def onExpr(expr: Expression): Expression = expr.map(onExpr) match {
      case mux @ Mux(cond, _,_,_) =>
        conds += cond
        mux
      case other => other
    }
    stmt.map(onExpr)
    conds
  }

  val coverageConfig = ProfileConfig("func_cover_out") {
    case Print(_, slit, Seq(pred), _, en) if slit.string.startsWith("COVER:") =>
      (EmptyStmt, Seq(And(pred, en)))
  }
  val assertConfig = ProfileConfig("assert_out") {
    case Print(_, slit, _, _, en) if slit.string.startsWith("Assertion") =>
      (EmptyStmt, Seq(en))
    case _: Stop => (EmptyStmt, Seq.empty) // Remove stops
  }
  val autoCoverageConfig = ProfileConfig("auto_cover_out") {
    case stmt if containsMux(stmt) => (stmt, extractMuxConditions(stmt))
  }
  val configs = Seq(
    coverageConfig,
    assertConfig,
    autoCoverageConfig
  )

  // Hardwired constants
  val profilePinPrefix = "profilePin"

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
  private def onModule(
    mod: Module,
    top: String,
    namespace: Namespace
  ): (Module, Map[ProfileConfig, Seq[Annotation]]) = {
    // We record Annotations for each profiled signal for each profiling configuration
    val profiledSignals = Map(configs.map(c => c -> mutable.ArrayBuffer.empty[Annotation]): _*)
    val localNS = Namespace(mod)

    def onStmt(stmt: Statement): Statement = {
      val stmtx = stmt.map(onStmt)
      configs.map(c => c.processStmt.lift(stmtx).map(c -> _)).flatten match {
        // No profiling on this Statement, just return it
        case Seq() => stmtx
        case Seq((config, (retStmt, signals))) =>
          val (nodes, annos) = (signals.map { expr =>
            val node = DefNode(NoInfo, localNS.newTemp, expr)
            val named = ComponentName(node.name, ModuleName(mod.name, CircuitName(top)))
            val pinName = namespace.newName(profilePinPrefix)
            assert(localNS.tryName(pinName), s"Name collision with $pinName in ${mod.name}!")
            val anno = SourceAnnotation(named, pinName)
            (node, anno)
          }).unzip
          profiledSignals(config) ++= annos
          Block(retStmt +: nodes)
        case multiple =>
          // We don't let multiple configurations match on a statement because they could have
          // different behavior for what should happen to that Statement (eg. removed vs. not
          // removed)
          throw new Exception("Error! Multiple profiling configurations trying to " +
            "profile the same Statement!")
      }
    }

    val bodyx = onStmt(mod.body)
    (mod.copy(body = bodyx), profiledSignals)
  }

  // Create sinks for all the cover points in top and cat them to a bitvector output
  def onTop(mod: Module,
            profiledSignals: Map[ProfileConfig, Seq[Annotation]]): (Module, Seq[Annotation]) = {
    val modName = ModuleName(mod.name, CircuitName(mod.name))
    val namespace = Namespace(mod)

    val (newPorts, stmts, annos) = (profiledSignals.map { case (config, sourceAnnos) =>
      // Create wires and sink annos
      val (wires, sinkAnnos) = (sourceAnnos.map { case SourceAnnotation(_, pin) =>
        val w = DefWire(NoInfo, namespace.newTemp, BoolType)
        (w, SinkAnnotation(ComponentName(w.name, modName), pin))
      }).unzip
      assert(namespace.tryName(config.topPortName))

      // Wire profiled points to top
      val numPoints = wires.size
      if (numPoints > 0) {
        val port = Port(NoInfo, config.topPortName, Output, UIntType(IntWidth(numPoints)))
        val connect = Connect(NoInfo,
          WRef(port.name, port.tpe, PortKind, MALE),
          Cat(wires.map(w => WRef(w.name, BoolType, NodeKind, MALE)): _*)
        )
        Some((port, wires :+ connect, sourceAnnos ++ sinkAnnos))
      } else {
        None
      }
    }).flatten.unzip3

    val bodyx = Block(stmts.flatten.toSeq :+ mod.body)
    val portsx = mod.ports ++ newPorts
    val modx = mod.copy(body = bodyx, ports = portsx)
    (modx, annos.flatten.toSeq)
  }

  def execute(state: CircuitState): CircuitState = {

    val top = state.circuit.modules.find(_.name == state.circuit.main).get
    val topNameS = Namespace(top) // used for pins naming

    val (modsx, profiledSignalMaps) = (state.circuit.modules.map {
      case mod: Module => onModule(mod, top.name, topNameS)
      case ext: ExtModule => (ext, Map.empty[ProfileConfig, Seq[Annotation]])
    }).unzip
    val profiledSignals =
      configs.map(c => c -> profiledSignalMaps.map(_.apply(c)).reduce(_ ++ _)).toMap

    val (Seq(topx: Module), otherMods) = modsx.partition(_.name == state.circuit.main)
    val (newTop, fullAnnos) = onTop(topx, profiledSignals)

    val circuitx = state.circuit.copy(modules = newTop +: otherMods)
    val annosx = state.annotations.getOrElse(AnnotationMap(Seq.empty)).annotations ++ fullAnnos

    state.copy(circuit = circuitx, annotations = Some(AnnotationMap(annosx)))
  }
}
