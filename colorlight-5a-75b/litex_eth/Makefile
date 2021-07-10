name = litex_eth
cpu  = picorv32
freq = 50000000
ip   = 192.168.1.20

all: build

build: clean
	python3 $(name).py --cpu $(cpu) --freq $(freq) --ip $(ip)
	cp build/colorlight_5a_75b/gateware/colorlight_5a_75b.bit $(name).bit

prog: build
	openFPGALoader --write-flash --cable dirtyJtag --bitstream $(name).bit

clean:
	rm -rf build $(name).bit

.PHONY: all build prog clean
