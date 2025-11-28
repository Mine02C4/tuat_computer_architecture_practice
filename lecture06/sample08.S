#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl main
main:
  la t0, array_1
  addi t1, zero, 65
  sw t1, 0(t0)
  addi a7, zero, 64 // load syscall "write" number
  addi a0, zero, 1 // load file descriptor (1 = stdout)
  addi a1, t0, 0 // load text address
  addi a2, zero, 1 // load text length
  ecall
  addi a7, zero, 63 // load syscall "read" number
  addi a0, zero, 0 // load file descriptor (0 = stdin)
  addi a1, t0, 4 // load text address
  addi a2, zero, 4 // load text length
  ecall
end_loop:
  ebreak
  j end_loop

.data
  array_1: .space 12

#pragma qtrvsim tab core
