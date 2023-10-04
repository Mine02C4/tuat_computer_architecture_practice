#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.equ WORKING_MEMORY_BASE, 0x0100

.globl　main
main:
  addi t0, zero, 12
  addi t1, zero, 24
  add t2, t0, t1
  sw t2, WORKING_MEMORY_BASE(zero)
  addi a7, zero, 64 // load syscall "write" number
  addi a0, zero, 1 // load file descriptor (1 = stdout)
  addi a1, zero, WORKING_MEMORY_BASE // load text address
  addi a2, zero, 1 // load text length
  ecall
end_loop:
  ebreak
  j end_loop

#pragma qtrvsim tab core
