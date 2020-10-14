%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "-2y4bdk4y83.", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    ;length of string
    mov eax, [ebp + 8]
    mov ebx, eax
    mov edi, eax
    mov al, 0x00
    repne scasb
    sub edi, ebx
    dec edi
    mov edx, edi
    
    mov eax, ebx
    mov ecx, 0
up_one_byte:
    mov bl, byte [eax + ecx]
    cmp bl, 0x61
    jl not_this
    cmp bl, 0x7a
    jg not_this
    sub bl, 0x20
not_this:
    mov byte[eax + ecx], bl
    inc ecx
    cmp ecx, edx
    jnz up_one_byte
    mov byte[eax + ecx + 1], 0
    leave
    ret

CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret