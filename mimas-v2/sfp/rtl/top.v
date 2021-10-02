module top(
    input   CLK_100MHz,

    output  [7:0]   LED
);

    wire clk_eth;
    wire clk_eth_ok;
    pma pma (
        .clk_in   (CLK_100MHz),
        .clk_pma  (clk_eth),

        .reset    (1'b0),       // Active LOW
        .locked   (clk_eth_ok)  // Active HIGH
    );
    
    assign LED[0]   = 1'b1;         // Always ON
    assign LED[1]   = clk_eth_ok;   // PLL Locked
    assign LED[7:2] = 6'b000000;

endmodule

`include "../rtl/phy/pma/pma.v"
