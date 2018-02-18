
DUT := ICacheCover

BUILD := build
INPUT := benchmarks/$(DUT).fir
INSTRUMENTED := $(BUILD)/$(DUT).v
TOML := $(BUILD)/$(DUT).toml
VERILATOR_HARNESS := $(BUILD)/$(DUT)_VHarness.v
FPGA_HARNESS := $(BUILD)/$(DUT)_FPGAHarness.v



default: $(INSTRUMENTED)

################################################################################
# instrumentation rules
################################################################################
EMPTY :=
SPACE := $(EMPTY) $(EMPTY)
COMMA := ,
FIRRTL_TRANSFORMS := \
	hardwareafl.firrtltransforms.ProfilingTransform \
	firrtl.passes.wiring.WiringTransform \
	hardwareafl.firrtltransforms.AutoCoverage \
	hardwareafl.firrtltransforms.SplitMuxConditions
INSTRUMENTATION_SOURCES := $(shell find instrumentation -name '*.scala')


$(INSTRUMENTED) $(TOML): $(INPUT) $(INSTRUMENTATION_SOURCES)
	cd instrumentation ;\
	sbt "runMain firrtl.Driver -i ../$< -o ../$@ -X verilog -ll info -fct $(subst $(SPACE),$(COMMA),$(FIRRTL_TRANSFORMS))"
	mv instrumentation/$(DUT).toml $(TOML)

################################################################################
# harness rules
################################################################################
HARNESS_SRC := $(shell find harness/src -name '*.scala')
HARNESS_TEST := $(shell find harness/test -name '*.scala')

$(VERILATOR_HARNESS) $(FPGA_HARNESS): $(TOML) $(HARNESS_SRC)
	cd harness ;\
	sbt "run ../$(TOML)"
	mv harness/VerilatorHarness.v $(VERILATOR_HARNESS)
	mv harness/Harness.v $(FPGA_HARNESS)


################################################################################
# Verilator Binary Rules
################################################################################
