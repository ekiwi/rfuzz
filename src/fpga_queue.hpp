// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// implements the fuzzer interface similar to how it would work with the FPGA

#ifndef FPGA_QUEUE_HPP
#define FPGA_QUEUE_HPP

#include <fuzzer.hpp>
#include <shared_memory.hpp>

class FPGAQueueFuzzer : public Fuzzer {
private:
public:
	void init() override {
		// plan:
		// 1. open file or named pipe to communicate
		// 2. wait for fuzzer to send us two 32bit shared memory ids
		//    one is for the input, one for the resulting coverage
		// 3. open shared input memory + parse number of tests
		// 4. open shared coverage memory + write coverage number
		//    as indicated by the number of tests
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
