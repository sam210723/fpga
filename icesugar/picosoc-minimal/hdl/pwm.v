module pwm(
    input       clk,
    input [7:0] pwm_r,
    input [7:0] pwm_g,
    input [7:0] pwm_b,
    output      out_r,
    output      out_g,
    output      out_b
);

    reg [7:0] counter;
    always @(posedge clk) counter <= counter + 1;

    assign out_r = ~(pwm_r > counter);
    assign out_g = ~(pwm_g > counter);
    assign out_b = ~(pwm_b > counter);

endmodule
