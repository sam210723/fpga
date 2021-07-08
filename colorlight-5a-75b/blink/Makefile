name = blink

all: build

build: clean
	yosys -ql $(name).log -p "synth_ecp5 -json $(name).json" $(name).v
	nextpnr-ecp5 --25k --package CABGA256 --json $(name).json --textcfg $(name).config --lpf $(name).lpf
	ecppack --svf $(name).svf $(name).config $(name).bit
	rm -rf $(name).json $(name).config

clean:
	rm -rf $(name).log $(name).json $(name).config $(name).bit

.PHONY: all build clean
