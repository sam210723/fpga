#!/usr/bin/env python3

import argparse

from migen import *

from litex.build.generic_platform import IOStandard, Subsignal, Pins
from litex_boards.platforms import colorlight_5a_75b

from litex.build.lattice.trellis import trellis_args, trellis_argdict

from litex.soc.cores.clock import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *


class _CRG(Module):
    def __init__(self, platform, sys_clk_freq):
        self.clock_domains.cd_sys = ClockDomain()

        clk25 = platform.request("clk25")
        platform.add_period_constraint(clk25, 1e9/25e6)

        self.submodules.pll = pll = ECP5PLL()

        pll.register_clkin(clk25, 25e6)
        pll.create_clkout(self.cd_sys, sys_clk_freq)


class BaseSoC(SoCCore):
    def __init__(self, revision, cpu, freq):
        platform = colorlight_5a_75b.Platform(revision)
        sys_clk_freq = freq

        # SoC with CPU
        SoCCore.__init__(
            self,
            platform,
            cpu_type                 = cpu,
            clk_freq                 = sys_clk_freq,
            ident                    = "LiteX SoC with PLL on Colorlight 5A-75B",
            ident_version            = True,
            integrated_rom_size      = 0x8000,
            integrated_main_ram_size = 0x4000,
            uart_name                = "serial"
        )

        # Clock Reset Generation and PLL
        self.submodules.crg = _CRG(platform, sys_clk_freq)


def main():
    parser = argparse.ArgumentParser(description="LiteX SoC with PLL on Colorlight 5A-75B")
    parser.add_argument("--revision", action="store", default="7.0", help="Colorlight 5A-75B board revision (6.1 / 7.0)")
    parser.add_argument("--cpu", action="store", default="vexriscv", help="SoC CPU (vexriscv / picorv32)")
    parser.add_argument("--freq", action="store", type=int, default=50e6, help="System clock frequency (Hz)")
    builder_args(parser)
    soc_core_args(parser)
    trellis_args(parser)
    args = parser.parse_args()
    
    soc = BaseSoC(
        revision = args.revision,
        cpu      = args.cpu,
        freq     = args.freq
    )

    builder = Builder(soc, **builder_argdict(args))
    builder.build(**trellis_argdict(args), run=True)


if __name__ == "__main__": main()
