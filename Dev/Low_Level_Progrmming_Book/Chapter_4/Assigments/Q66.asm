%include "strings.asm"
%include "syslib.asm"

section .data 
file: db "test.txt",0
size_print: db "the size is: ",0
size: times 20 db 0
content: db "the content: ",0

section .text 
global _start

_start:
  push rbp 
  mov rbp,rsp
  sub rsp,16
  
  mov rax,file
  call open_read
  push rax
  call get_size
  mov qword[rsp+8],rax
  pop rax

  mov rdi,qword[rsp]
  call map_file_to_memory
  mov qword[rsp+8],rax

  mov rax,size_print
  call print_string
  mov rax,qword[rsp]
  call print_uint
  call newline
  mov rax ,content
  call print_string
  mov rax,qword[rsp+8]
  call print_string

  mov rax,0
  call exit


