CC := gcc

.PHONY: default
.PRECIOUS: %.o %.text.bin %.out
default: learn_mmap.out

%.out: %.c
	$(CC) -o $@ $<
