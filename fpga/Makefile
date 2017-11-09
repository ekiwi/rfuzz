all: system.bit

system.bit: system.tcl
	vivado -mode batch -source make_bitstream.tcl
clean:
	rm -rf ekiwi
	rm -rf vivado*
	rm -f system.bit

deploy: system.bit system.tcl
	scp system.bit system.tcl  pynq:~
