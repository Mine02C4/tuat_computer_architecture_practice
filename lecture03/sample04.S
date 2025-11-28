#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl main
main:
  la t0, data_1
  lw s0, 0(t0)
end_loop:
  ebreak
  j end_loop
.data
  data_1: .word 9

#pragma qtrvsim tab core
