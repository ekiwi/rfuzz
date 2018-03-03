
package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.passes.wiring.WiringTransform

// Workaround for https://github.com/freechipsproject/firrtl/pull/751
class WrappedWiringTransform extends WiringTransform {
  private def funcs: Seq[CircuitState => CircuitState] = Seq(
    super.execute, (new FlattenStatements).execute
  )
  override def execute(state: CircuitState): CircuitState = {
    val result = funcs.foldLeft(state)((s, f) => f(s))
    result.copy(form = this.outputForm)
  }
}

