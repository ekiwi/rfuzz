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
