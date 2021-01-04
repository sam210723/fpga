#include <stdint.h>

#include "uart.h"

#define MEM_TOTAL 0x2000 // 8 KB Block RAM

int main()
{
    getc();
    print_banner(MEM_TOTAL);

    char c;
    while (1)
    {
        char buf[16];
        get_str(buf, "> ");
        print("\n");

        if (strcmp(buf, "halt")) return 1;
    }

    return 0;
}
