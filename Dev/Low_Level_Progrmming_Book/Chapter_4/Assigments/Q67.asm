global factorial
global prim_check
global number_len
global xth_fibo
global is_fibo 

section .text
; get in rax nuber and retun the factorial in rax
factorial:
  mov rcx,1
  mov r8,rax
  mov rax,1

  .loop:
    imul rax,rcx
    inc rcx
    
    cmp r8,rcx
    jb .end

    jmp .loop

.end:
  ret 
    

; get nuber in  rax and retun  if its prim and 0 if not  
prim_check:
  
  cmp rax,1
  jb .not_prim
 
  
  cmp rax,3
  jb .not_prim
 
  cmp rax,2
  jb .not_prim
 


  mov rcx,2
  mov r8,rax

  cvtsi2sd xmm0,r8
  sqrtsd xmm0,xmm0
  cvtsd2si r8,xmm0

 .loop:
  xor rdx,rdx
  push rax

  div rcx
  
  cmp rdx,0
  je .not_prim


  cmp rcx,r8
  jg .prim
  
  inc rcx
  pop rax
  jmp .loop


.not_prim:
  pop rax
  xor rax,rax
  ret

.prim:
  pop rax
  mov rax,1
  ret



; gwt in rax pointer to strint number and return the len of cahrs
number_len:
  xor rcx,rcx
  xor r8,r8

  mov r8b,byte[rax]
  cmp r8b,0x2d
  je .minus


  .loop:
    mov r8b,byte[rax]
    cmp r8b,0
    je .end

    cmp r8b,0xa
    je .end
    
    sub r8b,0x30
    add rcx,r8
    inc rax
    jmp .loop



  .minus:
    inc rcx
    jmp .loop


  .end:
    mov rax,rcx
    ret

xth_fibo:
  
  cmp rax,0 
  je .f0 

  mov rcx,1 ;counter loop rep f(1)
  
  mov rsi,0
  mov r8,1 

  lea rdi,[rsi+r8]
 

  .loop:
    
    cmp rcx,rax 
    je .end

    lea rdi,[rsi+r8]

    mov rsi,r8  
    mov r8,rdi   
    inc rcx 
 
    jmp .loop
     
  .f0:
    xor rdi,rdi 
    jmp .end

  .end: 
    mov rax,rdi  
    ret 
    

    





