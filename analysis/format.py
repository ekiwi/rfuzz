#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import os, sys, json, glob


def load_results(result_dir):
	assert os.path.isdir(result_dir)
	config = load_json(os.path.join(result_dir, 'config.json'))
	entry_pattern = os.path.join(result_dir, 'entry*.json')
	unordered_entries = [load_json(filename) for filename in glob.glob(entry_pattern)]
	entries = sorted(unordered_entries, key=lambda e: e['entry']['id'])
	return config, entries

def load_json(filename):
	return json.loads(open(filename).read())

WordSize = 8
def div_2_ceil(a,b): return (a + (b - 1)) / b
def to_bytes(b): return div_2_ceil(div_2_ceil(b, 8), WordSize) * WordSize

def parse_time(tt):
	return tt['secs'] + tt['nanos'] * 1e-9

class InputFormat:
	def __init__(self, config):
		self.fields = config['input']
		self.bits = sum(ff['width'] for ff in self.fields)
		self.bytes = to_bytes(self.bits)
	def cycle_count(self, data):
		cycles = len(data) // self.bytes
		assert cycles * self.bytes == len(data)
		return cycles
	def split(self, data):
		cc = self.cycle_count(data)
		if cc < 2:
			return data
		else:
			bb = self.bytes
			return [data[ii*bb:(ii+1)*bb] for ii in range(cc-1)]
	# this similar to code in `fuzzer/src/config.rs:print_inputs(..)`
	def format(self, bb):
		return {}

class CoverageFormat:
	def __init__(self, config):
		self.counters = config['conter']
		assert all(counter['index'] == ii for counter, ii in enumerate(self.counters))
		assert all(counter['width'] == 8 for counter in self.counters)
		self.bits = sum(cc['width'] for cc in self.counters)
		self.bytes = to_bytes(self.bits + 2 * 8) - 2


class Input:
	def __init__(self, entry, fmt):
		ee = entry['entry']
		self.id = ee['id']
		self.parent = ee['parent']
		self.mutator = ee['mutator']['id']
		self.cycles = fmt.cycle_count(ee['inputs'])
		self.inputs = fmt.split(ee['inputs'])
		self.bytes = [bytes(ii) for ii in self.inputs]
		self.formated = [fmt.format(bb) for bb in self.bytes]
