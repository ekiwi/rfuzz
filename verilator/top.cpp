
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <algorithm>

#include "dut.hpp"


#include <verilated.h>
#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif

#ifdef USE_AFL
#include <afl.hpp>
#else
#include <fpga_queue.hpp>
#endif

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
	void step() {
		top->clock = 0;
		top->eval();
		#if VM_TRACE
		if (tfp) { tfp->dump(main_time); }
		#endif
		main_time++;
		top->clock = 1;
		top->eval();
		#if VM_TRACE
		if (tfp) { tfp->dump(main_time); }
		#endif
		main_time++;
	}
	uint64_t cycles() { return main_time / 2; }
};

static inline void run_test(Simulation& sim, Fuzzer& fuzzer) {
	// reset circuit for one cycles
	sim.top->reset = 1;
	sim.step();
	sim.top->reset = 0;
	// run for as many cycles as we get data
	uint8_t input[InputSize];
	while(fuzzer.pop(input, InputSize)) {
		apply_input(sim.top, input);
		sim.step();
	}
	uint8_t coverage[CoverageSize];
	read_coverage(sim.top, coverage);
	fuzzer.push(coverage, CoverageSize);
}

double sc_time_stamp () { throw std::logic_error("calling sc_time_stamp is not supported!"); }
int main(int argc, char** argv) {
	ActiveFuzzer fuzzer;
	fuzzer.init(CoverageSize);

	Verilated::commandArgs(argc, argv);
	Simulation sim;
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

	cout << "Simulation completed after " << sim.cycles() << " cycles" << endl;

	// finish last cycle
	sim.top->eval();
#if VM_TRACE
	if (sim.tfp) { sim.tfp->dump(sim.main_time); }
	if (sim.tfp) { sim.tfp->close(); }
#endif
}

