RISCV := /opt/riscv32
CC := $(RISCV)/bin/riscv32-unknown-elf-gcc
OBJCOPY := $(RISCV)/bin/riscv32-unknown-elf-objcopy

.PHONY: default
default: sample02.txt

sample02.S: sample02.c
	$(CC) -S -O2 -o $@ $<

sample02.o: sample02.S
	$(CC) -c -o $@ $<

sample02.text.bin: sample02.o
	$(OBJCOPY) -O binary -j .text $< $@

sample02.txt: sample02.text.bin
	xxd -b $< | cut -d ' ' -f 2-8 > $@
