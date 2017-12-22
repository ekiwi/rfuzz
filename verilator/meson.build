project('fuzz-server', 'cpp', default_options : ['cpp_std=c++14'], version: '0.0.1')


# generate verilator
# TODO: integrate sbt
# sbt = find_program('sbt')
# verilog = custom_target('chisel',
#     output : 'UartDecoder.v',
#     input  : '../src/main/scala/UartDecoder.scala',
#     depend_files: '../build.sbt',
#     command : [sbt, '"run -X verilog --target-dir ."'])

top = '../harness/VerilatorHarness.v'
dependencies = ['../gcd.v']

# custom verilator target
verilator_py = find_program('verilator.py')
verilator = dependency('verilator', version: '>= 3.886')
verilator_defines = ['-DVL_PRINTF=printf', '-DVM_COVERAGE=0', '-DVM_SC=0', '-DVL_USER_FINISH']
verilator_warnings = ['-Wno-char-subscripts', '-Wno-sign-compare',
                      '-Wno-uninitialized', '-Wno-unused-but-set-variable',
                      '-Wno-unused-parameter', '-Wno-unused-variable']
verilator_files = ['VVerilatorHarness.h', 'VVerilatorHarness__Syms.h',
                   'VVerilatorHarness.cpp', 'VVerilatorHarness__Syms.cpp',
                   'verilated_vcd_c.cpp', 'verilated.cpp']
if get_option('trace')
	verilator_cmd = [verilator_py, '--trace']
	verilator_defines += ['-DVM_TRACE=1']
	verilator_files += ['VVerilatorHarness__Trace.cpp', 'VVerilatorHarness__Trace__Slow.cpp']
else
	verilator_cmd = [verilator_py]
endif
# TODO: potentially change to be a `generator`: http://mesonbuild.com/Generating-sources.html
verilator_src = custom_target('verilator',
    output : verilator_files,
    input  : [top] + dependencies,
    depend_files: '../build.sbt',
    command : verilator_cmd + ['-o', '@OUTPUT@', '-i', '@INPUT@'])
libsim = static_library('sim', verilator_src, dependencies: [verilator],
                        cpp_args: verilator_defines + verilator_warnings + ['-faligned-new'])
libsim_dep = declare_dependency(
             # TODO: is there a less hacky way to filter out the headerfiles?
    sources: [verilator_src[0], verilator_src[1]],
    link_with: libsim)


sources = ['top.cpp', 'fpga_queue.cpp']
executable('decoder', sources,
           cpp_args: verilator_defines,
           dependencies: [libsim_dep, verilator])
