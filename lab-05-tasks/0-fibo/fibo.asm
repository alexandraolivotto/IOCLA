%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    ;       store the sum in eax
    ;       use loop instruction 
    mov ecx, dword[N]
    mov ebx, 0
    mov edx, 1
    xor eax, eax
iterate:
    add eax, ebx
    add ebx, edx
    xchg ebx, edx
    loop iterate;

print: 
    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "
    PRINT_UDEC 4, eax
            
    leave
	ret
