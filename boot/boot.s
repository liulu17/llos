 .code16
    .global _start
    .text

    .equ BOOTSEG, 0x07c0
   

    ljmp $BOOTSEG,$_start

_start:
    // mov $BOOTSEG,%ax  
    // mov %ax,%es        
    // mov $0x03,%ah      
    // xor %bh,%bh        
    // int $0x10

    // mov     $20,%cx    
    // mov     $0x0007,%bx
   
    // mov     $msg1,%bp
    // mov     $0x1301,%ax
    // int     $0x10  
    movw $BOOTSEG,%ax
    movw %ax,%es
    movw $0xb800,%ax
    movw %ax,%di
    movb $97,%es:(%di)
    movb $98,%es:2(%di)


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
