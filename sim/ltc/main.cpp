#include <stdio.h>
#include <verilated.h>
#include "Vtop.h"
#include "verilated_vcd_c.h"

// Simulation Properties
const int CLK_MHZ = 25;     // Clock speed in MHz
const int SIM_LEN_MS = 125; // Simulation duration in milliseconds
const long SIM_LEN = SIM_LEN_MS * 1e9;
const int SIM_STEP = int((1 / (float)CLK_MHZ) * 1e6) / 2;

int main(int argc, char* argv[]) {
    // Setup Verilator
    Verilated::commandArgs(argc, argv);
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};

    // Create instance of Verilog module
    Vtop* top = new Vtop;

    // Setup VCD trace output
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("obj_dir/trace.vcd");

    // Initialise the Verilog module
    top->clk = 0;
    top->eval();

    // Print simulation info
    printf("CLOCK:    %u MHz\n", CLK_MHZ);
    printf("DURATION: %u ms\n", SIM_LEN_MS);
    printf("STEP:     %.2f ns\n", SIM_STEP / 1000.0);

    int progress = 0;
    while (contextp->time() <= (SIM_LEN) && !contextp->gotFinish()) {
        // Clock posedge
        top->clk = 1;
        top->eval();
        tfp->dump(contextp->time());
        contextp->timeInc(SIM_STEP);

        // Clock negedge
        top->clk = 0;
        top->eval();
        tfp->dump(contextp->time());
        contextp->timeInc(SIM_STEP);

        // Simulation progress (print every 5%)
        progress = int((contextp->time() / (float)SIM_LEN) * 100);
        if (progress % 5 == 0) printf("\33[2K\r%u%% ", progress);
    }

    // Exit simulation
    top->final();
    tfp->close();
    printf("\nSimulation finished\n");
    return 0;
}
