#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import argparse,os

# let's try to be a cool **data** scientist!
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from format import load_results, parse_time


if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='analysis script for the fuzzing results')
	parser.add_argument('DIR', help='fuzzer output directory to be analyzed', nargs=1)
	args = parser.parse_args()

	config, entries = load_results(args.DIR[0])

	disco_times = [parse_time(entry['entry']['discovered_after']) for entry in entries]

	plt.plot(disco_times, range(len(disco_times)) )
	plt.ylabel("Inputs found")
	plt.xlabel("Time (s)")
	plt.show()