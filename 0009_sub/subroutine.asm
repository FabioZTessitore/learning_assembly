; subroutine.asm
;
; calcola la somma e la media di un vettore di interi mediante subroutine

segment .data
msg         db "Somma e media di un vettore", 10, 10, 0
vettore     db "Vettore:", 10, 0
fmt         db "%d, ", 0
newline     db 10, 0
vet         dd 1, 2, 4, 4, 7, 9, 11, 12, 15, 17     ; somma 82, media 8.2
size        dd 10
output1     db "Somma: %d", 10, 0
output2     db "Media: %d con resto %d (/%d)", 10, 0

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
  pop ecx

  ; stampa vettore
  ; printf(vettore)
  push vettore
  call printf
  pop ecx
  ; stampa_vettore(vet, size)
  push DWORD [size]
  push vet
  call stampa_vettore
  add esp, 8

  ; somma degli elementi del vettore
  ; somma = somma_vettore(vet, size)
  push DWORD [size]
  push vet
  call somma_vettore
  add esp, 8
  mov [somma], eax

  ; stampa somma
  ; printf(output1, somma)
  push DWORD [somma]
  push output1
  call printf
  add esp, 8

  ; calcola la media
  ; calcola_media(somma, size, &media, &resto)
  push DWORD resto
  push DWORD media
  push DWORD [size]
  push DWORD [somma]
  call calcola_media
  add esp, 16

  ; stampa media
  ; printf(output2, media, resto, size)
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

; stampa_elemento
; stampa un valore intero (dd)
stampa_elemento:
  enter 0,0
  pusha

  push DWORD [ebp+8]
  push fmt
  call printf
  add esp, 8

  popa
  mov eax, 0
  leave
  ret

stampa_vettore:
  ; size ebp+12
  ; &vet ebp+8
  enter 0,0
  pusha

  mov ecx, [ebp+12]
  mov edx, [ebp+8]
  mov esi, 0
  item:
  push DWORD [edx+esi]
  call stampa_elemento
  add esp, 4
  add esi, 4
  loop item

  push newline
  call printf
  pop ecx

  popa
  mov eax, 0
  leave
  ret

somma_vettore:
  ; size ebp+12
  ; &vet ebp+8
  ;
  ; local var
  ; somma ebp-4
  enter 4,0
  pusha

  mov DWORD [ebp-4], 0    ; somma = 0

  mov ecx, [ebp+12]
  mov edx, [ebp+8]
  mov esi, 0
  add_elem:
  mov eax, [edx+esi]      ; somma += v[i]
  add [ebp-4], eax        ;
  add esi, 4
  loop add_elem

  popa
  mov eax, [ebp-4]        ; return somma
  leave
  ret

calcola_media:
  ; somma ebp+8
  ; size  ebp+12
  ; &media ebp+16
  ; &resto ebp+20
  ;
  ; local var
  ; media ebp-4
  ; resto ebp-8
  enter 8, 0
  pusha

  mov edx, 0                  ; EDX:EAX
  mov eax, [ebp+8]
  idiv DWORD [ebp+12]         ; EAX (quot), EDX (remainder)
  mov [ebp-4], eax
  mov [ebp-8], edx

  mov eax, [ebp+16]           ; copia media locale in
  mov ebx, [ebp-4]            ; media passata per riferimento
  mov [eax], ebx

  mov eax, [ebp+20]           ; idem per il resto
  mov ebx, [ebp-8]
  mov [eax], ebx

  popa
  mov eax, 0
  leave
  ret
