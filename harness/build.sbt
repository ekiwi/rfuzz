name := "harness"

version := "0.1"

scalaVersion := "2.11.12"

scalacOptions := Seq("-deprecation")

resolvers ++= Seq(
	Resolver.sonatypeRepo("snapshots"),
	Resolver.sonatypeRepo("releases")
)

// Provide a managed dependency on X if -DXVersion="" is supplied on the command line.
val defaultVersions = Map(
	"chisel3" -> "3.0.0-RC1",
	"chisel-iotesters" -> "1.1.0-RC1"
)

libraryDependencies ++= (Seq("chisel3","chisel-iotesters").map {
	dep: String => "edu.berkeley.cs" %% dep % sys.props.getOrElse(
		dep + "Version", defaultVersions(dep))
})

// toml-scala: https://github.com/sparsetech/toml-scala
// (stoml does not support dates)
libraryDependencies += "tech.sparse" %% "toml-scala" % "0.1.0"

scalaSource in Compile := baseDirectory.value / "src"
scalaSource in Test := baseDirectory.value / "test"
