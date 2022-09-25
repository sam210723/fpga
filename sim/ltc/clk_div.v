/**
 * Fractional Clock Divider
 */

module clk_div(
    input  wire reset_n,        // Reset Flag
    input  wire clk_i,          // Input Clock
    output wire clk_o,          // Output Clock

    input reg [27:0] clk_i_f,   // Input Clock Frequency (Hz)
    input reg [27:0] clk_o_f    // Output Clock Frequency (Hz)
);

    reg [27:0] div = clk_i_f / (clk_o_f * 2);   // Divisor Value
    reg [27:0] step = 28'hFFFFFFF / div;        // Increment Value
    reg [28:0] count;                           // Counter Register
    reg out = 1'h1;                             // Output Clock Buffer

    always @(posedge clk_i) begin
        if (reset_n) begin
            // Increment counter on incoming clock edge
            count <= count + step;

            // Toggle output clock and reset when counter overflows
            if (count[28]) begin
                out <= ~out;
                count <= 29'h0;
            end
        end
    end

    assign clk_o = out && reset_n;

endmodule;
