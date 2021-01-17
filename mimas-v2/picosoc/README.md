# PicoSoC for Numato Lab Mimas V2

The [Mimas V2](https://numato.com/product/mimas-v2-spartan-6-fpga-development-board-with-ddr-sdram/) by [Numato Lab](https://numato.com/) is a Spartan 6 FPGA development board with VGA, SD Card, PMOD and audio interfaces.
The Spartan 6 variant used by the Mimas V2 is the XC6SLX9 which has 9152 logic cells and 576 Kb BRAM.

![Mimas V2](https://numato.com/wp-content/uploads/2020/08/MimasV2_2-2-1.png)

This SoC is based on the [PicoSoC example](https://github.com/cliffordwolf/picorv32/blob/master/picosoc/README.md) by [Clifford Wolf](https://github.com/cliffordwolf) which uses the [PicoRV32](https://github.com/cliffordwolf/picorv32) RISC-V RV32I CPU core.

![PicoSoC Overview](https://raw.githubusercontent.com/cliffordwolf/picorv32/master/picosoc/overview.svg)

## Building
This SoC is built using the [Xilinx ISE 14.7 virtual machine](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html) provided by Xilinx, otherwise known as "ISE Design Suite for Windows 10 - 14.7". A script for installing the RISC-V build toolchain, GTKWave and Icarus Verilog in the ISE VM can be [found here](https://gist.github.com/sam210723/80d0f735eba42b1c332069067c9afc2c).

To build the SoC bitstream, run `make`. The bitstream can be updated with new firmware without re-building the core by running `make -B firmware && make image`.

## Folders
| Folder   | Contents                          |
| -------- | --------------------------------- |
| `rtl`    | Verilog HDL code                  |
| `src`    | CPU firmware C source code        |
| `test`   | Verilog testbench for HDL modules |
| `xilinx` | Config files for Xilinx ISE tools |

## Resources
 - [Mimas V2 Schematic](https://numato.com/blog/wp-content/uploads/2016/08/MimasV2Sch.pdf)
 - [Spartan 6 FPGA Family Overview](https://www.xilinx.com/support/documentation/data_sheets/ds160.pdf)
 - [RISC-V ISA Manual](https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf)
 - [RISC-V Extensions](https://en.wikipedia.org/wiki/RISC-V#ISA_base_and_extensions)
