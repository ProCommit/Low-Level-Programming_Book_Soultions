%include "words.inc"
extern exit 
extern print 
extern get_input 
extern find_word


section .data 
enter_input: db "Enter input:",0
buff: times 255 db 0
error: db "word not found!",0


section .text 
global _start 

_start:
  mov rsi,buff 
  call get_input
  
  mov rdi,buff 
  mov rsi,word1

  call find_word

  test rax,rax
  jz .not_found

  mov rsi,rax
  call print

  xor rax,rax
  call exit
  
  .not_found:
    mov rsi,error
    call print 

    mov rax,1 
    call exit
