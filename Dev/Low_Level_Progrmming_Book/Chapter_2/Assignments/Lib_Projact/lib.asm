global exit
global string_length
global print_string
global print_char
global print_newline
global print_uint
global print_int
global read_char
global read_word
global parse_uint
global parse_int
global string_equals
global string_copy



section .text
;get two pointers in rsi(dest) rdi(src) and rdx(len of chers) and copy to dest the src, ret pointer to dest else null, the fun add null to the dest make sure you calc it in the len!
string_copy:
	push rbp 
	mov rbp,rsp
	sub rsp,16
	
	xor rcx,rcx
	dec rdx
	mov r8,rsi
	mov rsi,rdi
	call string_length
	mov rsi,r8

	xor r8,r8
	cmp rax,rdx
	jg .error

	.loop:
		mov r8b,[rdi+rcx]
		mov [rsi+rcx],r8d
		inc rcx
		cmp rcx,rdx
		je .secssus
		jmp .loop

	.error:
		xor rax,rax
		jmp .end
	.secssus:
		inc rcx
		mov byte[rsi+rcx],0
		mov rax,rsi
		jmp .end
	.end:
		add rsp,16
		pop rbp
		ret

			
		
		

;get two pointers in rsi,rdi of strings and ret 1 if they equal else 0
string_equals:
	push rbp 
	mov rbp,rsp
	sub rsp,16
	
	xor rcx,rcx
	xor rax,rax
	xor r8,r8

	.loop:
		mov al,[rsi+rcx]
		mov r8b,[rdi+rcx]
		cmp al,r8b
		jne .not_equal

		cmp al,0
		je .equal
		inc rcx
		jmp .loop

	.not_equal:
		xor rax,rax
		jmp .end
	.equal:
		mov rax,1
		jmp .end
	.end:
		add rsp,16
		pop rbp
		ret
		
    
    
    
	

;get pointer to string number in rsi and ret as signed number 
parse_int:
	push rbp 
	mov rbp,rsp
	sub rsp,16
    	
    call string_length
	mov rdx,rax
	test rdx,rdx
	jz .end
	
	xor rcx,rcx
	xor r8,r8
	mov r8b,byte[rsi+rcx]
	cmp r8b,0x2d
	jne .unsigned
	
	inc rcx
	xor rax,rax
	.loop:
		mov r8b,[rsi+rcx]
		sub r8b,0x30
		cmp r8b,9
		jg .end
		cmp r8b,0
		jl .end

		imul rax,10
		add rax,r8
		inc rcx
		cmp rdx,rcx
		je .end
		jmp .loop
	.error:
		xor rax,rax 
		jmp .end
	.unsigned:
		;leave          ; implent question 21 use TCO
		;jmp print_uint ; 
		push print_uint ; implemet question 22
		ret
		
	.end:
		sub rax,1
		not rax
		add rsp,16
		pop rbp
		ret

;get pointer to string number in rsi and ret as unsigned number 
parse_uint:
	push rbp 
	mov rbp,rsp
	sub rsp,16
	
	call string_length
	mov rdx,rax
	test rdx,rdx
	jz .end
	xor rax,rax
	xor rcx,rcx
	xor r8,r8
	.loop:
	mov r8b,[rsi+rcx]
	sub r8b,0x30
	imul rax,10
	add rax,r8
	inc rcx
	cmp rcx,rdx
	je .end
	
	jmp .loop

	.end:
		add rsp,16
		pop rbp 
		ret
	





;get buff adress in rsi and size of char to read in rdi and read it to buff. the fun add NULL in the end os make sure you calc it, if the buff small its retun 0
read_word:
	push r9
    push rbp
	mov rbp,rsp
	sub rsp,16
	
	inc rdi
	xor r9,r9
	mov r8,rdi
	mov rbx,rsi
	.loop:
		cmp r9,r8
		je .error
	
		call read_char
		cmp al,0x20
		je .loop

		cmp al,0xa
		je .ok
		
		mov byte[rbx+r9],al
		inc r9
		jmp .loop
	.ok:
		mov byte[rbx+r9],0
		mov rax,rbx
		jmp .end
	.error:
		xor rax,rax
		jmp .end
	.end:
		add rsp,16
		pop rbp
		pop r9
		ret	
	
	

;read char and return the ascii value in rax
read_char:
	push rbp
	mov rbp,rsp
	sub rsp,16
	xor rax,rax
	xor rdi,rdi
	lea rsi,[rsp]
	mov rdx,1
	syscall
		
	movzx rax,byte[rsp]
	add rsp,16
	pop rbp
	ret
	

;get number in rax and print in tow cmplement ascii
print_int:
	push rbp
	mov rbp,rsp
	sub rsp,24
	
	xor rcx,rcx
	mov r8,rbp

	mov rdi,1
	shl rdi,63
	and rdi,rax
	test rdi,rdi
	jz .unsigned

	not rax
	add rax,1
	mov rdi,10
	mov byte[r8],cl
	inc rcx

	.loop:
		xor rdx,rdx
		div rdi
		add dl,0x30
		dec r8
		mov byte[r8],dl
		inc rcx
		test rax,rax
		jz .end
		jmp .loop


	.unsigned:
		leave 
		jmp print_uint


	.end:
		dec r8
		mov byte[r8],0x2d
		mov rsi,r8
		call print_string
		add rsp,24
		pop rbp
		ret


;get number in rax and print it in decimal ascii form
print_uint:
	push rbp
	mov rbp,rsp
	sub rsp,24
	
	xor rcx,rcx
	mov r8,rbp
	
	mov rdi,10
	mov byte[r8],cl
	inc rcx

	.loop:
		xor rdx,rdx
		div rdi
		add dl,0x30
		dec r8
		mov byte[r8],dl
		inc rcx
		test rax,rax
		jz .end
		jmp .loop

	.end:
		mov rsi,r8
		call print_string
		add rsp,24
		pop rbp
		ret
		

; print new line not get arguments
print_newline:
	push rbp
	mov rbp,rsp
	sub rsp,8
	mov rsi,0xa 
	leave	
	jmp print_char
;get char value in rsi and print it
print_char:
    push rbp
	mov rbp,rsp
	sub rsp,16

	mov byte[rsp],sil
	lea rsi,[rsp]
	mov rax,1
	mov rdi,1
	mov rdx,1
	syscall
	
	xor rax,rax
	add rsp,16
	pop rbp
	ret
;get pointer to string in rsi and print it
print_string:
	push rbp
	mov rbp,rsp
	sub rsp,16
	
	call string_length
	mov rdx,rax
	mov rax,1
	mov rdi,1
	syscall
	
	xor rax,rax
	add rsp,16
	pop rbp
	ret
;get pointer to string in rsi register and return the len of the char
string_length:
	push rbp
	mov rbp,rsp 
	sub rsp,8
	
	xor rbx,rbx
	xor rax,rax
	
	.loop:
		mov bl,byte[rax+rsi]
		cmp bl,0
		je .end
		
		inc rax
		jmp .loop

	.end:
		add rsp,8
		pop rbp
		ret
;get status code in rdi and make syscall exit and ret  rdi
exit:
	mov rax,60
	syscall
	
