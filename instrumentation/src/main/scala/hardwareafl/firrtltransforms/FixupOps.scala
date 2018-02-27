
package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.Mappers._
import firrtl.PrimOps._

// Workaround for https://github.com/freechipsproject/firrtl/issues/498
class FixupOps extends Transform {
  def inputForm = LowForm
  def outputForm = HighForm

  private def onExpr(expr: Expression): Expression =
    expr.map(onExpr) match {
      case prim @ DoPrim(Dshlw,_,_,_) => prim.copy(op = Dshl)
      case prim @ DoPrim(Shlw,_,_,_) => prim.copy(op = Shl)
      case other => other
    }
  private def onStmt(stmt: Statement): Statement = stmt.map(onStmt).map(onExpr)
  private def onMod(mod: DefModule): DefModule = mod.map(onStmt)
  def execute(state: CircuitState): CircuitState = {
    state.copy(circuit = state.circuit.map(onMod))
  }
}

