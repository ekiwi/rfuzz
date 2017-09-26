
root_dir =  $(abspath .)
firrtl_dir = $(root_dir)/firrtl
src_dir = $(root_dir)/src
build_dir = $(root_dir)/build
afl_dir = /scratch/jack/afl-2.41b
afl_out_dir = $(root_dir)/out
FIRRTL ?= $(firrtl_dir)/utils/bin/firrtl
FIRRTL_JAR ?= $(firrtl_dir)/utils/bin/firrtl.jar

TOP := gcdcov
TOP_CPP := aflwrap.cpp
TARGET_V := $(build_dir)/$(TOP).v
TARGET_VERILATOR := $(build_dir)/V$(TOP).mk
TARGET_BINARY := $(build_dir)/V$(TOP)

all: $(TARGET_BINARY)

$(FIRRTL_JAR):
	make -C $(firrtl_dir) build

$(TARGET_V): $(src_dir)/$(TOP).fir $(FIRRTL_JAR)
	$(FIRRTL) -i $< -o $@ -X verilog

binary: $(TARGET_VERILATOR)

VERILATOR := verilator --cc --exe

VERILATOR_FLAGS := --top-module $(TOP) \
	--assert \
	-Wno-fatal \
	-Wno-WIDTH \
	-Wno-STMTDLY \
	--trace \
	-O1 \
  +define+TOP_TYPE=V$(TOP) \
  +define+PRINTF_COND='!$(TOP).reset' \
  +define+STOP_COND='!$(TOP).reset' \
  -CFLAGS "-O1 -DTOP_TYPE=V$(TOP) -DVL_USER_FINISH -include V$(TOP).h -include $(src_dir)/afl.h -std=c++11 -fpermissive" \

$(TARGET_VERILATOR): $(TARGET_V) $(TOP_CPP)
	$(VERILATOR) $< $(TOP_CPP) $(src_dir)/afl.c $(VERILATOR_FLAGS) -Mdir $(build_dir)

$(TARGET_BINARY): $(TARGET_VERILATOR)
	make VM_PARALLEL_BUILDS=1 -C $(build_dir) -f $<

# export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
#cat in/test0 | $<
run: $(TARGET_BINARY)
	mkdir -p $(afl_out_dir)
	AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1 AFL_SKIP_CPUFREQ=1 $(afl_dir)/afl-fuzz -i in -o $(afl_out_dir) $<

.PHONY: clean all binary run

clean:
	rm -rf $(build_dir)/* $(afl_out_dir)
