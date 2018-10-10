# -*- mode: ruby -*-

$box = "ubuntu/bionic64"
$mem = "2048"

$install_script = <<-SCRIPT
 apt-get update -y
 apt-get upgrade -y
 apt-get install build-essential meson pkg-config openjdk-8-jdk verilator cargo -y
 apt-get install python3-toml python3-numpy python3-matplotlib graphviz -y
 echo "Installing SBT"
 echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
 apt-get update -y
 apt-get install sbt -y
SCRIPT

$config_script = <<-SCRIPT
  mkdir -p ~/.config/matplotlib/
  echo "backend: agg" > ~/.config/matplotlib/matplotlibrc
SCRIPT

$clone_script = <<-SCRIPT
  git clone https://github.com/ekiwi/rfuzz.git
  cd rfuzz
  sed -i 's/git@github.com:/https:\\/\\/github.com\\//'  .gitmodules
  git submodule update --init
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = $box
  config.vm.provider "virtualbox" do |vb|
    vb.memory = $mem
  end
  config.vm.provision "install", type: "shell", privileged: true,  inline: $install_script
  config.vm.provision "config",  type: "shell", privileged: false, inline: $config_script
  config.vm.provision "clone",   type: "shell", privileged: false, inline: $clone_script
end
