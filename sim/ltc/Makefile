name = ltc

all: build

build:
	verilator -Irtl/ -cc top.v --exe main.cpp -o $(name) --trace
	make -C ./obj_dir -f Vtop.mk
	./obj_dir/$(name)
	gtkwave --save=trace.gtkw obj_dir/trace.vcd

clean:
	rm -rf obj_dir
