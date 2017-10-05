// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// fpga fuzzer interface and helper class implementation

#include <fpga_queue.hpp>
#include <iostream>
#include <unistd.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <cassert>


NamedPipe::NamedPipe(const std::string& name) {
	// we will try to create two fifos in /tmp/fpga/{name}/
	std::string fpga_path = "/tmp/fpga";
	dir = fpga_path + "/" + name;
	assert(mkdir(dir.c_str(), ACCESSPERMS) == 0);
	// make pipes
	const auto rx_filename = dir + "/rx.fifo";
	assert(mkfifo(rx_filename.c_str(), DEFFILEMODE) == 0);
	rx.open(rx_filename);
	const auto tx_filename = dir + "/tx.fifo";
	assert(mkfifo(tx_filename.c_str(), DEFFILEMODE) == 0);
	tx.open(tx_filename);
}
NamedPipe::~NamedPipe() {
	// remove pipes
	rx.close();
	const auto rx_filename = dir + "/rx.fifo";
	assert(unlink(rx_filename.c_str()) == 0);
	tx.close();
	const auto tx_filename = dir + "/tx.fifo";
	assert(unlink(tx_filename.c_str()) == 0);
	// remove instance directory
	assert(rmdir(dir.c_str()) == 0);
}
uint32_t NamedPipe::pop_blocking() {
	uint32_t value;
	rx.read(reinterpret_cast<char*>(&value), sizeof(uint32_t));
	return value;
}
void NamedPipe::push(uint32_t value) {
	tx.write(reinterpret_cast<const char*>(&value), sizeof(uint32_t));
	tx.flush();
}

static constexpr uint32_t MagicHeader = 0x19933991;

void FPGAQueueFuzzer::acquire_buffer() {
	assert(shm_id == -1);
	assert(shm_start_ptr == nullptr);
	const auto id = command_pipe->pop_blocking();
	auto data = shmat(id, NULL, 0);
	assert(data != nullptr);
	// register new buffer
	shm_id = id;
	shm_start_ptr = data;
	buffer_io_ptr = static_cast<char*>(data);
}
void FPGAQueueFuzzer::release_buffer() {
	assert(shm_id > -1);
	assert(shm_start_ptr != nullptr);
	// detach shared memory
	assert(shmdt(shm_start_ptr) == 0);
	// return control over buffer
	command_pipe->push(shm_id);
	// reset buffer state
	shm_id = -1;
	shm_start_ptr = nullptr;
}
void FPGAQueueFuzzer::parse_header() {
	const auto magic_header = read_from_buffer<uint32_t>();
	assert(magic_header == MagicHeader);
	tests_left = read_from_buffer<uint32_t>();
}
void FPGAQueueFuzzer::parse_test() {
	test_id = read_from_buffer<uint64_t>();
	inputs_left = read_from_buffer<uint32_t>();
}

void FPGAQueueFuzzer::init() {
	// plan:
	// 1. open file or named pipe to communicate
	command_pipe = std:: make_unique<NamedPipe>("0");
	// 2. wait for fuzzer to send us one 32bit shared memory id
	acquire_buffer();
	// 3. open shared input memory + parse number of tests
	parse_header();
}
bool FPGAQueueFuzzer::done() {
	if(tests_left > 0) {
		parse_test();
		tests_left -= 1;
		return false;
	} else {
		release_buffer();
		return true;
	}
}
bool FPGAQueueFuzzer::pop(InputType* input) {
	if(inputs_left > 0) {
		*input = read_from_buffer<InputType>();
		inputs_left -= 1;
		return true;
	} else {
		// no more inputs left, expecting coverage now!
		return false;
	}
}
void FPGAQueueFuzzer::push(const CoverageType& coverage) {
	assert(inputs_left == 0);
	write_to_buffer(coverage);
}

