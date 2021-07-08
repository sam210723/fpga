name = litex_pll
cpu  = picorv32
freq = 100000000

all: build

build: clean
	python3 $(name).py --cpu $(cpu) --freq $(freq)
	cp build/colorlight_5a_75b/gateware/colorlight_5a_75b.bit $(name).bit

prog: build
	openFPGALoader --write-sram --cable dirtyJtag --bitstream $(name).bit

clean:
	rm -rf build $(name).bit

.PHONY: all build prog clean
