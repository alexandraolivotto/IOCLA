%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    
    ; pushing an array on the stack
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ; pushing a string on the stack
    ;push 0
    mov eax, 0
    sub esp, 4
    mov [esp], eax 
    ;push "mere"
    sub esp, 4
    mov eax, "mere"
    mov [esp], eax 
    ;push "are "
    sub esp, 4
    mov eax, "are "
    mov [esp], eax
   ; push "Ana "
    sub esp, 4
    mov eax, "Ana "
    mov [esp], eax
    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
   ; xor ebx, ebx
print_loop:
  ;  add ebx, 1
    PRINT_HEX 4, esp
    PRINT_STRING " : "
    PRINT_DEC 1, [esp]
    NEWLINE
    add esp, 1
    cmp esp, ebp
    jnz print_loop 
    
    mov ecx,5
push_nums2:
    push ecx
    loop push_nums2
    
    push 0
    push "mere"
    push "are "
    push "Ana "  
    ;sub esp, ebx
    ; TODO 3: print the string byte by byte 
    mov ebx, 12   
    mov ecx, 0
print_string:
    cmp ebx,ecx
    je print_array
    PRINT_CHAR [esp]
    add esp, 1
    inc ecx
    cmp esp, ebp
    jnz print_string
    ; TODO 4: print the array element by element
print_array:
    NEWLINE
    add esp, 4
array:
    PRINT_DEC 1, [esp]
    PRINT_STRING " "
    add esp, 4
    cmp esp, ebp
    jnz array
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
