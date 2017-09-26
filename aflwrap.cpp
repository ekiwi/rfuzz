
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

// Override Verilator definition so first $finish ends simulation
// Note: VL_USER_FINISH needs to be defined when compiling Verilator code
void vl_finish(const char* filename, int linenum, const char* hier) {
  Verilated::flushCall();
  exit(0);
}

using namespace std;

class GCDInput {
  public:
    bool reset;
    bool io_in_valid;
    uint32_t io_in_bits_a;
    uint32_t io_in_bits_b;
    bool io_out_ready;

    const uint32_t size = 67;

    GCDInput(bool r, bool valid, uint32_t a, uint32_t b, bool ready) :
      reset(r),
      io_in_valid(valid),
      io_in_bits_a(a),
      io_in_bits_b(b),
      io_out_ready(ready) { }

    //appendToVec(

    string toString() {
      ostringstream ss;
      ss << "GCDInput:" << endl <<
        "  reset = " << reset << endl <<
        "  io_in_valid = " << io_in_valid << endl <<
        "  io_in_bits_a = " << io_in_bits_a << endl <<
        "  io_in_bits_b = " << io_in_bits_b << endl <<
        "  io_out_ready = " << io_out_ready << endl;
      return ss.str();
    }
};

Vgcdcov *top;

vluint64_t main_time = 0;       // Current simulation time
        // This is a 64-bit integer to reduce wrap over issues and
        // allow modulus.  You can also use a double, if you wish.

double sc_time_stamp () { // Called by $time in Verilog
  return main_time;       // converts to double, to match
                          // what SystemC does
}

const long timeout = 10000L;


// Read all inputs from cin
vector<GCDInput> readInput(void) {
  //ifstream infile(filename);
  uint32_t reset, in_valid, a, b, out_ready;

  vector<GCDInput> vec;

  while (cin >> reset >> in_valid >> a >> b >> out_ready) {
    vec.push_back(GCDInput(reset, in_valid, a, b, out_ready));
  }

  return vec;
}

int main(int argc, char** argv) {
  afl_init();
  cout << "Hello World!" << endl;

  // Read inputs
  vector<GCDInput> inputs = readInput();
  vector<GCDInput>::iterator inputs_it = inputs.begin();

  Verilated::commandArgs(argc, argv);
  top = new TOP_TYPE;

#if VM_TRACE			// If verilator was invoked with --trace
    Verilated::traceEverOn(true);	// Verilator must compute traced signals
    VL_PRINTF("Enabling waves...\n");
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);	// Trace 99 levels of hierarchy
    tfp->open ("dump.vcd");	// Open the dump file
#endif

  top->reset = 1;

  cout << "Starting simulation!\n";

  while (!Verilated::gotFinish() && main_time < timeout && inputs_it != inputs.end()) {
    if ((main_time % 10) == 1) {
      top->clock = 1;       // Toggle clock
    }
    // Read coverage here
    if ((main_time % 10) == 2) {
      if (top->io_in_ready) afl_increment(0);
      if (top->io_out_valid) afl_increment(1);
      if (top->cov_valid) afl_increment(2);
      if (top->cov_bits_T_43_true) afl_increment(3);
      if (top->cov_bits_T_43_false) afl_increment(4);
      if (top->cov_bits_T_45_true) afl_increment(5);
      if (top->cov_bits_T_45_false) afl_increment(6);
      if (top->cov_bits_T_54_true) afl_increment(7);
      if (top->cov_bits_T_54_false) afl_increment(8);
      if (top->cov_bits_start_true) afl_increment(9);
      if (top->cov_bits_start_false) afl_increment(10);
    }
    if ((main_time % 10) == 6) {
      top->clock = 0;
      top->reset = inputs_it->reset;
      top->io_in_valid = inputs_it->io_in_valid;
      top->io_out_ready = inputs_it->io_out_ready;
      top->io_in_bits_a = inputs_it->io_in_bits_a;
      top->io_in_bits_b = inputs_it->io_in_bits_b;
      inputs_it++;
    }
    top->eval();               // Evaluate model
#if VM_TRACE
	if (tfp) tfp->dump (main_time);	// Create waveform trace for this timestamp
#endif
    main_time++;               // Time passes...
  }

  if (main_time >= timeout) {
      cout << "Assertion failed! Simulation terminated by timeout at time " << main_time <<
              " (cycle " << main_time / 10 << ")"<< endl;
      return -1;
  } else {
      cout << "Simulation completed at time " << main_time <<
              " (cycle " << main_time / 10 << ")"<< endl;
  }

  // Run for 10 more clocks
  vluint64_t end_time = main_time + 100;
  while (main_time < end_time) {
    if ((main_time % 10) == 1) {
      top->clock = 1;       // Toggle clock
    }
    if ((main_time % 10) == 6) {
      top->clock = 0;
    }
    top->eval();               // Evaluate model
#if VM_TRACE
	if (tfp) tfp->dump (main_time);	// Create waveform trace for this timestamp
#endif
    main_time++;               // Time passes...
  }

#if VM_TRACE
    if (tfp) tfp->close();
#endif
}

