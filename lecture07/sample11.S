#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl main
main:
  addi s1, zero, 100
  addi s2, zero, 0
  addi s0, zero, 0
loop_head:
  bge s0, s1, end_loop
  addi s2, s2, 5
  addi s0, s0, 1
  j loop_head
end_loop:
  ebreak
  j end_loop

#pragma qtrvsim tab core
