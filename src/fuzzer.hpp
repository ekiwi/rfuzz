// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// this file contains a C++ interface for interacting with a fuzzer

#ifndef FUZZER_HPP
#define FUZZER_HPP

struct Fuzzer {
	using InputType = Test::Input;
	using CoverageType = Test::Coverage;
	/// called before the simulation is initialized
	virtual void init() {}
	/// called inbetween tests to check if there is more data availabel
	virtual bool done() { return true; }
	/// returns false on last input of a single test
	virtual bool pop(InputType* input) = 0;
	virtual void push(const CoverageType& coverage) = 0;
	virtual ~Fuzzer(){}
};

#endif // FUZZER_HPP
