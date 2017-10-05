// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// implements the fuzzer interface similar to how it would work with the FPGA

// Data is shared through buffers that are allocated by the fuzzer
// and transfered (in an ownership sense) to the FPGA once the test input
// data has been written to them.
// The FPGA is processing one buffer at a time, reading and applying the
// test inputs and writing back the coverage for each individual test.
// Once all tests are done, the FPGA hands the buffer back to the fuzzer
// and checks its queue for a new buffer to work on.

// The basic data format is as follows:
// struct Buffer {
//     uint32_t MagicHeader = 0x19931993;
//     uint32_t test_count;
//     Test tests[test_count];
// }
// struct Test {
//     uint64_t id;
//     uint32_t input_count;
//     Input inputs[input_count];
//     Coverage coverage;
// }
// Every data item is 32bit word aligned!
// TODO: deal with endianess issues.



#ifndef FPGA_QUEUE_HPP
#define FPGA_QUEUE_HPP

#include <fuzzer.hpp>
#include <shared_memory.hpp>

class FPGAQueueFuzzer : public Fuzzer {
private:
	void wait_for_buffer() {

	}
	void release_buffer() {
	}

public:
	void init() override {
		// plan:
		// 1. open file or named pipe to communicate
		// 2. wait for fuzzer to send us one 32bit shared memory id
		// 3. open shared input memory + parse number of tests
	}
	bool done() override {
		// plan
		// 1. check if there are tests left in our current input buffer
		// if YES:
		//     2. load test_id and test_length into local variables
		//     3. return false
		// if NO (no tests left):
		//     2. detach input and coverage shared memory
		//     3. notify fuzzer (send shared memory ids back?)
		//     3. return true
	}
	bool pop(InputType* input) override {
		if(next_input >= inputs.size()) {
			// no more inputs for the current test
			return false;
		} else {
			*input = inputs[next_input];
			next_input += 1;
			return true;
		}
	}
	void push(const CoverageType& coverage) override {
		// plan:
		// 1. memcpy coverage to shared coverage memory
		// 2. increment pointer to point to next free slot for coverage
	}
};

using FPGAQueueFuzzer = AflFuzzer;
#endif // FPGA_QUEUE_HPP
