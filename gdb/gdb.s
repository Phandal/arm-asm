.global _start

_start:
// Load X2 ith 0x1234FEDC4F5D6E3A
mov x2, #0x6e3a
movk x2, #0x4f5d, lsl #16
movk x2, #0xfedc, lsl #32
movk x2, #0x1234, lsl #48

// Just move W2 into W1
mov w1, w2

// Now lets see all the shift versionf of MOV
mov x1, x2, LSL #1 // Logical Shift Left
mov x1, x2, LSR #1 // Logical Shift Right
mov x1, x2, ASR #1 // Arithmetic Shift Right
mov x1, x2, ROR #1 // Rotate Right

// Repeat the above shifts using mnemonics
lsl x1, x2, #1 // Logical Shift Left
lsr x1, x2, #1 // Logical Shift Right
asr x1, x2, #1 // Arithmetic Shift Right
ror x1, x2, #1 // Rotate Right

// Example that works with 8 bit immediate and shift
mov x1, #0xab000000 // Too big for #imm16

// Example that can't be represented and results in an error
// Uncomment that instruction if you want to see the error
// mov x1, #0xabcdef11 // Too big for #imm16 and can't be represented

// Example of MOVN
movn w1, #45

// Example of a mov that the assembler will change to movn
mov w1, #0xFFFFFFFE // (-2)

// Setup the parameters to exit the program and then call Linux to do it
mov x0, #0 // Use 0 return code
mov x8, #93 // Serv command code 93 terms
svc 0
