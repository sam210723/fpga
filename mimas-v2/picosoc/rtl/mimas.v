`ifdef PICOSOC_V
`error "mimas.v must be read before picosoc.v!"
`endif

module mimas(
    input CLK,

    output UART_TX,
    input  UART_RX,

    output [7:0] LED
);

    wire resetn;
    reset_gen rst(CLK, resetn);

    picosoc _picosoc(
        .clk   (CLK    ),
        .resetn(resetn ),
        .led   (LED    ),
        .rxd   (UART_RX),
        .txd   (UART_TX)
    );

endmodule

`include "../rtl/rst.v"
`include "../rtl/picosoc.v"
`include "../rtl/picorv32.v"
`include "../rtl/uart.v"
