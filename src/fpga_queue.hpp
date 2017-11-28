// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// implements the fuzzer interface similar to how it would work with the FPGA

// Data is shared through buffers that are allocated by the fuzzer
// and transfered (in an ownership sense) to the FPGA once the test input
// data has been written to them.
// The FPGA is processing one buffer at a time, reading and applying the
// test inputs and writing back the coverage for each individual test.
// Once all tests are done, the FPGA hands the buffer back to the fuzzer
// and checks its queue for a new buffer to work on.

// Test Input Data Format (CPU -> FPGA)
// ====================================
// struct Buffer {
//     uint32_t MagicHeader = 0x19933991;
//     uint32_t buffer_id;
//     uint16_t test_count;
//     uint16_t test_cycles;
//     uint32_t reserved_control;
//     Test tests[test_count];
// }
// struct Test {
//     Input inputs[input_count];
// }
//
// Coverage Data Format (FPGA -> CPU)
// ==================================
// struct Buffer {
//     uint32_t MagicHeader = 0x73537353;
//     uint32_t buffer_id;
//     Coverage coverage[test_count];
//     uint64_t reserved_status;
// }
// Every data item is 64bit word aligned!
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
#include <unordered_map>

class NamedPipe {
private:
	std::string dir;
	std::ifstream rx;
	std::ofstream tx;
public:
	NamedPipe(const std::string& name);
	~NamedPipe();
	bool pop_blocking(uint32_t*, uint32_t*);
	void push(uint32_t, uint32_t);
};

static inline uint16_t change_endianess(uint16_t value) {
	return (value >> 8) | ((value & 0xff) << 8);
}
static inline uint32_t change_endianess(uint32_t value) {
	return ((value & 0xff000000) >> 24) |
	       ((value & 0x00ff0000) >>  8) |
	       ((value & 0x0000ff00) <<  8) |
	       ((value & 0x000000ff) << 24);
}
static inline uint64_t change_endianess(uint64_t value) {
	return ((value & 0xff00000000000000) >> 56) |
	       ((value & 0x00ff000000000000) >> 40) |
	       ((value & 0x0000ff0000000000) >> 24) |
	       ((value & 0x000000ff00000000) >>  8) |
	       ((value & 0x00000000ff000000) <<  8) |
	       ((value & 0x0000000000ff0000) << 24) |
	       ((value & 0x000000000000ff00) << 40) |
	       ((value & 0x00000000000000ff) << 56);
}

class FPGAQueueFuzzer : public Fuzzer {
private:
	std::unique_ptr<NamedPipe> command_pipe;

	// current buffer
	uint16_t tests_left = 0;
	uint16_t input_cycle_count = 0;
	/// keep up to N shared memory regions mapped at one time
	static constexpr size_t MaxMappedShms = 20;
	/// contains all shared memory regions that we have consumed
	std::unordered_map<int, char*> shms;
	int test_in_id = -1;
	const char* test_in_ptr = nullptr;
	int coverage_out_id = -1;
	char* coverage_out_ptr = nullptr;
	template<typename T> inline T read_from_test() {
		T value;
		std::memcpy(&value, test_in_ptr, sizeof(T));
		test_in_ptr += sizeof(T);
		return value;
	}
	template<typename T> inline void write_to_coverage(const T& value) {
		std::memcpy(coverage_out_ptr, &value, sizeof(T));
		coverage_out_ptr += sizeof(T);
	}

	// current test
	uint16_t inputs_left = 0;

	// shard memory managemenet
	char* map_shm(const int id);
	void unmap_shms();
	size_t get_size_of_shm(const int id) const;

	bool acquire_buffer();
	void release_buffer();
	void parse_header();
public:
	void init() override;
	bool done() override;
	bool pop(InputType* input) override;
	void push(const CoverageType& coverage) override;
	~FPGAQueueFuzzer();
};

using ActiveFuzzer = FPGAQueueFuzzer;
#endif // FPGA_QUEUE_HPP
