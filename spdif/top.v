module top (
  input  CLK,   // 16 MHz Global Clock
  output LED,   // On-board LED
  output USBPU  // USB Pull-up Resistor
);

  // Disable USB
  assign USBPU = 0;

  // Create S/PDIF core instance
  spdif core(CLK, LED);
endmodule
