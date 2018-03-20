#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import argparse, os, sys, json, glob


def load_json(filename):
	return json.loads(open(filename).read())

if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='analysis script for the fuzzing results')
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs=1)
	args = parser.parse_args()

	result_dir = args.DIR[0]
	assert os.path.isdir(result_dir)
	config = load_json(os.path.join(result_dir, 'config.json'))
	entry_pattern = os.path.join(result_dir, 'entry*.json')
	entries = [load_json(filename) for filename in glob.glob(entry_pattern)]

	print(len(entries))
