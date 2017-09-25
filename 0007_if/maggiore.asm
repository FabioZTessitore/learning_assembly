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
num1        resd 1
num2        resd 1

segment .text
global asm_main
extern printf
extern scanf

asm_main:
  enter 0,0
  pusha

  ; printf(msg)
  push msg
  call printf
  pop eax

  ; printf(prompt)
  push prompt
  call printf
  pop eax

  ; scanf("%d", &num1)
  push num1
  push fmt
  call scanf
  add esp, 8

  ; printf(prompt)
  push prompt
  call printf
  pop eax

  ; scanf("%d", &num2)
  push num2
  push fmt
  call scanf
  add esp, 8

  ; printf output
  push output
  call printf
  pop eax

  ; determina il maggiore e stampa
  ; if (num1 >= num2) {
  ;   max = num1
  ; } else {
  ;   max = num2
  ; }
  mov ebx, [num1]
  mov ecx, [num2]
  cmp ebx, ecx
  jl elsecase       ; if num1 < num2 go to else
  mov eax, ebx
  jmp next
elsecase:
  mov eax, ecx
next:
  ; printf("%d", eax)
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
