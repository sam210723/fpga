.section .init
.global start
.global main

start:
# Zero initialize registers
addi x1,  zero, 0   # Return Address       (RA )
#    x2             # Stack Pointer        (SP )
addi x3,  zero, 0   # Global Pointer       (GP )
addi x4,  zero, 0   # Thread Pointer       (TP )
addi x5,  zero, 0   # Temporary Register   (T0 )
addi x6,  zero, 0   # Temporary Register   (T1 )
addi x7,  zero, 0   # Temporary Register   (T2 )
addi x8,  zero, 0   # Saved Register       (S0 )
addi x9,  zero, 0   # Saved Register       (S1 )
addi x10, zero, 0   # Function Arguments   (A0 )
addi x11, zero, 0   # Function Arguments   (A1 )
addi x12, zero, 0   # Function Arguments   (A2 )
addi x13, zero, 0   # Function Arguments   (A3 )
addi x14, zero, 0   # Function Arguments   (A4 )
addi x15, zero, 0   # Function Arguments   (A5 )
addi x16, zero, 0   # Function Arguments   (A6 )
addi x17, zero, 0   # Function Arguments   (A7 )
addi x18, zero, 0   # Saved Register       (S2 )
addi x19, zero, 0   # Saved Register       (S3 )
addi x20, zero, 0   # Saved Register       (S4 )
addi x21, zero, 0   # Saved Register       (S5 )
addi x22, zero, 0   # Saved Register       (S6 )
addi x23, zero, 0   # Saved Register       (S7 )
addi x24, zero, 0   # Saved Register       (S8 )
addi x25, zero, 0   # Saved Register       (S9 )
addi x26, zero, 0   # Saved Register       (S10)
addi x27, zero, 0   # Saved Register       (S11)
addi x28, zero, 0   # Temporary Register   (T3 )
addi x29, zero, 0   # Temporary Register   (T4 )
addi x30, zero, 0   # Temporary Register   (T5 )
addi x31, zero, 0   # Temporary Register   (T6 )

# Reset stack pointer
lui sp,%hi(8192)
addi sp,sp,%lo(8192)

# Turn off seven segment displays
li a0, 0x80000018
li a1, 0x00
sw a1, 0(a0)

# Set return address and jump to main
jal ra,main
ebreak
