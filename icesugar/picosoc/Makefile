name = picosoc
hdl  = hdl/icesugar.v hdl/ice40up5k_spram.v hdl/spimemio.v hdl/simpleuart.v hdl/picosoc.v hdl/picorv32.v
pcf  = icesugar.pcf
src  = src/start.s src/firmware.c

RV_PRE = riscv32-unknown-elf
CFLAGS = 

all: clean image

core:
	@printf "\n====== Building RISC-V CPU core ======\n"
	yosys -ql $(name).log -p 'synth_ice40 -top icesugar -json $(name).json' $(hdl)
	nextpnr-ice40 --up5k --package sg48 --freq 13 --json $(name).json --asc $(name).asc --pcf $(pcf)
	icetime -d up5k -c 12 -mtr $(name).rpt $(name).asc
	icepack $(name).asc bin/$(name)_core.bin
	rm -rf $(name).json $(name).asc

firmware:
	@printf "\n====== Building firmware ======\n"
	$(RV_PRE)-cpp -P -DICEBREAKER -o icesugar_sections.lds src/sections.lds
	$(RV_PRE)-gcc $(CFLAGS) -DICEBREAKER -march=rv32ic -Wl,-Bstatic,-T,icesugar_sections.lds,--strip-debug -ffreestanding -nostdlib -o icesugar_fw.elf $(src)
	$(RV_PRE)-objcopy -O binary icesugar_fw.elf bin/$(name)_firmware.bin
	rm -rf *.lds *.elf

image: core firmware
	@printf "\n====== Assembling bitstream ======\n"
	truncate -s 1048576 bin/$(name)_core.bin
	cat bin/$(name)_core.bin bin/$(name)_firmware.bin > bin/$(name).bin

clean:
	@printf "\n====== Cleaning development environment ======\n"
	rm -rf *.log *.rpt *.json *.asc bin/*.bin

.PHONY: all core firmware image clean
