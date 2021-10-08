module pll (
    input   clk_in,
    output  clk_out,

    input   reset,
    output  locked
    );

    IBUFG clkin1_buf (
        .O (clkin1),
        .I (clk_in)
    );

    wire [15:0] do_unused;
    wire        drdy_unused;
    wire        clkfbout;
    wire        clkfbout_buf;
    wire        clkout1_unused;
    wire        clkout2_unused;
    wire        clkout3_unused;
    wire        clkout4_unused;
    wire        clkout5_unused;

    PLL_BASE # (
        .BANDWIDTH              ("HIGH"),
        .CLK_FEEDBACK           ("CLKFBOUT"),
        .COMPENSATION           ("SYSTEM_SYNCHRONOUS"),
        .DIVCLK_DIVIDE          (1),
        .CLKFBOUT_MULT          (10),
        .CLKFBOUT_PHASE         (0.000),
        .CLKOUT0_DIVIDE         (4),
        .CLKOUT0_PHASE          (0.000),
        .CLKOUT0_DUTY_CYCLE     (0.500),
        .CLKIN_PERIOD           (10.0),
        .REF_JITTER             (0.010)
    )
    pll_base_inst (
        .CLKFBOUT               (clkfbout),
        .CLKOUT0                (clkout0),
        .CLKOUT1                (clkout1_unused),
        .CLKOUT2                (clkout2_unused),
        .CLKOUT3                (clkout3_unused),
        .CLKOUT4                (clkout4_unused),
        .CLKOUT5                (clkout5_unused),

        .LOCKED                 (locked),
        .RST                    (reset),

        .CLKFBIN                (clkfbout_buf),
        .CLKIN                  (clkin1)
    );

    BUFG clkf_buf (
        .O (clkfbout_buf),
        .I (clkfbout)
    );

    BUFG clkout1_buf (
        .O   (clk_out),
        .I   (clkout0)
    );
endmodule
