
package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.Mappers._
import firrtl.Utils.BoolType

import scala.collection.mutable

// Removes compound expressions from mux conditions
// Ensures they are a reference
// Borrows from Firrtl's SplitExpressions
class SplitMuxConditions extends Transform {
  def inputForm = MidForm
  def outputForm = MidForm

  private def isRef(expr: Expression): Boolean = expr match {
    case ref @ (_: WRef | _: WSubField | _: WSubIndex) => true
    case _ => false
  }

  private def onModule(mod: Module): Module = {
    val namespace = Namespace(mod)
    def onStmt(s: Statement): Statement = {
      val stmts = mutable.ArrayBuffer.empty[Statement]
      def onExpr(e: Expression): Expression = e map onExpr match {
        case mux @ Mux(cond, tval, fval, mtpe) if !isRef(cond) =>
          val n = DefNode(Utils.get_info(s), namespace.newTemp, cond)
          stmts.append(n)
          Mux(WRef(n.name, cond.tpe, NodeKind, MALE), tval, fval, mtpe)
        case mux: Mux =>
          mux
        case other => other
      }

      stmts += s.map(onExpr).map(onStmt)
      stmts.size match {
        case 1 => stmts.head
        case _ => Block(stmts)
      }
    }
    mod.copy(body = onStmt(mod.body))
  }
  def execute(state: CircuitState): CircuitState = {
    state.copy(circuit = state.circuit.copy(modules = state.circuit.modules map {
      case mod: Module => onModule(mod)
      case ext: ExtModule => ext
    }))
  }
}

// Important Assumption: We rely on SplitExpressions and CSE doing a good job to prevent duplicate
// cover points. Wires probably prevent all duplicates from being removed
class AutoCoverage extends Transform {
  def inputForm = LowForm
  def outputForm = LowForm
  // Hardwired constants
  val coveragePortName = "coverageOut"
  val coverPointPrefix = "_COV"

  // Helper functions that probably should be in Firrtl itself
  private def Not(expr: Expression) = {
    require(expr.tpe == BoolType, "You can only invert Boolean expressions!")
    DoPrim(PrimOps.Not, List(expr), List.empty, BoolType)
  }
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

  private def onModule(mod: Module): Module = {
    // We require mux conditions to be WRefs, thus SplitExpressions must precede this transform
    // We also assume CSE has removed duplicates
    val muxConds = mutable.LinkedHashSet.empty[WRef]
    def onExpr(expr: Expression): Expression = expr.map(onExpr) match {
      case mux: Mux =>
        val cond: WRef = mux.cond match {
          case ref: WRef => ref
          case other => throw new Exception(s"Unexpected mux condition that isn't a WRef! $other")
        }
        muxConds += cond
        mux
      case other => other
    }
    def onStmt(stmt: Statement): Statement = stmt.map(onStmt).map(onExpr)

    // collect Mux conditions
    onStmt(mod.body)
    val numCovPoints = muxConds.size * 2 // we want both sides of each mux condition

    val namespace = Namespace(mod)

    // Add coverage port
    assert(namespace.tryName(coveragePortName))
    val covPort = Port(NoInfo, coveragePortName, Output, UIntType(IntWidth(numCovPoints)))

    // Generate cover points
    val coverPoints: Seq[DefNode] = muxConds.toList.flatMap { expr =>
      val trueNode = DefNode(NoInfo, namespace.newName(coverPointPrefix), expr)
      val falseNode = DefNode(NoInfo, namespace.newName(coverPointPrefix), Not(expr))
      List(trueNode, falseNode)
    }

    // Cat cover points and connect to coverage port
    val covConnect = Connect(NoInfo,
      WRef(covPort.name, covPort.tpe, PortKind, MALE),
      Cat(coverPoints.map(node => WRef(node.name, BoolType, NodeKind, MALE)): _*)
    )

    // Add new constructs
    val portsx = mod.ports :+ covPort
    val bodyx = Block(List(mod.body) ++ coverPoints ++ List(covConnect))
    mod.copy(ports = portsx, body = bodyx)
  }
  val cleanupPasses = List(
    // This should be run by the Firrtl Verilog Emitter but currently isn't
    firrtl.passes.SplitExpressions
  )
  def execute(state: CircuitState): CircuitState = {
    require(state.circuit.modules.size == 1,
      "This custom transform currently only works on single Module designs!")
    val splitMux = new SplitMuxConditions
    //val state2 = splitMux.execute(state)
    val state2 = state
    val result = state2.copy(circuit = state2.circuit.copy(modules = state.circuit.modules map {
      case mod: Module => onModule(mod)
      case ext: ExtModule => ext
    }))
    cleanupPasses.foldLeft(result) { case (s, xform) => xform.execute(s) }
  }
}
