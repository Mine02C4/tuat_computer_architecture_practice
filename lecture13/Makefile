CC := gcc
CFLAGS := -Wall

.PHONY: default
.PRECIOUS: %.o %.text.bin %.out
default: learn_mmap.out

%.out: %.c
	$(CC) $(CFLAGS) -o $@ $<
