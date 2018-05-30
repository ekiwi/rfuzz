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

def analyse_out(inp_dir):
	name = os.path.basename(inp_dir)
	print("processing {} ...".format(name))
	config, entries, dut, latest = load_results(inp_dir)

	end2end = CoverageCalcuator(dut)
	fuzzer_cov = CoverageFormat(config)
	fmt = InputFormat(config)
	inputs = [Input(ee, fmt, fuzzer_cov, end2end) for ee in entries]

	#if "sodor" in os.path.basename(inp_dir):
	#	riscv.print_instructions(inputs)

	make_mutation_graph("{}_mutations.png".format(name), inputs)

	disco_times = [ii.discovered_after for ii in inputs if not ii.e2e_cov['invalid']]
	cov = [ii.e2e_cov['total'] for ii in inputs if not ii.e2e_cov['invalid']]
	if latest is not None:
		disco_times.append(latest)
		cov.append(cov[-1])

	print("# not covered: {}".format(len(inputs[-1].e2e_cov['not_covered'])))
	print(inputs[-1].e2e_cov['not_covered'])
	print("invalid: {}/{}".format(sum(ii.e2e_cov['invalid'] for ii in inputs), len(inputs)))
	#print([ii.cycles for ii in inputs])

	return (disco_times, cov, name)

CI_mult = [12.7062,4.3027,3.1824,2.7764,2.5706,2.4469,2.3646, 2.3060, 2.2622,2.2281,2.2010,2.1788,2.1604,2.1448, 2.131,2.120,2.110,2.101,2.093,2.086,2.080,2.074,2.069]
color_cycle = [color['color'] for color in list(plt.rcParams['axes.prop_cycle'])]



def analyse_multi(inp_dirs):
	if len(inp_dirs) < 1:
		print("ERROR: inp_dirs in {}".format(inp_dirs))
		sys.exit(1)

	times = []
	percentages = []
	all_times = []
	for subdir in inp_dirs:
		disco_times, cov, name = analyse_out(subdir)
		times.append(disco_times)
		all_times += disco_times
		percentages.append(cov)

	all_percentages = np.zeros((len(inp_dirs),len(all_times)))
	all_times_sorted = sorted(all_times)
	for ii in range(len(inp_dirs)):
		#print(len(all_times_sorted), len(times[ii]), len(percentages[ii]))
		#print(all_times_sorted, times[ii], percentages[ii])
		all_percentages[ii] = np.interp(all_times_sorted, times[ii], percentages[ii])

	means = np.mean(all_percentages, axis = 0)
	stds = np.std(all_percentages, axis = 0)
	stds = stds/np.sqrt(len(all_percentages))
	stds = stds * CI_mult[len(all_percentages)-2]
	return (all_times_sorted, means, stds, determine_name(inp_dirs))

def determine_name(dirs):
	names = [os.path.basename(s) for s in dirs]
	if len(names) == 1:
		name = names[0]
	else:
		names = ['.'.join(n.split('.')[1:]) for n in names]
		assert all(n == names[0] for n in names)
		name = os.path.basename(os.path.dirname(dirs[0]))
	if name.endswith('.out'):
		return name[:-len('.out')]
	return name

if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='analysis script for the fuzzing results')
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs='+')
	args = parser.parse_args()

	coverage_data = []

	for inp_dir in args.DIR:
		conf_json = os.path.join(inp_dir, "config.json")
		subdirs = glob.glob(os.path.join(inp_dir, '*.out'))
		if os.path.isfile(conf_json):
			assert len(subdirs) == 0
			subdirs = [inp_dir]
		coverage_data.append(analyse_multi(subdirs))

	#print(coverage_data)

	for ii, (disco_times, cov, stds, name) in enumerate(coverage_data):
		plt.plot(disco_times, cov, label=name)
		#plt.fill_between(disco_times, cov - stds, cov + stds,
		#                 facecolor=color_cycle[ii], alpha=0.2,
		#                 linestyle='dashed', edgecolor=color_cycle[ii])
	plt.legend(loc='best')
	plt.ylabel("T/F Coverage")
	plt.xlabel("Time (s)")
	plt.ylim(ymax=1.0, ymin=0.0)
	# hide lines on top and right side
	plt.gca().spines['right'].set_visible(False)
	plt.gca().spines['top'].set_visible(False)
	plt.show()