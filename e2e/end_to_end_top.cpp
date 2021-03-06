// Copyright 2018, University of California, Berkeley
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>

// This file contains the top level for measuring the end -to-end coverage
// of a test input corpus generated by our fuzzer.
// This allows us to measure very detailed coverage in a manner independent
// from our fuzzer which makes things easier and more reliable to compare.

#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <algorithm>
#include <chrono>
#include <locale>

#define E2E
#include "dut.hpp"


#include <verilated.h>
#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
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

static inline std::vector<uint8_t> load_test(const std::string& filename) {
	std::ifstream in(filename, std::ios::binary);
	assert(in.is_open());
	in.seekg(0, std::ios::end);
	auto len = in.tellg();
	in.seekg(0, std::ios::beg);
	std::vector<uint8_t> out;
	out.resize(len);
	in.read((char*)out.data(), len);
	return out;
}

double sc_time_stamp () { throw std::logic_error("calling sc_time_stamp is not supported!"); }
#define ERROR(reason) { std::cout << "{\"error\": \"" reason "\"}" << std::endl; return 1; }
int main(int argc, char** argv) {

	if(argc != 2) { ERROR("argcount"); }
	std::string filename(argv[1]);

	Simulation sim;
	sim.top = new TOP_TYPE;

	// load test data
	const auto in = load_test(filename);
	const int64_t cycles = in.size() / InputSize;
	if(cycles * InputSize != in.size()) { ERROR("size"); }

	// If verilator was invoked with --trace
#if VM_TRACE
	Verilated::traceEverOn(true);
	sim.tfp = new VerilatedVcdC;
	sim.top->trace(sim.tfp, 99);
	sim.tfp->open ("dump.vcd");
#endif

	sim.top->reset = 0;
	// meta reset circuit for one cycle
	sim.top->io_meta_reset = 1;
	sim.step();
	sim.top->io_meta_reset = 0;
	// reset circuit for one cycles
	sim.top->reset = 1;
	sim.step();
	sim.top->reset = 0;
	// run for as many cycles as we get data
	for(auto ii = 0; ii < cycles; ++ii) {
		auto input = in.data() + (InputSize * ii);
		apply_input(sim.top, input);
		sim.step();
	}
	uint8_t coverage[CoverageSize];
	read_coverage(sim.top, coverage);
	std::cout << "{\"coverage\": [" << (int)coverage[0];
	for(auto ii = 1; ii < (int)CoverageSize; ++ii) {
		std::cout << ", " << (int)coverage[ii];
	}
	std::cout << "]}" << std::endl;


	// finish last cycle
	sim.top->eval();
#if VM_TRACE
	if (sim.tfp) { sim.tfp->dump(sim.main_time); }
	if (sim.tfp) { sim.tfp->close(); }
#endif
}

