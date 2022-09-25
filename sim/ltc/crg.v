/**
 * Generates synchronous RESET signal after 16 clock cycles
 */

module crg(
    input  wire clk,
    output wire rst_n
);

    reg [15:0] x = 16'h0000;
    always @(posedge clk)
        x <= {x[14:0], 1'b1};
    
    assign rst_n = x[15];

endmodule;
