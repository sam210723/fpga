name = litex_base
cpu  = picorv32

all: build

build: clean
	python3 $(name).py --cpu $(cpu)
	cp build/colorlight_5a_75b/gateware/colorlight_5a_75b.bit $(name).bit

prog: build
	openFPGALoader --write-flash --cable dirtyJtag --bitstream $(name).bit

clean:
	rm -rf build $(name).bit

.PHONY: all build prog clean
