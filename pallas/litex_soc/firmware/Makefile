BUILD_DIR = ../build/litex_soc

include $(BUILD_DIR)/software/include/generated/variables.mak
include $(SOC_DIRECTORY)/software/common.mak

#OBJECTS = donut.o crt0.o main.o
OBJECTS = crt0.o main.o

all: bootrom.bin

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@
	chmod -x $@
	$(RM) $(OBJECTS) *.d *.elf *.map

vpath %.a $(PACKAGES:%=../%)

bootrom.elf: $(OBJECTS)
	$(CC) $(LDFLAGS) -T linker.ld -N -o $@ \
		$(OBJECTS) \
		$(PACKAGES:%=-L$(BUILD_DIR)/software/%) \
		-Wl,--whole-archive \
		-Wl,--gc-sections \
		-Wl,-Map,$@.map \
		$(LIBS:lib%=-l%)

	chmod -x $@

# pull in dependency info for *existing* .o files
-include $(OBJECTS:.o=.d)

donut.o: CFLAGS   += -w

VPATH = $(BIOS_DIRECTORY):$(BIOS_DIRECTORY)/cmds:$(CPU_DIRECTORY)


%.o: %.cpp
	$(compilexx)

%.o: %.c
	$(compile)

%.o: %.S
	$(assemble)

clean:
	$(RM) $(OBJECTS) bootrom.elf bootrom.bin .*~ *~

.PHONY: all clean
