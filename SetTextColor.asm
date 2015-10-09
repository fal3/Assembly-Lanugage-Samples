TITLE Draw Text Colors Program

; This program displays a string in 4 different colors using SetTextColor

INCLUDE Irvine32.inc

.data

foregroundColor = 2 ; 2 is the constant for green color
str1 BYTE "Alex Fallah", 0

.code
main PROC
call Clrscr
mov edx,OFFSET str1 
mov ecx,4 

L1:
add eax, foregroundColor + (white*16)
call SetTextColor ; makes a color change from the eax value
call WriteString ; writes a string from edx
call Crlf 
loop L1

exit

main ENDP

END main