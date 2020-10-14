%include "includes/io.inc"

extern getAST
extern freeAST
section .data
    subtraction dd "-", 0
    addition dd "+", 0
    multiplication dd "*", 0
    division dd "/", 0
    leftstring dd "left_op", 0
    rightstring dd "right_op", 0

section .bss
    ; La aceasta adresa, scheletul stocheaza radacina arborelui
    root: resd 1

section .text
global main
evaluate_tree:
    push ebp
    mov ebp, esp
    
    mov edx, [ebp + 8]
    push edx
    push edx
    
    ;verific daca e valoare numerica si daca e ii dau push si jmp end
    push dword[edx]
    pop edx
    push dword[edx]
    pop edx
    ;daca e frunza pun valoarea numerica pe stiva
    cmp edx, 47
    jg return_atoi_val
    ;recursiv pt copilul din stanga
    pop edx
    push edx  
    mov ebx, dword[edx + 4]
    test ebx, ebx
    je end_ev
    push ebx
    call evaluate_tree
    add esp, 4
    push eax
    ;recursiv pentru copilul din dreapta
    pop eax
    pop edx
    push eax
    mov ebx, dword[edx + 8]
    test ebx, ebx
    je end_ev
    push ebx
    call evaluate_tree
    add esp, 4
    push eax
    
call_operate:
    pop ebx
    pop ecx
    pop edx
    push dword[edx]
    pop edx
    push dword[edx]
    pop edx
    
    push edx ;operator
    push ebx ;drept
    push ecx ;stang
    call operate
    add esp, 12
    push eax ;rezultatul partial
    
    jmp end_ev
return_atoi_val:
    pop edx
    push dword[edx]
    call atoi
    add esp, 4
end_ev:
    leave
    ret  
    
operate:
    push ebp
    mov ebp, esp
    
    mov ecx, [ebp + 8] ;membrul stang
    mov ebx, [ebp + 12] ;membrul drept
    mov edx, [ebp + 16] ;operator
    
        
    mov eax, 0
    mov eax, dword[addition]
    cmp edx, eax
    jz addto
    
    mov eax, 0
    mov eax, dword[subtraction]
    cmp edx, eax
    jz subtract   
    
    mov eax, 0
    mov eax, dword[multiplication]
    cmp edx, eax
    jz multiply

    mov eax, 0
    mov eax, dword[division]
    cmp edx, eax
    jz divide
        
subtract:
    sub ecx, ebx
    mov eax, ecx 
    jmp end
addto:
    add ecx, ebx
    mov eax, ecx
    jmp end
multiply:
    mov eax, ecx
    imul ebx
    jmp end
divide:
    cmp ecx, 0
    jl is_negative
    mov edx, 0
divide_no:
    mov eax, ecx
    mov ebx, ebx
    idiv ebx
    jmp end
is_negative: 
    mov edx, -1
    jmp divide_no    
    jmp end
end:
    leave
    ret
                 
atoi:
    push ebp
    mov ebp, esp
    
    mov ecx, 0
    mov edx, dword[ebp + 8]
    mov edi, edx
    
    movzx ebx, byte[edx + ecx]
    cmp ebx,0x00
    jz end_atoi
    cmp ebx, 48
    jl negative
    push 43    
    sub ebx, 48
    push ebx
    inc ecx
iterate:
    mov edx, edi
    movzx ebx, byte[edx + ecx]
    cmp ebx, 0x00
    jz end_atoi
    sub ebx,48
    pop eax
    push ebx
    mov ebx, 10
    mul ebx
    pop ebx
    add eax, ebx
    push eax
    inc ecx
    jmp iterate
negative:
    push ebx
    inc ecx
    mov edx, edi
    movzx ebx, byte[edx + ecx]
    cmp ebx, 0x00
    jz end_atoi
    sub ebx, 48
    push ebx
    inc ecx
    jmp iterate
end_atoi:    
    pop eax
    pop ebx
    cmp ebx, 43
    jz return
    mov ebx, -1
    imul ebx
return:
    leave
    ret

main:
    mov ebp, esp; for correct debugging
    ; NU MODIFICATI
    push ebp
    mov ebp, esp
    
    ; Se citeste arborele si se scrie la adresa indicata mai sus
    call getAST
    mov [root], eax
    
    ; Implementati rezolvarea aici:
    mov edx , dword[root]
    push edx
    call evaluate_tree
    add esp, 4
        ;pop eax
    PRINT_DEC 4, eax
    ; NU MODIFICATI
    ; Se elibereaza memoria alocata pentru arbore
    push dword [root]
    call freeAST
    
    xor eax, eax
    leave
    ret
