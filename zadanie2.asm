;   PROGRAM  "zadanie2.asm"
; zadania cw 1 i 2 zestaw I zadanie 41
dane SEGMENT 	;segment danych
tekst 	db 64 dup(?)
koniec_txt db ?
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawieraj¹cy rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:
		mov ax, SEG dane
		mov ds, ax
		mov cl, 7
		mov dh, 6
		mov bx, OFFSET tekst 	;wpisanie do rejestru BX obszaru
					;zawieraj¹cego wyswietlany tekst
spc:					;petla wstawiajaca spacje
		mov dl, 20h ;wstawienie spacji
		mov [bx], dl
		inc bx
		dec cl
		cmp cl,0
		ja spc 
		
		mov cl, 0

ptl:					;petla wstawiajaca zawsze 8 znakow %
		mov dl, 25h ;wstawianie znaku %
		mov [bx], dl 	
				
		inc bx
		inc cl
		cmp cl,8
		jb ptl 

		mov dl, 13 ;kolejna linia
		mov [bx], dl
		inc bx
		mov dl, 10
		mov [bx], dl
		inc bx
ptl1:					;petla wysokosci rownolegloboku
		mov cl,dh
		dec dh
		cmp dh,0
		ja spc 
wyswietl:
		mov dl, "$" 
		mov [bx], dl
		mov dx, offset tekst
		mov ah, 09h
		int 21H 	;wyswietlanie tekstu

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