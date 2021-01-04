module reset_gen(
    input  clk,
    output resetn
);

    reg [7:0] x = 8'hFF;

    always @(posedge clk)
        x <= {x[6:0], 1'b0};

    assign resetn = !x[7];

endmodule
