global exit
global open_read
global get_size
global map_file_to_memory


%define O_APPEND 0x1000
%define O_CREAT  0x40
%define O_TRUNC  0x200
%define O_RDWR 2
%define O_WRONLY 1
%define O_RDONLY 0

%define O_RDONLY 0
%define PROT_READ 0x1
%define MAP_PRIVATE 0x2

section .text



; get status exit code in rax and exit
exit:
  mov rdi,rax
  mov rax,60
  syscall

; get file name in rax and retun the file descriptor
open_read:
  mov rdi,rax
  mov rax,2 
  mov rsi,O_APPEND
  mov rdx,O_RDONLY
  syscall
  ret


;get file descriptor in rax and return size
get_size:
  push rbp 
  mov rbp,rsp 
  sub rsp,144

  mov rdi,rax
  mov rax,5
  mov rsi,rsp
  syscall

  mov rax,qword[rsp+0x30]
  leave
  ret
  
;get file descriptor in rax and size in rdi and retun pointer to first byte in memory
map_file_to_memory:
  mov r9,0
  mov r8,rax
  mov r10,MAP_PRIVATE
  mov rdx,PROT_READ
  mov rsi,rdi
  mov rdi,0
  mov rax,9
  syscall
  
  ret



