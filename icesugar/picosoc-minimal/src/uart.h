#ifndef UART_H
#define UART_H

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data   (*(volatile uint32_t*)0x02000008)

int  setup_uart(int baud);

void print(char *p);
void print_dec(uint32_t v);
void print_hex(uint32_t v, int digits);
void putc(char c);
char getc();

void print_banner(int mem);

#endif
