#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

import os, subprocess
from format import InputFormat, Input

dasm_bin = None if 'RISCV' not in os.environ else os.path.join(os.environ['RISCV'], 'bin', 'spike-dasm')

def dasm(instruction):
	hx = "DASM({:x})\n".format(instruction).encode('ASCII')
	rr = subprocess.run([dasm_bin], input=hx, check=True, stdout=subprocess.PIPE)
	return rr.stdout.decode('ASCII').strip()

def print_instructions(inputs):
	for inp in inputs:
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