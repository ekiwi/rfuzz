// Provide a managed dependency on X if -DXVersion="" is supplied on the command line.
val defaultVersions = Map(
  "chisel3" -> "3.0.0-RC1"
)

val commonSettings = Seq(
  scalaVersion := "2.11.12",

  scalacOptions := Seq("-deprecation"),

  resolvers ++= Seq(
	Resolver.sonatypeRepo("snapshots"),
	Resolver.sonatypeRepo("releases")
  ),

  libraryDependencies ++= (Seq("chisel3").map {
	dep: String => "edu.berkeley.cs" %% dep % sys.props.getOrElse(
		dep + "Version", defaultVersions(dep))
  }),

  // toml-scala: https://github.com/sparsetech/toml-scala
  // (stoml does not support dates)
  libraryDependencies += "tech.sparse" %% "toml-scala" % "0.1.0",

  // For MIDAS
  libraryDependencies += "org.json4s" %% "json4s-native" % "3.5.3",

  // For MDF
  libraryDependencies += "com.typesafe.play" %% "play-json" % "2.6.2"
)

lazy val mdf = (project in file("barstools/mdf/scalalib"))
  .settings(commonSettings)
lazy val barstools = (project in file("barstools/macros"))
  .settings(commonSettings)
  .dependsOn(mdf)
// Code taken from rocketchip for midas
// Should be deleted when we decide to
// import rocketchip
lazy val lib = project
  .settings(commonSettings)
lazy val midas = project
  .settings(commonSettings)
  .dependsOn(lib, barstools)

lazy val harness = RootProject(file("../harness"))
lazy val root = (project in file("."))
  .settings(commonSettings ++ Seq(
    name := "rfuzz",
    version := "0.1"))
  .dependsOn(midas, harness)
