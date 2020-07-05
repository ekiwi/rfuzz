package rfuzz

import firrtl.Mappers._
import firrtl.Utils.throwInternalError
import firrtl._
import firrtl.annotations._
import firrtl.ir._
import firrtl.passes.MemPortUtils.memType

import scala.collection.mutable

object ReplaceMemsTransform {
  // TODO: increase for longer tests!
  val SparseMemSize = 32

  def getMem(tpe: Type, depth: BigInt, nR: Int, nW: Int, syncRead: Boolean): Module = {
    import chisel3._
    import chisel3.util.log2Ceil
    val chirrtl = chisel3.Driver.emit(() => new Module {
      override def desiredName = "IgnoreMe"
      def typeToData(tpe: Type): Data = tpe match {
        case UIntType(IntWidth(w)) => UInt(w.toInt.W)
        case SIntType(IntWidth(w)) => SInt(w.toInt.W)
        case VectorType(t, s) => Vec(s, typeToData(t))
        case other => throwInternalError(s"Unsupported type ${other.serialize} for SparseMem")
      }
      val dataType = typeToData(tpe)
      val io = IO(new Bundle {})
      // No need for dontTouch because we retop to SparseMem right away
      val size = math.min(SparseMemSize, depth.toInt) // Use actual mem depth if it's smaller
      val submod = Module(new SparseMem(dataType, size, log2Ceil(depth), nR, nW, syncRead))
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
  def inputForm = LowForm
  def outputForm = HighForm

  import ReplaceMemsTransform._

  def access(expr: Expression, index: Expression) =
    WSubAccess(expr, index, UnknownType, UnknownFlow)
  def subindex(expr: Expression, index: Int) =
    WSubIndex(expr, index, UnknownType, UnknownFlow)

  private def onStmt(ns: Namespace,
                     topNS: Namespace,
                     resetRef: Option[WRef],
                     newMods: mutable.ArrayBuffer[Module])
                    (stmt: Statement): Statement = stmt.map(onStmt(ns, topNS, resetRef, newMods)) match {
    case mem: DefMemory =>
      if (mem.writeLatency != 1 || (mem.readLatency != 0 && mem.readLatency != 1) || mem.readwriters.nonEmpty) {
        throwInternalError(s"Error! Can only handle Chisel mems, try running after CustomVerilogMemDelays!\n" +
          s"Got ${mem.serialize}")
      }
      val memMod = {
        val syncRead = mem.readLatency == 1
        val mod = getMem(mem.dataType, mem.depth, mem.readers.size, mem.writers.size, syncRead)
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
          // On LowForm, zero-width address will be removed
          val addrCon = if (mem.depth > 1) {
            Seq(Connect(NoInfo, WSubField(pref, "addr"), WSubField(rref, "addr")))
          } else Seq()
          addrCon ++ Seq(Connect(NoInfo, WSubField(pref, "en"), WSubField(rref, "en")),
                         Connect(NoInfo, WSubField(rref, "data"), WSubField(pref, "data")))
        }
      }
      val wcons = {
        mem.writers.zipWithIndex.flatMap { case (w, i) =>
          val pref = subindex(WSubField(WSubField(WRef(inst.name), "io"), "w"), i)
          val wref = WSubField(WRef(wire), w)
          val addrCond = if (mem.depth > 1) {
            Seq(Connect(NoInfo, WSubField(pref, "addr"), WSubField(wref, "addr")))
          } else Seq()
          addrCond ++ Seq(Connect(NoInfo, WSubField(pref, "en"), WSubField(wref, "en")),
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
      // TODO This heavily relies on metaRest reseting everything to zero
      val reset = resetRef.getOrElse(UIntLiteral(0, IntWidth(1)))
      val resetCon = Connect(NoInfo, WSubField(WRef(inst.name), "reset"), reset)
      val allCons = rcons ++ wcons ++ Seq(clkCon, resetCon)

      Block(Seq(inst, wire) ++ allCons)
    case other => other
  }

  // Returns the transformed module as well as any new modules created
  private def onModule(topNS: Namespace)(mod: Module): Seq[Module] = {
    val namespace = Namespace(mod)

    val resetRef = mod.ports.collectFirst { case Port(_,"reset",_,_) => WRef("reset") }

    val newMods = mutable.ArrayBuffer.empty[Module]
    val bodyx = onStmt(namespace, topNS, resetRef, newMods)(mod.body)
    Seq(mod.copy(body = bodyx)) ++ newMods
  }
  def execute(state: CircuitState): CircuitState = {
    val moduleNamespace = Namespace(state.circuit)
    val circuitName = CircuitName(state.circuit.main)
    val (modulesx: Seq[DefModule], annos: Seq[DoNotProfileModule]) = state.circuit.modules.map {
      case mod: Module =>
        val mods = onModule(moduleNamespace)(mod)
        val newMods = mods.filter(_.name != mod.name)
        assert(newMods.size + 1 == mods.size) // Sanity check
        (mods, newMods.map(m => DoNotProfileModule(ModuleName(m.name, circuitName))))
      case ext: ExtModule => (Seq(ext), Seq.empty[DoNotProfileModule])
    }.unzip match { case (ms, as) => (ms.flatten, as.flatten) }

    val res = state.copy(circuit = state.circuit.copy(modules = modulesx),
                         annotations = annos ++ state.annotations)
    (new ResolveAndCheck).execute(res)
  }
}
