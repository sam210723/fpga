module spdif (
  input  clock    // S/PDIF Clock
);

  // Sub-frame Preambles
  localparam preamble_b = 8'b11101000;  // Channel 1 (Left) and Start of Block
  localparam preamble_m = 8'b11100010;  // channel 1 (Left)
  localparam preamble_w = 8'b11100100;  // Channel 2 (Right) or higher

endmodule
