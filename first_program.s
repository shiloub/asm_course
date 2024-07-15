bits 64

;ordre des registres de parametres: rdi, rsi, rdx, rcx, r8, r9, pile (droite a gauche)
;destination index, source index, donees, compteur
;retour dans rax 64 bits ou rax + rdx 128 bits


;b byte (8 bits)
;w word (16 bits)
;d double (32 bits)
;q quadruple (64 bits)
;t
;o
;y
;z
;declaration d'une variable: variable: dq 12 (premier d pour data, deuxieme pour la taille) je reserve 12 q donc 12*64 bits
;on declare une variable reserver avec res suivi de la taille



 

section .data
    message: db 'Hello world !', 10
    MESSAGE_LEN: equ $-message

section .bss
    written: resq 1
    buffer: resb 8
    BUFF_LEN: equ 8

section .text
    global _start
    _start:
        ;print message
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, MESSAGE_LEN
        syscall

        ;read on stdin
        mov rax, 0
        mov rdi, 0
        mov rsi, buffer
        mov rdx, BUFF_LEN,
        syscall
        
        ;print buffer
        mov rax, 1
        mov rdi, 1
        mov rsi, buffer
        mov rdx, BUFF_LEN
        syscall

        ;exit
        mov rax, 60
        mov rdi, 0
        syscall