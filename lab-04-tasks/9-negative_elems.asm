%include "io.inc"

%define ARRAY_SIZE 4

section .data
    print_format1 db "negative:", 0
    print_format2 db "pozitive:", 0

    array dd -16785, -24563, -289796, -30001
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
   
    mov ebx, dword[array]
    test ebx, ebx
    js add_negatives
    
    jmp iterate
add_negatives:
    inc eax
    dec ecx   
iterate:
    mov ebx, dword[ array + 4*ecx - 4 ] 
    test ebx, ebx
    js add_negatives
    loop iterate
print:
    PRINT_STRING print_format1
    PRINT_UDEC 4, eax
    NEWLINE
    mov ecx, ARRAY_SIZE
    sub ecx, eax
    PRINT_STRING print_format2
    PRINT_UDEC 4, ecx
    NEWLINE
    ret