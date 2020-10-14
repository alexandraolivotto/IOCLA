global computeLength
global computeLength2

section .text
computeLength:
    push ebp
    mov ebp, esp
    mov edi, [ebp + 8]
    xor eax, eax
    ;TODO: Implement byte count using a software loop
test_one_byte:
    cmp byte[edi], 0
    je out
    inc edi
    inc ecx
    jmp test_one_byte
out:
    mov eax, ecx
    mov esp, ebp
    pop ebp
    ret

computeLength2:
    push ebp
    mov ebp, esp
    mov edi, [ebp + 8]
    mov ecx, edi
    xor eax, eax
    ;TODO: Implement byte count using a hardware loop
    repne scasb
    sub edi, ecx
    dec edi
    mov eax, edi
    mov esp, ebp
    pop ebp
    ret
