PLATFORM ?= zynq
DUT ?= ICache

base_dir = $(abspath ..)
build_dir = $(base_dir)/build
bmark_dir = $(base_dir)/benchmarks
verilator_dir = $(base_dir)/verilator
simif_dir = $(abspath midas/src/main/cc)
driver_dir = $(abspath src/main/cc)
fpga_dir = $(abspath platforms/$(PLATFORM))

firrtl = $(build_dir)/$(DUT).lo.fir
in_toml = $(build_dir)/$(DUT)_InstrumentationInfo.toml
out_toml = $(build_dir)/$(DUT).toml

SBT ?= sbt
SBT_FLAGS ?= -J-Xmx16G -J-Xss8M -J-XX:MaxMetaspaceSize=512M

$(firrtl) $(in_toml):
	$(MAKE) -C $(base_dir) instrumentation

verilog = $(build_dir)/FPGATop.v
header = $(build_dir)/VerilatorHarness-const.h
$(verilog) $(header): $(firrtl) $(in_toml) $(shell find . -name "*.scala")
	$(SBT) $(SBT_FLAGS) "run $(build_dir) $(firrtl) $(in_toml) $(out_toml)"

verilog: $(verilog)

harness_h = $(addprefix $(verilator_dir)/,fpga_queue.hpp fuzzer.hpp)
harness_cc = $(addprefix $(verilator_dir)/,fpga_queue.cpp)

driver_h = $(addprefix $(driver_dir)/,rfuzz.h)
emul_cc = $(addprefix $(driver_dir)/,rfuzz-emul.cc)

verilator = $(build_dir)/VVerilatorHarness
verilator_debug = $(build_dir)/VVerilatorHarness-debug

$(verilator) $(verilator_debug): export CXXFLAGS := $(CXXFLAGS) -std=c++14 -I$(verilator_dir)

$(verilator): $(emul_cc) $(driver_h) $(harness_cc) $(harness_h) $(verilog)
	$(MAKE) -C $(simif_dir) verilator \
	PLATFORM=$(PLATFORM) DESIGN=VerilatorHarness GEN_DIR=$(build_dir) \
	DRIVER="$(emul_cc) $(harness_cc)"

$(verilator_debug): $(emul_cc) $(driver_h) $(harness_cc) $(harness_h) $(verilog)
	$(MAKE) -C $(simif_dir) verilator-debug \
	PLATFORM=$(PLATFORM) DESIGN=VerilatorHarness GEN_DIR=$(build_dir) \
	DRIVER="$(emul_cc) $(harness_cc)"

verilator: $(verilator)
	$< 2> $<.out
	
verilator-debug: $(verilator_debug)
	$< +waveform=$<.vcd 2> $<.out

vcs = $(build_dir)/VerilatorHarness
vcs_debug = $(build_dir)/VerilatorHarness-debug

$(vcs) $(vcs_debug): export CXXFLAGS := $(CXXFLAGS) -std=c++14 -I$(verilator_dir)

$(vcs): $(emul_cc) $(driver_h) $(harness_cc) $(harness_h) $(verilog)
	$(MAKE) -C $(simif_dir) vcs \
	PLATFORM=$(PLATFORM) DESIGN=VerilatorHarness GEN_DIR=$(build_dir) \
	DRIVER="$(emul_cc) $(harness_cc)"

$(vcs_debug): $(emul_cc) $(driver_h) $(harness_cc) $(harness_h) $(verilog)
	$(MAKE) -C $(simif_dir) vcs-debug \
	PLATFORM=$(PLATFORM) DESIGN=VerilatorHarness GEN_DIR=$(build_dir) \
	DRIVER="$(emul_cc) $(harness_cc)"

vcs: $(vcs)
	$< 2> $<.out
	
vcs-debug: $(vcs_debug)
	$< +waveform=$<.vpd 2> $<.out

ifeq ($(PLATFORM),zynq)
board     ?= zedboard
board_dir := $(fpga_dir)/$(board)
bitstream := fpga-images-$(board)/boot.bin

$(board_dir)/src/verilog/$(DUT)/FPGATop.v: $(verilog)
	$(MAKE) -C $(board_dir) clean DESIGN=$(DUT)
	mkdir -p $(dir $@)
	cp $< $@

fpga: $(board_dir)/src/verilog/$(DUT)/FPGATop.v
	mkdir -p $(build_dir)/$(board)
	$(MAKE) -C $(board_dir) $(bitstream) DESIGN=$(DUT)
	cp $(board_dir)/$(bitstream) $(build_dir)/$(board)

include zynq.mk
endif

driver_cc = $(addprefix $(driver_dir)/,rfuzz-$(PLATFORM).cc)
$(PLATFORM) = $(build_dir)/$(DUT)-$(PLATFORM)

$($(PLATFORM)): $(driver_cc) $(simif_cc) $(simif_h) $(header) $(gmp)
	mkdir -p $(build_dir)/$(PLATFORM)
	cp $(header) $(build_dir)/$(PLATFORM)
	$(MAKE) -C $(simif_dir) $(PLATFORM) DESIGN=VerilatorHarness \
	GEN_DIR=$(build_dir)/$(PLATFORM) DRIVER="$(driver_cc) $(harness_cc)"

$(PLATFORM): $($(PLATFORM))

.PHONY: verilog
.PHONY: verilator verilator-debug
.PHONY: vcs vcs-debug
.PHONY: fpga $(PLATFORM)
