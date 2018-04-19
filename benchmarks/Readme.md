# Benchmarks

This folder contains high level firrtl code that can be instrumented
and used as a benchmark for our fuzzer.

Please document the source in this file when adding new benchmarks.

## ICache

**ICache.fir**

Generated from `rocket-chip @ 8799508b` (last commit Fri Jan 12) with the
following config:

```.scala
class WithICache extends Config((site, here, up) => {
	case RocketTilesKey => up(RocketTilesKey) map (tile => tile.copy(
		icache = tile.icache map (_.copy(
			nSets = 64,
			nWays = 4,
			rowBits = 128
		))
	))
})
```

Using [Donggyu's commit in project-template](https://github.com/ucb-bar/project-template/commit/8a5fc95dedbccc7241a30888f2dac16fdf63c4f1)
we ran `make chirrtl` in the `verisim` directory and manually extracted the
`ICache_icache` from the resulting `example.TestHarness.DefaultExampleConfig.fir`
and renamed it `ICache`.

## ICache with Coverage

**ICacheCover.fir**

This version of the ICache includes designer-specified cover points. It was
generated with instructions similar to the above, with the addition of a
property library and config.

```scala
class PrintfPropertyLibrary extends BasePropertyLibrary {
  def generateProperty(prop_param: BasePropertyParameters)(implicit sourceInfo: SourceInfo) = {
    prop_param match {
      case CoverPropertyParameters(cond, label, message) =>
        printf(p"COVER:$cond:$label:$message\n")
      case _ => ???
    }
  }
}

class WithCoverage extends Config((site, here, up) => {
  case PropertyLibrary => new PrintfPropertyLibrary
})
```
## Non-blocking Data Cache

**NonBlockingDCache.fir**

Generated from `rocket-chip @ 8799508b` (last commit Fri Jan 12) with the
following config:

```.scala
class WithNonBlockingDCache extends Config((site, here, up) => {
  case RocketTilesKey => up(RocketTilesKey) map (tile => tile.copy(
    dcache = tile.dcache map (_.copy(
      nSets = 64,
      nWays = 4,
      nMSHRs = 2 // should be > 0
    ))
  ))
})
```

Note that the non-blocking data cache is a multi-module design.
Using [another Donggyu's commit in project-template](https://github.com/ucb-bar/project-template/commit/86da7216e814ce0ab181bf6e99e1b77fedadb42e),
we ran `make chirrtl` in the `verisim` directory and take all the modules from
`module WritebackUnit` to `module NonBlockingDCache_dcache`(cropped from
Line 133232 to Line 145035 in `example.TestHarness.DefaultExampleConfig.fir`).

<img src="http://www.lowrisc.org/docs/untether-v0.2/figures/dcache.png" width="640">

## gcd

This is the small circuit that we originally used for testing the basic system.
No one remembers the exact origin, but the file definitely has been edited
by hand to make all registers have resets (including `x` and `y`).


## Sodor

### 1 Stage

from: https://github.com/ekiwi/riscv-sodor @
[adf2ed49c634b2b3c1bb391a67e544cf26334f96](https://github.com/ekiwi/riscv-sodor/commit/adf2ed49c634b2b3c1bb391a67e544cf26334f96)

Generated like this:

```
$ ./configure
$ sbt
$ project rv32_1stage
$ run -chnrf
```

Then copy the generated `Sodor1Stage.fir` to the benchmarks directory.

Build the fuzz server like this:
```
make DUT=Sodor1Stage FIR=Sodor1Stage.fir run
```

You will also need to copy `vsrc/AsyncReadMem.sv` from `riscv-sodor` into
the build directory (`build/vSodor1Stage`).

### 2 Stage

Generated similarely to the Stage 1 from: https://github.com/ekiwi/riscv-sodor @
[9cb98a26c5f7742ba4647229b07ad7c7dfb1da0d](https://github.com/ekiwi/riscv-sodor/commit/9cb98a26c5f7742ba4647229b07ad7c7dfb1da0d)

### 3 Stage

Generated similarely to the Stage 1 from: https://github.com/ekiwi/riscv-sodor @
[adf2ed49c634b2b3c1bb391a67e544cf26334f96](https://github.com/ekiwi/riscv-sodor/commit/adf2ed49c634b2b3c1bb391a67e544cf26334f96)

**Note**: You will also need to copy `vsrc/SyncMem.sv` from `riscv-sodor` into
the build directory (`build/vSodor3Stage`).

## SiFive Peripherals

We extracted a series of Tile Link peripherals from the [SiFive Blocks repo](https://github.com/sifive/sifive-blocks).

To reproduce do the following:

* checkout [sifive/freedom @ fff1881](https://github.com/sifive/freedom/commit/fff18810cd56d6b331a4ac08b62425a75280182b)
* populate all the submodules: `git submodule update --init --recoursive`
* change `rocket-chip/src/main/scala/util/PlusArg.scala` to use a dummy version of the plus argument reader:

```.diff
--- a/src/main/scala/util/PlusArg.scala
+++ b/src/main/scala/util/PlusArg.scala
@@ -14,6 +14,11 @@ class plusarg_reader(val format: String, val default: Int, val docstring: String
   }
 }
 
+class DummyPlusArgReader(val format: String, val default: Int, val docstring: String) extends Module {
+       val io = IO(new Bundle { val out = UInt(OUTPUT, width = 32) } )
+       io.out := default.U
+}
+
 object PlusArg
 {
   // PlusArg("foo") will return 42.U if the simulation is run with +foo=42
@@ -24,7 +29,7 @@ object PlusArg
 
   def apply(name: String, default: Int = 0, docstring: String = ""): UInt = {
     PlusArgArtefacts.append(name, default, docstring)
-    Module(new plusarg_reader(name + "=%d", default, docstring)).io.out
+    Module(new DummyPlusArgReader(name + "=%d", default, docstring)).io.out
   }
 }
```

* disable (comment out) the `printf` in `sifive-blocks/src/main/scala/devices/uart/UART.scala`
* generate firrtl: `make -f Makefile.e300artydevkit firrtl`
* extract the peripherals using Jack's
  [retop_firrtl.py](https://gist.githubusercontent.com/jackkoenig/b780c809c7e0ef5d6658bdcfe273ecda/raw/7abe8ee3ccd46f04531b586b524451334ed4b75f/retop_firrtl.py)
  which depends on
  [split_firrtl.py](https://gist.githubusercontent.com/jackkoenig/68c91ad94315fb566032816cc769aac4/raw/8e54cb93dadee409b64cd87fcbcb83933ce0d66b/split_firrtl.py):

```.sh
./retop_firrtl.py TLPWM builds/e300artydevkit/sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir TLPWM.fir
./retop_firrtl.py TLSPI builds/e300artydevkit/sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir TLSPI.fir
./retop_firrtl.py TLUART builds/e300artydevkit/sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir TLUART.fir
./retop_firrtl.py TLI2C builds/e300artydevkit/sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir TLI2C.fir
```

**Note**: for some reason the fuzz server segfaults when trying to fuzz `TLPWM`.
