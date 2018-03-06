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
bool NamedPipe::pop_blocking(uint32_t* value0, uint32_t* value1) {
	char buf[2 * sizeof(uint32_t)];
	rx.read(buf, 2 * sizeof(uint32_t));
	std::memcpy(value0, &buf[0], sizeof(uint32_t));
	std::memcpy(value1, &buf[4], sizeof(uint32_t));
	// when the pipe is closed prematurely, we will read 0 instead of 4 bytes
	// in this case it is best to crash here instead of later in the code
	const auto successfull_read_from_rx_pipe = rx.gcount() == 2 * sizeof(uint32_t);
	// assert(successfull_read_from_rx_pipe);
	return successfull_read_from_rx_pipe;
}
void NamedPipe::push(uint32_t value0, uint32_t value1) {
	char buf[2 * sizeof(uint32_t)];
	std::memcpy(&buf[0], &value0, sizeof(uint32_t));
	std::memcpy(&buf[4], &value1, sizeof(uint32_t));
	tx.write(buf, 2 * sizeof(uint32_t));
	tx.flush();
}

static constexpr uint32_t MagicTestInputHeader      = 0x19931993;
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
	shms.clear();
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
	const bool failed = !command_pipe->pop_blocking(&in, &out);
	if(failed) { return false; }
	test_in_id = in;
	test_in_ptr = map_shm(test_in_id);
	coverage_out_id = out;
	coverage_out_ptr = map_shm(coverage_out_id);
	return true;
}
void FPGAQueueFuzzer::release_buffer() {
	// release in reverse order
	if(coverage_out_id > 0 && test_in_id > 0) {
		command_pipe->push(coverage_out_id, test_in_id);
		// reset buffer state
		coverage_out_id = -1;
		coverage_out_ptr = nullptr;
		// reset buffer state
		test_in_id = -1;
		test_in_ptr = nullptr;
	}
}
void FPGAQueueFuzzer::parse_header() {
	const auto magic_header = change_endianess(read_from_test<uint32_t>());
	assert(magic_header == MagicTestInputHeader);
	const auto buffer_id = change_endianess(read_from_test<uint32_t>());
	tests_left = change_endianess(read_from_test<uint16_t>());
	// read reserved values
	change_endianess(read_from_test<uint16_t>());
	change_endianess(read_from_test<uint16_t>());
	change_endianess(read_from_test<uint16_t>());
	//std::cout << "received " << tests_left << " new tests" << std::endl;
	const auto CoverageSize = 8 + 8 + (coverage_size + 2) * tests_left;
	const bool enough_space_for_coverage_provided =
		get_size_of_shm(coverage_out_id) >= CoverageSize;
	if(!enough_space_for_coverage_provided) {
		std::cout << "Space needed for " << tests_left << " coverage entries: "
		          << CoverageSize << " bytes" << std::endl;
		std::cout << "Space available on provided buffer: "
		          << get_size_of_shm(coverage_out_id) << " bytes" << std::endl;
	}
	assert(enough_space_for_coverage_provided);
	// write coverage header
	write_to_coverage(change_endianess(MagicCoverageOutputHeader));
	write_to_coverage(change_endianess(buffer_id));
}

void FPGAQueueFuzzer::start_test() {
	inputs_left = change_endianess(read_from_test<uint64_t>());
	tests_left -= 1;
	const auto cycles = static_cast<uint16_t>(inputs_left);
	//std::cout << "cycles: " << cycles << "" << std::endl;
	write_to_coverage(change_endianess(cycles));
}

void FPGAQueueFuzzer::init(size_t coverage_size) {
	Fuzzer::init(coverage_size);
	assert((this->coverage_size + 2) % 8 == 0);
	command_pipe = std:: make_unique<NamedPipe>("0");
}
bool FPGAQueueFuzzer::done() {
	if(tests_left > 0) {
		start_test();
		return false;
	} else {
		release_buffer();
		const bool done = !acquire_buffer();
		if(!done) {
			parse_header();
			start_test();
		} else {
			unmap_shms();
		}
		return done;
	}
}
bool FPGAQueueFuzzer::pop(uint8_t* input, size_t len) {
	if(inputs_left > 0) {
		read_from_test(input, len);
		inputs_left -= 1;
		return true;
	} else {
		// no more inputs left, expecting coverage now!
		return false;
	}
}
void FPGAQueueFuzzer::push(const uint8_t* coverage, size_t len) {
	assert(inputs_left == 0);
	assert(len == this->coverage_size);
	write_to_coverage(coverage, len);
}

FPGAQueueFuzzer::~FPGAQueueFuzzer() {
	unmap_shms();
}
