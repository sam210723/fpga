#include "util.h"

    
int main()
{
    getc();
    
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
    
    int i = 0;
    char c;

    for (;;)
    {
        c = getc();
        puts(&c);

        puts("\r\n");
        puts("  ____  _          ____         ____\r\n");
        puts(" |  _ \\(_) ___ ___/ ___|  ___  / ___|\r\n");
        puts(" | |_) | |/ __/ _ \\___ \\ / _ \\| |\r\n");
        puts(" |  __/| | (_| (_) |__) | (_) | |___\r\n");
        puts(" |_|   |_|\\___\\___/____/ \\___/ \\____|\r\n");
        puts("\r\n");

        led(i);
        i++;
    }

    return 0;
}
