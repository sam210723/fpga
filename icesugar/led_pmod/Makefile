name = led

all: build

build: clean
	yosys -ql $(name).log -p "synth_ice40 -json $(name).json" $(name).v
	nextpnr-ice40 --up5k --package sg48 --json $(name).json --asc $(name).asc --pcf $(name).pcf
	icepack $(name).asc $(name).bin
	rm -rf $(name).json $(name).asc

prog: build

	icelink = $(shell df | grep iCELink | awk '{print $$6}')
	${warning iCELink Path: $(icelink)}

	@if [ -d '$(ICELINK_DIR)' ]; \
        then \
            cp $(filename).bin $(ICELINK_DIR); \
        else \
            echo "iCELink not found"; \
            exit 1; \
    fi

clean:
	rm -rf $(name).log $(name).json $(name).asc $(name).bin
