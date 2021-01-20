package rfuzz

import firrtl.Mappers._
import firrtl._
import firrtl.annotations._
import firrtl.ir._
import firrtl.transforms.NoDedupAnnotation

import scala.collection.mutable

// Annotate every module with NoDedupAnnotation
// Also check that there is only one instance of each module
// We need this because the WiringTransform cannot handle deduplicated modules
// Turning off dedup should be a feature of FIRRTL
// Note that we can't use InstanceGraph because it only works on WIR (needs to be checked)
class NoDedupTransform extends Transform with DependencyAPIMigration {

  // Returns a *relative* count of modules, ie. how many times the DefInstance shows up in the
  // Module graph
  def countInsts(circuit: Circuit): Map[String, Int] = {
    val counts = mutable.HashMap.empty[String, Int]
    counts(circuit.main) = 1
    def onStmt(stmt: Statement): Statement = stmt.map(onStmt) match {
      case inst @ DefInstance(_,_, mname, _) =>
        counts(mname) = counts.getOrElse(mname, 0) + 1
        inst
      case (_: WDefInstance | _: WDefInstanceConnector) =>
        throw new RuntimeException("Unexpected non-Chirrtl Instance!")
      case other => other
    }
    def onMod(mod: DefModule): DefModule = mod.map(onStmt)
    circuit.map(onMod)
    counts.toMap
  }

  // NoDedupAnnotation
  def execute(state: CircuitState): CircuitState = {
    val counts = countInsts(state.circuit)
    // Check counts
    require(counts.forall(_._2 == 1), s"There must be no deduplicated modules! " +
      counts.filter(_._2 > 1)
    )
    // create annotations
    val circuitName = CircuitName(state.circuit.main)
    val modNames = state.circuit.modules.map(m => ModuleName(m.name, circuitName))
    val annos = modNames.map(NoDedupAnnotation(_))
    state.copy(annotations = state.annotations ++ annos)
  }
}
