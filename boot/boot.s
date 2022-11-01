 .code16
    .global _start
    .text

    .equ BOOTSEG, 0x07c0
   

    ljmp $BOOTSEG,$_start

_start:
    movw $0xb800,%ax  
    movw %ax,%es
    movb $97,%al
    xor  %di,%di
    movb %al,%es:(%di)  

loop_forever:          
    jmp loop_forever

sectors:
    .word 0

msg1:
    .byte 13,10
    .ascii "Hello world!"
    .byte 13,10,13,10

    .=0x1fe
boot_flag:
    .word 0xAA55
