#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2018, University of California, Berkeley
# author: Kevin Laeufer <laeufer@cs.berkeley.edu>

# this script launches multiple fuzz servers and fuzzers to collect data
# for the analysis script which can extract confidence intervals from multiple
# runs

import sys, os, subprocess, time, shutil, signal

def shell(): from IPython import embed; embed()

fir_patch = {'ICache': 'ICacheCover'}

analysis_dir = os.path.dirname(os.path.abspath(__file__))
build_dir = os.path.abspath(os.path.join(analysis_dir, '..', 'build'))
root_dir = os.path.abspath(os.path.join(analysis_dir, '..'))
fuzzer_dir = os.path.abspath(os.path.join(analysis_dir, '..', 'fuzzer'))

def make_out_dir(dirname):
	parent = os.path.dirname(os.path.abspath(dirname))
	if not os.path.isdir(parent):
		print("directory {} does not exist!".format(parent))
		sys.exit(1)
	if os.path.isdir(dirname):
		shutil.rmtree(dirname)
	os.makedirs(dirname, exist_ok=True)


class Instance:
	def __init__(self, dut, out, options, id):
		self.dut = dut
		self.options = options
		self.id = id
		self.logfile = os.path.abspath(os.path.join(out, "{}.{}.log".format(self.id, self.dut)))
		self.outdir = os.path.abspath(os.path.join(out, "{}.{}.out".format(self.id, self.dut)))
		self.logfd = None
		self.server_proc = None
		self.fuzzer_proc = None
	def start_server(self):
		# clear dir
		fifo_dir = os.path.join('/tmp', 'fpga', str(self.id))
		if os.path.isdir(fifo_dir):
			shutil.rmtree(fifo_dir)
		cwd = root_dir
		cmd = ['{}/{}_server'.format(build_dir, self.dut), str(self.id)]
		self.server_proc = subprocess.Popen(cmd, cwd=cwd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
	def start_fuzzer(self):
		cwd = fuzzer_dir
		cmd = ['cargo', 'run', '--release', '--', '-o', self.outdir]
		cmd += ['-s', str(self.id)]
		cmd += self.options + [ '../build/{}.toml'.format(dut)]
		self.logfd = open(self.logfile, 'w')
		self.fuzzer_proc = subprocess.Popen(cmd, cwd=cwd, stdout=self.logfd)
	def interrupt_fuzzer(self):
		if self.fuzzer_proc.poll() is None:
			self.fuzzer_proc.send_signal(signal.SIGINT)
	def wait_for_procs(self):
		self.fuzzer_proc.wait(timeout=2)
		self.server_proc.wait(timeout=1)


if __name__ == '__main__':
	if len(sys.argv) < 4:
		print("usage: {} [OPTIONS] DUT OUTDIR TIMEOUT".format(sys.argv[0]))
		sys.exit(1)

	timeout = float(sys.argv[-1])
	out_dir = sys.argv[-2]
	dut = sys.argv[-3]
	options = sys.argv[1:-3]
	fir = "{}.fir".format(fir_patch.get(dut, dut))
	instance_count = 5


	# build dut
	cwd = root_dir
	cmd = ['make', 'DUT={}'.format(dut), 'FIR={}'.format(fir), 'bin']
	subprocess.run(cmd, cwd=cwd, check=True)

	# build fuzzer
	subprocess.run(['cargo', 'build', '--release'], cwd=fuzzer_dir, check=True)

	make_out_dir(out_dir)


	instances = [Instance(dut, out_dir, options, ii) for ii in range(instance_count)]

	# spin up servers
	for ii in instances: ii.start_server()

	# wait a bit
	time.sleep(1e-2)

	# launch fuzzers
	for ii in instances: ii.start_fuzzer()

	time.sleep(timeout)

	# kill procs
	for ii in instances: ii.interrupt_fuzzer()
	for ii in instances: ii.wait_for_procs()