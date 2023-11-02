#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory
.globl　main
main:
  li s0, 0
  li s0, 0
  li s0, 0
  li s0, 0
  j end_loop
  li s0, 0
  li s0, 0
end_loop:
  ebreak
  j end_loop
#pragma qtrvsim tab core
