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
     *  0x40    16   Sync Word (0011 1111 1111 1101, 0x3FFD)
     */

    // Module Parameters
    parameter CLK_FREQ = 25000000;          // System Clock Frequency (Hz)
    parameter LTC_FPS = 25;                 // Frames per second

    // Registers
    reg [15:0] sync = 16'b0011111111111101; // SMPTE 12M Sync Word (0x3FFD)
    reg [79:0] frame;                       // LTC Frame
    reg [4:0]  time_hour;                   // Timestamp Hour Value
    reg [5:0]  time_minute;                 // Timestamp Minute Value
    reg [5:0]  time_second;                 // Timestamp Second Value
    reg [4:0]  time_frame;                  // Timestamp Frame Value
    reg        out;                         // LTC Output Buffer

    // Synchronous Reset Signal Generator
    wire reset_n;
    reset_gen reset_gen(clk, reset_n);

    // Clock Divider
    wire clk_ltc;
    clk_div clk_div(
        .reset_n(reset_n),
        .clk_i(clk),
        .clk_o(clk_ltc),
        .clk_i_f(CLK_FREQ),
        .clk_o_f(LTC_FPS)
    );

    // Serialise LTC Frame
    always @(posedge clk) begin
        if (reset_n) begin
            out <= clk_ltc;
        end
    end

    // Update Timestamp
    always @(posedge clk_ltc) begin
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
    end

    assign ltc = out && reset_n;
endmodule
