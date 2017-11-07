// See LICENSE for license details.

package pynq

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class HarnessUnitTester(harness: Harness) extends PeekPokeTester(harness) {
	private val h = harness

	// we are not ready to send or receive by default
	poke(h.io.s_axis_tvalid, false)
	poke(h.io.m_axis_tready, false)
	step(2)

	def send(data : BigInt, last : Boolean = false) = {
		expect(h.io.s_axis_tready, true)
		poke(h.io.s_axis_tvalid, true)
		poke(h.io.s_axis_tdata, data)
		poke(h.io.s_axis_tkeep, 0xff)
		poke(h.io.s_axis_tlast, last)
		step(1)
		poke(h.io.s_axis_tvalid, false)
		poke(h.io.s_axis_tlast, false)
	}

	def recv(data : BigInt, last : Boolean = false) = {
		expect(h.io.m_axis_tvalid, true)
		expect(h.io.m_axis_tdata, data)
		expect(h.io.m_axis_tlast, last)
		poke(h.io.m_axis_tready, true)
		step(1)
		poke(h.io.m_axis_tready, false)
	}

	def maybe_recv() = {
		poke(h.io.m_axis_tready, true)
		step(1)
		poke(h.io.m_axis_tready, false)
	}

	// test settings
	val magic = BigInt(0x19931993)
	val test_count = BigInt(3)
	val test_cycles = BigInt(3)
	val test_id_0 = BigInt(0x17f2a8ed)
	val test_0_a = BigInt(400)
	val test_0_b = BigInt(100)
	val test_0_valid = BigInt(1)
	val test_0_ready = BigInt(1)
	// test bytes
	val header = (magic << 32) | (test_count << 16) | test_cycles
	val cycle_data_0 = (test_0_a << 32) | test_0_b
	val cycle_data_1 = (test_0_valid << 63) | (test_0_ready << 62)
	send(header)
	for( ii <- 1 to 3) {
		send(test_id_0)
		send(cycle_data_0)
		send(cycle_data_1)
		send(cycle_data_0)
		send(cycle_data_1)
		send(cycle_data_0)
		send(cycle_data_1, ii == 3)
		// wait a bit
		step(4)
		// show that we are ready (TODO: acutally check return data)
		recv(test_id_0)
		step(2)
		recv(BigInt("0300030003000303", 16)) // the first 8 counters (8 * 8 = 64)
		step(1)
		recv(BigInt("0000030000000000", 16), ii == 3)
	}

	step(10)
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
