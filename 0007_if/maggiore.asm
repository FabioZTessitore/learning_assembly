; maggiore.asm
;
; trova il maggiore tra i due interi dati in input

segment .data
msg         db "Trova il maggiore", 10, 10, 0
prompt      db "? ", 0
fmt         db "%d", 0
newline     db 10, 0
output      db "Il maggiore e' ", 0

segment .bss
num1         resd 1      ; una int e' DWORD
num2         resd 1      ; una int e' DWORD

segment .text
global asm_main
extern printf
extern scanf

asm_main:
  enter 0,0
  pusha

  ; printf(msg)
  mov ebp, esp
  push msg
  call printf
  mov esp, ebp

  ; printf(prompt)
  mov ebp, esp
  push prompt
  call printf
  mov esp, ebp

  ; scanf("%d", &num1)
  mov ebp, esp
  push num1              ; indirizzo di num1
  push fmt
  call scanf
  mov esp, ebp

  ; printf(prompt)
  mov ebp, esp
  push prompt
  call printf
  mov esp, ebp

  ; scanf("%d", &num2)
  mov ebp, esp
  push num2              ; indirizzo di num2
  push fmt
  call scanf
  mov esp, ebp

  ; printf output
  mov ebp, esp
  push output
  call printf
  mov esp, ebp

  ; determina il maggiore e stampa
  ; if (num1 >= num2) {
  ;   max = num1
  ; } else {
  ;   max = num2
  ; }
  mov ebx, [num1]
  mov ecx, [num2]
  cmp ebx, ecx
  jl elsecase       ; se num1 < num2 salta all'else
  mov eax, [num1]
  jmp next
elsecase:
  mov eax, [num2]
next:
  mov ebp, esp      ; stampa il massimo
  push eax
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
