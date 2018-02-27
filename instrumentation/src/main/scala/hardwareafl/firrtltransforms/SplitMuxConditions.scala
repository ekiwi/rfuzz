package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.Mappers._

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