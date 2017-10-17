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

static constexpr uint32_t MagicTestInputHeader      = 0x19933991;
static constexpr uint32_t MagicCoverageOutputHeader = 0x73537353;

char* FPGAQueueFuzzer::map_shm(const int id) {
	if(shms.find(id) == shms.end()) {
		if(shms.size() >= MaxMappedShms) {
			std::cout << "WARN: unmapping buffered shared memories." << std::endl;
			unmap_shms();
		}
		auto data = shmat(id, nullptr, 0);
		assert(data != (void*)-1);
		shms[id] = static_cast<char*>(data);
	}
	return shms.at(id);
}

void FPGAQueueFuzzer::unmap_shms() {
	for(auto mapping : shms) {
		auto ptr = static_cast<void*>(mapping.second);
		assert(shmdt(ptr) == 0);
	}
}

size_t FPGAQueueFuzzer::get_size_of_shm(const int id) const {
	struct shmid_ds sb;
	if (shmctl(id, IPC_STAT, &sb) == -1) {
		std::cerr << "Failed to determine size of shared memory " << id << std::endl;
		return 0;
	}
	return sb.shm_segsz;
}

bool FPGAQueueFuzzer::acquire_buffer() {
	assert(test_in_id == -1);
	assert(coverage_out_id == -1);
	uint32_t in = 0, out = 0;
	const bool failed = !command_pipe->pop_blocking(&in) or
	                    !command_pipe->pop_blocking(&out);
	if(failed) { return false; }
	test_in_id = in;
	test_in_ptr = map_shm(test_in_id);
	coverage_out_id = out;
	coverage_out_ptr = map_shm(coverage_out_id);
	return true;
}
void FPGAQueueFuzzer::release_buffer() {
	// release in reverse order
	if(coverage_out_id > 0) {
		command_pipe->push(coverage_out_id);
		// reset buffer state
		coverage_out_id = -1;
		coverage_out_ptr = nullptr;
	}
	if(test_in_id > 0) {
		// return control over buffer
		command_pipe->push(test_in_id);
		// reset buffer state
		test_in_id = -1;
		test_in_ptr = nullptr;
	}
}
void FPGAQueueFuzzer::parse_header() {
	const auto magic_header = read_from_test<uint32_t>();
	assert(magic_header == MagicTestInputHeader);
	tests_left = read_from_test<uint32_t>();
	//std::cout << "received " << tests_left << " new tests" << std::endl;
	const auto CoverageSize = 4 + 4 + (8 + sizeof(CoverageType)) * tests_left;
	const bool enough_space_for_coverage_provided =
		get_size_of_shm(coverage_out_id) >= CoverageSize;
	assert(enough_space_for_coverage_provided);
	// write coverage header
	write_to_coverage(MagicCoverageOutputHeader);
	write_to_coverage(tests_left);
}
void FPGAQueueFuzzer::parse_test() {
	test_id = read_from_test<uint64_t>();
	inputs_left = read_from_test<uint32_t>();
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
		} else {
			unmap_shms();
		}
		return done;
	}
}
bool FPGAQueueFuzzer::pop(InputType* input) {
	if(inputs_left > 0) {
		*input = read_from_test<InputType>();
		inputs_left -= 1;
		return true;
	} else {
		// no more inputs left, expecting coverage now!
		return false;
	}
}
void FPGAQueueFuzzer::push(const CoverageType& coverage) {
	assert(inputs_left == 0);
	write_to_coverage(test_id);
	write_to_coverage(coverage);
}

FPGAQueueFuzzer::~FPGAQueueFuzzer() {
	unmap_shms();
}
