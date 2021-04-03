from nmigen import *
from nmigen.back.pysim import *

__all__ = ["SPDIF"]

class SPDIF(Elaboratable):
    def __init__(self, sim, ch, sr, bd, br):
        self.sim = sim
        self.ch = ch
        self.sr = sr
        self.bd = bd
        self.br = br
        self.out = Signal()

    def elaborate(self, platform):
        m = Module()

        # Clock divider
        counter = Signal(32)
        m.d.sync += counter.eq(counter + 0x83126E97)
        clk_stb = Signal()
        m.d.comb += clk_stb.eq(counter + 0x83126E97 > 2**32)
        #m.d.comb += clk_stb.eq(counter[31])
        m.d.comb += self.out.eq(clk_stb)

        # Assign pins
        if not self.sim:
            led = platform.request("led", 0)
            pmod = platform.request("pmod", 0)
            m.d.comb += led.o.eq(self.out)
            m.d.comb += pmod.o[4].eq(self.out)  # A1

        return m


# Build or simulate
if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    p_action = parser.add_subparsers(dest="action")
    p_action.add_parser("simulate")
    p_action.add_parser("generate")
    args = parser.parse_args()

    ch = 2      # Number of channels
    sr = 48e3   # Audio sample rate
    bd = 32     # Sample bit depth
    br = sr * bd * ch * 2

    if args.action == "simulate":
        spdif = SPDIF(True, ch, sr, bd, br)

        sim = Simulator(spdif)
        with sim.write_vcd("spdif.vcd"):
            def process():
                for i in range(int(1000)): yield Tick()

            sim.add_clock(1/6.144e6)
            sim.add_sync_process(process)
            sim.run()
    
    elif args.action == "generate":
        spdif = SPDIF(False, ch, sr, bd, br)

        from icesugar_nano import ICESugarNanoPlatform
        ICESugarNanoPlatform().build(spdif, do_program=False)
