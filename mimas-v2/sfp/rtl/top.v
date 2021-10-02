module top(
    input   CLK_100MHz,             // 100 MHz System Clock

    output  [7:0]   LED,            // Status LEDs
    output  [7:0]   SEV_SEG,        // Seven Segment Display
    output  [2:0]   SEV_SEG_EN      // Seven Segment Display Enable
    );

    // Clock Generator (125 MHz)
    wire clk_eth;
    wire pll_ok;
    pll pll_eth (
        .clk_in   (CLK_100MHz),
        .clk_out  (clk_eth),

        .reset    (1'b0),   // Active LOW
        .locked   (pll_ok)  // Active HIGH
    );

    // Status Display
    reg [7:0] status = 8'h00;
    hex #(
		.refresh_rate     (100),
		.sys_clk_freq     (125000000)
    )
    display (
        .clk              (clk_eth),
        .hex_byte         (status),
        .segments         (SEV_SEG),
        .segments_enable  (SEV_SEG_EN)
    );

    // Status LEDs
    assign LED[0]   = pll_ok;       // PLL Lock Indicator
    assign LED[7:1] = 6'b0000000;
endmodule

`include "../rtl/phy/pma/pll.v"     // Phase Locked Loop
`include "../rtl/hex.v"             // Seven Segment Hexadecimal Display
