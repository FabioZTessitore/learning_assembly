segment .data
msg db "Hello, World!", 10, 0

segment .text
global asm_main
extern printf

asm_main:
  enter 0,0
  pusha

  mov ebp, esp      ; save the stack pointer
  push msg          ; put msg on the stack
  call printf
  mov esp, ebp      ; restore the stack pointer

  popa
  mov eax, 0
  leave
  ret
