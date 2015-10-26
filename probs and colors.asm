TITLE Probabilities and Colors

; This program clears the screen, chooses 20 front colors to

; write a line 20 times each time with a different selected

; color as per the given probabilities

INCLUDE Irvine32.inc

.data
str1 BYTE "Durga Suresh <3's Alex's Code ",0
.code

main PROC

; calls the procedures

call Clrscr ; clears the screen

mov ecx,10 ; runs procedure 10 times

start:

call DisplayText ; calls the procedure

call Crlf

call Crlf

loop start ; continue the loop

exit

main ENDP

DisplayText PROC USES ecx eax edx

; Receives: Nothing

; Returns: Nothing

; Displays the text with a different color

mov ecx,20 ; writes string str1 20

; times

start:

mov eax,10

call RandomRange ; generate an integer

; from 0 to 9

cmp eax,2

ja Label1 ; if above 2, jump to

; Label1

; if 0 to 2, choose white color

mov eax, white + (black*16) ; white color on black

; background

call SetTextColor ; makes a color change

jmp Label3

Label1:

cmp eax,3

jne Label2 ; if not 3, jump to

; Label2

; if 3, choose blue

mov eax, blue + (black*16) ; blue color on black

; background

call SetTextColor ; makes a color change

jmp Label3

Label2:

; else 4 to 9, choose green

mov eax, green + (black*16) ; green color on black

; background

call SetTextColor ; makes a color change

Label3:

mov edx,OFFSET str1

call WriteString ; writes the line with

; chosen color

call Crlf

loop start ; continue the loop

ret

DisplayText ENDP

END main