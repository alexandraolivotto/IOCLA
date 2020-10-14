%include "io.inc"
section .data
    array_1 db 27, 46, 55, 83, 84
    array_2 db 1, 4, 21, 26, 59, 92, 105
    array_output times 12 db 0

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12
section .text
global CMAIN
CMAIN:
    mov ebp, esp 
    mov ebx, ARRAY_1_LEN
    mov ecx, ARRAY_2_LEN
    jmp compare
push_arr1:
    sub esp, 1
    mov [esp], al
    dec ebx
    cmp ebx, 0
    jz arr1_fin
    jmp compare
push_arr2:
    sub esp, 1
    mov [esp], dl
    dec ecx
    cmp ecx, 0
    jz arr2_fin
compare:
    mov al, byte[array_1 + ebx - 1]
    mov dl, byte[array_2 + ecx - 1]
    cmp dl,al
    jg push_arr2
    jmp push_arr1
arr1_fin:
    mov dl, byte[array_2 + ecx - 1]
    sub esp, 1
    mov [esp], dl
    dec ecx
    cmp ecx,0
    je print
    jmp arr1_fin
arr2_fin:
    mov al, byte[array_1 + ebx - 1]
    sub esp, 1
    mov [esp], al
    dec ebx
    cmp ebx, 0
    jz print
    jmp arr2_fin
print:
    mov al, [esp]
    add esp, 1
    PRINT_DEC 1, al
    NEWLINE
    cmp esp, ebp
    jnz print
    ret