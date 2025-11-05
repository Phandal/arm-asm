/**
 * The goal of this program is to print the contents of a register in hex
 *
 * x0 - x2: parameters to system interupts
 * x1: the address of the byte to write at
 * x4: the register to print
 * x5: loop index
 * x6: current character;
 * x8: system interupt number
 */

.global _start

.text
_start:
  // Load the register with the number that we want to output
  mov x4, #0x6E3A
  movk x4, #0x4F5D, LSL #16
  movk x4, #0xFEDC, LSL #32
  movk x4, #0x1234, LSL #48

  ldr x1, =hexstring // Load register 1 with the address for the start of the output string
  add x1, x1, #17 // Move to the least significant bit in the output string

  // Init for loop
  mov x5, #16
loop:
  and x6, x4, 0xf // Mask of the least significant byte of the register

  // If the byte is >= 10 then process it as a letter
  cmp x6, #10
  bge letter
  // Else process it as a digit
  add x6, x6, #'0'
  b cont
  letter:
  add x6, x6, #('A' - 10)
  cont:
  strb w6, [x1] // Store the byte from x6 into x1
  sub x1, x1, #1 // Decrement the address of the byte to write at
  lsr x4, x4, #4 // Shift of the byte processed

  subs x5, x5, #1 // Decrement Counter
  bne loop

  // Setup to print the string here
  mov x0, #1 // STDOUT
  ldr x1, =hexstring
  mov x2, #19
  mov x8, #64
  svc 0

  // Setup for ending the program here
  mov x0, x5
  mov x8, #93
  svc 0

.data
hexstring: .ascii "0x123456789ABCDEFG\n" // Set the output string to this at first. It gets modified throughout the program running
