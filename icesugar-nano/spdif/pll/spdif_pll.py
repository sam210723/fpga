from nmigen import *
from nmigen.back.pysim import *

__all__ = ["SPDIF"]

class SPDIF(Elaboratable):
    def __init__(self, sim, ch, sr):
        self.sim = sim
        self.ch = ch
        self.sr = sr
        self.out = Signal()
        self.pll_clk_freq = 6.144e6 * 4

    def elaborate(self, platform):
        m = Module()

        # Setup PLL
        if not self.sim:
            m.domains.spdif = cd_spdif = ClockDomain(reset_less=False)
            m.submodules += PLL(
                platform.default_clk_frequency,
                self.pll_clk_freq,
                odomain="spdif"
            )
            platform.add_clock_constraint(cd_spdif.clk, self.pll_clk_freq)

        # Test counter
        #counter = Signal(25)
        #m.d.spdif += counter.eq(counter + 1)
        #m.d.comb += self.out.eq(counter[24])
        m.d.spdif += self.out.eq(~self.out.bool())

        # Assign pins
        if not self.sim:
            led = platform.request("led", 0)
            pin = platform.request("A", 1)
            m.d.comb += led.o.eq(self.out)
            m.d.comb += pin.o.eq(self.out)

        return m


class PLL(Elaboratable):
    # https://github.com/GlasgowEmbedded/glasgow/blob/main/software/glasgow/gateware/pll.py

    def __init__(self, f_in, f_out, odomain, idomain="sync"):
        self.f_in    = float(f_in)
        self.f_out   = float(f_out)
        self.odomain = odomain
        self.idomain = idomain

    def elaborate(self, platform):
        if hasattr(platform, "get_pll"): return platform.get_pll(self)
        raise NotImplementedError("No PLL support for platform")


# Build or simulate
if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    p_action = parser.add_subparsers(dest="action")
    p_action.add_parser("simulate")
    p_action.add_parser("generate")
    args = parser.parse_args()

    ch = 1      # Number of channels
    sr = 48e3   # Audio sample rate

    if args.action == "simulate":
        spdif = SPDIF(True, ch, sr)

        sim = Simulator(spdif)
        with sim.write_vcd("spdif.vcd"):
            def process():
                for i in range(100): yield Tick()

            sim.add_clock(1/6.144e6)
            sim.add_sync_process(process)
            sim.run()
    
    elif args.action == "generate":
        spdif = SPDIF(False, ch, sr)

        from icesugar_nano import ICESugarNanoPlatform
        ICESugarNanoPlatform().build(spdif, do_program=False)
