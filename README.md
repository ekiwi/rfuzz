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
$ sbt "runMain firrtl.Driver -i firrtl/regress/Rob.fir -o rob.v -X verilog -fct hardwareafl.firrtltransforms.AutoCoverage,hardwareafl.firrtltransforms.SplitMuxConditions -ll info"
```
You can try designs other than the Rob so long as they are a single module

### How to generate rocket-chip with coverage
1. Clone rocket-chip repo and follow instructions at https://github.com/freechipsproject/rocket-chip
1. Apply the following patch
```
diff --git a/src/main/scala/system/Generator.scala b/src/main/scala/system/Generator.scala
index 5232bb3..637bdd0 100644
--- a/src/main/scala/system/Generator.scala
+++ b/src/main/scala/system/Generator.scala
@@ -2,12 +2,26 @@
 
 package freechips.rocketchip.system
 
+import chisel3._
+import chisel3.internal.sourceinfo.{SourceInfo, SourceLine}
+import freechips.rocketchip.util.property._
+
 import freechips.rocketchip.coreplex.RocketTilesKey
 import freechips.rocketchip.tile.XLen
 import freechips.rocketchip.util.GeneratorApp
 
 import scala.collection.mutable.LinkedHashSet
 
+object PrintfProp extends BasePropertyLibrary {
+  def generateProperty(prop_param: BasePropertyParameters)(implicit sourceInfo: SourceInfo) = {
+    prop_param match {
+      case CoverPropertyParameters(cond, label, message) =>
+        printf(p"COVER:$cond:$label:$message\n")
+      case _ => ???
+    }
+  }
+}
+
 /** A Generator for platforms containing Rocket Coreplexes */
 object Generator extends GeneratorApp {
 
@@ -86,6 +100,7 @@ object Generator extends GeneratorApp {
   }
 
   val longName = names.topModuleProject + "." + names.configs
+  cover.setPropLib(PrintfProp)
   generateFirrtl
   generateAnno
   generateTestSuiteMakefrags
```
1. In vsim, run `make verilog`
