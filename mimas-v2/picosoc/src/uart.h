#ifndef UART_H
#define UART_H

#define reg_uart_clkdiv   (*(volatile uint32_t*)0x02000004)
#define reg_uart_tx_data  (*(volatile uint32_t*)0x80000004)
#define reg_uart_tx_ready (*(volatile uint32_t*)0x80000008)
#define reg_uart_rx_data  (*(volatile uint32_t*)0x8000000C)
#define reg_uart_rx_ready (*(volatile uint32_t*)0x80000010)

int  setup_uart(int baud);

void print(char *p);
void print_dec(uint32_t v);
void print_hex(uint32_t v, int digits);
void putc(char c);
char getc();
void get_str(char *buf, char *prompt);
int  strcmp(char *c1, char *c2);

void print_banner(int mem);

#endif
