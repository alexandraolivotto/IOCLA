	.file	"inline_rotate.c"
	.intel_syntax noprefix
	.section	.rodata
	.align 4
.LC0:
	.string	"init: 0x%08x, rot_left: 0x%08x, rot_right: 0x%08x\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	lea	ecx, [esp+4]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	mov	ebp, esp
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	sub	esp, 16
	mov	DWORD PTR [ebp-20], 305419896
	mov	edx, DWORD PTR [ebp-20]
#APP
# 11 "inline_rotate.c" 1
	mov eax, edx
rol eax, 8
mov edx, eax
	mov ecx, edx
ror ecx, 8
mov ebx, ecx
# 0 "" 2
#NO_APP
	mov	DWORD PTR [ebp-16], ebx
	mov	DWORD PTR [ebp-12], edx
	push	DWORD PTR [ebp-12]
	push	DWORD PTR [ebp-16]
	push	DWORD PTR [ebp-20]
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	eax, 0
	lea	esp, [ebp-8]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	lea	esp, [ecx-4]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
