%include "print_info.asm"

section .data
file: db "test.txt",0


section .text
global _start

_start:
	mov rax,file
	call print_info
	
	mov rax,60
	xor rdi,rdi
	syscall	



