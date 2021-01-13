#include <stdint.h>

#include "vga.h"

/**
 * Clear VGA frame buffer
 */
void vga_clear()
{
    for (int y = 0; y < 192; y++)
    {
        for (int x = 0; x < 256; x++)
        {
            vga_set_px(x, y, 0, 0, 0);
        }
    }
}

/**
 * Set pixel in VGA frame buffer
 */
void vga_set_px(int x, int y, int r, int g, int b)
{
    reg_vga_addr = (256 * y) + x;
    reg_vga_data = (r << 5) | (g << 2) | b;
}
