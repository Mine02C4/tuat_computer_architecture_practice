#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl main
main:
  la t0, array_1
  lw s0, 0(t0)
  lw s1, 4(t0)
  srl s2, s0, s1
  sll s3, s0, s1
  srli s4, s0, 3
  slli s5, s0, 3
end_loop:
  ebreak
  j end_loop
.data
  array_1: .word 30, 4

#pragma qtrvsim tab core
