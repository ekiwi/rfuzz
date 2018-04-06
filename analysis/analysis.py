#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import argparse, os, subprocess

# let's try to be a cool **data** scientist!
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from format import *
import riscv

def shell(): from IPython import embed; embed()

if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='analysis script for the fuzzing results')
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs='+')
	args = parser.parse_args()

	coverage_data = []

	for inp_dir in args.DIR:
		name = os.path.basename(inp_dir)
		config, entries = load_results(inp_dir)

		#if os.path.basename(inp_dir).startswith("sodor"):
		#	riscv.print_instructions(config, entries)

		cov = CoverageFormat(config)
		fmt = InputFormat(config)
		inputs = [Input(ee, fmt, cov) for ee in entries]

		make_mutation_graph("{}_mutations.png".format(name), inputs)

		disco_times = [ii.discovered_after for ii in inputs]
		cov = [ii.total_cov / ii.max_cov for ii in inputs]
		coverage_data.append((disco_times, cov))

	max_time = max(cc[0][-1] for cc in coverage_data)
	for disco_times, cov in coverage_data:
		disco_times.append(max_time)
		cov.append(cov[-1])
		plt.plot(disco_times, cov)
	plt.ylabel("T/F Coverage")
	plt.xlabel("Time (s)")
	plt.show()