from nmigen import *
from nmigen.back.pysim import *

__all__ = ["SPDIF"]

class SPDIF(Elaboratable):
    def __init__(self, sim, ch, sr, bd):
        self.sim = sim                  # Simulation flag (no I/O)
        self.ch = ch                    # Number of channels
        self.sr = sr                    # Audio sample rate
        self.bd = bd                    # Audio sample bit depth (max 24)
        self.br = sr * 32 * ch * 2      # S/PDIF block rate (bitrate * 2)
        self.out = Signal()             # S/PDIF output signal

    def elaborate(self, platform):
        m = Module()

        # Setup clock generator and domain
        self.clkgen = ClockGen(72e6, self.br)                           # Create clock generator instance (72 MHz input)
        m.submodules.clkgen = self.clkgen                               # Add clock generator submodule to top module
        m.domains.spdif = cd_spdif = ClockDomain(reset_less=True)       # Create new clock domain for S/PDIF clock
        cd_spdif.clk = self.clkgen.clk_out                              # Assign clock generator output to clock domain

        # Test output
        m.d.spdif += self.out.eq(~self.out)

        # Assign output pins
        if not self.sim:
            # Get LED and PMOD pins
            led = platform.request("led", 0)
            pmod = platform.request("pmod", 0)

            # Assign S/PDIF output to LED and PMOD pin
            m.d.comb += led.o.eq(self.out)      # B6
            m.d.comb += pmod.o[3].eq(self.out)  # B1

        return m


class ClockGen(Elaboratable):
    """
    Fractional clock divider
    """

    def __init__(self, f_in, f_out):
        assert f_in >= f_out, "Output frequency must be smaller than input frequency"

        self.width = 32                         # Counter register width
        self.max = 2 ** self.width              # Maximum counter value
        self.div = f_in / (f_out * 2)           # Division factor
        self.step = round(self.max / self.div)  # Counter step size
        self.clk_out = Signal()                 # Output clock signal

        print(
            f"[clk] f_in={f_in / 1e6} MHz  " \
            f"f_out={f_out / 1e6} MHz  " \
            f"width={self.width} bits  " \
            f"div={self.div}  " \
            f"step=0x{self.step:X}"
        )


    def elaborate(self, platform):
        m = Module()

        # Increment counter on each input clock cycle
        counter = Signal(self.width)
        m.d.sync += counter.eq(counter + self.step)

        # Check for overflow condition
        ovf = Signal()
        m.d.comb += ovf.eq(counter + self.step > self.max)
        
        # Toggle output clock on overflow strobe
        with m.If(ovf):
            m.d.sync += self.clk_out.eq(~self.clk_out)

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
    bd = 24     # Sample bit depth

    if args.action == "simulate":
        spdif = SPDIF(True, ch, sr, bd)

        sim = Simulator(spdif)
        with sim.write_vcd("spdif.vcd"):
            def process():
                for i in range(int(1000)): yield Tick()

            sim.add_clock(1/72e6)
            sim.add_sync_process(process)
            sim.run()
    
    elif args.action == "generate":
        spdif = SPDIF(False, ch, sr, bd)

        from icesugar_nano import ICESugarNanoPlatform
        ICESugarNanoPlatform().build(spdif, do_program=False)
