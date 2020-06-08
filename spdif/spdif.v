module spdif (
  input  clock_i,   // S/PDIF clock
  output spdif_o    // S/PDIF output
);

  // Sub-frame Preambles
  localparam preamble_b = 8'b11101000;  // Channel 1 (Left) and start of block
  localparam preamble_m = 8'b11100010;  // Channel 1 (Left)
  localparam preamble_w = 8'b11100100;  // Channel 2 (Right) or higher

  assign spdif_o = 0;
endmodule
