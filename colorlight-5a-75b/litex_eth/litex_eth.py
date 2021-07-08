#!/usr/bin/env python3

import argparse

from migen import *

from litex.build.generic_platform import IOStandard, Subsignal, Pins
from litex_boards.platforms import colorlight_5a_75b

from litex.build.lattice.trellis import trellis_args, trellis_argdict

from litex.soc.cores.clock import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *

from liteeth.phy.ecp5rgmii import LiteEthPHYRGMII


class _CRG(Module):
    def __init__(self, platform, sys_clk_freq):
        self.clock_domains.cd_sys = ClockDomain()

        clk25 = platform.request("clk25")
        platform.add_period_constraint(clk25, 1e9/25e6)

        self.submodules.pll = pll = ECP5PLL()

        pll.register_clkin(clk25, 25e6)
        pll.create_clkout(self.cd_sys,    sys_clk_freq)


class BaseSoC(SoCCore):
    def __init__(self, revision, cpu, freq, ip, mac, **kwargs):
        platform = colorlight_5a_75b.Platform(revision)
        sys_clk_freq = freq

        # SoC with CPU
        SoCCore.__init__(
            self,
            platform,
            cpu_type                 = cpu,
            clk_freq                 = sys_clk_freq,
            ident                    = "LiteX SoC with Ethernet on Colorlight 5A-75B",
            ident_version            = True,
            integrated_main_ram_size = 0x4000,
            **kwargs
        )

        # Clock Reset Generation and PLL
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        # Ethernet
        self.submodules.ethphy = LiteEthPHYRGMII(
            clock_pads = self.platform.request("eth_clocks"),
            pads       = self.platform.request("eth"),
            tx_delay   = 0e-9
        )
        self.add_csr("ethphy")
        self.add_etherbone(
            phy         = self.ethphy,
            ip_address  = ip,
            mac_address = int(mac, 0)
        )


def main():
    parser = argparse.ArgumentParser(description="LiteX SoC with Ethernet on Colorlight 5A-75B")
    parser.add_argument("--revision", action="store", default="7.0", help="Colorlight 5A-75B board revision (6.1 / 7.0)")
    parser.add_argument("--cpu", action="store", default="vexriscv", help="SoC CPU (vexriscv / picorv32)")
    parser.add_argument("--freq", action="store", type=int, default=50e6, help="System clock frequency (Hz)")
    parser.add_argument("--ip", action="store", default="192.168.1.20", help="Ethernet IP address")
    parser.add_argument("--mac", action="store", default="0x726b895bc2e2", help="Ethernet MAC accress")
    parser.add_argument("--eth-phy", default=0, type=int, help="Ethernet PHY 0 or 1 (default=0)")
    builder_args(parser)
    soc_core_args(parser)
    trellis_args(parser)
    args = parser.parse_args()
    
    soc = BaseSoC(
        revision = args.revision,
        cpu      = args.cpu,
        freq     = args.freq,
        ip       = args.ip,
        mac      = args.mac,
        **soc_core_argdict(args)
    )

    builder = Builder(soc, **builder_argdict(args))
    builder.build(**trellis_argdict(args), run=True)


if __name__ == "__main__": main()
