package hardwareafl

import chisel3._
import chisel3.util._

object SparseMem {
  def getMaskWidth(data: Data): Int = data match {
    case agg: Aggregate =>
      agg.getElements.map(getMaskWidth).sum
    case _: Element => 1
  }
}

class MemReaderIO[T <: Data](private val dataType: T, private val addrWidth: Int) extends Bundle {
  val addr = Input(UInt(addrWidth.W))
  val en = Input(Bool())
  val data = Output(dataType)
  def check(addr: UInt, expected: T): Unit = {
    en := true.B
    this.addr := addr
    assert(data.asUInt === expected.asUInt)
  }
}
class MemWriterIO[T <: Data](private val dataType: T, private val addrWidth: Int) extends Bundle {
  val addr = Input(UInt(addrWidth.W))
  val en = Input(Bool())
  // We have to emulate firrtl's memlib mask type with is Vector for aggregate or Bool for GroundType
  val mask: Data = dataType match {
    case _: Vec[_] => Input(Vec(SparseMem.getMaskWidth(dataType), Bool()))
    case _: Bits => Input(UInt(SparseMem.getMaskWidth(dataType).W))
  }
  val data = Input(dataType)
  def write(addr: UInt, data: T): Unit = {
    en := true.B
    this.addr := addr
    this.data := data
  }
}
class SparseMem[T <: Data]
    (dataType: T,
     depth: Int,
     addrWidth: Int,
     nR: Int,
     nW: Int,
     syncRead: Boolean)
    (implicit maybe: MaybeVec[T]) extends Module {
  val io = IO(new Bundle {
    val w = Vec(nW, new MemWriterIO(dataType, addrWidth))
    val r = Vec(nR, new MemReaderIO(dataType, addrWidth))
  })

  val mem = Mem(depth, dataType)
  val addresses = RegInit(VecInit(Seq.fill(depth) {
    val w = Wire(Valid(UInt(addrWidth.W)))
    w.valid := false.B
    w.bits := DontCare
    w
  }))

  def addrMatch(addr: UInt): (Bool, UInt) = {
    val matches = VecInit(addresses.map(v => v.valid && v.bits === addr)).asUInt
    (matches =/= 0.U, OHToUInt(matches))
  }
  def read(en: Bool, addr: UInt): Data = {
    val (valid, addrIdx) = addrMatch(addr)
    Mux(valid && en, mem(addrIdx), 0.U.asTypeOf(dataType))
  }

  val readers = if (syncRead) RegNext(io.r) else io.r

  for (r <- io.r) {
    r.data := read(r.en, r.addr)
  }

  // Increase addr width by 1 so we can detect overflow
  val nextAddr = RegInit(0.U((log2Ceil(depth) + 1).W))

  val nextAddrs = io.w.foldLeft(nextAddr) {
    case (na, w) => Mux(w.en, na +% 1.U, na)
  }

  val nextAddrUpdate = io.w.foldLeft(nextAddr) { case (naddr, w) =>
    val (found, faddr) = addrMatch(w.addr)
    val allocate = w.en && !found
    when (w.en) {
      val addr = Mux(found, faddr, naddr)
      addresses(addr).valid := true.B
      addresses(addr).bits := w.addr
      maybe.evidence match {
        case Some(ev) =>
          implicit val evidence = ev
          mem.write(addr, w.data, w.mask.asUInt.toBools)
        case None =>
          mem.write(addr, w.data)
      }
    }
    Mux(allocate, naddr +% 1.U, naddr)
  }
  nextAddr := nextAddrUpdate

  // make sure that we never write beyond the allocated space
  assert(nextAddrUpdate <= depth.U,
    "SparseMem ran out of space with size %d, increase size in ReplaceMemsTransform!", depth.U)
}

