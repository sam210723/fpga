#include <stdint.h>

#include "uart.h"
#include "sevenseg.h"

#define MEM_TOTAL 0x2000 // 8 KB Block RAM


int main()
{
    reg_sevenseg_data = 0xFF0000;

    getc();
    print_banner(MEM_TOTAL);

    char c;
    while (1)
    {
        char buf[16];
        get_str(buf, "> ");
        print("\n");

        if (strcmp(buf, "soc"))
        {
            sevenseg_set(0, 0x9C); // "S"
            sevenseg_set(1, 0xB6); // "o"
            sevenseg_set(2, 0x3A); // "C"
        }
    }

    return 0;
}
