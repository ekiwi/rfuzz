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

def exclude(counter, signal):
	""" decide which counters/signals to include in our end2end coverage metric """
	return signal['port'] not in ['auto_cover_out']

class CoverageCounterInfo:
	""" represents one T/F counter """
	def __init__(self, counter, signal):
		assert counter['name'] == 'TF'
		assert counter['width'] == 8
		self.port = signal['port']
		self.index = counter['index']
		self.name = signal['name']
	def value(self): return CoverageCounterValue(self)

class CoverageCounterValue:
	def __init__(self, cc=set()):
		self.covd = cc
		assert all(ii in {1,2,3} for ii in self.covd)
	def union(self, other):
		assert isinstance(other, CoverageCounterValue)
		return CoverageCounterValue(cc = self.covd | other.covd)
	def difference(self, other):
		assert isinstance(other, CoverageCounterValue)
		return CoverageCounterValue(cc = self.covd - other.covd)
	@property
	def cov_percent(self):
		# TODO: 0/1 or 0/0.5/1?
		if 3 in self.covd: return 1.0
		#if 2 in self.covd: return 0.5
		#if 1 in self.covd: return 0.5
		return 0.0

class TestCoverage:
	@classmethod
	def empty(cls, counters):
		vv = [CoverageCounterValue() for cc in counters]
		return TestCoverage(vv)
	@classmethod
	def parse(cls, counters, values):
		vv = [CoverageCounterValue({values[cc.index]}) for cc in counters]
		return TestCoverage(vv)
	def __init__(self, vv):
		self.values = vv
	def union(self, other):
		assert isinstance(other, TestCoverage)
		assert len(other.values) == len(self.values)
		vv = [a.union(b) for a, b in zip(self.values, other.values)]
		return TestCoverage(vv)
	def difference(self, other):
		assert isinstance(other, TestCoverage)
		assert len(other.values) == len(self.values)
		vv = [a.difference(b) for a, b in zip(self.values, other.values)]
		return TestCoverage(vv)
	def cov_percent(self):
		return sum(vv.cov_percent for vv in self.values) / len(self.values)


class CoverageCalcuator:
	""" stateful wrapper around the coverage oracle """
	def __init__(self, dut):
		self.oracle = CoverageOracle.get(dut)
		self.counters = [
			CoverageCounterInfo(counter, self.signal(counter))
			for counter in self.oracle.counters
			if not exclude(counter, self.signal(counter))
		]
		self.fail_counters = [cc['index'] for cc in self.oracle.counters
		                      if cc['name'] == 'Fail']
		#print(self.oracle.counters)
		#print("\n".join(cc.name for cc in self.counters))
		# initialize coverage state
		self.total = TestCoverage.empty(self.counters)
	def get(self, inp):
		trace_bits = self.oracle.query(inp)
		invalid = not all(trace_bits[ii] == 0 for ii in self.fail_counters)
		covered = TestCoverage.parse(self.counters, trace_bits)
		#print([vv.cov_percent for vv in covered.values])
		new_coverage = covered.difference(self.total)
		if not invalid:
			self.total = self.total.union(covered)
		return {
			'total': self.total.cov_percent(),
			'local': covered.cov_percent(),
			'new': new_coverage.cov_percent(),
			'individual': [vv.cov_percent for vv in self.total.values],
			'not_covered': [cc.name
				for vv, cc in zip(self.total.values, self.counters)
				if vv.cov_percent == 0.0],
			'invalid': invalid,
		}
	def signal(self, counter):
		return self.oracle.config['coverage'][counter['signal']]
	def exclude(self, counter):
		sig = self.signal(counter)['name']
		return sig['port'] not in ['auto_cover_out']

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
		self.config = toml.loads(open(cov_toml).read())
		# make sure the coverage instrumentation is the way we want
		self.counters = self.config['counter']
		assert all(counter['index'] == ii for ii, counter in enumerate(self.counters))
		assert all(counter['width'] == 8 for counter in self.counters)
		assert all(cc['name'] in ['TF', 'Fail'] for cc in self.counters)
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


