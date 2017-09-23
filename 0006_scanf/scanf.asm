segment .data
msg         db "Calcola il doppio", 10, 10, 0
prompt      db "? ", 0
output1     db "Il doppio di ", 0
output2     db " e' ", 0
fmt         db "%d", 0
newline     db 10, 0

segment .bss
num         resd 1
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
  push num              ; pass by reference
  push fmt
  call scanf
  add esp, 8

  ; calcola il doppio
  mov eax, [num]
  add eax, eax
  mov [doppio], eax

  ; printf(output1)
  push output1
  call printf
  pop eax

  ; printf(fmt, num)
  push DWORD [num]
  push fmt
  call printf
  add esp, 8

  ; printf(output2)
  push output2
  call printf
  pop eax

  ; printf(fmt, doppio)
  push DWORD [doppio]
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
