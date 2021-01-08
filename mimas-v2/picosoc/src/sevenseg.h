#ifndef SEVENSEG_H
#define SEVENSEG_H

#define reg_sevenseg_data   (*(volatile uint32_t*)0x80000014)

void sevenseg_set(int digit, int seg);

#endif
