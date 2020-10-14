%include "io.inc"

%define NUM_FIBO 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    sub esp, NUM_FIBO * 4
    push 0
    push 1
    mov ecx, NUM_FIBO
    sub ecx, 2
iterate:
    pop ebx
    pop edx
    mov eax, ebx
    add eax, edx
    push edx
    push ebx
    push eax
    loop iterate
    
    mov ecx, NUM_FIBO
print:
    PRINT_UDEC 4, [esp + (ecx - 1) * 4]
    PRINT_STRING " "
    dec ecx
    cmp ecx, 0
    ja print

    mov esp, ebp
    xor eax, eax
    ret
