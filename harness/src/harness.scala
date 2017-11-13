package pynq

import chisel3._
import chisel3.util._
import chisel3.experimental.withReset

import scala.collection.immutable.ListMap

// WARN: all circuts designed with 64bit AXIS interface in mind

object div2Ceil {
	def apply(dividend: Int, divisor: Int): Int = (dividend + divisor - 1) / divisor
}

class WrappingCounter(width : Int) extends Module {
	val io = this.IO(new Bundle {
		val enable = Input(Bool())
		val max = Input(UInt(width.W))
		val value = Output(UInt(width.W))
		val last = Output(Bool())
	})
	val count = RegInit(0.U(width.W))
	io.value := count
	io.last := count === io.max
	count := Mux(!io.enable, count, Mux(io.last, 0.U, count + 1.U))
}

class TestExecControl extends Bundle {
	val run_cycles = Input(UInt(16.W))
	val test_count = Input(UInt(16.W))
}

class DUTDriverInterface(input_width: Int) extends Bundle {
	// TODO: why does this fail when wrapped in Input(...)?
	val data = DeqIO(UInt(input_width.W))
	val start_next = Input(Bool())
	val ready_next = Output(Bool())
	override def cloneType: this.type = new DUTDriverInterface(input_width).asInstanceOf[this.type]
}

class InputsReceiver(input_width: Int) extends Module {
	val max_cycles = 64
	val in_width = 64
	val data_per_cycle = div2Ceil(input_width, in_width)

	val io = this.IO(new Bundle {
		val control = new TestExecControl
		// test run control
		val driver = Flipped(new DUTDriverInterface(input_width))
		// axis consumer
		val axis_valid = Input(Bool())
		val axis_data = Input(UInt(in_width.W))
		val axis_ready = Output(Bool())
	})

	val axis_fire = io.axis_valid && io.axis_ready

	// receive counters
	val data_count = Module(new WrappingCounter(log2Ceil(data_per_cycle)))
	data_count.io.max := (data_per_cycle -1).U
	data_count.io.enable := axis_fire
	val cycle_count = Module(new WrappingCounter(log2Ceil(max_cycles)))
	cycle_count.io.max := io.control.run_cycles - 1.U
	cycle_count.io.enable := data_count.io.enable && data_count.io.last
	val last_data_last_cycle = data_count.io.last && cycle_count.io.last

	// queue
	val q = Module(new Queue(UInt(input_width.W), max_cycles))
	assert(q.io.enq.ready || !q.io.enq.valid, "Never push when queue is full")
	assert(q.io.deq.valid || !q.io.deq.ready, "Never pop when queue is empty")

	// receive test data
	q.io.enq.bits := Cat((0 until data_per_cycle - 1).map{ case(cycle) => {
		val reg = RegInit(0.U(in_width.W))
		when(axis_fire && data_count.io.value === cycle.U) { reg := io.axis_data }
		reg
	}} ++ Seq(io.axis_data))
	q.io.enq.valid := axis_fire && data_count.io.last

	// dut driver interaction (wait state in case test execution takes longer)
	val sReady :: sWaiting :: Nil = Enum(2)
	val state = RegInit(sReady)
	io.axis_ready := state === sReady
	io.driver.start_next := last_data_last_cycle || state === sWaiting
	io.driver.data <> q.io.deq
	switch(state) {
		is(sReady) { when(last_data_last_cycle && !io.driver.ready_next) { state := sWaiting } }
		is(sWaiting) { when(io.driver.ready_next) { state := sReady } }
	}
}

class DUTDriver(input_width: Int) extends Module {
	val max_cycles = 64

	val io = this.IO(new Bundle {
		val control = new TestExecControl
		// to DUT
		val dut_inputs = Output(UInt(input_width.W))
		val dut_reset = Output(Bool())
		// test run control
		val test_input = new DUTDriverInterface(input_width)
		val coverage = Flipped(new CoverageControl)
	})
	val sReset :: sRunTest :: sCollectCoverage :: Nil = Enum(3)
	val state = RegInit(sReset)

	val cycle_count = Module(new WrappingCounter(log2Ceil(max_cycles)))
	cycle_count.io.max := io.control.run_cycles - 1.U
	cycle_count.io.enable := state === sRunTest

	io.dut_inputs := io.test_input.data.bits
	io.dut_reset := state === sReset
	io.test_input.data.ready := state === sRunTest
	io.test_input.ready_next := state === sReset
	io.coverage.start_next := cycle_count.io.last

