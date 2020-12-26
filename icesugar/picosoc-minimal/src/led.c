#include <stdint.h>

#include "led.h"

/**
 * Set LED PMOD value (PMOD 2)
 */
void pmod_led(int pmod)
{
    uint32_t rgb = reg_gpio_led & 0xFFFFFF00;
    
    reg_gpio_led = rgb | pmod;
}

/**
 * Set RGB LED value
 */
void rgb_led(int r, int g, int b)
{
    uint32_t pmod = reg_gpio_led & 0x000000FF;
    uint32_t rgb = b << 24 | g << 16 | r << 8;
    
    reg_gpio_led = rgb | pmod;
}
