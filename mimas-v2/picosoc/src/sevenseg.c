#include <stdint.h>

#include "sevenseg.h"

void sevenseg_set(int digit, int seg)
{
    int d0 = (reg_sevenseg_data & 0x00FF0000) >> 16;
    int d1 = (reg_sevenseg_data & 0x0000FF00) >> 8;
    int d2 = (reg_sevenseg_data & 0x000000FF);

    switch (digit)
    {
    case 0:
        reg_sevenseg_data = seg << 16 | d1 << 8  | d2;
        break;
    case 1:
        reg_sevenseg_data = d0 << 16  | seg << 8 | d2;
        break;
    case 2:
        reg_sevenseg_data = d0 << 16  | d1 << 8  | seg;
        break;
    
    default:
        break;
    }
}
