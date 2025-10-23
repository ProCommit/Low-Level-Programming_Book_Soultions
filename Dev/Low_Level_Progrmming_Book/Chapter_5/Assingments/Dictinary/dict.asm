
extern strcmp
global find_word


section .text
; get 2 pointers rsi(dectinry entry),rdi(word) return 0 if not found, return pointer to value if found
find_word:
  push rsi 

  lea r8,[rsi]
  test r8,r8 
  jz .not_found 
  
  lea r8,[rsi+8]
  mov rsi,r8 

  call strcmp

  test rax,rax 
  jz .next 

  cmp rax,1
  je .found 

  .not_found:
    xor rax,rax
    pop rsi 
    ret 

  .next:
    pop rsi 
    mov rsi,[rsi]
    jmp find_word

  .found:
    lea rax,[rsi+6]
    pop rsi 
    ret 

