as -32 boot.s -o boot.o
# ld -m elf_i386 -Ttext 0 -o boot.bin boot.o
ld -m elf_i386 --oformat binary -N -Ttext 0x0 -o boot1.bin boot.o
# objcopy -O binary boot.bin
git add . && git commit -m "fix" && git push 