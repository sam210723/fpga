module top(
    input   CLK_100MHz,

    output  [7:0]   LED
    output  [7:0]   LED,            // Status LEDs
    output  [7:0]   SEV_SEG,        // Seven Segment Display
    output  [2:0]   SEV_SEG_EN      // Seven Segment Display Enable
    );

    wire clk_eth;
    wire clk_eth_ok;
    pma pma (
        .clk_in   (CLK_100MHz),
        .clk_pma  (clk_eth),

        .reset    (1'b0),       // Active LOW
        .locked   (clk_eth_ok)  // Active HIGH
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
    
    assign LED[0]   = 1'b1;         // Always ON
    assign LED[1]   = clk_eth_ok;   // PLL Locked
    assign LED[7:2] = 6'b000000;

endmodule

`include "../rtl/phy/pma/pma.v"
`include "../rtl/hex.v"             // Seven Segment Hexadecimal Display
