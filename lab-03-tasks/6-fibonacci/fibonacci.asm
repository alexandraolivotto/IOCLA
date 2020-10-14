%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ebx, 1
    mov ecx, 1
    sub eax, 2
compare:
    cmp eax, 0
    jle print
    
    dec eax
    mov edx, ecx
    add edx, ebx
    mov ebx, ecx
    mov ecx, edx
    jmp compare

print:
    PRINT_DEC 4, ecx
    NEWLINE    
    ret