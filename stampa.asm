segment .data

prompt1 db "Enter a number: ", 0
prompt2 db "Enter another number: ", 0
outmsg1 db "You entered ", 0
outmsg2 db " and ", 0
outmsg3 db ", the sum of these is ", 0
fmt_int db "%d"


segment .bss

input1  resd 1
input2  resd 1


segment .text
  global  asm_main
  extern printf
  extern scanf
asm_main:
  enter 0,0
  pusha

  mov ebp, esp
  push prompt1
  call printf
  ;
  push input1
  push fmt_int
  call scanf
  ;
  push prompt2
  call printf
  ;
  push input2
  push fmt_int
  call scanf
  ;
  mov esp, ebp

  mov eax, [input1]
  add eax, [input2]
  mov ebx, eax

  mov ebp, esp
  push outmsg1
  call printf
  push DWORD [input1]
  push fmt_int
  call printf
  push outmsg2
  call printf
  push DWORD [input2]
  push fmt_int
  call printf
  push outmsg3
  call printf
  push ebx
  push fmt_int
  call printf
  mov esp, ebp

  popa
  mov eax, 0
  leave
  ret
