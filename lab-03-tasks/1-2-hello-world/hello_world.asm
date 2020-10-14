%include "io.inc"

section .data
    myString: db "Hello, World!",0
    myString2: db "Goodbye, World!",0
section .text
global CMAIN
CMAIN:
    mov ecx, 6                 ; N = valoarea registrului ecx
    mov eax, 1
    mov ebx, 1
    
tst:
    test ecx, ecx
    jnz prt
   
prt:
    PRINT_STRING myString
    NEWLINE
    dec ecx
    test ecx, ecx
    jnz tst
    
    cmp eax, ebx
    cmp eax, ebx
    je print                  ; TODO1: eax > ebx?
    
print:
;    PRINT_STRING myString
;    NEWLINE
    PRINT_STRING myString2     ; TODO2.2: afisati "Hello, World!" de N ori
    NEWLINE                           ; TODO2.1: afisati "Goodbye, World!"


    
