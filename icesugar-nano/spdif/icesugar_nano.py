import os
import subprocess

from nmigen import *
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

        Resource("A", 1, Pins("A1", dir="o"), Attrs(IO_STANDARD="SB_LVCMOS")),  # TEMP
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


    def get_pll(self, pll, simple_feedback=True):
        # https://github.com/GlasgowEmbedded/glasgow/blob/main/software/glasgow/platform/ice40.py

        if not 10e6 <= pll.f_in <= 133e6:
            print(f"PLL: f_in ({pll.f_in / 1e6:.3f} MHz) must be between 10 and 133 MHz")
            raise Exception("PLL f_in out of range")

        if not 16e6 <= pll.f_out <= 275e6:
            print(f"PLL: f_out ({pll.f_out / 1e6:.3f} MHz) must be between 16 and 275 MHz")
            raise Exception("PLL f_out out of range")

        # The documentation in the iCE40 PLL Usage Guide incorrectly lists the
        # maximum value of DIVF as 63, when it is only limited to 63 when using
        # feedback modes other that SIMPLE.
        if simple_feedback:
            divf_max = 128
        else:
            divf_max = 64

        variants = []
        for divr in range(0, 16):
            f_pfd = pll.f_in / (divr + 1)
            if not 10e6 <= f_pfd <= 133e6:
                continue

            for divf in range(0, divf_max):
                if simple_feedback:
                    f_vco = f_pfd * (divf + 1)
                    if not 533e6 <= f_vco <= 1066e6:
                        continue

                    for divq in range(1, 7):
                        f_out = f_vco * (2 ** -divq)
                        variants.append((divr, divf, divq, f_pfd, f_out))

                else:
                    for divq in range(1, 7):
                        f_vco = f_pfd * (divf + 1) * (2 ** divq)
                        if not 533e6 <= f_vco <= 1066e6:
                            continue

                        f_out = f_vco * (2 ** -divq)
                        variants.append((divr, divf, divq, f_pfd, f_out))

        if not variants:
            print(f"PLL: f_in ({pll.f_in / 1e6:.3f} MHz) to f_out ({pll.f_out / 1e6:.3f}) constraints not satisfiable")
            raise Exception("PLL f_in/f_out out of range")

        def f_out_diff(variant):
            *_, f_out = variant
            return abs(f_out - pll.f_out)
        divr, divf, divq, f_pfd, f_out = min(variants, key=f_out_diff)

        if f_pfd < 17:
            filter_range = 1
        elif f_pfd < 26:
            filter_range = 2
        elif f_pfd < 44:
            filter_range = 3
        elif f_pfd < 66:
            filter_range = 4
        elif f_pfd < 101:
            filter_range = 5
        else:
            filter_range = 6

        if simple_feedback:
            feedback_path = "SIMPLE"
        else:
            feedback_path = "NON_SIMPLE"

        ppm = abs(pll.f_out - f_out) / pll.f_out * 1e6
        percent = abs(pll.f_out - f_out) / pll.f_out * 100

        print(f"PLL: f_in={pll.f_in / 1e6:.3f} f_out(req)={pll.f_out / 1e6:.3f} f_out(act)={f_out / 1e6:.3f} [MHz] ppm={ppm:.2f} ({percent:.2f}%)")
        print(f"     feedback_path={feedback_path} divr={divr} divf={divf} divq={divq} filter_range={filter_range}")

        return Instance("SB_PLL40_CORE",
            p_FEEDBACK_PATH=feedback_path,
            p_PLLOUT_SELECT="GENCLK",
            p_DIVR=divr,
            p_DIVF=divf,
            p_DIVQ=divq,
            p_FILTER_RANGE=filter_range,
            i_REFERENCECLK=ClockSignal(pll.idomain),
            o_PLLOUTCORE=ClockSignal(pll.odomain),
            i_RESETB=~ResetSignal(pll.idomain),
            i_BYPASS=Const(0),
        )


if __name__ == "__main__":
    from test.blinky import *
    ICESugarNanoPlatform().build(Blinky(), do_program=True)
