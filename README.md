# rfuzz: coverage-directed fuzzing for RTL research platform

This repository contains the `rfuzz` research platform which was
created at UC Berkeley's [ADEPT Lab](https://adept.eecs.berkeley.edu/)
to investigate the use of coverage-directed fuzzing for RTL
pre-silicon testing.

The source code is release under a BSD-3-Clause license in order to
allow for reproduction of experimental results as well as a basis for
further research.

## Instructions

### Clone the Repository

```.sh
git clone https://github.com/ekiwi/rfuzz.git
cd rfuzz
# switch submodules to use HTTPS instead of SSH
sed -i 's/git@github.com:/https:\/\/github.com\//'  .gitmodules
# initialize and update submodules
git submodule update --init
```

### Install Dependencies

On a fresh installation of `Ubuntu 18.04` (Bionic Beaver) the following
installation steps were necessary:

1. Install dependencies from the default repositories (requires root privileges):

```.sh
apt update && apt upgrade
apt install build-essential meson pkg-config openjdk-8-jdk verilator cargo
apt install python3-toml python3-numpy python3-matplotlib graphviz
```


2. Install `sbt` by following the [official docs](https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html#Ubuntu+and+other+Debian-based+distributions):

```.sh
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt
```

3. On a _headless_ server: add the following to your `~/.config/matplotlib/matplotlibrc`:

```
backend: agg
```
([more info](https://stackoverflow.com/questions/2801882/generating-a-png-with-matplotlib-when-display-is-undefined))


**Note:** _`rfuzz` is developed on  [Fedora Linux Workstation](https://getfedora.org/)
which thus also offers good support_

### Software Simulation Fuzz Server

In order to fuzz test a particular RTL design, we need to take the FIRRTL source
code, instrument it and compile it into a fast RTL simulation using the
[verilator](https://www.veripool.org/wiki/verilator) tool.

The exact build steps are encoded in the toplevel `Makefile` provided with
this repository.
In order to build the final binary you can use the pseudo target `bin`.
If you also want to start the binary you can use the pseudo target `run`
(_WARNING: this will create the `/tmp/fpga` directory and will delete any
existing directory of the same name_).

Thus to start the RTL simulation (also called the **fuzz server**)
for the default `Sodor3Stage` benchmark you just need to execute `make run`.
This should provide you with the following output:
```
rm -rf /tmp/fpga
mkdir /tmp/fpga
/home/ubuntu/rfuzz/build/ICache_server
Fuzz Server for ICache
Allocated Bytes per Input:    40
Allocated Bytes per Coverage: 30
created tx fifo
created rx fifo
```

This signals that the fuzz server is ready to receive test input from the
fuzzer as well as provide coverage feedback.

### Fuzzer

The fuzzer is implemented in software and connects to the software simulation
fuzz server or the FPGA driver through shared memory.
As opposed to the fuzz server, the fuzzer itself is design agnostic and
thus only needs to be compiled once. The design specific information
is propagated through a TOML file generated alongside the fuzz server
when executing `make bin` (or `make run`).

To build the fuzzer change to the `fuzzer` directory and execute:
```.sh
cargo build --release
```

**Note:** _the performance of `release` builds can be around 10x faster.
Do NOT run benchmarks with `debug` builds (the default configuration)._

To see a list of options that the fuzzer supports run:
```.sh
cargo run --release -- -h
```
This should provide you with an output similar to this:
```
kfuzz 0.1.0
Kevin Laeufer <ekiwi@berkeley.edu>
AFL-style fuzzer specialized for fuzzing RTL circuits.

USAGE:
    kfuzz [FLAGS] [OPTIONS] <TOML> --output-directory <DIR>

FLAGS:
    -h, --help                      Prints help information
    -q, --print-queue               Prints queue content at the end of a fuzzing run.
    -c, --print-total-cov           Prints the union coverage at the end of a fuzzing run.
    -r, --random                    Generate independent random inputs instead of using the fuzzing algorithm.
    -d, --skip-deterministic        Skip all deterministic mutation strategies.
    -n, --skip-non-deterministic    Skip all non-deterministic mutation strategies.
    -t, --test-mode                 Test the fuzz server with known input/coverage pairs.
    -v, --version                   Prints version information

OPTIONS:
    -s, --server-id <fuzz_server_id>    The id of the fuzz server isntance to connect to. [default: 0]
    -i, --input-directory <DIR>         The output directory of a previous run from which to resume.
    -j, --jqf-level <jqf_level>         Select which level of JQF to apply. [default: 2]  [possible values: 0, 1, 2]
    -o, --output-directory <DIR>        Used to log this session. Must be empty!
        --seed-cycles <seed_cycles>     The starting seed consits of all zeros for N cycles. [default: 5]

ARGS:
    <TOML>    TOML file describing the circuit being fuzzed
```

To quickly fuzz the default configuration, make sure that the fuzz server is
running (see previous section) and then launch the fuzzer like this:
```.sh
cargo run --release -- -c -o out ../build/Sodor3Stage.toml
```

To terminate fuzzing use `Ctrl+C` and wait for the fuzzer to shut down
(this can take some time depending on how fast the design under test executes).

### FPGA Accelerated Fuzz Server

**TODO:** document

### Analysis

The scripts that were used to analyze the fuzzing results and generate
graphs for our `ICCAD'18` paper can be found in the `analysis/` directory.
Our raw results from running the fuzz server and fuzzer on the AWS cloud
can be found in the [rfuzz-results](https://github.com/ekiwi/rfuzz-results)
repository in the
[jack](https://github.com/ekiwi/rfuzz-results/tree/390e4eedbca8254b8b4aac859b906827c6052f1c/jack)
folder.
In order to ignore any functional changes that were made to `rfuzz`
after the `ICCAD'18` submission, please make sure that you use the
`iccad18` branch in the `rfuzz` repository.

In order to regenerate the graphs, make sure that your installation has a
graphical desktop environment (or add the appropriate code to dump graphs to disk
to the end of [analysis.py](analysis/analysis.py)).  
Then make sure that the appropriate binaries are available:

```.sh
make FIR=FFTSmall.fir DUT=FFTSmall bin
make FIR=Sodor1Stage.fir DUT=Sodor1Stage bin
make FIR=Sodor3Stage.fir DUT=Sodor3Stage bin
make FIR=Sodor5Stage.fir DUT=Sodor5Stage bin
make FIR=TLI2C.fir DUT=TLI2C bin
make FIR=TLSPI.fir DUT=TLSPI bin
```

Now you can run the analysis script like this:
```.sh
./analysis.py ../../rfuzz-results/jack/Sodor3Stage.jqf1.seed5.random.out ../../rfuzz-results/jack/Sodor3Stage.jqf2.seed5.out
```

This will display the resulting graph which should be an exact copy of the one
printed in our paper (assuming you used the `iccad18` branch).
It will also generate a mutation history graph for each fuzzing run,
e.g. `0.Sodor3Stage.out_mutations.png`.

**Note:** _the `analysis.py` script uses a version of the design with minimal
instrumentation and restarts the RTL simulator for each test input in order
to increase our confidence in the analysis results.
Invalid inputs as indicated by failing assumptions in the design
are automatically discarded and excluded from the coverage results.
Have a look at the scripts in the `analysis/` directory to learn the details._

### Benchmarks

A collection of benchmarks in the form of
RTL circuits in the [FIRRTL format](https://bar.eecs.berkeley.edu/projects/firrtl.html)
can be found in the `benchmarks/` directory.
Please consult the [local Readme](benchmarks/Readme.md) to learn more about
how each individual benchmark was created.

Our `Makefile` takes the name of a FIRRTL (`*.fir`) file and the name
of the corresponding RTL toplevel module as parameters, e.g.:
```.sh
make FIR=TLI2C.fir DUT=TLI2C run
```

The following benchmarks are available, benchmarks used in our `ICCAD'18` paper
are listed in **bold**:

| Name                    | `FIR`                   | `DUT`               | Description                                   | Source                                                         |
|-------------------------|-------------------------|---------------------|-----------------------------------------------|----------------------------------------------------------------|
| **FFT Small**           | `FFTSmall.fir`          | `FFTSmall`          | FFT DSP circuit                               | [fft](https://github.com/ucb-art/fft)                          |
| ICache                  | `ICache.fir`            | `ICache`            | instruction cache from Rocket Chip            | [rocket-chip](https://github.com/freechipsproject/rocket-chip) |
| ICache w/ Coverage      | `ICacheCover.fir`       | `ICache`            | ICache w/ user defined coverage annotations   | [rocket-chip](https://github.com/freechipsproject/rocket-chip) |
| Non-Blocking Data Cache | `NonBlockingDCache.fir` | `NonBlockingDCache` | data cache from Rocket Chip                   | [rocket-chip](https://github.com/freechipsproject/rocket-chip) |
| **Rocket Chip Tile**    | `RocketTile.fir`        | `RocketTile`        | 64-bit RISCV CPU Tile                         | [rocket-chip](https://github.com/freechipsproject/rocket-chip) |
| **Sodor 1-Stage**       | `Sodor1Stage.fir`       | `Sodor1Stage`       | educational RISCV core with 1 pipeline stage  | [riscv-sodor](https://github.com/ucb-bar/riscv-sodor)          |
| **Sodor 3-Stage**       | `Sodor3Stage.fir`       | `Sodor3Stage`       | educational RISCV core with 3 pipeline stages | [riscv-sodor](https://github.com/ucb-bar/riscv-sodor)          |
| **Sodor 5-Stage**       | `Sodor5Stage.fir`       | `Sodor5Stage`       | educational RISCV core with 5 pipeline stages | [riscv-sodor](https://github.com/ucb-bar/riscv-sodor)          |
| **I2C Peripheral**      | `TLI2C.fir`             | `TLI2C`             | I2C controller connected to TileLink bus      | [sifive-blocks](https://github.com/sifive/sifive-blocks)       |
| PWM Peripheral          | `TLPWM.fir`             | `TLPWM`             | PWM timer connected to TileLink bus           | [sifive-blocks](https://github.com/sifive/sifive-blocks)       |
| **SPI Peripheral**      | `TLSPI.fir`             | `TLSPI`             | SPI controller connected to TileLink bus      | [sifive-blocks](https://github.com/sifive/sifive-blocks)       |
| UART Peripheral         | `TLUART.fir`            | `TLUART`            | UART controller connected to TileLink bus     | [sifive-blocks](https://github.com/sifive/sifive-blocks)       |

**Note:** _the benchmarks that were not used in our paper have not been thoroughly
evaluated and thus may not work reliably or may produce spurious results._

## ICCAD'18 Paper

You can learn more about `rfuzz` in our `ICCAD'18` paper which explains
how we adapted the coverage-directed fuzzing ideas from software testing
to RTL verification while building the basic research platform.

In order to reproduce our results, please make sure to use the `iccad18`
branch of this repository.

Kevin Laeufer and Jack Koenig and Donggyu Kim and Jonathan Bachrach and Koushik Sen.
**RFUZZ: Coverage-Directed Fuzz Testing of RTL on FPGAs**.
_In International Conference On Computer Aided Design, 2018 (ICCAD'18)_, San Diego, CA, November 2018.

[Preprint PDF](https://people.eecs.berkeley.edu/~laeufer/papers/rfuzz_kevin_laeufer_iccad2018.pdf)
