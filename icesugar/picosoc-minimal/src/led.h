#ifndef LED_H
#define LED_H

#define reg_gpio_led (*(volatile uint32_t*)0x03000000)

void pmod_led(int v);
void rgb_led(int r, int g, int b);

#endif
