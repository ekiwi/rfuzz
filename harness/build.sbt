name := "rfuzz-harness"
version := "0.1"
organization := "edu.berkeley.cs"
scalaVersion := "2.12.12"

scalacOptions := Seq("-deprecation", "-unchecked", "-Xsource:2.11")
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.4.1"
// toml-scala: https://github.com/sparsetech/toml-scala
// (stoml does not support dates)
libraryDependencies += "tech.sparse" %% "toml-scala" % "0.1.0"

scalaSource in Compile := baseDirectory.value / "src"
scalaSource in Test := baseDirectory.value / "test"
