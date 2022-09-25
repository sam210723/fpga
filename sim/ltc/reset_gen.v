/**
 * Generates synchronous RESET signal after 16 clock cycles
 */

module reset_gen(
    input  wire clk,
    output wire reset_n
);

    reg [15:0] x = 16'h0000;
    always @(posedge clk)
        x <= {x[14:0], 1'b1};
    
    assign reset_n = x[15];

endmodule;
