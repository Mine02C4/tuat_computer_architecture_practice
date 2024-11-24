#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

.globl main
main:
  la s0, str01
  la s1, str01_length
  addi a7, zero, 64 // load syscall "write" number
  addi a0, zero, 1 // load file descriptor (1 = stdout)
  addi a1, s0, 0 // load text address
  addi a2, s1, 0 // load text length
  ecall
end_loop:
  ebreak
  j end_loop

.data
  str01: .ascii "1 has been inputted\n"
  str02: .ascii "2 has been inputted\n"
  str03: .ascii "It is neither 1 nor 2\n"
  str04: .ascii "X has been inputted\n"
  str_sentinel:
  .equ str01_length, str02-str01
  .equ str02_length, str03-str02
  .equ str03_length, str04-str03
  .equ str04_length, str_sentinel-str04

#pragma qtrvsim tab core
