#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl　main
main:
  addi s0, zero, 4
  addi s1, zero, 2
  addi a0, s0, 0
  addi a1, s1, 0
  jal ra, routine00
  addi s2, a0, 0
end_loop:
  ebreak
  j end_loop

routine00:
  addi sp, sp, -4
  sw ra, 0 (sp)
  jal ra, routine01
  mul a0, a0, a1
  lw ra, 0 (sp)
  addi sp, sp, 4
  jalr zero, 0(ra)

routine01:
  addi sp, sp, -4
  sw ra, 0 (sp)
  add a0, a0, a1
  lw ra, 0 (sp)
  addi sp, sp, 4
  jalr zero, 0(ra)


#pragma qtrvsim tab core
