/**
 * Create an assembly language framework to implement a select/case construct.
 */

.global _start

.text
_start:
mov x1, #5

// case 1
cmp x1, #1
beq one

// case 2
cmp x1, #2
beq two

// case 3
cmp x1, #3
beq three

b default

one:
mov x1, #'A'
b end

two:
mov x1, #'B'
b end

three:
mov x1, #'C'
b end

default:
mov x1, #'D'

end:
// Setup for exit
mov x0, #0
mov x8, #93
svc 0
