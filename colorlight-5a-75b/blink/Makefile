name = blink

all: build

build: clean
	yosys -ql $(name).log -p "synth_ecp5 -json $(name).json" $(name).v
	nextpnr-ecp5 --25k --package CABGA256 --json $(name).json --textcfg $(name).config --lpf $(name).lpf
	ecppack --svf $(name).svf $(name).config $(name).bit
	rm -rf $(name).json $(name).config

prog: build
	 openFPGALoader --write-flash --cable dirtyJtag --bitstream $(name).bit

clean:
	rm -rf $(name).log $(name).json $(name).config $(name).bit $(name).svf

.PHONY: all build prog clean