	// control
	switch(state) {
	is(sReset) { when(io.test_input.start_next) { state := sRunTest } }
	is(sRunTest) { when(cycle_count.io.last) { state := sCollectCoverage } }
	is(sCollectCoverage) { when(io.coverage.done_next) { state := sReset } }
	}

}

class Harness() extends Module {
	val axis_width = 64
	val axis_bit_count = div2Ceil(axis_width, 8)
	val cov_conf = new CoverageConfig
	val dut_conf = new DUTConfig(cov_conf)

	val io = this.IO(new Bundle {
		// TODO: split up into separate producer / consumer boundles
		val s_axis_tvalid = Input(Bool())
		val s_axis_tready = Output(Bool())
		val s_axis_tdata = Input(UInt(axis_width.W))
		val s_axis_tkeep = Input(UInt(axis_bit_count.W))
		val s_axis_tlast = Input(Bool())
		val m_axis_tvalid = Output(Bool())
		val m_axis_tready = Input(Bool())
		val m_axis_tdata = Output(UInt(axis_width.W))
		val m_axis_tkeep = Output(UInt(axis_bit_count.W))
		val m_axis_tlast = Output(Bool())
	})
	val m_axis_fire = io.m_axis_tready && io.m_axis_tvalid

	// control states
	val sReceiveHeader :: sReceiveControl :: sSendHeader :: sRunTests :: sSendStatus :: Nil = Enum(5)
	val state = RegInit(sReceiveHeader)

	// state
	val buffer_id = RegInit(0.U(32.W))
	val control = RegInit(0.U(64.W))
	val status = Wire(UInt(64.W))
	status := 0.U // TODO: connect to interesting internal state
	val control_src = Wire(Flipped(new TestExecControl))
	control_src.run_cycles := control(63, 48)
	control_src.test_count := control(47, 32)

	// modules
	val inp = Module(new InputsReceiver(dut_conf.input_bits))
	val driver = Module(new DUTDriver(dut_conf.input_bits))
	val reset_dut_and_cov = Wire(Bool())
	val (dut, cov) = withReset(this.reset.toBool || reset_dut_and_cov) {
		(Module (new DUT(dut_conf) ), Module (new Coverage(cov_conf))) }

	// connect axis inputs
	inp.io.axis_data  := io.s_axis_tdata
	inp.io.axis_valid := Mux(state === sRunTests, io.s_axis_tvalid, false.B)
	io.s_axis_tready := MuxLookup(state, false.B, Array(
	sReceiveHeader -> true.B, sReceiveControl -> true.B, sRunTests -> inp.io.axis_ready))

	// connect submodule chain
	inp.io.control <> control_src
	inp.io.driver <> driver.io.test_input
	driver.io.control <> control_src
	driver.io.dut_inputs <> dut.io.inputs
	driver.io.dut_reset <> reset_dut_and_cov
	driver.io.coverage <> cov.io.control
	dut.io.coverage <> cov.io.coverage_signals

	// connect axis output
	val coverage_header = Cat("h73537353".U, buffer_id)
	cov.io.axis_ready := io.m_axis_tready
	io.m_axis_tdata  := Mux(state === sSendHeader, coverage_header,
	                    Mux(state === sSendStatus, status, cov.io.axis_data))
	io.m_axis_tvalid := Mux((state === sSendHeader) || (state === sSendStatus),
	                        true.B, cov.io.axis_valid)
	io.m_axis_tkeep  := ((1 << axis_bit_count) - 1).U
	io.m_axis_tlast  := state === sSendStatus

	// count the tests that were executed from the active buffer
	val test_ii = Module(new WrappingCounter(16))
	test_ii.io.enable := cov.io.control.done_next
	test_ii.io.max := control_src.test_count - 1.U

	// control
	switch (state) {
	is (sReceiveHeader) {
		// wait for start of test buffer
		val magic_header = io.s_axis_tdata(63,32)
		val valid_header = magic_header === "h19931993".U
		when (io.s_axis_tvalid && valid_header) {
			buffer_id := io.s_axis_tdata(31,0)
			state := sReceiveControl
		}
	}
	is (sReceiveControl) {
		when (io.s_axis_tvalid) {
			control := io.s_axis_tdata
			state := sSendHeader
		}
	}
	is (sSendHeader) {
		when(m_axis_fire) { state := sRunTests }
	}
	is(sRunTests) {
		when(test_ii.io.last && cov.io.control.done_next) { state := sSendStatus }
	}
	is(sSendStatus) {
		when(m_axis_fire) { state := sReceiveHeader }
	}
	}
}

object HarnessGenerator extends App {
	chisel3.Driver.execute(args, () => new Harness())
}

