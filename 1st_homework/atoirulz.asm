%include "io.inc"
section .data
    mynumber dd "-"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ebx, mynumber
    
    ;length
    mov edi, ebx
    mov al, 0x00
    repne scasb
    sub edi, ebx
    dec edi
    mov ecx, edi
    
    
    mov esi, ecx
    mov eax, 1;10 power
    
    cmp ecx, 1
    jz check_if_operator
    ;check if negative
    mov edx, 1;suppose is positive
    push edx;push sign
    mov edi, ebx
    xor ebx, ebx
    mov bl, byte[edi]
    cmp ebx, 48
    jg convert_string
    ;if negative pop the positive sign
    pop edx
    mov edx, -1
    push edx;push sign
    mov bl, 48
    mov byte[edi], bl
    
convert_string:
    xor ebx, ebx
    mov bl, byte[edi + ecx - 1]
    xchg eax, ebx
    sub eax, 48
    mul ebx
    push eax
    xchg eax, ebx
    mov ebx, 10
    mul ebx
    loop convert_string
    
    mov eax, 0
    mov ecx, esi
    
pop_stack_addition:
    pop ebx
    add eax, ebx
    loop pop_stack_addition
    
    jmp end_fct
check_if_operator:
    push dword[ebx]
    pop ebx
    cmp ebx, 48
    jl is_true
    sub ebx, 48
    mov eax, ebx
    jmp end_fct
is_true:
    mov eax, ebx
    jmp return
end_fct:
    pop edx
    mov ebx, edx
    imul ebx

return:
    PRINT_DEC 4, eax
    xor eax, eax
    ret