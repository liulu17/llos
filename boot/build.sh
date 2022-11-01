as -32 boot.s -o boot.o
ld -m elf_i386 -Ttext 0 -o boot.bin boot.o
objcopy -O binary boot.bin