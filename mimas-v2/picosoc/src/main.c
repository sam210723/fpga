#include <stdint.h>

#include "uart.h"
#include "sevenseg.h"

#define MEM_TOTAL 0x2000 // 8 KB Block RAM


void delay(int ms)
{
    for (int i = 0; i < (ms * 1000); i++)
    {
        __asm__("nop");
    }
}


int main()
{
    // Seven segment dots
    sevenseg_set(0, 0x80);
    sevenseg_set(1, 0x80);
    sevenseg_set(2, 0x80);

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
    }

    return 0;
}
