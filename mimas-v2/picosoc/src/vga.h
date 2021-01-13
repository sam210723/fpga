#ifndef VGA_H
#define VGA_H

#define reg_vga_addr   (*(volatile uint32_t*)0x80000018)
#define reg_vga_data   (*(volatile uint32_t*)0x8000001C)

void vga_set_px(int x, int y, int r, int g, int b);
void vga_clear();

#endif
