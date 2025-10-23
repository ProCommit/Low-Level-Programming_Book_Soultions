
%define O_APPEND 0x1000
%define O_REONL 0	

section .data
stat_buff: times 144 db 0



section .text
global  print_info

; get file name in rax
print_info:
	
	;mov rdi,rax
	;mov rax,2
	;mov rsi,O_APPEND
	;mov rdx,O_REONL	
	;syscall

	mov rdi,rax
	mov rsi,stat_buff
	mov rax,4
	syscall
	
	ret
	
	



