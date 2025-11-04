/**
 * Write a program to add two 192-bit numbers. You will need to use the
 * `ADCS` instruction for this. Remeber you can set the flags from any
 * instruction
 */

.global _start

_start:
  mov x9, #0xFFFFFFFFFFFFFFFF // load the lower 64 bits
  mov x8, #0xFFFFFFFFFFFFFFFF // load the middle 64 bits
  mov x7, #0x3 // load the upper 64 bits

  mov x6, #0x1 // load the lower 64 bits
  mov x5, #0x0 // load the middle 64 bits
  mov x4, #0x5 // load the upper 64 bits

  // Add the numbers
  adds x3, x9, x6
  adcs x2, x8, x5
  adc x1, x7, x4

  // Setup for exit
  mov x0, x1
  mov x8, #93
  svc 0

