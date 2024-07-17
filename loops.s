bits 64

section .data
    message: db 'Hello world', 10, 0
    MESSAGE_LEN: equ $-message

section .text
    global _start
    _start:

        mov rbx, 6

        _loop_message:
        jmp _print_message
        _after:
        sub rbx, 2
        jnz _loop_message
        jmp _exit

        _print_message:
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, MESSAGE_LEN
        syscall
        jmp _after

        _exit:
        mov rax, 60
        mov rdi, 0
        syscall
