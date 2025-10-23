%include "strings.asm"
%include "syslib.asm"
%include "Q67.asm"

section .data 
file: db "test.txt",0



section .text
global _start

_start:
  mov rax,file
  call open_read

  mov rdi,4096
  call map_file_to_memory
  
  ;call number_len

  
  call atoint

  ;call factorial
  ;call prim_check
  call xth_fibo
  
  
  call exit
