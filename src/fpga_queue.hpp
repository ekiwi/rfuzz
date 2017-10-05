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

class NamedPipe {
private:
	std::string dir;
	std::ifstream rx;
	std::ofstream tx;
public:
	NamedPipe(const std::string& name);
	~NamedPipe();
	uint32_t pop_blocking();
	void push(uint32_t value);
};

class SharedMemory {
	const int32_t id;
	void* const data;
public:
	SharedMemory(int32_t id, void* data) : id(id), data(data) {}
	~SharedMemory();
public:
	template<typename T>
	T get_as() { return static_cast<T>(data); }
public:
	static SharedMemory alloc(size_t bytes);
	static SharedMemory from_id(int32_t id);
};

class FPGAQueueFuzzer : public Fuzzer {
private:
	// command pipe

	// current buffer
	int shm_id = -1;
	uint32_t tests_left;
	char* buffer_ptr;

	// current test
	uint64_t test_id;
	uint32_t inputs_left;

	void wait_for_buffer();
	void release_buffer();
public:
	void init() override;
	bool done() override;
	bool pop(InputType* input) override;
	void push(const CoverageType& coverage) override;
};

using ActiveFuzzer = FPGAQueueFuzzer;
#endif // FPGA_QUEUE_HPP
