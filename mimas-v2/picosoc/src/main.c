#include <stdint.h>

#include "uart.h"
#include "sevenseg.h"
#include "vga.h"

#define MEM_TOTAL 0x2000 // 8 KB Block RAM

void delay(int ms)
{
    for (int i = 0; i < (ms * 1000); i++)
    {
        __asm__("nop");
    }
}


void gfx()
{
    // Gradients
    for (int i = 0; i < 8; i++)
    {
        vga_fill(
            i * 8, 0,
            (i + 1) * 8, 48,
            i, 0, 0
        );

        vga_fill(
            i * 8, 48,
            (i + 1) * 8, 96,
            0, i, 0
        );

        vga_fill(
            i * 8, 96,
            (i + 1) * 8, 144,
            0, 0, i / 2
        );

        vga_fill(
            i * 8, 144,
            (i + 1) * 8, 192,
            i, i, i / 2
        );
    }

    // Left boundary line
    vga_fill(0, 0, 1, 192, 7, 7, 3);

    // Crosshair
    for (int y = 91; y < 102; y++)
    {
        for (int x = 123; x < 134; x++)
        {
            vga_set_px(  x, 96, 7, 7, 3);
            vga_set_px(128,  y, 7, 7, 3);
        }
    }
    vga_set_px(128, 96, 0, 0, 0);
}


int main()
{
    // Seven segment dots
    sevenseg_set(0, 0x80);
    sevenseg_set(1, 0x80);
    sevenseg_set(2, 0x80);

    gfx();

    getc();
    print_banner(MEM_TOTAL);

    // "PicoSoC" seven segment characters
    int picosoc_ss[14] = {0x00, 0x00, 0x00, 0x73, 0x04, 0x58, 0x5C, 0x6D, 0x5C, 0x39, 0x00, 0x00, 0x00};

    char c;
    while (1)
    {
        char buf[16];
        get_str(buf, "> ");
        print("\n");

        if (strcmp(buf, "seg"))
        {
            for (int i = 0; i < 11; i++)
            {
                reg_sevenseg_data = 0x00 << 24 | picosoc_ss[i] << 16 | picosoc_ss[i + 1] << 8 | picosoc_ss[i + 2];
                delay(500);
            }
        }
        else if (strcmp(buf, "vga"))
        {
            // Wait for keyboard interrupt
            while(!reg_uart_rx_ready)
            {
                for (int i = 0; i < (192 - 8); i++)
                {
                    // Clear 8px vertical column on far right
                    vga_fill(256-8, 0, 256, 192, 0, 0, 0);

                    vga_fill(256-8, i, 256, i + 8, 7, 0, 0);
                }

                for (int i = (192 - 8); i > 0; i--)
                {
                    // Clear 8px vertical column on far right
                    vga_fill(256-8, 0, 256, 192, 0, 0, 0);

                    vga_fill(256-8, i, 256, i + 8, 0, 7, 0);
                }
            }

            // Clear 8px vertical column on far right
            vga_fill(256-8, 0, 256, 192, 0, 0, 0);
        }
    }

    return 0;
}
