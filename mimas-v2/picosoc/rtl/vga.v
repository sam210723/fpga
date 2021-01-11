module vga_sync(
    input               clk,
    output              hsync,
    output              vsync,
    output              active,
    output wire [12:0]  h,
    output wire [12:0]  v
);

    // VGA Timing Parameters
    //
    // Resolution:      1024 x 768  (XGA)
    // Frame Rate:      60 Hz
    // Vertical Rate:   48.36 kHz
    // Pixel Clock:     65 MHz
    //
    // Horizontal (px):
    //   Active Area:  1024   // Horizontal active pixels
	//   Front Porch:  24     // Horizontal front porch
	//   Sync Pulse:   136    // Horizontal sync pulse
	//   Back Porch:   160    // Horizontal back porch
    //
    // Vertical (px):
	//   Active Area:  768    // Vertical active pixels
	//   Front Porch:  3      // Vertical front porch
	//   Sync Pulse:   6      // Vertical sync pulse
	//   Back Porch:   29     // Vertical back porch

    
	localparam H_ACTIVE = 1024;     // Horizontal active pixels
	localparam H_FPORCH = 24;       // Horizontal front porch
	localparam H_PULSE  = 136;      // Horizontal sync pulse
	localparam H_BPORCH = 160;      // Horizontal back porch
	localparam V_ACTIVE = 768;      // Vertical active pixels
	localparam V_FPORCH = 3;        // Vertical front porch
	localparam V_PULSE  = 6;        // Vertical sync pulse
	localparam V_BPORCH = 29;       // Vertical back porch

	// Calculated timing parameters
	localparam H_SYNC_S = H_ACTIVE + H_FPORCH;     							// Horizontal sync start
	localparam H_SYNC_E = H_SYNC_S + H_PULSE;      							// Horizontal sync end
	localparam H_TOTAL  = H_ACTIVE + H_FPORCH + H_PULSE + H_BPORCH - 1;     // Horizontal total pixels
	localparam V_SYNC_S = V_ACTIVE + V_FPORCH;     							// Horizontal sync start
	localparam V_SYNC_E = V_SYNC_S + V_PULSE;      							// Horizontal sync end
	localparam V_TOTAL  = V_ACTIVE + V_FPORCH + V_PULSE + V_BPORCH - 1;     // Horizontal total pixels

    // Position registers
	reg [12:0] h_out, v_out;
	
	// Generate horizontal and vertical sync signals
	always @(posedge clk) begin
		// Reset horizontal position if at last pixel
		// else increment to next pixel
		h_out <= h_out == H_TOTAL ? 0 : h_out + 1;
		
		// Increment vertical position after horizontal reset
		// and reset vertical position if at last row
		// else do nothing
		v_out <= h_out == 0 ? (
			v_out == V_TOTAL ? 0 : v_out + 1
		) : v_out;
	end
	
	// Assign outputs
	assign hsync  = ~( h_out >= H_SYNC_S && h_out <= H_SYNC_E );
	assign vsync  = ~( v_out >= V_SYNC_S && v_out <= V_SYNC_E );
    assign active =    h_out <  H_ACTIVE && v_out <  V_ACTIVE  ;
    assign h = h_out;
    assign v = v_out;
endmodule
