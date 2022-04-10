# asm-proj1
My assembler mini-projects part 1 (university assignments)

## zadanie.asm
1. Zdefiniuj 4 tablice znakowe o długościach N=9 znaków oraz 1 tablice znakową o długości
 M=64 znaków.
2. Cztery tablice zainicjuj znakami ASCII tworzącymi liczby 8 cyfrowe zakończone znakiem "$".
3. Wpisz do tablicy 64 znakowej kolejno cztery tablice tworząc napis:
 ”liczba1,liczba2 liczba3,liczba4”, na końcu powstałego łańcucha znaków umieść znak "$".
4. Wypisz cztery liczby 8 cyfrowe oraz powstały łańcuch znaków na ekran w postaci 5 linii tekstu 
oddzielonych pustymi liniami.
Przykład (tylko przekształcanie tekstu): ”23415459” ”43453452” ”27415146” ”94435621” 
 ”23415459,43453452 27415146,94435621”
Uwaga: do jednoczesnego niezależnego indeksowania dwóch tablic używaj rejestrów BX i SI.
 
## zadanie2.asm
1. Zdefiniuj tablicę znakową o długości N=64 znaków.
2. Korzystając z tablicy oraz jednakowych znaków ASCII (np. '%') narysuj na ekranie równoległobok o 
długości podstaw równej 8 znakom i wysokości równej 6 liniom – patrz rysunek.
Kolejne linie tekstu przed wyświetlaniem zakończ znakiem "$".
Uwaga: do niezależnego podwójnego indeksowania używaj rejestrów BX i SI.
''' 
           % % % % % % % %
         % % % % % % % % 
       % % % % % % % % 
     % % % % % % % % 
   % % % % % % % % 
 % % % % % % % %
'''
