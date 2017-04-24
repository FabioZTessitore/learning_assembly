segment .data
msg     db "Hello, var is ", 0
fmt     db "%d", 0
newline db 10, 0

segment .bss
var     resd 1      ; una int e' DWORD

segment .text
global asm_main
extern printf

asm_main:
  enter 0,0
  pusha

  mov DWORD [var], 7

  mov ebp, esp
  push msg
  call printf
  mov esp, ebp

  ; stampa della variabile intera
  ; push dei parametri in ordine inverso
  mov ebp, esp
  push DWORD [var]
  push fmt
  call printf
  mov esp, ebp

  mov ebp, esp
  push newline
  call printf
  mov esp, ebp

  popa
  mov eax, 0
  leave
  ret
