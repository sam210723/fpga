# This file is based on ios_stream.py
# Copyright (c) 2019 Florent Kermarrec <florent@enjoy-digital.fr>
#
# License: BSD
#
# Generates a bitstream which places a UART transmitter on each FPGA pin that repeatedly transmits the pin name

import argparse

from migen import *
from migen.genlib.io import CRG

from litex.build.generic_platform import IOStandard, Pins, Misc
from litex.build.xilinx import XilinxPlatform
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *

ios = [
    "D4", "C4", "B2", "A2", "D6", "C6", "B3", "A3", "B4", "A4", "C5", "A5","C7", "A7",
    "B6", "A6", "D8", "C8", "B8", "A8", "D9", "C9", "B9", "A9", "D11", "C11", "C10",
    "A10", "G9", "F9", "B11", "A11", "B12", "A12", "C13", "A13", "B14", "A14", "F13",
    "E13", "C15", "A15", "D14", "C14", "B16", "A16", "A17", "D15", "B18", "D16", "F15",
    "F16", "C17", "C18", "F14", "G14", "D17", "D18", "H12", "G13", "E16", "E18", "K12",
    "K13", "F17", "F18", "H13", "H14", "H15", "H16", "G16", "G18", "J13", "K14", "L12",
    "L13", "K15", "K16", "L15", "L16", "H17", "H18", "J16", "J18", "K17", "K18", "L17",
    "L18", "M16", "M18", "N17", "N18", "P17", "P18", "N15", "N16", "T17", "T18", "U17",
    "U18", "M14", "N14", "L14", "M13", "P15", "P16", "R16", "P13", "V17", "R15", "T15",
    "U16", "V16", "R13", "T13", "U15", "V15", "T14", "V14", "N12", "P12", "U13", "V13",
    "M11", "N11", "R11", "T11", "T12", "V12", "N10", "P11", "M10", "N9", "U11", "V11",
    "R10", "T10", "U10", "V10", "R8", "T8", "T9", "V9", "M8", "N8", "U8", "V8", "U7",
    "V7", "N7", "P8", "T6", "V6", "R7", "T7", "N6", "P7", "R5", "T5", "U5", "V5", "R3",
    "T3", "T4", "V4", "N5", "P6", "U3", "V3", "V2", "N4", "N3", "P4", "P3", "L6", "M5",
    "U2", "U1", "T2", "T1", "P2", "P1", "N2", "N1", "M3", "M1", "L2", "L1", "K2", "K1",
    "L4", "L3", "J3", "J1", "H2", "H1", "K4", "K3", "L5", "K5", "H4", "H3", "L7", "K6",
    "G3", "G1", "J7", "J6", "F2", "F1", "H6", "H5", "E3", "E1", "F4", "F3", "D2", "D1",
    "H7", "G6", "E4", "D3", "F6", "F5", "C2", "C1"
]
clk_pin = "A10"
_io = [("clk100", 0, Pins(clk_pin), IOStandard("LVCMOS33"))]


class IOStreamer(Module):
    """
    Stream an identifier string over UART
    """

    def __init__(self, identifier, pad, sys_clk_freq, baudrate):
        from litex.soc.cores.uart import RS232PHYTX
        assert len(identifier) <= 4
        for i in range(4-len(identifier)):
            identifier += " "

        # UART
        pads = Record([("tx", 1)])
        self.comb += pad.eq(pads.tx)
        phy = RS232PHYTX(pads, int((baudrate/sys_clk_freq)*2**32))
        self.submodules += phy

        # Memory
        mem  = Memory(8, 4, init=[ord(identifier[i]) for i in range(4)])
        port = mem.get_port()
        self.specials += mem, port
        self.comb += phy.sink.valid.eq(1)
        self.comb += phy.sink.data.eq(port.dat_r)
        self.sync += If(phy.sink.ready, port.adr.eq(port.adr + 1))


class Platform(XilinxPlatform):
    default_clk_name   = "clk100"
    default_clk_period = 1e9/100e6

    def __init__(self, **kwargs):
        XilinxPlatform.__init__(self, "xc6slx45-csg324-2", _io, toolchain="ise", **kwargs)


class BaseSoC(SoCCore):
    def __init__(self):
        platform = Platform()
        sys_clk_freq = int(100e6)

        SoCMini.__init__(self, platform, sys_clk_freq)

        clk100 = platform.request("clk100")
        platform.add_period_constraint(clk100, 1e9/25e6)
        self.submodules.crg = CRG(clk100)

        excludes =  [clk_pin]                       # Clock Pins
        excludes += ["A17", "D15", "B18", "D16"]    # JTAG Pins
        excludes += ["R16", "P13", "V17", "V2"]     # Miscellaneous
        for exclude in excludes: ios.remove(exclude)

        for io in ios:
            platform.add_extension([(io, 0, Pins(io), IOStandard("LVCMOS33"), Misc("DRIVE=4"))])
            io_streamer = IOStreamer(io, platform.request(io), sys_clk_freq, baudrate=9600)
            self.submodules += io_streamer


def main():
    parser = argparse.ArgumentParser(description="LiteX pin tracing SoC on PallasLCD Video Decoder")
    builder_args(parser)
    soc_core_args(parser)
    args = parser.parse_args()
    
    soc = BaseSoC()

    builder = Builder(soc, **builder_argdict(args))
    builder.build(run=True)


if __name__ == "__main__": main()
