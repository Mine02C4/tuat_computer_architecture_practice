#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory
.globl main
main:
  li s0, 0
  li s1, 100
  li s2, 100
  li s3, 100
  li s4, 100
  li s5, 100
  li s6, 100
# ここに書く
end_loop:
  ebreak
  j end_loop
#pragma qtrvsim tab core
