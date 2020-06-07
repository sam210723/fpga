module spdif (
  input  clock,   // S/PDIF Clock
  output led      // On-board LED
);

  reg [23:0] counter;

  always @ (posedge clock) begin
    counter <= counter + 1;

    if (counter > 16e6) counter <= 0;
  end

  assign led = (counter < 1e6) || (counter > 3e6 && counter < 4e6);

endmodule
