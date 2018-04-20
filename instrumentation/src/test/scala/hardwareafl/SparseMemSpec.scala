
package hardwareafl

import chisel3._
import chisel3.util._
import chisel3.testers._

class SparseMemTester extends BasicTester {
  val mod = Module(new SparseMem(UInt(32.W), 4, 8, 1, 1, false))
  // Defaults
  mod.io <> DontCare
  mod.io.w(0).en := false.B
  mod.io.r(0).en := false.B

  val (cycle, done) = Counter(true.B, 8)
  printf(p" ***** Cycle $cycle *****\n")
  printf(p"${mod.io}\n")
  when (cycle === 0.U) {
    mod.io.w(0).write(100.U, 123.U)
    mod.io.r(0).check(5.U, 0.U)
  }
  .elsewhen(cycle === 1.U) {
    mod.io.r(0).check(100.U, 123.U)
  }
  .elsewhen(cycle === 2.U) {
    mod.io.w(0).write(8.U, 456.U)
    mod.io.r(0).check(8.U, 0.U)
  }
  .elsewhen(cycle === 3.U) {
    mod.io.r(0).check(8.U, 456.U)
  }
  when (done) {
    stop()
  }
}

object TestSparseMem extends App {
  assert(TesterDriver.execute(() => new SparseMemTester), "Test must work!")
}
