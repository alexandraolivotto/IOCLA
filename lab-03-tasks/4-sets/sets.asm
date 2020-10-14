%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ; TODO1: reuniunea a doua multimi
    or eax, ebx
    PRINT_STRING "reuniune: "
    PRINT_DEC 4, eax
    NEWLINE    
    mov eax, 139
    ; TODO2: adaugarea unui element in multime
    or eax, 1280
    PRINT_STRING "adaugare de elemente: "
    PRINT_DEC 4, eax
    NEWLINE
    mov ecx, eax;
    ; TODO3: intersectia a doua multimi
    and eax, ebx
    PRINT_STRING "intersectie: "
    PRINT_DEC 4, eax
    NEWLINE 
    mov eax, ecx
    ; TODO4: complementul unei multimi
    not ebx
    PRINT_STRING "complement: "
    PRINT_DEC 4, ebx
    NEWLINE 
    mov ebx, 169
    
    ; TODO5: eliminarea unui element
    and ebx, 161
    PRINT_STRING "eliminare element 8 din ebx: "
    PRINT_DEC 4, ebx
    NEWLINE 
    mov ebx, 169    
    mov ecx, eax
    ; TODO6: diferenta de multimi EAX-EBX
    xor eax, ebx
    and eax, ecx
    PRINT_STRING "diferenta: "
    PRINT_DEC 4, eax
    NEWLINE 
    
    ret
