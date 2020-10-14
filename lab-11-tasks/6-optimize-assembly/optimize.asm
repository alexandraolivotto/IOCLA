global runAssemblyCode

extern printf

section .data
    str: db "%d",10,13

section .text
runAssemblyCode:
    push ebp
    mov ebp, esp
    
    xor eax, eax ;sum
    mov edx, [ebp+8] ; a
    mov ebx, [ebp+12] ; N
    
    mov ecx, 0
    
sum:
    add eax, [edx + ecx*4]
    inc ecx
    cmp ecx, ebx
    jnz sum
    
    mov esp, ebp
    pop ebp
    ret
