
scalaVersion := "2.11.11"

lazy val firrtl = project in file("firrtl")
lazy val transforms = (project in file(".")).dependsOn(firrtl)


