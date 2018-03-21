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

def shell(): from IPython import embed; embed()

dasm_bin = None if 'RISCV' not in os.environ else os.path.join(os.environ['RISCV'], 'bin', 'spike-dasm')

def dasm(instruction):
	hx = "DASM({:x})\n".format(instruction).encode('ASCII')
	rr = subprocess.run([dasm_bin], input=hx, check=True, stdout=subprocess.PIPE)
	return rr.stdout.decode('ASCII').strip()


if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='analysis script for the fuzzing results')
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs=1)
	args = parser.parse_args()

	config, entries = load_results(args.DIR[0])



	fmt = InputFormat(config)

	for ee in entries:
		inp = Input(ee, fmt)
		print("-------------------------------------------")
		print("- {} Entry:".format(inp.id))
		# for ii, cc, bb, raw in zip(range(inp.cycles), inp.formated, inp.bytes, inp.inputs):
		# 	print("{}: {}".format(ii, raw))
		# 	print("{}: {}".format(ii, bb))
		# 	print("{}: {}".format(ii, cc))
		for ii, cc in enumerate(inp.formated):
			valid = cc['io_imem_resp_valid']
			#skip = (valid == 0)
			skip = False
			if not skip:
				binary = cc['io_imem_resp_bits_data']
				instruction = dasm(binary)
				print("{}: ({}) {:08x} -> {}".format(ii, valid, binary, instruction))


	disco_times = [parse_time(entry['entry']['discovered_after']) for entry in entries]
	plt.plot(disco_times, range(len(disco_times)) )
	plt.ylabel("Inputs found")
	plt.xlabel("Time (s)")
	#plt.show()