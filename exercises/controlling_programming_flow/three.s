/**
 * Construct a do/while statement in assembly language. In this case the loop always executes once before the condition is tested
 */

.global _start

.text

_start:
  // Load the address of the text string to write
  ldr x1, =output_string

  // Character to be printed
  mov w6, #'A'

 // add characters to print while counter is > 0
 mov x4, #5;
 loop:
 strb w6, [x1]
 add x1, x1, #1
 subs x4, x4, #1
 bne loop

 // Print output
 mov x0, #1
 ldr x1, =output_string
 mov x2, #7
 mov x8, #64
 svc 0

 // Exit
 mov x0, #0
 mov x8, #93
 svc 0

.data
output_string: .ascii "111110\n";
