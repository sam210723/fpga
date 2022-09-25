/**
 * SMPTE 12M Linear Timecode (LTC) Generator
 */

module top(
    input  wire clk,
    output wire ltc
);

    /*
     *  SMPTE 12M Linear Timecode (LTC) Frame Format
     *  https://en.wikipedia.org/wiki/Linear_timecode#Longitudinal_timecode_data_format
     *  
     *  OFFSET  LEN  USE
     *  0x00    4    Frame (units)
     *  0x04    4    User Field 1
     *  0x08    2    Frame (tens)
     *  0x0A    1    Drop Frame Flag
     *  0x0B    1    Color Frame Flag
     *  0x0C    4    User Field 2
     *  0x10    4    Second (units)
     *  0x14    4    User Field 3
     *  0x18    3    Second (tens)
     *  0x1B    1    Binary Group Flag 0 (BGF0) @ 25 FPS / Polarity Correction Bit
     *  0x1C    4    User Field 4
     *  0x20    4    Minute (units)
     *  0x24    4    User Field 5
     *  0x28    3    Minute (tens)
     *  0x2B    1    Binary Group Flag 2 (BGF2) @ 25 FPS / Binary Group Flag 0 (BGF0)
     *  0x2C    4    User Field 6
     *  0x30    4    Hour (units)
     *  0x34    4    User Field 7
     *  0x38    2    Hour (tens)
     *  0x3A    1    Binary Group Flag 1 (External Sync Source Flag)
     *  0x3B    1    Polarity Correction Bit @ 25 FPS / Binary Group Flag 2 (BGF2)
     *  0x3C    4    User Field 8
     */

    parameter FPS = 25;     // Frames per second
    parameter CLK = 25e6;   // Clock frequency in Hz

    reg [15:0] sync = 16'b0011111111111101;     // SMPTE 12M Sync Word
    reg [79:0] frame;
    reg        out;

    wire reset_n;
    reset_gen crg(clk, reset_n);

    always @(posedge clk) begin
        if (reset_n) begin
            out <= ~out;
        end
    end

    assign ltc = out;
endmodule
