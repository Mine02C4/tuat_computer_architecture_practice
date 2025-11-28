#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl main
main:
  addi s0, zero, 100
  addi s1, zero, 100
  beq s0, s1, iftrue
else:
  addi s2, zero, 0
  j end_loop
iftrue:
  addi s2, zero, 1
end_loop:
  ebreak
  j end_loop

#pragma qtrvsim tab core
