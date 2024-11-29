.globl main
main:
  jal ra, read_number
  addi s0, a0, 0
  jal ra, read_number
  addi s1, a0, 0

  addi a0, s0, 0
  addi a1, s1, 0
  jal ra, sum_range
  addi s0, a0, 0

  li a7, 64 // load syscall "write" number
  li a0, 1 // load file descriptor (1 = stdout)
  la a1, result_prefix // load text address
  la a2, result_prefix_length // load text length
  ecall

  addi a0, s0, 0
  jal ra, print_int

  jal ra, print_line_feed

end_loop:
  ebreak
  j end_loop

print_progress:
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  addi s0, a1, 0
  jal ra, print_int
  li a7, 64 // load syscall "write" number
  li a0, 1 // load file descriptor (1 = stdout)
  la a1, comma // load text address
  li a2, 1 // load text length
  ecall
  addi a0, s0, 0
  jal ra, print_int
  jal ra, print_line_feed
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  jalr zero, 0(ra)

print_line_feed:
  li a7, 64 // load syscall "write" number
  li a0, 1 // load file descriptor (1 = stdout)
  la a1, line_feed // load text address
  li a2, 1 // load text length
  ecall
  jalr zero, 0(ra)

read_number:
  // Impl. here
  jalr zero, 0(ra)

sum_range:
  // Impl. here
  jalr zero, 0(ra)

print_int:
  // Impl. here
  jalr zero, 0(ra)

.data:
  line_feed: .ascii "\n"
  comma: .ascii ","
  result_prefix: .ascii "result = "
  result_prefix_sentinel:
  .equ result_prefix_length, result_prefix_sentinel-result_prefix
