#include <stdint.h>

#include "uart.h"
#include "mem.h"

#define MEM_TOTAL 0x20000 /* 128 KB for iCESugar (UP5K) */

// Memory Map
// 0x00000000 - 0x00FFFFFF		Internal SRAM
// 0x01000000 - 0x01FFFFFF		External Serial Flash
// 0x02000000 - 0x02000003		SPI Flash Controller Config Register
// 0x02000004 - 0x02000007		UART Clock Divider Register
// 0x02000008 - 0x0200000B		UART Send/Recv Data Register
// 0x03000000 - 0xFFFFFFFF		Memory mapped user peripherals


void main()
{
	setup_uart(115200);
	print_banner(MEM_TOTAL);

	mem_test(MEM_TOTAL);

	while (1)
	{
		char buf[16];
		get_str(buf, "> ");
		print("\n");

		if (strcmp(buf, "memtest")) mem_test(MEM_TOTAL);
	}
}
