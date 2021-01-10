#include <stdint.h>

#include "sevenseg.h"

void sevenseg_set(int digit, int seg)
{
    int d0 = (int)reg_sevenseg_data >> 16;
    int d1 = (int)reg_sevenseg_data >> 8;
    int d2 = (int)reg_sevenseg_data;
    
    switch (digit)
    {
        case 0:
        reg_sevenseg_data = 0x00 << 24 | seg << 16 | d1 << 8 | d2;
        break;

        case 1:
        reg_sevenseg_data = 0x00 << 24 | d0 << 16 | seg << 8 | d2;
        break;

        case 2:
        reg_sevenseg_data = 0x00 << 24 | d0 << 16 | d1 << 8 | seg;
        break;

        default:
        break;
    }
}
