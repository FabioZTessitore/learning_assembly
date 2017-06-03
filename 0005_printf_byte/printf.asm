segment .data
msg     db "Hello, var is ", 0
fmt     db "%d", 0
newline db 10, 0

segment .bss
var     resb 1      ; voglio stampare un byte

segment .text
global asm_main
extern printf

asm_main:
  enter 0,0
  pusha

  mov BYTE [var], 7

  push msg
  call printf
  pop eax

  ; stampa della variabile intera
  ; push dei parametri in ordine inverso
  mov al, [var]     ; sposta il byte da stampare
                    ; in un registro.
  movzx eax, al     ; poi estende il valore alla dword
  push eax
  push fmt
  call printf
  add esp, 8

  push newline
  call printf
  pop eax

  popa
  mov eax, 0
  leave
  ret
