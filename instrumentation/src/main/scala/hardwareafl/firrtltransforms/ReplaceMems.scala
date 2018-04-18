package hardwareafl
package firrtltransforms

import firrtl._
import firrtl.ir._
import firrtl.Utils.throwInternalError
import firrtl.Mappers._
import firrtl.passes.MemPortUtils.{memPortField, memType}

import scala.collection.mutable

object ReplaceMemsTransform {
  // TODO: increase for longer tests!
  val SparseMemSize = 32

  def getMem(tpe: Type, depth: Int, nR: Int, nW: Int): Module = {
    import chisel3._
    import chisel3.util.log2Ceil
    val chirrtl = chisel3.Driver.emit(() => new Module {
      override def desiredName = "IgnoreMe"
      val dataType = tpe match {
        case UIntType(IntWidth(w)) => UInt(w.toInt.W)
        case SIntType(IntWidth(w)) => SInt(w.toInt.W)
        case other => throwInternalError(s"Unsupported type ${other.serialize}, bug Jack")
      }
      val io = IO(new Bundle {})
      // No need for dontTouch because we retop to SparseMem right away
      val submod = Module(new SparseMem(dataType, SparseMemSize, log2Ceil(depth), nR, nW))
    })
    val circuit = {
      val parsed = Parser.parse(chirrtl.split("\n").toIterator, Parser.IgnoreInfo)
      val mods = parsed.modules.filterNot(_.name == "IgnoreMe")
      assert(mods.size == 1)
      parsed.copy(modules = mods, main = mods.head.name)
    }
    val state = (new MiddleFirrtlCompiler).compile(CircuitState(circuit, ChirrtlForm), Seq.empty)
    state.circuit.modules match {
      case Seq(one: firrtl.ir.Module) => one
      case other => throwInternalError(s"Invalid resulting modules ${other.map(_.name)}")
    }
  }
}

/** Replaces Mems with a sparse mem
  * @note Assumes that clocks on all mem ports are the same (generally safe assumption)
  * @note Assumes that wrapping Module has a port named "reset"
  */
class ReplaceMemsTransform extends Transform {
  def inputForm = HighForm
  def outputForm = HighForm

  import ReplaceMemsTransform._

  def access(expr: Expression, index: Expression) =
    WSubAccess(expr, index, UnknownType, UNKNOWNGENDER)
  def subindex(expr: Expression, index: Int) =
    WSubIndex(expr, index, UnknownType, UNKNOWNGENDER)

  private def onStmt(ns: Namespace,
                     topNS: Namespace,
                     newMods: mutable.ArrayBuffer[Module])
                    (stmt: Statement): Statement = stmt.map(onStmt(ns, topNS, newMods)) match {
    case mem: DefMemory =>
      if (mem.writeLatency != 1 || mem.readLatency != 0 || mem.readwriters.nonEmpty) {
        throwInternalError(s"Error! Must run after CustomVerilogMemDelays!\n" +
          s"Got ${mem.serialize}")
      }
      val memMod = {
        val mod = getMem(mem.dataType, mem.depth, mem.readers.size, mem.writers.size)
        mod.copy(name = topNS.newName(mod.name))
      }
      newMods += memMod
      val instName = ns.newName(s"mem_sparse") // Helps debug
      val inst = WDefInstance(mem.info, instName, memMod.name, UnknownType)

      // Keep connections to the mem now go through the wire
      val wire = DefWire(mem.info, mem.name, memType(mem))
      val rcons = {
        mem.readers.zipWithIndex.flatMap { case (r, i) =>
          val pref = subindex(WSubField(WSubField(WRef(inst.name), "io"), "r"), i)
          val rref = WSubField(WRef(wire), r)
          Seq(Connect(NoInfo, WSubField(pref, "addr"), WSubField(rref, "addr")),
              Connect(NoInfo, WSubField(pref, "en"), WSubField(rref, "en")),
              Connect(NoInfo, WSubField(rref, "data"), WSubField(pref, "data")))
        }
      }
      val wcons = {
        mem.writers.zipWithIndex.flatMap { case (w, i) =>
          val pref = subindex(WSubField(WSubField(WRef(inst.name), "io"), "w"), i)
          val wref = WSubField(WRef(wire), w)
          Seq(Connect(NoInfo, WSubField(pref, "addr"), WSubField(wref, "addr")),
              Connect(NoInfo, WSubField(pref, "en"), WSubField(wref, "en")),
              Connect(NoInfo, WSubField(pref, "data"), WSubField(wref, "data")),
              Connect(NoInfo, WSubField(pref, "mask"), WSubField(wref, "mask")))
        }
      }
      val clkCon = {
        val memPort = mem.readers.headOption.getOrElse(mem.writers.head)
        val lhs = WSubField(WRef(inst.name), "clock")
        val rhs = WSubField(WSubField(WRef(wire), memPort), "clk")
        Connect(NoInfo, lhs, rhs)
      }
      val resetCon = Connect(NoInfo, WSubField(WRef(inst.name), "reset"), WRef("reset"))
      val allCons = rcons ++ wcons ++ Seq(clkCon, resetCon)

      Block(Seq(inst, wire) ++ allCons)
    case other => other
  }

  // Returns the transformed module as well as any new modules created
  private def onModule(topNS: Namespace)(mod: Module): Seq[Module] = {
    val namespace = Namespace(mod)

    val newMods = mutable.ArrayBuffer.empty[Module]
    val bodyx = onStmt(namespace, topNS, newMods)(mod.body)
    Seq(mod.copy(body = bodyx)) ++ newMods
  }
  def execute(state: CircuitState): CircuitState = {
    val moduleNamespace = Namespace(state.circuit)
    val modulesx = state.circuit.modules.flatMap {
      case mod: Module => onModule(moduleNamespace)(mod)
      case ext: ExtModule => Seq(ext)
    }
    val res = state.copy(circuit = state.circuit.copy(modules = modulesx))
    (new ResolveAndCheck).execute(res)
  }
}
