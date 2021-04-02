import os
import subprocess

from nmigen.build import *
from nmigen.vendor.lattice_ice40 import *
from resources import *

__all__ = ["ICESugarNanoPlatform"]


class ICESugarNanoPlatform(LatticeICE40Platform):
    device      = "iCE40LP1K"
    package     = "CM36"
    default_clk = "clk12"
    resources   = [
        Resource("clk12", 0, Pins("D1", dir="i"),
        Clock(12e6), Attrs(IO_STANDARD="SB_LVCMOS")),

        *LEDResources(pins="B6", invert=False, attrs=Attrs(IO_STANDARD="SB_LVCMOS")),

        UARTResource(0,
            rx="A3", tx="B3",
            attrs=Attrs(IO_STANDARD="SB_LVTTL", PULLUP=1)
        ),

        *SPIFlashResources(0,
            cs="D5", clk="E5", mosi="E4", miso="F5",
            attrs=Attrs(IO_STANDARD="SB_LVCMOS")
        ),

        Resource("pmod", 0, Pins("B4 B5 E1 B1 A1 C2 E3 C6", dir="o"), Attrs(IO_STANDARD="SB_LVCMOS")),
    ]
    connectors = [
        Connector("pmod", 0, "E2 D1 B1 A1 - -  -  -  -  - - -"), # PMOD1 - IO pin D1 shared by CLK
        Connector("pmod", 1, "B3 A3 B6 C5 - -  -  -  -  - - -"), # PMOD2 - IO pins B3/A3 shared by UART_TX/UART_RX
        Connector("pmod", 2, "B4 B5 E1 B1 - - A1 C2 E3 C6 - -"), # PMOD3 - IO pins B1/A1 shared by P1_3/P1_4
    ]


    def toolchain_program(self, products, name):
        icesprog = os.environ.get("ICESPROG", "icesprog")
        with products.extract("{}.bin".format(name)) as bitstream_filename:
            subprocess.check_call([icesprog, "-w", bitstream_filename])


if __name__ == "__main__":
    from test.blinky import *
    ICESugarNanoPlatform().build(Blinky(), do_program=True)
