#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show csrdock
#pragma qtrvsim show memory

# コメントが Write で始まる行を続きのコメントに従い生めよ
# array_1からスタートするアドレスは長さ3の符号付き32-bit整数の配列(C言語で言う int32_t array_1[3];)とみなす

.globl main
main:
  # Write t0 レジスタに array_1 の先頭アドレスを格納
  li t1, 0
  sw t1, 0(t0) # array_1[0] に t1 を保存
  li t1, 10
  # Write array_1[1] に t1 を保存
  li t1, -20
  # Write array_1[2] に t1 を保存
  lw s0, 0(t0) # s0 に array_1[0] を読み込み
  # Write s1 に array_1[1] を読み込み
  add s0, s0, s1
  # Write s2 に array_1[2] を読み込み
  add s0, s0, s2
  # Write array_1[2] に s0 を保存
end_loop:
  ebreak
  j end_loop
.data
  array_1: .space 12 # 12バイトの空間を確保し array_1 ラベルを付与

#pragma qtrvsim tab core
