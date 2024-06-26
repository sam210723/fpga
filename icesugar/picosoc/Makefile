name = picosoc
hdl  = hdl/icesugar.v hdl/ice40up5k_spram.v hdl/spimemio.v hdl/simpleuart.v hdl/picosoc.v hdl/picorv32.v
pcf  = icesugar.pcf
src  = src/start.s src/firmware.c

RV_PRE = riscv32-unknown-elf
CFLAGS = 

all: clean image

core: bin/$(name)_core.bin
firmware: bin/$(name)_firmware.bin

bin/$(name)_core.bin:
	@printf "\n====== Building RISC-V CPU core ======\n"
	yosys -ql $(name).log -p 'synth_ice40 -top icesugar -json $(name).json' $(hdl)
	nextpnr-ice40 --up5k --package sg48 --freq 13 --json $(name).json --asc $(name).asc --pcf $(pcf)
	icetime -d up5k -c 12 -mtr $(name).rpt $(name).asc
	icepack $(name).asc bin/$(name)_core.bin
	rm -rf $(name).json $(name).asc

bin/$(name)_firmware.bin:
	@printf "\n====== Building firmware ======\n"
	$(RV_PRE)-cpp -P -o icesugar.lds src/sections.lds
	$(RV_PRE)-gcc $(CFLAGS) -march=rv32ic -Wl,-Bstatic,-T,icesugar.lds,--strip-debug -ffreestanding -nostdlib -o icesugar.elf $(src)
	$(RV_PRE)-objcopy -O binary icesugar.elf bin/$(name)_firmware.bin
	rm -rf *.lds *.elf

image: bin/$(name)_core.bin bin/$(name)_firmware.bin
	@printf "\n====== Assembling bitstream ======\n"
	truncate -s 1048576 bin/$(name)_core.bin
	cat bin/$(name)_core.bin bin/$(name)_firmware.bin > bin/$(name).bin

clean:
	@printf "\n====== Cleaning development environment ======\n"
	rm -rf *.log *.rpt *.json *.asc *.lds *.elf bin/*.bin

.PHONY: all core firmware image clean
