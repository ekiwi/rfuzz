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
//     uint32_t MagicHeader = 0x19933991;
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

#include <module_interface.hpp>    // TODO: how and where should this be included?
#include <fuzzer.hpp>
#include <cstdint>
#include <cstddef>
#include <string>
#include <fstream>
#include <memory>

class NamedPipe {
private:
	std::string dir;
	std::ifstream rx;
	std::ofstream tx;
public:
	NamedPipe(const std::string& name);
	~NamedPipe();
	bool pop_blocking(uint32_t* value);
	void push(uint32_t value);
};

class FPGAQueueFuzzer : public Fuzzer {
private:
	std::unique_ptr<NamedPipe> command_pipe;

	// current buffer
	int shm_id = -1;
	uint32_t tests_left = 0;
	void* shm_start_ptr = nullptr;
	char* buffer_io_ptr = nullptr;
	template<typename T> inline T read_from_buffer() {
		T value;
		std::memcpy(&value, buffer_io_ptr, sizeof(T));
		buffer_io_ptr += sizeof(T);
		return value;
	}
	template<typename T> inline void write_to_buffer(const T& value) {
		std::memcpy(buffer_io_ptr, &value, sizeof(T));
		buffer_io_ptr += sizeof(T);
	}

	// current test
	uint64_t test_id = 0;
	uint32_t inputs_left = 0;

	bool acquire_buffer();
	void release_buffer();
	void parse_header();
	void parse_test();
public:
	void init() override;
	bool done() override;
	bool pop(InputType* input) override;
	void push(const CoverageType& coverage) override;
};

using ActiveFuzzer = FPGAQueueFuzzer;
#endif // FPGA_QUEUE_HPP
