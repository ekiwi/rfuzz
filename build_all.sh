#!/usr/bin/env sh
echo "WARN: run git clean -dxf first."

echo "1) Instrumenting the GCD circuit"
sbt "runMain firrtl.Driver -i example/gcd.fir -o gcd.v -X verilog -fct hardwareafl.firrtltransforms.AutoCoverage,hardwareafl.firrtltransforms.SplitMuxConditions -ll info"

echo "2) Testing the Chisel Harness"
cd harness
sbt test
cd ..

echo "3) Generating the FPGA and Verilator Harness"
cd harness
sbt run "../gcd.toml"
cd ..

echo "4) Building the Verilator Harness"
cd verilator
mkdir -p build
cd build
meson .. --buildtype=release
ninja
cd ..
cd ..

echo "5) Synthesizing the FPGA Circuit"
cd fpga
make clean
make
cd ..
