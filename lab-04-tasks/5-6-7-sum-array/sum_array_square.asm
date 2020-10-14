%include "io.inc"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992
    print_format db "Array sum is ", 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor eax, eax
    xor ebx, ebx
    xor edx, edx

add_dword_array_element:
    mov eax, dword [dword_array + 4*ecx - 4]
    mov edx, eax
    mul edx
    add ebx, EAX
    loop add_dword_array_element

    PRINT_STRING print_format
    PRINT_UDEC 4, ebx
    NEWLINE   
    leave
    ret