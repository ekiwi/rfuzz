// See LICENSE for license details.

package pynq

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class HarnessUnitTester(harness: Harness) extends PeekPokeTester(harness) {
	private val h = harness

}

class GCDTester extends ChiselFlatSpec {
	private val backendNames =
		if(firrtl.FileUtils.isCommandAvailable("verilator")) {
			Array("firrtl", "verilator") } else { Array("firrtl") }

	for ( backendName <- backendNames ) {
		"Harness" should s"behave correctly (with $backendName)" in {
			Driver(() => new Harness(), backendName) {
				harness => new HarnessUnitTester(harness)
			} should be (true)
		}
	}
}
