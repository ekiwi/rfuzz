
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <algorithm>
#include <verilated.h>

#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif

#include <module_interface.hpp>
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
	sim.top->reset = 0;
	dummy_run(sim, 2);
	sim.top->reset = 1;
	// run for as many cycles as we get data
	Test::Input input;
	Test::Coverage coverage;
	assert(sim.main_time % 10 == 0);
	while(!Verilated::gotFinish()) {
		if ((sim.main_time % 10) == 0) { if(!fuzzer.pop(&input)) break; }
		if ((sim.main_time % 10) == 1) { sim.top->clock = 1; }
		if ((sim.main_time % 10) == 2) { coverage.update(*sim.top); }
		if ((sim.main_time % 10) == 6) { sim.top->clock = 0; }
		if ((sim.main_time % 10) == 6) { input.apply(*sim.top); }
		sim.top->eval();
		#if VM_TRACE
		if (sim.tfp) { sim.tfp->dump (sim.main_time); }
		#endif
		sim.main_time++;
	}
	fuzzer.push(coverage);
}

Simulation global_sim;
// Called by $time in Verilog converts to double, to match what SystemC does
double sc_time_stamp () { return global_sim.main_time; }
int main(int argc, char** argv) {
	ActiveFuzzer fuzzer;
	fuzzer.init();

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

