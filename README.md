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

### Benchmarks

A collection of benchmarks in the form of
RTL circuits in the [FIRRTL format](https://bar.eecs.berkeley.edu/projects/firrtl.html)
can be found in the `benchmarks/` directory.
Please consult the [local Readme](benchmarks/Readme.md) to learn more about
how each individual benchmark was created.

Our `Makefile` takes the name of a FIRRTL (`*.fir`) file and the name
of the corresponding RTL toplevel module as parameters, e.g.:
```.sh
make FIR=TLI2C.fir DUT=TLI2C
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

_Please note that benchmarks not used in our paper have not been thoroughly
evaluated and thus may not work reliably or may produce spurious results._

