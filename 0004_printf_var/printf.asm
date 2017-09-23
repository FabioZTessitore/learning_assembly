segment .data
msg     db "Hello, var is ", 0
fmt     db "%d", 0
newline db 10, 0

segment .bss
var     resd 1      ; int is a DWORD

segment .text
global asm_main
extern printf

asm_main:
  enter 0,0
  pusha

  ; var = 7
  mov DWORD [var], 7

  ; printf(msg)
  push msg
  call printf
  pop eax

  ; printf(fmt, var)
  push DWORD [var]    ; pass by value
  push fmt
  call printf
  add esp, 8

  ; printf(newline)
  push newline
  call printf
  pop eax

  popa
  mov eax, 0
  leave
  ret
