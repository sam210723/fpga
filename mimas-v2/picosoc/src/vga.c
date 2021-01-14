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
 * Fill frame buffer area with colour
 */
void vga_fill(int x1, int y1, int x2, int y2, int r, int g, int b)
{
    for (int y = y1; y < y2; y++)
    {
        for (int x = x1; x < x2; x++)
        {
            vga_set_px(x, y, r, g, b);
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
