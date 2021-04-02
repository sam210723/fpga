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

        # Get default clock frequency of platform
        if not self.sim: clk_freq = platform.default_clk_frequency

        # Test counter
        counter = Signal(25)
        m.d.sync += counter.eq(counter + 1)
        m.d.comb += self.out.eq(counter[22])

        # Assign LED to output signal
        if not self.sim:
            led = platform.request("led", 0)
            m.d.comb += led.o.eq(self.out)

        return m


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
                for i in range(100):
                    #print("out =", (yield spdif.out))
                    yield Tick()

            sim.add_clock(1/6.144e6)
            sim.add_sync_process(process)
            sim.run()
    
    elif args.action == "generate":
        spdif = SPDIF(False, ch, sr)

        from icesugar_nano import ICESugarNanoPlatform
        ICESugarNanoPlatform().build(spdif, do_program=False)
