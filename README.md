# Hardware AFL

Currently this is a simple example of using AFL with a small, manually written, Firrtl design.

Note that you must have verilator installed.

### Instructions
```
$ git submodule update --init
$ make run
```

### Run AutoCoverage
```
$ sbt "run-main firrtl.Driver -i firrtl/regress/Rob.fir -o rob.v -X verilog -fct hardwareafl.firrtltransforms.AutoCoverage,hardwareafl.firrtltransforms.SplitMuxConditions -ll info"
```
You can try designs other than the Rob so long as they are a single module
