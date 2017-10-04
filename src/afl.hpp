// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// implements the fuzzer interface for working with afl

#ifndef AFL_HPP
#define AFL_HPP

#include <fuzzer.hpp>
#include <afl.h>

class AflFuzzer : public Fuzzer {
private:
	static constexpr size_t MaxInputBytes = sizeof(InputType) * 1024;
	// afl only does a one shot test, after that the program is reset by the forkserver
	bool first_test = true;
	std::vector<InputType> inputs;
	int next_input = 0;
	void read_input() {
		char input_buffer[MaxInputBytes];
		cin.read(input_buffer, MaxInputBytes);
		const auto len = cin.gcount();
		const auto input_count = len / sizeof(InputType);
		auto items = reinterpret_cast<const InputType*>(input_buffer);
		std::cout << "input_count: " << input_count << std::endl;
		for(int ii = 0; ii < input_count; ii++) {
			inputs.push_back(items[ii]);
		}
	}
public:
	void init() override {
		afl_init();
		read_input();
	}
	bool done() override {
		if(first_test) { first_test = false; return false; }
		else { return true; }
	}
	bool pop(InputType* input) override {
		if(next_input >= inputs.size()) {
			return false;
		} else {
			*input = inputs[next_input];
			next_input += 1;
			return true;
		}
	}
	void push(const CoverageType& coverage) override {
		afl_copy(static_cast<const void*>(&coverage), sizeof(CoverageType));
	}
};

#endif // AFL_HPP
