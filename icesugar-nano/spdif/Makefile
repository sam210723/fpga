name = spdif

all: build

build: clean
	python3 $(name).py generate

sim: clean
	python3 $(name).py simulate
	gtkwave $(name).vcd --rcvar 'fontname_signals Monospace 16' --rcvar 'fontname_waves Monospace 12'

prog: build
	sudo icesprog -c 4
	sudo icesprog --write build/top.bin

clean:
	rm -rf __pycache__ build $(name).vcd

.PHONY: build
