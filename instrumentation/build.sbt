
scalaVersion := "2.11.12"

lazy val firrtl = RootProject(file("../firrtl"))
lazy val transforms = (project in file(".")).dependsOn(firrtl)


