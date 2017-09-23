segment .data
msg db "Hello, World!", 0

segment .text
global asm_main
extern puts

asm_main:
  enter 0,0
  pusha

  ; puts(msg)
  push msg          ; put msg on the stack
  call puts
  pop eax

  popa
  mov eax, 0
  leave
  ret
