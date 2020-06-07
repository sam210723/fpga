module spdif (
  input  CLK,   // S/PDIF Clock
  output LED    // On-board LED
);

  reg [23:0] counter;

  always @ (posedge CLK) begin
    counter <= counter + 1;

    if (counter > 16e6) counter <= 0;
  end

  assign LED = (counter < 1e6) || (counter > 3e6 && counter < 4e6);

endmodule
