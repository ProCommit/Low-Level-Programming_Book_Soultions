global exit 
global print 
global char_len 
global get_input 
global strcmp 


section .text 
; get exit status code in rax and exit 
exit:
  mov rdi,rax 
  mov rax,60 
  syscall 


; get pointer in rsi and retun len in rax 
char_len:
  xor rax,rax
  xor r8,r8 
  .loop:
    mov r8b,byte[rsi+rax]
    cmp r8b,0
    je .end 

    inc rax 
    jmp .loop
  
  .end:
    ret 

; get pointe in rsi and print it
print:
  call char_len
  mov rdx,rax 
  mov rdi,1
  mov rax,1 
  syscall
  ret 
  

; get pointer in rsi and write to there                      
get_input:
    mov rdx,255
    mov rdi,0
    mov rax,0 
    syscall
    
    call char_len
    dec rax
    lea r8,[rsi+rax]
    mov byte[r8],0
    ret 

; get 2 pointers in rsi and rdi and return 0 is not equals and if thay mach return 1
strcmp:
  push rsi 
  push rdi 
  xor rcx,rcx ;counter 
  xor r8,r8   ;tmp 
  xor rbx,rbx ;tmp2 

  .loop:
    mov r8b,byte[rdi+rcx]
    mov bl,byte[rsi+rcx]

    cmp bl,r8b
    jne .not_eq

    test r8b,bl 
    jz .eq 
   
    inc rcx
    jmp .loop 

  .not_eq:
    xor rax,rax
    pop rdi
    pop rsi 
    ret

  .eq:
    mov rax,1
    pop rdi
    pop rsi 
    ret 


    


