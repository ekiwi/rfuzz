// See LICENSE for license details.

package rfuzz

import chisel3._
/*
class HarnessUnitTester(harness: Harness) extends PeekPokeTester(harness) {
	private val h = harness

	def hex(value : String) : BigInt = BigInt(value.replaceAll("_",""), 16)

	val mask64 = (BigInt(1) << 64) - 1
	val mask8  = (BigInt(1) <<  8) - 1
	def change_endianess(value: BigInt) = {
		val int64 = value & mask64
		val bytes = for (ii <- 0 to 7) yield (int64 >> (ii * 8)) & mask8
		bytes.zipWithIndex.map { case(bb, ii) => bb << ((7-ii) * 8) }.reduce(_|_)
	}
	assert(change_endianess(BigInt("0123456789abcdef", 16)) == BigInt("efcdab8967452301", 16))
	assert(change_endianess(BigInt("01234567", 16)) == BigInt("6745230100000000", 16))

	// we are not ready to send or receive by default
	poke(h.io.s_axis_tvalid, false)
	poke(h.io.m_axis_tready, false)
	step(2)

	def send(data : BigInt, last : Boolean = false) = {
		// AXI automagically interprets data as a 64bit litle endian integer
		// we assume that our input and output is big-endian
		val data_little = change_endianess(data)
		expect(h.io.s_axis_tready, true)
		poke(h.io.s_axis_tvalid, true)
		poke(h.io.s_axis_tdata, data_little)
		poke(h.io.s_axis_tkeep, 0xff)
		poke(h.io.s_axis_tlast, last)
		step(1)
		poke(h.io.s_axis_tvalid, false)
		poke(h.io.s_axis_tlast, false)
	}

	def recv(data : BigInt, last : Boolean = false) = {
		// AXI automagically interprets data as a 64bit litle endian integer
		// we assume that our input and output is big-endian
		val data_little = change_endianess(data)
		expect(h.io.m_axis_tvalid, true)
		expect(h.io.m_axis_tdata, data_little)
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
	val coverage_magic = BigInt("73537353", 16)
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

	val cycle_data_0     = hex("00_00_00_00_00_00_00_00")
	val cycle_data_1     = hex("80_00_00_00_00_00_00_00")
	val cycle_data_zeros = hex("00_00_00_00_00_00_00_00")

	// these values were manually collected by looking at
	// the instrumented signals in the wave view
	// and then mapped to the counters
	// 0b11011101 = 0xdd
	// 0b10010000 = 0x90
	val cov_cycle_0 = hex("dd_90_00_00_00_00_00_00")

	send(header)
	send(conf)
	recv(coverage_magic << 32 | buf_id)
	for( ii <- 1 to 3) {
		send(cycle_data_0)
		send(cycle_data_1)
		send(cycle_data_zeros)
		send(cycle_data_zeros)
		send(cycle_data_zeros)
		send(cycle_data_zeros, ii == 3)
		// wait a bit
		step(4)
		recv(cov_cycle_0)
	}

	// receive status
	val status = BigInt(0)
	recv(status, true)

	step(10)
}

class HarnessLatencyTester(harness: Harness, test_count : Int, test_cycles : Int)
extends PeekPokeTester(harness) {
	private val h = harness

	val mask64 = (BigInt(1) << 64) - 1
	val mask8  = (BigInt(1) <<  8) - 1
	def change_endianess(value: BigInt) = {
		val int64 = value & mask64
		val bytes = for (ii <- 0 to 7) yield (int64 >> (ii * 8)) & mask8
		bytes.zipWithIndex.map { case(bb, ii) => bb << ((7-ii) * 8) }.reduce(_|_)
	}
	assert(change_endianess(BigInt("0123456789abcdef", 16)) == BigInt("efcdab8967452301", 16))
	assert(change_endianess(BigInt("01234567", 16)) == BigInt("6745230100000000", 16))

	// we are not ready to send or receive by default
	poke(h.io.s_axis_tvalid, false)
	poke(h.io.m_axis_tready, false)

	def send(data : BigInt, last : Boolean = false) = {
		// AXI automagically interprets data as a 64bit litle endian integer
		// we assume that our input and output is big-endian
		val data_little = change_endianess(data)
		expect(h.io.s_axis_tready, true)
		poke(h.io.s_axis_tvalid, true)
		poke(h.io.s_axis_tdata, data_little)
		poke(h.io.s_axis_tkeep, 0xff)
		poke(h.io.s_axis_tlast, last)
		step(1)
		poke(h.io.s_axis_tvalid, false)
		poke(h.io.s_axis_tlast, false)
	}

	def recv(data : BigInt, last : Boolean = false) = {
		// AXI automagically interprets data as a 64bit litle endian integer
		// we assume that our input and output is big-endian
		val data_little = change_endianess(data)
		expect(h.io.m_axis_tvalid, true)
		expect(h.io.m_axis_tdata, data_little)
		expect(h.io.m_axis_tlast, last)
		poke(h.io.m_axis_tready, true)
		step(1)
		poke(h.io.m_axis_tready, false)
	}

	// test settings
	val magic  = BigInt("19931993", 16)
	val coverage_magic = BigInt("73537353", 16)
	val buf_id = BigInt("0abcdef0", 16)
	// test bytes
	val header = (magic << 32) | (buf_id)
	val conf   = (BigInt(test_count) << 48) | (BigInt(test_cycles) << 32)
	send(header)
	send(conf)
	recv(coverage_magic << 32 | buf_id)

	// send (dummy data) and receive as quickly as possible
	// we expect:
	val test_data_load_cycles = 2 * test_cycles
	val run_test_and_collect_cov_cycles = test_cycles + 2 + 1
	val latency = test_data_load_cycles + run_test_and_collect_cov_cycles
	val avg_cycles_per_test = math.max(test_data_load_cycles, run_test_and_collect_cov_cycles)
	poke(h.io.s_axis_tvalid, true)
	poke(h.io.s_axis_tdata, 0)
	poke(h.io.m_axis_tready, true)
	step(latency + (test_count - 1) * avg_cycles_per_test - 1)

	// make sure the data stream is over
	expect(h.io.m_axis_tlast, true)
	step(1)

	// TODO: this test is sending more data than expected and this should
	//       be handled correctly in the Harness
	//       Especially the input receiver should not accept any more test data!
}

class HarnessSpec extends ChiselFlatSpec {
	private val conf = Config.loadToml("../gcd.toml")

	private val backendNames =
		if(firrtl.FileUtils.isCommandAvailable("verilator")) {
			Array("firrtl", "verilator") } else { Array("firrtl") }

	for ( backendName <- backendNames ) {
		"Harness" should s"behave correctly (with $backendName)" in {
			Driver(() => new Harness(conf), backendName) {
				harness => new HarnessUnitTester(harness)
			} should be (true)
		}
	}

	// TODO: improve latency/throughput prediction
	// "Harness" should "be quick!" in {
	// 	Driver(() => new Harness(), "verilator") {
	// 		harness => new HarnessLatencyTester(harness, 3, 3)
	// 	} should be (true)
	// }
}
*/