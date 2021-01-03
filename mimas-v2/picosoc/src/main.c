#include "util.h"

    
int main()
{
    /*
    unsigned int a,b,y;
    a = 23;
    b = 45;
    y = a*b;
    puts("23 * 45 = "); put_dec(y); putc('\n');

    double fa,fb,fy;
    fa = 23.758;
    fb = 682.7713;
    fy = fa*fb;
    puts("(int)(23.758 * 682.7713) = "); put_dec(fy); putc('\n');
    */

    int i = 0;
    char c;

    while (1)
    {
        c = getc();
        puts(&c);

        puts("\n");
        puts("  ____  _          ____         ____\n");
        puts(" |  _ \\(_) ___ ___/ ___|  ___  / ___|\n");
        puts(" | |_) | |/ __/ _ \\___ \\ / _ \\| |\n");
        puts(" |  __/| | (_| (_) |__) | (_) | |___\n");
        puts(" |_|   |_|\\___\\___/____/ \\___/ \\____|\n");
        puts("\n");

        led(i);
        i++;
    }

    return 0;
}
