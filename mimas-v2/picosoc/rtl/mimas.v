module mimas(
    input CLK,

    output UART_TX,
    input  UART_RX,

    output [7:0] LED,
    output [7:0] SevenSegment,
    output [2:0] SevenSegmentEN,
    output       VGA_HSYNC,
    output       VGA_VSYNC,
    output [7:0] VGA_PIX
);

    wire resetn;
    reset_gen rst(
        .clk   (CLK   ),
        .resetn(resetn)
    );

    picosoc soc(
        .clk     (CLK           ),
        .resetn  (resetn        ),
        .led     (LED           ),
        .rxd     (UART_RX       ),
        .txd     (UART_TX       ),
        .ss      (SevenSegment  ),
        .ssen    (SevenSegmentEN),
        .vga_h   (VGA_HSYNC     ),
        .vga_v   (VGA_VSYNC     ),
        .vga_pix (VGA_PIX       )
    );

endmodule


// Generates synchronous RESET signal after 8 clock cycles
module reset_gen(
    input  clk,
    output resetn
);

    reg [7:0] x = 8'hFF;

    always @(posedge clk)
        x <= {x[6:0], 1'b0};

    assign resetn = !x[7];

endmodule


`include "../rtl/picosoc.v"
`include "../rtl/picorv32.v"
`include "../rtl/uart.v"
`include "../rtl/pll.v"
`include "../rtl/vga.v"
