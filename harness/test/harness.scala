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
	val magic  = BigInt("19931993", 16)
	val buf_id = BigInt("0abcdef0", 16)
	val test_count = BigInt(3)
	val test_cycles = BigInt(3)
	val test_0_a = BigInt(400)
	val test_0_b = BigInt(100)
	val test_0_valid = BigInt(1)
	val test_0_ready = BigInt(1)
	// test bytes
	val header = (magic << 32) | (buf_id)
	val conf   = (test_count << 48) | (test_cycles << 32)
	val cycle_data_0 = (test_0_a << 32) | test_0_b
	val cycle_data_1 = (test_0_valid << 63) | (test_0_ready << 62)
	send(header)
	send(conf)
	for( ii <- 1 to 3) {
		send(cycle_data_0)
		send(cycle_data_1)
		send(cycle_data_0)
		send(cycle_data_1)
		send(cycle_data_0)
		send(cycle_data_1, ii == 3)
		// wait a bit
		step(4)
		recv(BigInt("0300030003000303", 16)) // the first 8 counters (8 * 8 = 64)
		step(1)
		recv(BigInt("0000030000000000", 16))
	}

	// receive status
	val status = BigInt(0)
	recv(status, true)

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
