module heartbeat (
  input  clock_i,   // Global clock input (16 MHz)
  output pulse_o    // Heartbeat pulse output
);

  // Register to count clock pulses
  reg [23:0] counter;

  // Increment counter on clock pulse
  always @ (posedge clock_i) begin
    counter <= counter + 1;

    // Reset counter at 16,000,000
    if (counter > 16e6) counter <= 0;
  end

  // Pulse pattern
  assign pulse_o = (counter < 1e6) || (counter > 3e6 && counter < 4e6);
endmodule
