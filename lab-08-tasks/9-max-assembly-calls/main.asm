BITS 64
extern printf
extern get_max

section .data
    arr: dd 19, 7, 129, 87, 54, 218, 67, 12, 19, 99
    len: equ $-arr

    print_format: db "max: %u", 13, 10, 0

section .text

global main

main:
    push rbp
    mov rbp, rsp

    ; Compute length in eax.
    ; Divide by 4 (we are using integer data type of 4 bytes) by
    ; using shr 2 (shift right with 2 bits).
    mov rax, len
    shr rax, 2

    mov rdi, arr
    mov rsi, rax
    call get_max
    ;add esp, 8

    xor rdi, rdi
    xor rsi, rsi
    
    ; Print max.
    mov rdi, print_format
    mov rsi, rax
    call printf
    ;add esp, 8

    leave
    ret
