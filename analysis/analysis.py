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
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs=1)
	args = parser.parse_args()

	inp_dir = args.DIR[0]
	config, entries = load_results(inp_dir)

	if os.path.basename(inp_dir).startswith("sodor"):
		riscv.print_instructions(config, entries)

	fmt = InputFormat(config)
	inputs = [Input(ee, fmt) for ee in entries]

	make_mutation_graph("mutations.png", inputs)

	disco_times = [parse_time(entry['entry']['discovered_after']) for entry in entries]
	plt.plot(disco_times, range(len(disco_times)) )
	plt.ylabel("Inputs found")
	plt.xlabel("Time (s)")
	#plt.show()