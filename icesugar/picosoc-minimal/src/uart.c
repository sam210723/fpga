#include <stdint.h>

#include "uart.h"

/**
 * Set UART clock divider for given baud rate.
 * Baud options: 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200
 */
int setup_uart(int baud)
{
    int div;

    switch (baud)
    {
    case 1200:
        div = 10000;
        break;
    case 2400:
        div = 5000;
        break;
    case 4800:
        div = 2500;
        break;
    case 9600:
        div = 1250;
        break;
    case 19200:
        div = 625;
        break;
    case 38400:
        div = 312;
        break;
    case 57600:
        div = 208;
        break;
    case 115200:
        div = 104;
        break;
    default:
        div = 1250;
        break;
    }

    reg_uart_clkdiv = div;
    return div;
}

/**
 * Print string
 */
void print(char *p)
{
    while (*p) putc(*(p++));
}

/**
 * Print integer in decimal
 */
void print_dec(uint32_t v)
{
	if (v >= 1000) {
		print(">=1000");
		return;
	}

	if      (v >= 900) { putc('9'); v -= 900; }
	else if (v >= 800) { putc('8'); v -= 800; }
	else if (v >= 700) { putc('7'); v -= 700; }
	else if (v >= 600) { putc('6'); v -= 600; }
	else if (v >= 500) { putc('5'); v -= 500; }
	else if (v >= 400) { putc('4'); v -= 400; }
	else if (v >= 300) { putc('3'); v -= 300; }
	else if (v >= 200) { putc('2'); v -= 200; }
	else if (v >= 100) { putc('1'); v -= 100; }

	if      (v >= 90) { putc('9'); v -= 90; }
	else if (v >= 80) { putc('8'); v -= 80; }
	else if (v >= 70) { putc('7'); v -= 70; }
	else if (v >= 60) { putc('6'); v -= 60; }
	else if (v >= 50) { putc('5'); v -= 50; }
	else if (v >= 40) { putc('4'); v -= 40; }
	else if (v >= 30) { putc('3'); v -= 30; }
	else if (v >= 20) { putc('2'); v -= 20; }
	else if (v >= 10) { putc('1'); v -= 10; }

	if      (v >= 9) { putc('9'); v -= 9; }
	else if (v >= 8) { putc('8'); v -= 8; }
	else if (v >= 7) { putc('7'); v -= 7; }
	else if (v >= 6) { putc('6'); v -= 6; }
	else if (v >= 5) { putc('5'); v -= 5; }
	else if (v >= 4) { putc('4'); v -= 4; }
	else if (v >= 3) { putc('3'); v -= 3; }
	else if (v >= 2) { putc('2'); v -= 2; }
	else if (v >= 1) { putc('1'); v -= 1; }
	else putc('0');
}

/**
 * Print integer in hexadecimal
 */
void print_hex(uint32_t v, int digits)
{
	for (int i = 7; i >= 0; i--) {
		char c = "0123456789abcdef"[(v >> (4*i)) & 15];
		if (c == '0' && i >= digits) continue;
		putc(c);
		digits = i;
	}
}

/**
 * Send character to UART
 */
void putc(char c)
{
    // Include carriage return with new line 
    if (c == '\n') putc('\r');

	reg_uart_data = c;
}

/**
 * Get character from UART
 */
char getc()
{
    int32_t c = -1;
    while (c == -1) c = reg_uart_data;

    return c;
}

/**
 * Print PicoSoC ASCII banner
 */
void print_banner(int mem_total)
{
    print("  ____  _          ____         ____\n");
	print(" |  _ \\(_) ___ ___/ ___|  ___  / ___|\n");
	print(" | |_) | |/ __/ _ \\___ \\ / _ \\| |\n");
	print(" |  __/| | (_| (_) |__) | (_) | |___\n");
	print(" |_|   |_|\\___\\___/____/ \\___/ \\____|\n\n");

    print(" PicoRV32 RISC-V RV32I CPU + PicoSoC\n\n");
    print(" Total RAM: ");
	print_dec(mem_total / 1024);
	print(" KiB\n");
}
