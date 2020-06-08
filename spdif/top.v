module top (
  input  CLK,     // 16 MHz global clock
  output LED,     // On-board LED
  output PIN_4,   // Heartbeat pin
  output PIN_8,   // S/PDIF pin
  output USBPU    // USB pull-up
);

  // Disable USB
  assign USBPU = 0;

  // Create S/PDIF core instance
  spdif core(CLK, PIN_8);

  // Create Heartbeat module instance
  wire pulse;
  heartbeat beat(CLK, pulse);
  assign LED = pulse;
  assign PIN_4 = pulse;
endmodule
