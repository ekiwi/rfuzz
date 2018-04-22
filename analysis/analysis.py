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
from e2e import CoverageCalcuator
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
		print("processing {} ...".format(name))
		config, entries, dut = load_results(inp_dir)

		end2end = CoverageCalcuator(dut)
		fuzzer_cov = CoverageFormat(config)
		fmt = InputFormat(config)
		inputs = [Input(ee, fmt, fuzzer_cov, end2end) for ee in entries]

		#if "sodor" in os.path.basename(inp_dir):
		#	riscv.print_instructions(inputs)

		make_mutation_graph("{}_mutations.png".format(name), inputs)

		disco_times = [ii.discovered_after for ii in inputs if not ii.e2e_cov['invalid']]
		cov = [ii.e2e_cov['total'] for ii in inputs if not ii.e2e_cov['invalid']]
		coverage_data.append((disco_times, cov, name))
		print(inputs[-1].e2e_cov['not_covered'])
		print("invalid: {}/{}".format(sum(ii.e2e_cov['invalid'] for ii in inputs), len(inputs)))

	#print(coverage_data)

	max_time = max(cc[0][-1] for cc in coverage_data)
	for disco_times, cov, name in coverage_data:
		disco_times.append(max_time)
		cov.append(cov[-1])
		plt.plot(disco_times, cov, label=name)
	plt.legend(loc='best')
	plt.ylabel("T/F Coverage")
	plt.xlabel("Time (s)")
	plt.show()