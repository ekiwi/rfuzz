all: system.bit

system.bit: system.tcl
	vivado -mode batch -source system.tcl
clean:
	rm -r ekiwi
	rm vivado*
	rm system.bit

deploy: system.bit system.tcl
	scp system.bit system.tcl  pynq:~
