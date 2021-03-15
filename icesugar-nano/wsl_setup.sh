#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y autoconf automake autotools-dev build-essential clang bison \
	flex libreadline-dev gawk tcl-dev libffi-dev cmake curl git graphviz xdot \
	pkg-config python python3 python3-dev mercurial libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev libboost-all-dev libeigen3-dev \
	zlib1g-dev libmpc-dev libftdi-dev libmpfr-dev libgmp-dev gawk texinfo gperf \
	libtool patchutils bc libexpat-dev qt5-default

# Build and install IceStorm
git clone https://github.com/YosysHQ/icestorm
cd icestorm
make -j$(nproc)
sudo make install
cd ..

# Build and install Yosys
git clone https://github.com/YosysHQ/yosys
cd yosys
make
sudo make install
cd ..

# Build and install nextpnr
git clone https://github.com/YosysHQ/nextpnr
cd nextpnr
cmake . -DARCH=ice40
make -j$(nproc)
sudo make install
cd ..

# Build and install RISC-V GCC toolchain
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain-rv32i
cd riscv-gnu-toolchain-rv32i
./configure --prefix=/opt/riscv --with-arch=rv32i --with-abi=ilp32
export PATH="$PATH:/opt/riscv/bin"
sudo make
cd ..
