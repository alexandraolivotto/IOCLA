%include "io.inc"

struc stud_struct
    name: resb 32
    surname: resb 32
    age: resb 1
    group: resb 8
    gender: resb 1
    birth_year: resw 1
    id: resb 16
endstruc

section .data

sample_student:
    istruc stud_struct
        at name, db 'Andrei', 0
        at surname, db 'Voinea', 0
        at age, db 21
        at group, db '321CA', 0
        at gender, db 1
        at birth_year, dw 1994
        at id, db 0
    iend

print_format db "ID:", 0
string db "-",0

section .text
global CMAIN

CMAIN:
    push ebp
    mov ebp, esp
    mov ecx, 3
    ; TODO: store in a register the address of the sample_student struct
    mov eax, [sample_student]
    ; TODO: copy the first 3 bytes from the name field to id using movsb
    lea esi, [sample_student + name]
    lea edi, [sample_student + id]
    rep movsb 
    mov ecx, 3
    ; TODO: copy the first 3 bytes from the surname field to id using movsb
    lea esi, [sample_student + surname]
    lea edi, [sample_student + id + ecx]
    rep movsb
    mov ecx, 6
    ; TODO: insert `-`
    lea esi, [string]
    lea edi,[sample_student + id + ecx]
    rep movsb
    mov ecx, 7
    ; TODO: copy the bytes from field group to id using movsb
    lea esi, [sample_student + group]
    lea edi, [sample_student + id + ecx]
    rep movsb
    ; print the new ID added
    PRINT_STRING print_format
    PRINT_STRING [sample_student + id]
    
    leave
    ret