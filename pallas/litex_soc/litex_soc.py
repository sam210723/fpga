import argparse
import os

from migen import *
from migen.genlib.io import CRG

from litex.build.generic_platform import IOStandard, Pins, Subsignal
from litex.build.xilinx import XilinxPlatform
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *

_io = [
    ("clk100", 0, Pins("A10"), IOStandard("LVCMOS33")),
    ("serial", 0,
        Subsignal("tx", Pins("P8")),
        Subsignal("rx", Pins("N7")),
        IOStandard("LVCMOS33")
    ),
    ("user_led", 0, Pins("P15"), IOStandard("LVCMOS33")),  # LED1
    ("user_led", 1, Pins("U3"),  IOStandard("LVCMOS33")),  # LED3
    ("user_led", 2, Pins("P4"),  IOStandard("LVCMOS33"))   # LED4
]


class Blink(Module):
    def __init__(self, led):
        counter = Signal(26)
        self.comb += led.eq(counter[25])
        self.sync += counter.eq(counter + 1)


class Platform(XilinxPlatform):
    default_clk_name   = "clk100"
    default_clk_period = 1e9/100e6

    def __init__(self, **kwargs):
        XilinxPlatform.__init__(self, "xc6slx45-csg324-2", _io, toolchain="ise", **kwargs)


class BaseSoC(SoCCore):
    def __init__(self, cpu):
        platform = Platform()
        sys_clk_freq = int(100e6)

        SoCCore.__init__(
            self,
            platform,
            cpu_type                 = cpu,
            clk_freq                 = sys_clk_freq,
            ident                    = "LiteX SoC on PallasLCD Video Decoder",
            ident_version            = True,
            integrated_rom_size      = 0x8000,
            integrated_main_ram_size = 0xF000,
            #integrated_rom_init      = "firmware/bootrom.bin",
            uart_name                = "serial"
        )

        clk100 = platform.request("clk100")
        platform.add_period_constraint(clk100, 1e9/25e6)
        self.submodules.crg = CRG(clk100)

        self.submodules.blink = Blink(platform.request("user_led", 0))

        #os.system(f"cd firmware && make clean && make")
        self.add_rom("bootrom", 0x20000000, 0x2000, contents=get_mem_data("firmware/bootrom.bin", endianness="little"))
        self.add_constant("ROM_BOOT_ADDRESS", 0x20000000)


def main():
    parser = argparse.ArgumentParser(description="LiteX pin tracing SoC on PallasLCD Video Decoder")
    parser.add_argument("--cpu", action="store", default="vexriscv", help="SoC CPU (vexriscv / picorv32)")
    builder_args(parser)
    soc_core_args(parser)
    args = parser.parse_args()

    soc = BaseSoC(
        cpu=args.cpu
    )

    builder = Builder(soc, **builder_argdict(args))
    builder.build(run=True)


if __name__ == "__main__": main()
