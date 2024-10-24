#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl　main
main:
  li s0,100
  li s1,200
  sub s3, s0, s1
  li t0, 4
  mul s0, s0, t0
  add s4, s0, s3
end_loop:
  ebreak
  j end_loop

#pragma qtrvsim tab core
