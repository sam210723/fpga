module top(
    input  wire clk,
    output wire ltc
);

    parameter FPS = 25;
    reg [79:0] frame;   // LTC frame
    reg        out;     // Output buffer

    wire rst_n;
    crg reset(clk, rst_n);

    always @(posedge clk) begin
        if (rst_n) begin
            out <= ~out;
        end
    end

    assign ltc = out;
endmodule
