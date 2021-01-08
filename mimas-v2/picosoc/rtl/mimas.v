module mimas(
    input CLK,

    output UART_TX,
    input  UART_RX,

    output [7:0] LED,
    output [7:0] SevenSegment,
    output [2:0] SevenSegmentEN
);

    wire resetn;
    reset_gen rst(
        .clk   (CLK   ),
        .resetn(resetn)
    );

    picosoc soc(
        .clk   (CLK    ),
        .resetn(resetn ),
        .led   (LED    ),
        .rxd   (UART_RX),
        .txd   (UART_TX),
        .ss    (SevenSegment),
        .ssen  (SevenSegmentEN)
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
