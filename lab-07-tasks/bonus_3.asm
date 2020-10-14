%include "io.inc"

section .data
    mystring db "ana", 0, "are", 0, "mere", 0
    
section .text
global CMAIN
torot13:
    push ebp
    mov ebp, esp

    ; TODO
    mov ecx,0
    mov eax, [ebp + 8]
    ;change null to space
change_null:
    mov bl, byte[eax + ecx]  
    inc ecx
    cmp bl, 0x00
    jnz change_null 
    mov bl, 0x20
    mov byte[eax + ecx - 1], bl
    mov bl, byte[eax + ecx]
    cmp bl, 0x00
    jnz change_null
    dec ecx
    mov bl, 0x00
    mov byte[eax + ecx], bl
    
    ;length of string
    mov ebx, eax
    
    mov edi, eax
    mov al, 0x00
    repne scasb
    sub edi, ebx
    mov edx, edi
    
    mov eax, ebx
    mov ecx, 0
    jmp rot13_one_byte
translate:
    sub bl, 13
    jmp not_this
rot13_one_byte:
    mov bl, byte [eax + ecx]
    cmp bl, 0x61
    jl not_this
    cmp bl, 0x6d
    jg translate
    add bl, 13
not_this:
    mov byte[eax + ecx], bl
    inc ecx
    cmp ecx, edx
    jnz rot13_one_byte
    mov byte[eax + ecx + 1], 0
;    PRINT_STRING [eax]
;    NEWLINE
    leave
    ret

CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    push mystring
    call torot13
    add esp, 4
    
    PRINT_STRING [eax]

    leave
    ret