module mimas(
  input clk,
  output [7:0] led,
  input rs232_dce_rxd,
  output rs232_dce_txd
);

  wire resetn;
 
  reset_gen _reset_gen(clk, resetn);

  top _top(clk,resetn,led,rs232_dce_rxd,rs232_dce_txd);

endmodule

module reset_gen(
  input clk,
  output resetn
);

  reg [7:0] x = 8'hff;

  always @(posedge clk)
    x <= {x[6:0], 1'b0};

  assign resetn = !x[7];

endmodule

`include "../rtl/top.v"
`include "../rtl/picorv32.v"
`include "../rtl/uart.v"
