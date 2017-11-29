#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

import sys, os, argparse, subprocess, tempfile, shutil

# Verilator Settings
OptLevel = '-O3'
CFlags = [OptLevel, '-DVL_USER_FINISH']
Verilator = ['verilator', '--cc']
DefaultFlags = ['--assert', '-Wno-fatal', '-Wno-WIDTH', '-Wno-STMTDLY',
                OptLevel, '-CFLAGS', '"{}"'.format(' '.join(CFlags))]
VerilatorIncluder = os.path.join('bin', 'verilator_includer')
# File Prediction Settings
GeneratedFiles = ['V{}_classes.mk', 'V{}.cpp', 'V{}.h', 'V{}.mk',
                  'V{}__Syms.cpp', 'V{}__Syms.h', 'V{}__ver.d', 'V{}__verFiles.dat']
GeneratedTraceFiles = ['V{}__Trace.cpp', 'V{}__Trace__Slow.cpp']
# Some Magic Library Files
VerilatorLibPath = 'include'
VerilatorLibFiles = ['verilated_vcd_c.cpp', 'verilated.cpp']

################################################################################

def check_file_predictions(toplevel, trace, out):
	files = GeneratedFiles + (GeneratedTraceFiles if args.trace else [])
	expected = {ff.format(toplevel) for ff in files}
	produced = {ff for ff in os.listdir(out) if os.path.isfile(os.path.join(out, ff))}
	missing = expected - produced
	if len(missing) > 0:
		sys.stderr.write("expected files were not generated: {}\n".format(missing))
		sys.exit(1)
	not_expected = produced - expected
	if len(not_expected) > 0:
		sys.stderr.write("unexpected files were generated: {}\n".format(not_expected))
		sys.exit(1)
	return produced

def verilator_root_from_makefile(filename):
	with open(filename) as make:
		for line in make:
			if line.startswith("VERILATOR_ROOT"):
				return line.split('=')[1].strip()
	sys.stderr.write("failed to find VERILATOR_ROOT in {}\n".format(filename))
	sys.exit(1)

def verilator_include(includer, inputs, output):
	cmd = ['perl', includer]
	args = ['-DVL_INCLUDE_OPT=include'] + inputs
	r = subprocess.run(' '.join(cmd + args), shell=True, stdout=subprocess.PIPE)
	if r.returncode != 0:
		sys.exit(r.returncode)
	print(output)
	with open(output, 'w') as out:
		out.write(r.stdout.decode('utf-8'))

if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='small wrapper around verilator to be used with meson')
	parser.add_argument('--trace', help='enable tracing, samle as verilators flag',
		                           action='store_const', const=True)
	parser.add_argument('--print-out', help='print the files that were created',
		                           action='store_const', const=True)
	parser.add_argument('-o', '--output', help='files expected to be generated', nargs='+')
	parser.add_argument('-i', '--input', help='verilog file to be simulated', nargs='+', required=True)
	args = parser.parse_args()

	verilog = args.input
	if not os.path.isfile(verilog):
		sys.stderr.write("input file `{}` not found\n".format(verilog))
		sys.exit(1)
	toplevel = os.path.splitext(os.path.basename(verilog))[0]

	out_dir = tempfile.TemporaryDirectory()
	out = out_dir.name

	TraceFlag = ['--trace'] if args.trace else []

	cmd = Verilator + TraceFlag + DefaultFlags + ['-Mdir', out, verilog]
	cmd = ' '.join(cmd)	# TODO: this should not be necessary!
	r = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE)
	if r.returncode != 0:
		sys.exit(r.returncode)
	produced = check_file_predictions(toplevel=toplevel, trace=args.trace, out=out)

	if args.print_out:
		ff = [os.path.join(out, ff) for ff in produced if ff.endswith('.cpp')]
		print('\n'.join(ff))

	makefile = os.path.join(out, 'V{}.mk'.format(toplevel))
	root = verilator_root_from_makefile(makefile)
	if not os.path.isdir(root):
		sys.stderr.write("verilator root `{}` does not exist\n".format(root))
		sys.exit(1)

	# copy output files
	output_files = { os.path.basename(oo): oo for oo in args.output }
	generated_outputs = set(output_files.keys()) - set(VerilatorLibFiles)
	missing = generated_outputs - produced
	if len(missing) > 0:
		sys.stderr.write("unable to produce requested output {}\n".format(missing))
		sys.exit(1)
	for name, dst in output_files.items():
		if name in generated_outputs:
			shutil.move(src=os.path.join(out, name), dst=dst)
		else:
			shutil.copyfile(src=os.path.join(root, VerilatorLibPath, name), dst=dst)
