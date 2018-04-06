#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import os, sys, json, glob, tempfile, subprocess


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
def div_2_ceil(a,b): return (a + (b - 1)) // b
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
			return [data]
		else:
			bb = self.bytes
			return [data[ii*bb:(ii+1)*bb] for ii in range(cc)]
	# this similar to code in `fuzzer/src/config.rs:print_inputs(..)`
	def format(self, bb):
		assert len(bb) == self.bytes
		def read_bit(ii):
			byte = bb[ii // 8]
			bit_ii = 7 - (ii % 8)
			return (byte >> bit_ii) & 1
		msb, dd = 0, {}
		for field in self.fields:
			value = 0
			for ii in range(field['width']):
				vv = read_bit(msb)
				value = (value << 1) | vv
				msb += 1
			dd[field['name']] = value
		return dd

class CoverageFormat:
	def __init__(self, config):
		self.counters = config['counter']
		assert all(counter['index'] == ii for ii, counter in enumerate(self.counters))
		assert all(counter['width'] == 8 for counter in self.counters)
		self.bits = sum(cc['width'] for cc in self.counters)
		self.bytes = to_bytes(self.bits + 2 * 8) - 2
		self.tf_coverage = all(
			self.counters[ii+0]['name'] == 'True' and
			self.counters[ii+1]['name'] == 'False'
			for ii in range(0, len(self.counters), 2))


def mutator_id_to_name(id, mutators):
	for mm in mutators:
		if mm['id'] == id: return mm['name']
	return None

def calc_tf_coverage(bitmap, cov, binned=False):
	assert cov.tf_coverage
	not_covd = 0xff if binned else 0
	covered = 0
	for ii in range(0, len(cov.counters), 2):
		t_covd = (bitmap[ii+0] != not_covd)
		f_covd = (bitmap[ii+1] != not_covd)
		covered += 1 if (t_covd and f_covd) else 0
	return covered

class Input:
	def __init__(self, entry, fmt, cov):
		ee = entry['entry']
		stats = entry['stats']
		self.id = ee['id']
		self.discovered_after = parse_time(ee['discovered_after'])
		lineage = ee['lineage']
		if lineage is None:
			self.parent = self.mutator_id = self.mutator_name = None
		else:
			self.parent = lineage['parent']
			self.mutator_id = lineage['mutation']['mutator']['id']
			self.mutator_name = mutator_id_to_name(self.mutator_id, stats['mutators'])
		inputs = ee['inputs']
		self.cycles = fmt.cycle_count(inputs)
		self.inputs = fmt.split(inputs)
		self.bytes = [bytes(ii) for ii in self.inputs]
		self.formated = [fmt.format(bb) for bb in self.bytes]
		# coverage
		if cov.tf_coverage:
			self.max_cov = len(cov.counters) // 2
			self.total_cov = calc_tf_coverage(stats['bitmap'], cov, binned=True)
			self.local_cov = calc_tf_coverage(entry['trace_bits'], cov, binned=False)

def make_mutation_graph_dot(inputs):
	nodes = []
	edges = []
	for ii in inputs:
		nodes.append(
			(ii.id, str(ii.id))
		)
		if ii.parent is not None:
			edges.append(
				(ii.parent, ii.id, ii.mutator_name)
			)
	dot = ["digraph g {"]
	dot += ['\t{} [label="{}"];'.format(*n) for n in nodes]
	dot += ['\t{} -> {} [label="{}"];'.format(*e) for e in edges]
	dot += ["}"]
	return "\n".join(dot)

def make_mutation_graph(filename, inputs, fmt=None):
	dot = make_mutation_graph_dot(inputs)
	if fmt is None:
		fmt = os.path.splitext(filename)[1][1:]
	with tempfile.NamedTemporaryFile('w', suffix='.dot', delete=False) as out:
		out.write(dot)
		dotfile = out.name
	#cmd = ['dot', '-Tpdf', dotfile, '-o', filename]
	cmd = ['sfdp', '-x', '-Goverlap=scale', '-T' + fmt, dotfile, '-o', filename]
	subprocess.run(cmd, check=True)