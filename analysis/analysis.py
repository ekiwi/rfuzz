#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import argparse, os, sys, json, glob

# let's try to be a cool **data** scientist!
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

def load_json(filename):
	return json.loads(open(filename).read())

# this similar to code in `fuzzer/src/config.rs:print_inputs(..)`
# def format_input(fmt, data):
# 	def read_bit(cycle, bit):

# 	for field in fmt:

def parse_time(tt):
	return tt['secs'] + tt['nanos'] * 1e-9

if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='analysis script for the fuzzing results')
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs=1)
	args = parser.parse_args()

	result_dir = args.DIR[0]
	assert os.path.isdir(result_dir)
	config = load_json(os.path.join(result_dir, 'config.json'))
	entry_pattern = os.path.join(result_dir, 'entry*.json')
	unordered_entries = [load_json(filename) for filename in glob.glob(entry_pattern)]
	entries = sorted(unordered_entries, key=lambda e: e['entry']['id'])

	# input_format = config['input']

	# from IPython import embed; embed()


	disco_times = [parse_time(entry['entry']['discovered_after']) for entry in entries]

	plt.plot(disco_times, range(len(disco_times)) )
	plt.ylabel("Inputs found")
	plt.xlabel("Time (s)")
	plt.show()