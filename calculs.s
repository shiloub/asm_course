bits 64

section .text
    global _start
    _start:
        nop
        mov rcx, 2147483648
        add rax, rcx
        add rax, 8
        mov rax, 60
        mov rdi, 0
        syscall
