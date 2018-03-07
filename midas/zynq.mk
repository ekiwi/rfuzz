host = arm-xilinx-linux-gnueabi

# Compile gmp
GMP_VERSION ?= 6.1.2
gmp_src_dir := $(build_dir)/$(PLATFORM)/gmp-$(GMP_VERSION)
gmp_build_dir := $(gmp_src_dir)/build
gmp_install_dir := $(gmp_src_dir)/install
gmp_lib := $(gmp_install_dir)/lib/libgmp.so
gmp := $(build_dir)/$(PLATFORM)/libgmp.so.10

$(build_dir)/$(PLATFORM)/gmp-$(GMP_VERSION).tar.bz2:
	mkdir -p $(dir $@)
	cd $(dir $@) && wget https://gmplib.org/download/gmp/gmp-$(GMP_VERSION).tar.bz2

$(gmp_src_dir): $(build_dir)/$(PLATFORM)/gmp-$(GMP_VERSION).tar.bz2
	cd $(dir $<) && tar -xf $<

$(gmp_lib): $(gmp_src_dir)
	mkdir -p $(gmp_build_dir)
	cd $(gmp_build_dir) && \
	../configure --prefix=$(gmp_install_dir) --host=$(host) && \
	$(MAKE) && $(MAKE) install

$(gmp): $(gmp_lib)
	cp $< $@

export AR := $(host)-ar
export CXX := $(host)-g++
export CXXFLAGS := $(CXXFLAGS) -I$(gmp_install_dir)/include
export LDFLAGS := -L$(gmp_install_dir)/lib -Wl,-rpath,/usr/local/lib
