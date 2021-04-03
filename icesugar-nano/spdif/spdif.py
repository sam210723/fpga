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

        ##################
        ##    Clocks    ##
        ##################
        self.clkgen = ClockGen(72e6, self.br)                           # Create clock generator instance (72 MHz input)
        m.submodules.clkgen = self.clkgen                               # Add clock generator submodule to top module
        m.domains.spdif = cd_spdif = ClockDomain(reset_less=True)       # Create new clock domain for S/PDIF clock
        cd_spdif.clk = self.clkgen.clk_out                              # Assign clock generator output to clock domain


        ####################
        ##    Counters    ##
        ####################
        c_subframe = Signal(9)      # Each S/PDIF block contains 192 frames, each containing two subframes
        c_cell = Signal(6)          # Within each subframe there are 32 cells (time-slots)

        # Increment cell counter on S/PDIF clock rising edge
        m.d.spdif += c_cell.eq(c_cell + 1)

        # Increment subframe counter after cell counter resets
        with m.If(c_cell == 31):
            with m.If(c_subframe == 383):
                m.d.spdif += c_subframe.eq(0)
            with m.Else():
                m.d.spdif += c_subframe.eq(c_subframe + 1)


        ####################
        ##    Preamble    ##
        ####################
        PREAMBLE_B = 0b00010111     # Channel A (Left) and start of block
        PREAMBLE_M = 0b00100111     # Channel A (Left)
        PREAMBLE_W = 0b01000111     # Channel B (Right)

        # Left channel flag
        left_flag = Signal()
        m.d.comb += left_flag.eq(~(c_subframe & 0x001))

        # Preamble
        with m.If(c_cell <= 7):
            # Left channel (B or M)
            with m.If(left_flag):
                with m.If(c_subframe == 0):
                    m.d.spdif += self.out.eq(PREAMBLE_B >> c_cell)
                with m.Else():
                    m.d.spdif += self.out.eq(PREAMBLE_M >> c_cell)
            
            # Right channel (W)
            with m.Else():
                m.d.spdif += self.out.eq(PREAMBLE_W >> c_cell)
        
        # Payload
        with m.Else():
            m.d.spdif += self.out.eq(~self.out)


        ###############
        ##    I/O    ##
        ###############
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
                for i in range(int(5000)): yield Tick()

            sim.add_clock(1/72e6)
            sim.add_sync_process(process)
            sim.run()
    
    elif args.action == "generate":
        spdif = SPDIF(False, ch, sr, bd)

        from icesugar_nano import ICESugarNanoPlatform
        ICESugarNanoPlatform().build(spdif, do_program=False)
