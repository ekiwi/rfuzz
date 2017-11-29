
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <algorithm>

#include <VVerilatorHarness.h>
#include <verilated.h>
#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif
#define TOP_TYPE VVerilatorHarness

#ifdef USE_AFL
#include <afl.hpp>
#else
#include <fpga_queue.hpp>
#endif

// TODO: autogenerate
static constexpr size_t CoverageSize = 16;
static constexpr size_t InputSize    = 16;

static inline void apply_input(TOP_TYPE* top, const uint8_t* input) {
	top->io_input_bytes_0  = input[ 0];
	top->io_input_bytes_1  = input[ 1];
	top->io_input_bytes_2  = input[ 2];
	top->io_input_bytes_3  = input[ 3];
	top->io_input_bytes_4  = input[ 4];
	top->io_input_bytes_5  = input[ 5];
	top->io_input_bytes_6  = input[ 6];
	top->io_input_bytes_7  = input[ 7];
	top->io_input_bytes_8  = input[ 8];
	top->io_input_bytes_9  = input[ 9];
	top->io_input_bytes_10 = input[10];
	top->io_input_bytes_11 = input[11];
	top->io_input_bytes_12 = input[12];
	top->io_input_bytes_13 = input[13];
	top->io_input_bytes_14 = input[14];
	top->io_input_bytes_15 = input[15];
}
static inline void read_coverage(TOP_TYPE* top, uint8_t* coverage) {
	coverage[ 0] = top->io_coverage_bytes_0;
	coverage[ 1] = top->io_coverage_bytes_1;
	coverage[ 2] = top->io_coverage_bytes_2;
	coverage[ 3] = top->io_coverage_bytes_3;
	coverage[ 4] = top->io_coverage_bytes_4;
	coverage[ 5] = top->io_coverage_bytes_5;
	coverage[ 6] = top->io_coverage_bytes_6;
	coverage[ 7] = top->io_coverage_bytes_7;
	coverage[ 8] = top->io_coverage_bytes_8;
	coverage[ 9] = top->io_coverage_bytes_9;
	coverage[10] = top->io_coverage_bytes_10;
	coverage[11] = top->io_coverage_bytes_11;
	coverage[12] = top->io_coverage_bytes_12;
	coverage[13] = top->io_coverage_bytes_13;
	coverage[14] = top->io_coverage_bytes_14;
	coverage[15] = top->io_coverage_bytes_15;
}


// Override Verilator definition so first $finish ends simulation
// Note: VL_USER_FINISH needs to be defined when compiling Verilator code
void vl_finish(const char* filename, int linenum, const char* hier) {
	Verilated::flushCall();
	exit(0);
}

using namespace std;

struct Simulation {
	TOP_TYPE* top = nullptr;
	vluint64_t main_time = 0;
	VerilatedVcdC* tfp = nullptr;
};

const long timeout = 10000L;

static inline void dummy_run(Simulation& sim, uint64_t cycles) {
	const vluint64_t end_time = sim.main_time + (cycles * 10);
	while (sim.main_time < end_time) {
		if ((sim.main_time % 10) == 1) { sim.top->clock = 1; }
		if ((sim.main_time % 10) == 6) { sim.top->clock = 0; }
		sim.top->eval();
		#if VM_TRACE
		if (sim.tfp) { sim.tfp->dump (sim.main_time); }
		#endif
		sim.main_time++;
	}
}


static inline void run_test(Simulation& sim, Fuzzer& fuzzer) {
	// reset circuit for two cycles
	sim.top->reset = 1;
	dummy_run(sim, 2);
	sim.top->reset = 0;
	// run for as many cycles as we get data
	uint8_t input[InputSize];
	assert(sim.main_time % 10 == 0);
	while(!Verilated::gotFinish()) {
		if ((sim.main_time % 10) == 0) { if(!fuzzer.pop(input, InputSize)) break; }
		if ((sim.main_time % 10) == 1) { sim.top->clock = 1; }
		if ((sim.main_time % 10) == 6) { sim.top->clock = 0; }
		if ((sim.main_time % 10) == 6) { apply_input(sim.top, input); }
		sim.top->eval();
		#if VM_TRACE
		if (sim.tfp) { sim.tfp->dump (sim.main_time); }
		#endif
		sim.main_time++;
	}
	uint8_t coverage[CoverageSize];
	read_coverage(sim.top, coverage);
	fuzzer.push(coverage, CoverageSize);
}

Simulation global_sim;
// Called by $time in Verilog converts to double, to match what SystemC does
double sc_time_stamp () { return global_sim.main_time; }
int main(int argc, char** argv) {
	ActiveFuzzer fuzzer;
	fuzzer.init(CoverageSize);

	Verilated::commandArgs(argc, argv);
	Simulation& sim = global_sim;
	sim.top = new TOP_TYPE;

	// If verilator was invoked with --trace
#if VM_TRACE
	Verilated::traceEverOn(true);
	sim.tfp = new VerilatedVcdC;
	sim.top->trace(sim.tfp, 99);
	sim.tfp->open ("dump.vcd");
#endif

	while(!fuzzer.done()) {
		run_test(sim, fuzzer);
	}

	cout << "Simulation completed after " << sim.main_time / 10 << " cycles" << endl;

#if VM_TRACE
	if (sim.tfp) { sim.tfp->close(); }
#endif
}

