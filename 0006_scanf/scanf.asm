segment .data
msg         db "Calcola il doppio", 10, 10, 0
prompt      db "? ", 0
output1     db "Il doppio di ", 0
output2     db " e' ", 0
fmt         db "%d", 0
newline     db 10, 0

segment .bss
num         resd 1      ; una int e' DWORD
doppio      resd 1

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

  ; scanf("%d", &num)
  mov ebp, esp
  push num              ; indirizzo di num
  push fmt
  call scanf
  mov esp, ebp

  ; calcola il doppio
  mov eax, [num]
  add eax, eax
  mov [doppio], eax

  ; printf output
  mov ebp, esp
  push output1
  call printf
  mov esp, ebp

  mov ebp, esp
  push DWORD [num]
  push fmt
  call printf
  mov esp, ebp

  mov ebp, esp
  push output2
  call printf
  mov esp, ebp

  mov ebp, esp
  push DWORD [doppio]
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
