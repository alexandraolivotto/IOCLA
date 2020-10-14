%include "io.inc"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

source_length: resd 1
substr_length: dd 4

print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO: Fill source_length with the length of the source_text string.
    ; Find the length of the string using scasb.
    mov al, 0x00
    mov edi, source_text
    repne scasb
    sub edi, source_text
    dec edi
    mov [source_length], edi
    ; TODO: Print the start indices for all occurrences of the substring in source_text
    lea esi, [source_text]
    lea edi, [source_text]
    mov ecx, [source_length]
    mov ebx, [substr_length]
    jmp diff
print:
    PRINT_STRING print_format
    mov eax, ecx
    sub eax, [substr_length]
    PRINT_UDEC 4, eax
    lea edi, [substring]
    mov ebx, [substr_length]
    jmp diff
decrement:
    dec ebx
    test ebx, ebx
    jz print
diff:
    repne cmpsb
    jz decrement
    jnz diff   

    
    leave
    ret
