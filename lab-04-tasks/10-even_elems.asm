%include "io.inc"

%define ARRAY_SIZE 8

section .data
    print_format1 db "impare:", 0
    print_format2 db "pare:", 0
    divisor db 2
    array db 1, 2, 4, 8, 5, 7, 10, 3
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx
    jmp iterate
add_evens:
    inc edx
    xor eax, eax
    loop iterate
iterate:
    cmp ecx, 0
    je print
    mov al, byte [ array + ecx - 1 ]
    mov bl, byte [ divisor ]
    div bl
    cmp AH, 0
    je add_evens
    xor eax, eax
    loop iterate
print:
    PRINT_STRING print_format2
    PRINT_UDEC 4, edx
    NEWLINE
    mov ecx, ARRAY_SIZE
    sub ecx, edx
    PRINT_STRING print_format1
    PRINT_UDEC 4, ecx
    NEWLINE
    
    ret