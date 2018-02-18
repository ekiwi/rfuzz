
EMPTY :=
SPACE := $(EMPTY) $(EMPTY)
COMMA := ,
FIRRTL_TRANSFORMS := \
	hardwareafl.firrtltransforms.ProfilingTransform \
	firrtl.passes.wiring.WiringTransform \
	hardwareafl.firrtltransforms.AutoCoverage \
	hardwareafl.firrtltransforms.SplitMuxConditions

INPUT := benchmarks/ICacheCover.fir
OUTPUT := $(basename $(notdir $(INPUT))).v
SCALA_SOURCES := $(shell find . -name '*.scala')

default: $(OUTPUT)

$(OUTPUT): $(INPUT) $(SCALA_SOURCES)
	sbt "runMain firrtl.Driver -i $< -o $@ -X verilog -ll info -fct $(subst $(SPACE),$(COMMA),$(FIRRTL_TRANSFORMS))"
