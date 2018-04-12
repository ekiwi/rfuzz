#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

# Using the $(DUT)_cov binary, we can get end-to-end coverage information
# that is independent of the coverage metrics used by the fuzzer.
# This allows us to independently evaluate the fidelity of a generated
# test suite with no dependency on the fuzzer.

import os, sys, toml, tempfile, subprocess, json

from format import to_bytes

analysis_dir = os.path.dirname(os.path.abspath(__file__))
build_dir = os.path.abspath(os.path.join(analysis_dir, '..', 'build'))


def bin(trace_bits):
	assert len(trace_bits) % 2 == 0
	return {
		(ii * 2) +
		(trace_bits[ii] + 2 * trace_bits[ii+1])
		for ii in range(0, len(trace_bits), 2)
	}

class CoverageCalcuator:
	""" stateful wrapper around the coverage oracle """
	def __init__(self, dut):
		self.oracle = CoverageOracle.get(dut)
		self.counters = self.oracle.counters
		# initialize coverage state
		self.union = set() # index set
	def get(self, inp):
		trace_bits = self.oracle.query(inp)
		assert len(trace_bits) == self.oracle.coverage_size
		if len(trace_bits) > len(self.counters):
			trace_bits = trace_bits[:len(self.counters)-len(trace_bits)]
		assert len(trace_bits) == len(self.counters)
		covered = bin(trace_bits)
		new_coverage = covered - self.union
		self.union = covered | self.union
		return {
			# possible values per (TF) counter are: 01, 10, 11
			'max': len(self.counters) * 3,
			'total': len(self.union),
			'local': len(covered),
			'new': len(new_coverage),
		}

class CoverageOracle:
	_oracles = {}
	@staticmethod
	def get(dut):
		if dut not in CoverageOracle._oracles:
			CoverageOracle._oracles[dut] = CoverageOracle(dut)
		return CoverageOracle._oracles[dut]
	def __init__(self, dut):
		assert os.path.isdir(build_dir)
		cov_toml = os.path.join(build_dir, "{}.e2e.toml".format(dut))
		assert os.path.isfile(cov_toml)
		cov_bin  = os.path.join(build_dir, "{}_cov".format(dut))
		assert os.path.isfile(cov_bin)
		config = toml.loads(open(cov_toml).read())
		# make sure the coverage instrumentation is the way we want
		self.counters = config['counter']
		assert all(counter['index'] == ii for ii, counter in enumerate(self.counters))
		assert all(counter['width'] == 8 for counter in self.counters)
		assert all(cc['name'] == 'TF' for cc in self.counters)
		# calculate coverage size
		bits = sum(cc['width'] for cc in self.counters)
		self.coverage_size = to_bytes(bits + 2 * 8) - 2
		self._bin = cov_bin
	def query(self, inp):
		assert all(isinstance(cc, bytes) for cc in inp)
		with tempfile.NamedTemporaryFile() as out:
			out.write(b''.join(inp))
			out.flush()
			cmd = [self._bin, out.name]
			rr = subprocess.run(cmd, check=True, stdout=subprocess.PIPE)
		cov = json.loads(rr.stdout.decode('utf-8'))
		assert 'error' not in cov
		return cov['coverage']


