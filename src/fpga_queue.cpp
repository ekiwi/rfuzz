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
	mkdir(dir.c_str(), ACCESSPERMS);
	// make pipes
	const auto tx_filename = dir + "/tx.fifo";
	assert(mkfifo(tx_filename.c_str(), DEFFILEMODE) == 0);
	std::cout << "created tx fifo" << std::endl;
	const auto rx_filename = dir + "/rx.fifo";
	assert(mkfifo(rx_filename.c_str(), DEFFILEMODE) == 0);
	std::cout << "created rx fifo" << std::endl;
	// open pipes
	tx.open(tx_filename);
	std::cout << "opened tx fifo" << std::endl;
	rx.open(rx_filename);
	std::cout << "opened rx fifo" << std::endl;
}
NamedPipe::~NamedPipe() {
	// remove pipes
	tx.close();
	const auto tx_filename = dir + "/tx.fifo";
	assert(unlink(tx_filename.c_str()) == 0);
	rx.close();
	const auto rx_filename = dir + "/rx.fifo";
	assert(unlink(rx_filename.c_str()) == 0);
	// remove instance directory
	assert(rmdir(dir.c_str()) == 0);
}
bool NamedPipe::pop_blocking(uint32_t* value) {
	rx.read(reinterpret_cast<char*>(value), sizeof(uint32_t));
	// when the pipe is closed prematurely, we will read 0 instead of 4 bytes
	// in this case it is best to crash here instead of later in the code
	const auto successfull_read_from_rx_pipe = rx.gcount() == sizeof(uint32_t);
	// assert(successfull_read_from_rx_pipe);
	return successfull_read_from_rx_pipe;
}
void NamedPipe::push(uint32_t value) {
	tx.write(reinterpret_cast<const char*>(&value), sizeof(uint32_t));
	tx.flush();
}

static constexpr uint32_t MagicHeader = 0x19933991;

bool FPGAQueueFuzzer::acquire_buffer() {
	assert(shm_id == -1);
	assert(shm_start_ptr == nullptr);
	uint32_t id;
	const bool failed = !command_pipe->pop_blocking(&id);
	if(failed) { return false; }
	auto data = shmat(id, NULL, 0);
	assert(data != nullptr);
	// register new buffer
	shm_id = id;
	shm_start_ptr = data;
	buffer_io_ptr = static_cast<char*>(data);
	return true;
}
void FPGAQueueFuzzer::release_buffer() {
	if(shm_id < 0 && shm_start_ptr == nullptr) {
		// buffer was already released (or never aquired)
		return;
	}
	// detach shared memory
	assert(shmdt(shm_start_ptr) == 0);
	// return control over buffer
	command_pipe->push(shm_id);
	// reset buffer state
	shm_id = -1;
	shm_start_ptr = nullptr;
	buffer_io_ptr = nullptr;
}
void FPGAQueueFuzzer::parse_header() {
	const auto magic_header = read_from_buffer<uint32_t>();
	assert(magic_header == MagicHeader);
	tests_left = read_from_buffer<uint32_t>();
	//std::cout << "received " << tests_left << " new tests" << std::endl;
}
void FPGAQueueFuzzer::parse_test() {
	test_id = read_from_buffer<uint64_t>();
	inputs_left = read_from_buffer<uint32_t>();
	//std::cout << "test(" << test_id << "): " << inputs_left << " inputs" << std::endl;
}

void FPGAQueueFuzzer::init() {
	command_pipe = std:: make_unique<NamedPipe>("0");
}
bool FPGAQueueFuzzer::done() {
	if(tests_left > 0) {
		parse_test();
		tests_left -= 1;
		return false;
	} else {
		release_buffer();
		const bool done = !acquire_buffer();
		if(!done) {
			parse_header();
			parse_test();
			tests_left -= 1;
		}
		return done;
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

