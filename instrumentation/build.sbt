name := "rfuzz-instrumentation"
organization := "edu.berkeley.cs"
scalaVersion := "2.12.12"

scalacOptions := Seq("-deprecation", "-unchecked", "-Xsource:2.11")
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.4.1"

scalaSource in Compile := baseDirectory.value / "src"
scalaSource in Test := baseDirectory.value / "test"
