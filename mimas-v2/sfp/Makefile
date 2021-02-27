name = sfp

all: clean test

test:
	@printf "\n====== Running testbench ======\n"
	mkdir test
	iverilog -o test/tb rtl/tb.v
	vvp -n test/tb > /dev/null
	gtkwave test/tb.vcd --rcvar 'fontname_signals Monospace 30' --rcvar 'fontname_waves Monospace 12'

clean:
	@printf "\n====== Cleaning development environment ======\n"
	rm -rf test

.PHONY: all test clean
