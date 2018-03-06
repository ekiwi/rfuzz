#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, Kevin Laeufer <ekiwi@berkeley.edu>

# Generates the `dut.hpp` file which contains dut specific interface code
# from the TOML dut description file.

import os, sys, argparse
import toml

template = """
// This file was generated from {conf_toml} using the dut_gen.py script.
// It contains DUt specific interface code for the verilator C++ test harness.

#ifndef DUT_CONF_HPP
#define DUT_CONF_HPP

#include <V{toplevel}_VHarness.h>
#define TOP_TYPE V{toplevel}_VHarness

#define TOPLEVEL_STR "{toplevel}"

static constexpr size_t CoverageSize = {cov_size};
static constexpr size_t InputSize    = {input_size};

static inline void apply_input(TOP_TYPE* top, const uint8_t* input) {{
{apply_input}
}}
static inline void read_coverage(TOP_TYPE* top, uint8_t* coverage) {{
{read_coverage}
}}

#endif // DUT_CONF_HPP
"""


align = 8
def bits_to_size(bits):
	bytes = (bits + 7) // 8
	words = (bytes + align - 1) // align
	return words * align

if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='generate DUT specific verilator code')
	parser.add_argument('-o', '--output', help='dut header file name', required=True)
	parser.add_argument('-i', '--input', help='toml dut description', required=True)
	args = parser.parse_args()


	conf_toml = args.input
	if not os.path.isfile(conf_toml):
		sys.stderr.write("dur config file `{}` not found\n".format(conf_toml))
		sys.exit(1)

	header = args.output
	header_dir = os.path.dirname(os.path.abspath(header))
	if not os.path.isdir(header_dir):
		sys.stderr.write("output directory `{}` does not exist\n".format(header_dir))
		sys.exit(1)

	conf = toml.loads(open(conf_toml).read())
	input_bits = sum(ii['width'] for ii in conf['input'])
	input_size = bits_to_size(input_bits)
	cov_bits = sum(counter['width'] for counter in conf['counter'])
	# the cycles count in front of the coverage feedback takes 16bit
	cov_size = bits_to_size(cov_bits + 2 * 8) - 2

	i_line = "\ttop->io_input_bytes_{0: <3}  = input[{0: >3}];"
	c_line = "\tcoverage[{0: >3}] = top->io_coverage_bytes_{0};"
	dd = { 'conf_toml': conf_toml, 'toplevel': conf['general']['top'],
	       'cov_size': cov_size, 'input_size': input_size,
	       'apply_input':   "\n".join(i_line.format(ii) for ii in range(input_size)),
	       'read_coverage': "\n".join(c_line.format(ii) for ii in range(cov_size))
	}

	output = template.format(**dd)
	open(header, 'w').write(output)