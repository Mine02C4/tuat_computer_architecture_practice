RISCV := /opt/riscv32
CC := $(RISCV)/bin/riscv32-unknown-elf-gcc
OBJCOPY := $(RISCV)/bin/riscv32-unknown-elf-objcopy

.PHONY: default
default: sample05.txt

sample05.o: sample05.S
	$(CC) -c -o $@ $<

sample05.text.bin: sample05.o
	$(OBJCOPY) -O binary -j .text $< $@

sample05.txt: sample05.text.bin
	xxd -b -c 4 $< | cut -d ' ' -f 2-6 > $@
