global string_len
global print_string
global print_uint
global newline
global atoint
global atouint 
section .text

; get pointer to string in rax and return len of char
string_len:
  push rsi
  push rcx

  mov rsi,rax
  xor rax,rax
  xor rcx,rcx
  .loop:
    mov cl,byte[rax+rsi]
    cmp cl,0
    je .end 
    inc rax
    jmp .loop
  
  .end:
    pop rcx
    pop rsi
    ret

; get pointer in rax and print it
print_string:
  mov rsi,rax
  call string_len 
  mov rdx,rax
  mov rdi,1
  mov rax,1
  syscall
  ret
  
;get number in rax and print it 
print_uint:
  push rbp
  mov rbp,rsp
  sub rsp,16

  mov rdi,10

  xor rcx,rcx 
  mov r8,rbp
  mov byte[r8],0x0


  .loop:
    xor rdx,rdx
    div rdi

    cmp dl,0xa
    je .end

    add dl,0x30
    dec r8
    mov byte[r8],dl
    test rax,rax
    jz .end

    cmp dl,0x30
    jb .end

    cmp dl,0x39
    ja .end

    jmp .loop

  .end:
    mov rax,r8
    call print_string
    leave
    ret
;print new line 
newline:
  push rbp
  mov rbp,rsp
  sub rsp,8

  mov byte[rsp],0xa
  mov rax,1 
  mov rdi,1 
  mov rsi,rsp
  mov rdx,1 
  syscall
  leave
  ret

;get pointer to  string of number in rax anf return in as a int
atoint:
  push rbp
  mov rbp,rsp
  sub rsp,16

  mov rsi,rax
  xor rax,rax
  xor rcx,rcx
  xor r8,r8
  mov byte[rsp],r8b

  mov r8b,byte[rsi+rcx]
  cmp r8b,0x2d
  je .flag

  .loop:
    mov r8b,byte[rsi+rcx]
    cmp r8b,0xa
    je .end

    cmp r8b,0x0 
    je .end
    
    cmp r8b,0x30
    jb .loop

    cmp r8b,0x39 
    ja .loop
 
    sub r8b,0x30 
    imul rax,10
    add rax,r8 
    inc rcx
    jmp .loop
    

  .flag:
    mov r8b,1
    mov byte[rsp],r8b
    inc rcx
    jmp .loop 
    
   
   .signed:
      not rax 
      sub rax,1
      jmp .return
      
   .end:
      mov r8b,byte[rsp]
      cmp r8b,1
      je .signed
      jmp .return

    .return:
        leave
        ret


