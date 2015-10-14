TITLE BetterRandomRanger Program 

; This program clears the screen, generates 50 random numbers and displays them

INCLUDE Irvine32.inc
ARRAY_SIZE = 47 ; array stores 47 Fibonacci numbers
TAB = 9 ; ASCII value to leave a tab space
.data

lowerLimit = 0
upperLimit = 100
str1 BYTE "The 50 random numbers are: ", 0

.code

main PROC
call Clrscr
mov edx, OFFSET str1 ; OFFSET gives starting address
call WriteString ; writes the string
call Crlf 
mov ecx,50
Label1:
call BetterRandomRange
mov al, TAB ; tab space character will be written
call WriteChar ; leaves a tab space
loop Label1
exit

main ENDP

BetterRandomRange PROC
mov eax, (upperLimit-lowerLimit)
call RandomRange
mov dl, lowerLimit
cmp dl, 0 ; compares the lower limit with 0
JL Label2 ; jump if less than

Lable1:
add eax, lowerLimit ; if lowerLimit >= 0
Label2:
sub eax, lowerLimit ; if lowerLimit < 0
call WriteInt ; writes the random number that lies in EAX

ret

BetterRandomRange ENDP

END main