
EMPTY :=
SPACE := $(EMPTY) $(EMPTY)
COMMA := ,
FIRRTL_TRANSFORMS := \
	hardwareafl.firrtltransforms.AutoCoverage \
	hardwareafl.firrtltransforms.SplitMuxConditions

INPUT := benchmarks/ICache.fir
OUTPUT := ICache.v
SCALA_SOURCES := $(shell find . -name '*.scala')

default: $(OUTPUT)

$(OUTPUT): $(INPUT) $(SCALA_SOURCES)
	sbt "runMain firrtl.Driver -i $< -o $@ -X verilog -ll info -fct $(subst $(SPACE),$(COMMA),$(FIRRTL_TRANSFORMS))"
