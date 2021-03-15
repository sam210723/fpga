name = pwm

all: build

build: clean
	yosys -ql $(name).log -p "synth_ice40 -json $(name).json" $(name).v
	nextpnr-ice40 --lp1k --package cm36 --json $(name).json --asc $(name).asc --pcf $(name).pcf
	icepack $(name).asc $(name).bin
	rm -rf $(name).json $(name).asc

prog: build
	# sudo mount -t drvfs F: /mnt/f
	cp $(name).bin /mnt/f

clean:
	rm -rf $(name).log $(name).json $(name).asc $(name).bin
