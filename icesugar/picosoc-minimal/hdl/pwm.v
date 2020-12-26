module pwm(
    input       clk,
    input [7:0] pwm,
    output      out,
);

    reg [7:0] counter;
    always @(posedge clk) counter <= counter + 1;

    assign out = ~(pwm > counter);

endmodule
