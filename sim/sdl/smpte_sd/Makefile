name = smpte_sd

all: build

build: clean
	verilator -I../ -cc top.v --exe main.cpp -o $(name) -LDFLAGS "`sdl2-config --libs`"
	make -C ./obj_dir -f Vtop.mk
	./obj_dir/$(name)

clean:
	rm -rf obj_dir
