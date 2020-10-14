%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 211   ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power
    mov ecx, ebx;
    jmp testing
        
print:
    PRINT_DEC 4, ebx
    NEWLINE
    
power:
    mov ebx, ecx
    shl ebx, 1
    mov ecx, ebx
    cmp ebx, eax
    ja stop
        
testing:
    and ebx, eax
    jnz print
    jmp power
    
stop:
    
    leave
    ret
