// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// this file contains a C++ interface for interacting with a fuzzer

#ifndef FUZZER_HPP
#define FUZZER_HPP
#include <stdint.h>
#include <cstring>
struct Fuzzer {
	/// called before the simulation is initialized
	virtual void init(size_t coverage_size) { coverage_size = coverage_size; }
	/// called inbetween tests to check if there is more data availabel
	virtual bool done() { return true; }
	/// returns false on last input of a single test
	virtual bool pop(uint8_t* input, size_t len) = 0;
	virtual void push(const uint8_t* coverage, size_t len) = 0;
	virtual ~Fuzzer(){}
protected:
	size_t coverage_size = 0;
};

#endif // FUZZER_HPP
