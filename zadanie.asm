;   PROGRAM  "zadanie.asm"
; zadania cw 1 i 2 zestaw I zadanie 12

dane SEGMENT 	;segment danych
tablica1 	db '11223344', '$'
tablica2	db '55667788', '$'
tablica3	db '00998877', '$'
tablica4	db '12345678', '$'
tablica5 	db 64 dup(?)
linia		db 13,10,13,10, '$'

dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawieraj¹cy rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:
		mov ax, SEG dane
		mov ds, ax
		mov cl, 0
		mov ch, 1
		mov bx, OFFSET tablica1 
		mov si, OFFSET tablica5
		mov dl, 0				
ptl:
		mov dx, [bx] 	;wpisanie do rejestru DX kodu ASCII
				;kolejnego wyœwietlanego znaku
		mov [si], dx

		mov ah, 02h ;wypisanie znakow
		int 21H

		inc bx
		inc si
		inc cl
		cmp cl, 8
		jb ptl

		mov dx,offset linia	;wypisywac bedziemy pusta linie
		mov ah, 09h
		int 21H
		
		mov cl, 0
		inc ch
		cmp ch, 2
		jz wczytab2
		cmp ch, 3
		jz wczytab3
		cmp ch, 4
		jz wczytab4
		cmp ch, 5
		jz wczytab5

wczytab2:	
		mov dh, 2Ch ;przecinek ASCII
		mov [si], dh
		inc si
		mov bx, OFFSET tablica2
		jmp ptl
wczytab3:
		mov dh, 20h	;spacja ASCII
		mov [si], dh
		inc si
		mov bx, OFFSET tablica3
		jmp ptl
wczytab4:
		mov dh, 2Ch	;przecinek ASCII
		mov [si], dh
		inc si
		mov bx, OFFSET tablica4
		jmp ptl
wczytab5:	
		mov dh, "$"
		mov [si], dh
		mov dx, offset tablica5
		mov ah, 09h 
		int 21H		;wypisanie calego ciagu znakow
		
		mov al, 0 	;kod powrotu programu (przekazywany przez
				;rejestr AL) stanowi syntetyczny opis programu
				;przekazywany do systemu operacyjnego
				;(zazwyczaj kod 0 oznacza, ¿e program zosta³
				;wykonany poprawnie)

		mov ah, 4CH 	;zakoñczenie programu – przekazanie sterowania
				;do systemu, za pomoc¹ funkcji 4CH DOS
		int 21H
rozkazy ENDS

nasz_stos SEGMENT stack 	;segment stosu
dw 128 dup (?)
nasz_stos ENDS

END wystartuj 			;wykonanie programu zacznie siê od rozkazu
				;opatrzonego etykiet¹ wystartuj