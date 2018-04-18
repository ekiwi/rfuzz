
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <algorithm>
#include <chrono>
#include <locale>

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

const uint8_t ResetInput[InputSize] = { 0 };

static inline void run_test(Simulation& sim, Fuzzer& fuzzer) {
	// apply deterministic inputs during reset
	apply_input(sim.top, ResetInput);
	// meta reset circuit for one cycle
	sim.top->io_meta_reset = 1;
	sim.step();
	sim.top->io_meta_reset = 0;
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

static inline void print_header() {
	std::cout << "Fuzz Server for \033[1m" << TOPLEVEL_STR << "\033[0m" << std::endl;
	std::cout << "Allocated Bytes per Input:    " << InputSize << std::endl;
	std::cout << "Allocated Bytes per Coverage: " << CoverageSize << std::endl;
}

#define CLR_LINES(n) "\033[" #n "F\033[0J"
class StatusDisplay {
	using Clock = std::chrono::high_resolution_clock;
	using TimePoint = Clock::time_point;
	using Duration = Clock::duration;
	const TimePoint begin = Clock::now();
	TimePoint last_status = Clock::now();
	uint64_t test_count = 0;
	bool first = true;

	template<typename D>
	static constexpr std::chrono::milliseconds
	Milliseconds(const D& duration) {
		return std::chrono::duration_cast<std::chrono::milliseconds>(duration);
	}
	template<typename D>
	static constexpr std::chrono::seconds
	Seconds(const D& duration) {
		return std::chrono::duration_cast<std::chrono::seconds>(duration);
	}

	inline void print(const uint64_t cycles) {
		const auto now = Clock::now();
		const auto delta_t = now - begin;
		//const auto ms = Milliseconds(delta_t).count();
		const auto sec = Seconds(delta_t).count();

		if(sec < 1) return;
		if(first) { first = false; }
		else { std::cout << CLR_LINES(5); }

		const auto tests_per_second = test_count / sec;
		std::cout << "Test/s:   " << tests_per_second << std::endl;
		const auto cycles_per_second = cycles / sec;
		std::cout << "Cycles/s: " << cycles_per_second << std::endl;
		const auto khz = cycles_per_second / 1000.0;
		std::cout << "kHz:      " << khz << std::endl;
		const auto Mhz = cycles_per_second / 1000000.0;
		std::cout << "MHz:      " << Mhz << std::endl;
		std::cout << "Runtime:  " << sec << " s" << std::endl;
	}

public:
	inline void update(const uint64_t cycles, const uint64_t new_tests) {
		this->test_count += new_tests;
		const auto now = Clock::now();
		const auto ms_last_print = Milliseconds(now - last_status).count();
		if(ms_last_print > 500) {
			this->last_status = now;
			this->print(cycles);
		}
	}

};

double sc_time_stamp () { throw std::logic_error("calling sc_time_stamp is not supported!"); }
int main(int argc, char** argv) {
	print_header();

	ActiveFuzzer fuzzer;
	fuzzer.init(CoverageSize, InputSize);

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

	StatusDisplay status;
	while(!fuzzer.done()) {
		run_test(sim, fuzzer);
		status.update(sim.cycles(), 1);
	}

	cout << "Simulation completed after " << sim.cycles() << " cycles" << endl;

	// finish last cycle
	sim.top->eval();
#if VM_TRACE
	if (sim.tfp) { sim.tfp->dump(sim.main_time); }
	if (sim.tfp) { sim.tfp->close(); }
#endif
}

