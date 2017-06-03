; loop.asm
;
; calcola la somma e la media di un vettore di interi

segment .data
msg         db "Somma e media di un vettore", 10, 10, 0
vettore     db "Vettore:", 10, 0
fmt         db "%d, ", 0
newline     db 10, 0
vet         dd 1, 2, 4, 4, 7, 9, 11, 12, 15, 17     ; somma 82, media 8.2
size        dd 10
output1     db "Somma: %d", 10, 0
output2     db "Media: %d con resto %d/%d", 10, 0

segment .bss
somma       resd 1
media       resd 1
resto       resd 1

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

  ; stampa vettore
  push vettore
  call printf
  pop eax
  ;
  mov ecx, [size]
  mov esi, 0
stampa_elem:
  push ecx          ; salva ecx (printf lo modifica!!!)
  push DWORD [vet+esi]  ; stampa elemento del vettore
  push fmt
  call printf
  add esp, 8
  pop ecx           ; restore ecx
  add esi, 4
  loop stampa_elem
  ;
  push newline
  call printf
  pop eax

  ; somma degli elementi del vettore
  mov eax, 0
  mov ecx, [size]
  mov esi, 0
add_elem:
  add eax, [vet+esi]
  add esi, 4
  loop add_elem
  mov [somma], eax

  ; stampa somma
  push DWORD [somma]
  push output1
  call printf
  add esp, 8

  ; calcola la media
  mov edx, 0          ; EDX:EAX
  mov eax, [somma]
  idiv DWORD [size]         ; EAX (quot), EDX (remainder)
  mov [media], eax
  mov [resto], edx

  ; stampa media
  push DWORD [size]
  push DWORD [resto]
  push DWORD [media]
  push output2
  call printf
  add esp, 16

  popa
  mov eax, 0
  leave
  ret
