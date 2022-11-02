.code16
    .equ INITSEG,0x9000
    .equ SETUPSEG, 0x9020
    .equ SYSSEG, 0x1000
    .equ BOOTSEG, 0x7c0
    .equ VIDEOSEG, 0xb800
.text
.global _start
    ljmp $BOOTSEG,$_start
_start:
    movw $BOOTSEG,%ax
    movw %ax,%ds
    movw $INITSEG,%ax
    movw %ax,%es
    movw $256,%cx
    subw %si,%si
    subw %di,%di
    cld
    rep movsw
    ljmp $INITSEG,$go

go:
    movw $INITSEG,%ax
    movw %ax,%ds
    movw %ax,%es
    movw %ax,%ss

clear_creen:
    movb $0x6,%ah
    movb $0,%al

    movb $0,%ch
    movb $0,%cl
    movb $24,%dh
    movb $79,%dl
    movb $0x07,%bh
    int $0x10

print_str:
// ah=0x13 功能号
// al=0x01 写方式
// cx = 字符串长度
// DH/DL 起始行列
// BH/BL 页号、属性
    movw $0x1301,%ax
    movw $0x0,%dx
    movw $msg,%bp
    movw $22,%cx
    movw $0x0007,%bx
    int $0x10

msg:
    .byte 13,10
    .ascii "Loading kernel......" 
.org 0x1fe
boot_flag:
    .word 0xAA55
