
package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.Mappers._
import firrtl.PrimOps._

import collection.mutable

// Flattens Block Hierchy on MidFirrtl
class FlattenStatements extends Transform {
  // But not really, better be no whens
  def inputForm = MidForm
  def outputForm = MidForm

  // Removes Block scopes and EmptyStatements
  // Assumes no whens
  private def flatten(acc: Seq[Statement], stmts: Seq[Statement]): Statement = {
    if (stmts.isEmpty) {
      if (acc.size == 1) acc.head else Block(acc)
    }
    else {
      stmts.head match {
        case _: Conditionally => throw new FIRRTLException("There should be no whens!")
        case Block(ss) => flatten(acc, ss ++ stmts.tail)
        case EmptyStmt => flatten(acc, stmts.tail)
        case s => flatten(acc :+ s, stmts.tail)
      }
    }
  }
  private def flatten(stmt: Statement): Statement = flatten(Vector(), List(stmt))

  private def onMod(mod: DefModule): DefModule = mod match {
    case m: Module => m.copy(body = flatten(m.body))
    case m: ExtModule => m
  }
  def execute(state: CircuitState): CircuitState = {
    state.copy(circuit = state.circuit.map(onMod))
  }
}

