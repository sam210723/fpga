# SMPTE 12M Linear Timecode (LTC) Encoder

Generates a [SMPTE 12M](https://en.wikipedia.org/wiki/SMPTE_timecode) compatible Linear Timecode signal at the specified frame rate.

Instantiate the `ltc` module by passing it the system clock frequency in `Hz` and the target frame rate. The standard SMPTE 12M frame rates are 24, 25 and 30 FPS.

```verilog
module top(
    input  wire clk,    // System Clock
    output wire ltc     // LTC Output
);

    // Synchronous Reset Signal Generator
    wire reset_n;
    reset_gen reset_gen(clk, reset_n);

    // Linear Timecode Generator
    ltc #(25000000, 25) encoder(reset_n, clk, ltc);

endmodule;
```

This module is simulated using [Verilator](https://www.veripool.org/verilator/) and [GTKWave](https://gtkwave.sourceforge.net/). Use `make` to build and run the simulation.
