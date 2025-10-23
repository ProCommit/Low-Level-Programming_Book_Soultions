%include "lib.asm"
;%include "q20.asm"
;%include "q21.asm"
 
global _start

section .data
src: db "123456",0
des: times 6 db 0  

section .text
_start:
	mov rax,0xff
	call print_int
	call print_newline
	mov rdi,rax
	call exit
	
