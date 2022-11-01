 .code16
    .global _start
    .text

    .equ BOOTSEG, 0x07c0
   

    ljmp $BOOTSEG,$_start

_start:
    mov $BOOTSEG,%ax  
    mov %ax,%es        
    mov $0x03,%ah      
    xor %bh,%bh        
    int $0x10

    mov     $20,%cx    
    mov     $0x0007,%bx
   
    mov     $msg1,%bp
    mov     $0x1301,%ax
    int     $0x10  
    movw $0xb800,%ax
    movw %ax,%es
    // movw %ax,%di
    xorw %di,%di
    xor %ecx,%ecx
    movb $26,%cx
    xor %eax,%eax
    movb $65,%al
    movb $0xc,%ah
loop1:
    movw %ax,%es:(%di)
    inc %al
    add $2,%di
    loop loop1


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
