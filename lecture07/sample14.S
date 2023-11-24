#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl　main
main:
  addi s0, zero, 4
  addi a0, s0, 0
  jal ra, routine00
  addi s2, a0, 0
end_loop:
  ebreak
  j end_loop

routine00:
  addi s0, zero, 1
  beq a0, zero, routine00_return
  beq s0, zero, routine00_return
  addi a0, a0, -2
  jal ra, routine00
  addi s1, a0, 0
  addi a0, a0, -1
  jal ra, routine00
  add a0, a0, s1
routine00_return:
  jalr zero, 0(ra)

#pragma qtrvsim tab core
