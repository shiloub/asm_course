bits 64

section .data
    a: dq 2
    b: dq 3
    eq_message: db 'a == b', 10
    neq_message: db 'a =! b', 10
    MESSAGE_LEN: equ 07

section .text
    global _start
    _start:
        mov rax, [a]
        mov rdi, [b]
        cmp rax, rdi
        je _equals
        jne _nequals
        _next:
        jmp _exit

        _equals:
        mov rax, 1
        mov rdi, 1
        mov rsi, eq_message
        mov rdx, MESSAGE_LEN
        syscall
        jmp _next

        _nequals:
        mov rax, 1
        mov rdi, 1
        mov rsi, neq_message
        mov rdx, MESSAGE_LEN
        syscall
        jmp _next


        _exit:
        mov rax, 60
        mov rdi, 0
        syscall
