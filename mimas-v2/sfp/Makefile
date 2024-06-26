name = sfp
top = rtl/top.vcd
ucf = xilinx/mimas.ucf
dev = xc6slx9-2csg324

all: bitstream

bitstream: clean
	@printf "\n====== Building bitstream ======\n"
	mkdir -p build
	mkdir -p build/netlist
	cd build; xst -ifn ../xilinx/$(name).xst -ofn $(name).srp
	cd build; ngdbuild -p ${dev} -uc ../$(ucf) -sd netlist netlist/$(name).ngc $(name).ngd
	cd build; map -w -timing -detail -p ${dev} -o $(name)_map.ncd $(name).ngd $(name).pcf
	cd build; par -w $(name)_map.ncd $(name).ncd $(name).pcf
	cd build; bitgen -w $(name).ncd $(name).bit $(name).pcf

test:
	@printf "\n====== Running testbench ======\n"
	mkdir test
	iverilog -o test/tb rtl/tb.v
	vvp -n test/tb > /dev/null
	gtkwave test/tb.vcd --rcvar 'fontname_signals Monospace 16' --rcvar 'fontname_waves Monospace 12'

prog:
	@printf "\n====== Programming Mimas V2 via iMPACT ======\n"
	impact -batch xilinx/impact.batch
	rm _impactbatch.log

clean:
	@printf "\n====== Cleaning development environment ======\n"
	rm -rf test build

.PHONY: all test clean
