section .text

global get_max

get_max:
;	push ebp
;	mov ebp, esp

	; [ebp+8] is array pointer
	; [ebp+12] is array length

	;mov ebx, [ebp+8]
	;mov ecx, [ebp+12]
	xor rax, rax
       mov rcx, rsi
compare:    
	cmp eax, [rdi+rcx*4-4]
	jge check_end
	mov eax, [rdi+rcx*4-4]
check_end:
	loopnz compare
       
	;leave
	ret
