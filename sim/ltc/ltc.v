/**
 * SMPTE 12M Linear Timecode (LTC) Encoder
 */

module ltc(
    input  wire reset_n,
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
     *  0x40    16   Sync Word (0011 1111 1111 1101, 0x3FFD)
     */

    // Module Parameters
    parameter CLK_FREQ;             // System Clock Frequency (Hz)
    parameter LTC_FPS;              // Frames per second

    // Registers
    reg [15:0] sync = 16'h3FFD;     // SMPTE 12M Sync Word
    reg [63:0] frame_a = 64'h0;     // LTC Frame A
    reg [63:0] frame_b = 64'h0;     // LTC Frame B
    reg  [7:0] pointer = 8'h00;     // Serialiser Bit Pointer
    reg        out;                 // Output Signal Buffer

    // LTC Encoder Clock Divider
    wire clk_ltc;
    clk_div #(
        CLK_FREQ,
        LTC_FPS * 80 * 2
    )
    clk_div_ltc(
        .reset_n(reset_n),
        .clk_i(clk),
        .clk_o(clk_ltc)
    );

    // Differential Manchester Encoder (Biphase Mark Code)
    always @(posedge clk_ltc) begin
        if (~pointer[0]) begin
            // Invert Output Register (Middle)
            if (frame_a[pointer[6:1]]) out <= ~out;
        end else begin
            // Invert Output Register (Start)
            out <= ~out;
        end

        // Increment Pointer Register
        pointer <= pointer + 1;

        // Reset Pointer Register
        if (pointer == 159) begin pointer <= 0;
        end
    end

    // Output Signal
    assign ltc = out && reset_n;
endmodule

/*
reg  [4:0] time_hour;           // Timestamp Hour Value
reg  [5:0] time_minute;         // Timestamp Minute Value
reg  [5:0] time_second;         // Timestamp Second Value
reg  [4:0] time_frame;          // Timestamp Frame Value

// Increment Frame
time_frame <= time_frame + 1;

// Increment Second and Reset Frame
if (time_frame == LTC_FPS - 1) begin
    time_frame <= 0;
    time_second <= time_second + 1;

    // Increment Minute and Reset Second
    if (time_second == 59) begin
        time_second <= 0;
        time_minute <= time_minute + 1;

        // Incrememt Hour and Reset Minute
        if (time_minute == 59) begin
            time_minute <= 0;
            time_hour <= time_hour + 1;

            // Reset Hour
            if (time_hour == 23) time_hour <= 0;
        end
    end
end
*/
