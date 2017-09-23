segment .text
global asm_main

asm_main:
  enter 0,0
  pusha

  ; set ebx value
  ; use gdb to inspect registers
  mov ebx, 12345678h

  popa
  mov eax, 0
  leave
  ret
