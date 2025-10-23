
section .data
file: db "test_map_file.txt",0

section .text
global _start

; get pointer in rdi
string_len:
	push r8
	xor rax,rax
	xor r8,r8
	.loop:
		mov r8b,[rax+rdi]
		cmp r8b,0
		je .end
		inc rax
		jmp .loop
	.end:
		pop r8
		ret
; get pointer in rax		
print_string:
	push rbp
	mov rbp,rsp
	sub rsp,16
	
	mov  rsi,rax
	call string_len
	mov rdx,rax
	mov rax,1
	mov rdi,1
	syscall
	
	add rsp,16
	pop rbp
	ret


_start:
	mov rax,2
	mov rdi,file
	mov rsi,0
	mov rdx,0
	syscall
	
	mov r8,rax
	mov rax,9
	mov rdi,0
	mov rsi,4096
	mov rdx,1
	mov r10,2
	mov r9,0
	syscall


	mov rdi,rax
	call print_string
	
	mov rax,60
	xor rdi,rdi
	syscall
	
	
	





