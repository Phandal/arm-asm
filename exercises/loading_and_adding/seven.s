/**
 * Write a program to perform 128-bit subtraction. Convince yourself that the carry flag
 * is what you need here. Use it to reverse the operations in the previous 128-bit operation
 * listed at the bottom of this file.
 */

/**
 * Example of 128-bit addition with add/adc instructions.
 */

.global _start

// Load the registers with some data
// First 64-bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
_start:
mov x2, #0x0000000000000003
mov x3, #0xFFFFFFFFFFFFFFFF

mov x4, #0x0000000000000005
mov x5, #0x0000000000000001

subs x1, x5, x3 // Lower order 64-bits
sbc x0, x4, x2 // Higher order 64-bits

mov x8, #93
svc 0

/**
// Example of 128-bit addition with add/adc instructions.

.global _start

// Load the registers with some data
// First 64-bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
_start:
mov x2, #0x0000000000000003
mov x3, #0xFFFFFFFFFFFFFFFF

mov x4, #0x0000000000000005
mov x5, #0x0000000000000001

adds x1, x3, x5 // Lower order 64-bits
adc x0, x2, x4 // Higher order 64-bits

mov x8, #93
svc 0
*/
