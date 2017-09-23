segment .data
msg     db "Hello, var is ", 0
fmt     db "%d", 0
newline db 10, 0

segment .bss
var     resb 1      ; only one byte

segment .text
global asm_main
extern printf

asm_main:
  enter 0,0
  pusha

  mov BYTE [var], 7

  ; printf(msg)
  push msg
  call printf
  pop eax

  ; move var into a register,
  ; then extends it to a dword
  mov al, [var]
  movzx eax, al
  ; printf(fmt, var)
  push eax
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
