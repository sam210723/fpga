from nmigen import *
from nmigen.back.pysim import *

__all__ = ["SPDIF"]

class SPDIF(Elaboratable):
    def __init__(self, sim, ch, sr):
        self.sim = sim
        self.ch = ch
        self.sr = sr
        self.out = Signal()

    def elaborate(self, platform):
        m = Module()

        # Test counter
        counter = Signal(25)
        m.d.sync += counter.eq(counter + 1)
        m.d.comb += self.out.eq(counter[19])

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
