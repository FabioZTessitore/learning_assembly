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
  push msg
  call printf
  pop eax

  ; printf(prompt)
  push prompt
  call printf
  pop eax

  ; scanf("%d", &num)
  push num              ; indirizzo di num
  push fmt
  call scanf
  add esp, 8

  ; calcola il doppio
  mov eax, [num]
  add eax, eax
  mov [doppio], eax

  ; printf output
  push output1
  call printf
  pop eax

  push DWORD [num]
  push fmt
  call printf
  add esp, 8

  push output2
  call printf
  pop eax

  push DWORD [doppio]
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
