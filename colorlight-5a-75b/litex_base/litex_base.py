#!/usr/bin/env python3

import argparse

from migen import *

from migen.genlib.io import CRG

from litex.build.generic_platform import IOStandard, Subsignal, Pins
from litex_boards.platforms import colorlight_5a_75b

from litex.build.lattice.trellis import trellis_args, trellis_argdict

from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *


class BaseSoC(SoCCore):
    def __init__(self, revision, cpu):
        platform = colorlight_5a_75b.Platform(revision)
        sys_clk_freq = int(25e6)

        # SoC with CPU
        SoCCore.__init__(
            self,
            platform,
            cpu_type                 = cpu,
            clk_freq                 = sys_clk_freq,
            ident                    = "LiteX SoC on Colorlight 5A-75B",
            ident_version            = True,
            integrated_rom_size      = 0x8000,
            integrated_main_ram_size = 0x4000,
            uart_name                = "serial"
        )

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk25"))


def main():
    parser = argparse.ArgumentParser(description="LiteX SoC on Colorlight 5A-75B")
    parser.add_argument("--revision", action="store", default="7.0", help="Colorlight 5A-75B board revision (6.1 / 7.0)")
    parser.add_argument("--cpu", action="store", default="vexriscv", help="SoC CPU (vexriscv / picorv32)")
    builder_args(parser)
    soc_core_args(parser)
    trellis_args(parser)
    args = parser.parse_args()
    
    soc = BaseSoC(
        revision = args.revision,
        cpu      = args.cpu
    )

    builder = Builder(soc, **builder_argdict(args))
    builder.build(**trellis_argdict(args), run=True)


if __name__ == "__main__": main()
