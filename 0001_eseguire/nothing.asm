segment .text
global asm_main

asm_main:
  enter 0,0
  pusha

  ; code here

  popa
  mov eax, 0    ; return value
  leave
  ret
