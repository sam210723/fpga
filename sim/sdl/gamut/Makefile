name = gamut

all: build

build: clean
	verilator -I../ -cc top.v --exe main.cpp -o $(name) -CFLAGS "`sdl2-config --cflags`" -LDFLAGS "`sdl2-config --libs`"
	make -C ./obj_dir -f Vtop.mk
	./obj_dir/$(name)

clean:
	rm -rf obj_dir
