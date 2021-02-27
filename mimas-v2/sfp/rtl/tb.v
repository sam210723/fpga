`timescale 1ns / 1ps

module tb;
    initial begin
        $dumpfile("test/tb.vcd");
        $dumpvars(0, tb);
        clk = 0;
    end

    // 100 MHz clock
    reg clk;
    parameter PERIOD = 5;
    always #PERIOD clk = ~clk;


    nco nco(
        .clk (clk)
    );


    // Simulation duration
    initial begin
        #1_000_000;
        $finish;
    end

endmodule


`include "rtl/pll/nco.v"
