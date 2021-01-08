module picosoc(
    input clk,
    input resetn,
    output [7:0] led,
    input rxd,
    output txd
);

    wire trap;
    wire mem_valid;
    wire mem_instr;
    reg mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0] mem_wstrb;
    wire [31:0] mem_rdata;
    
    picorv32 #(.ENABLE_REGS_DUALPORT(0)) _picorv32(
    .clk(clk),
    .resetn(resetn),
    .trap(trap),
    .mem_valid(mem_valid),
    .mem_instr(mem_instr),
    .mem_ready(mem_ready),
    .mem_addr(mem_addr),
    .mem_wdata(mem_wdata),
    .mem_wstrb(mem_wstrb),
    .mem_rdata(mem_rdata)
    );

    wire [31:0] ram_rdata;
    wire [31:0] io_rdata;
    reg [31:0] mem_addr1;

    always @(posedge clk) begin
    mem_ready <= mem_valid;
    mem_addr1 <= mem_addr;
    end

    wire io_valid = mem_valid && (mem_addr[31]);
    wire reset = ~resetn;

    ram_2k_32 _ram_2k_32(clk, mem_addr[12:2], mem_wdata, ram_rdata, mem_wstrb, mem_valid && !mem_addr[31]);

    io _io(clk, reset, io_valid, mem_addr[4:2], mem_wdata, mem_wstrb[0], io_rdata, led[6:0], rxd, txd);

    assign mem_rdata = mem_addr1[31] ? io_rdata : ram_rdata;
    assign led[7] = trap;

endmodule


module io(
    input clk,
    input reset,
    input valid,
    input [2:0] addr,
    input [31:0] wdata,
    input wstrb,
    output reg [31:0] rdata,
    output reg [6:0] led,
    input rxd,
    output txd
);

    // Peripheral Memory Map
    //
    // 80000000     out,    LED [0], write
    // 80000004 UART TX, data [7:0], write
    // 80000008 UART TX,  ready [0], read
    // 8000000c UART RX, data [7:0], read
    // 80000010 UART RX,  ready [0], read

    wire led_write_strobe =        valid && (addr==3'd0) && wstrb;
    wire uart_tx_write_strobe =    valid && (addr==3'd1) && wstrb;
    wire uart_rx_read_strobe =     valid && (addr==3'd3) && !wstrb;

    wire uart_tx_ready;
    wire [7:0] uart_rx_data;
    wire uart_rx_ready;
    
    always @(posedge clk)
    case (addr)
        3'd2: rdata <= {31'd0, uart_tx_ready};
        3'd3: rdata <= {24'd0, uart_rx_data};
        3'd4: rdata <= {31'd0, uart_rx_ready};
        default: rdata <= 32'd0;
    endcase

    wire baudclk16;

    uart_baud_clock_16x _uart_baud_clock_16x(clk, baudclk16);

    uart_tx _uart_tx(clk, reset, baudclk16, txd, wdata[7:0], uart_tx_ready, uart_tx_write_strobe);
    uart_rx _uart_rx(clk, reset, baudclk16, rxd, uart_rx_data, uart_rx_ready, uart_rx_read_strobe);

    always @(posedge clk) begin
    led[6] <= uart_tx_ready;
    led[5] <= uart_rx_ready;
    led[4] <= !txd;
    led[3] <= !rxd;
    if (led_write_strobe)
        led[2:0] <= wdata[2:0];
    end

endmodule


module ram_2k_32(
    input clk,
    input [10:0] addr,
    input [31:0] din,
    output [31:0] dout,
    input [3:0] we,
    input en
);

    bram_2k_8 _bram0(clk, addr, din[7:0], dout[7:0], we[0], en);
    bram_2k_8 _bram1(clk, addr, din[15:8], dout[15:8], we[1], en);
    bram_2k_8 _bram2(clk, addr, din[23:16], dout[23:16], we[2], en);
    bram_2k_8 _bram3(clk, addr, din[31:24], dout[31:24], we[3], en);

endmodule


module bram_2k_8(
    input clk,
    input [10:0] addr,
    input [7:0] din,
    output [7:0] dout,
    input we,
    input en
);

    reg [7:0] mem[0:2047];
    reg [10:0] addr1;

    always @(posedge clk)
    if (en) begin
        addr1 <= addr;
        if (we)
        mem[addr] <= din;
    end      

    assign dout = mem[addr1];

endmodule


module uart_baud_clock_16x(
    input clk,
    output baudclk16
);

    reg [8:0] c;
    wire m = (c==9'd325);    // 100e6 / (16 * 19200) ~= 326

    always @(posedge clk)
    c <= m ? 0 : c+1;

    assign baudclk16 = m;

endmodule
