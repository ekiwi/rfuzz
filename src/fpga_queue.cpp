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

SharedMemory::~SharedMemory() {
	if(id >= 0) {
		shmctl(id, IPC_RMID, NULL);
	}
}

SharedMemory
SharedMemory::alloc(size_t bytes) {
	const int32_t shm_id = shmget(IPC_PRIVATE, bytes, IPC_CREAT | IPC_EXCL | 0600);
	assert(shm_id >= 0);
	return SharedMemory::from_id(shm_id);
}


SharedMemory
SharedMemory::from_id(int32_t id) {
	auto data = shmat(id, NULL, 0);
	assert(data != nullptr);
	return SharedMemory(id, data);
}

static constexpr uint32_t MagicHeader = 0x19933991;

void FPGAQueueFuzzer::wait_for_buffer() {

}
void FPGAQueueFuzzer::release_buffer() {
}


void FPGAQueueFuzzer::init() {
	// plan:
	// 1. open file or named pipe to communicate
	// 2. wait for fuzzer to send us one 32bit shared memory id
	// 3. open shared input memory + parse number of tests
}
bool FPGAQueueFuzzer::done() {
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
bool FPGAQueueFuzzer::pop(InputType* input) {
	if(next_input >= inputs.size()) {
		// no more inputs for the current test
		return false;
	} else {
		*input = inputs[next_input];
		next_input += 1;
		return true;
	}
}
void FPGAQueueFuzzer::push(const CoverageType& coverage) {
	// plan:
	// 1. memcpy coverage to shared coverage memory
	// 2. increment pointer to point to next free slot for coverage
}

