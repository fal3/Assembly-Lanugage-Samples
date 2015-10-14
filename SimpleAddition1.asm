TITLE 3 SimpleAddition(1)

INCLUDE Irvine32.inc
.data
val1 DWORD ?
val2 DWORD ?
str1 BYTE "Enter First number: ",0
str2 BYTE "Enter second number: ",0
str3 BYTE "The sum of the two numbers: ", 0
var1 BYTE ?
var2 BYTE ?
Rows BYTE ?
Cols BYTE ?
arr1 DWORD 2 DUP(?)


.code 


main PROC
call clrscr



call readInp
call sum


exit
main ENDP

readInp PROC
	call LocateCursor
	mov edx, offset str1 ;prompt user
	call writestring  ;print value from edx
	call readint ;read user input and store it into eax
	mov val1, eax 
	mov ebx, eax
	mov var1, bl
	call writeint ; reads value from ebx
	call crlf ; new line

	call LocateCursor
	mov edx, offset str2 ;mov the new string to edx
	call writestring ; write edx
	call readint ; input user value and store it into eax
	mov val2, eax
	mov var2, bl
	call writeint
	call crlf
ret
readInp ENDP

printing PROC 
	mov ecx, val2 - val1 + 2
	call dumpregs
	mov eax, val1 
	L1:
		call writeint
		inc eax
		
	loop L1 

ret
printing ENDP

LocateCursor PROC
call GetMaxXY
mov Rows,al 
mov Cols,dl 
sar Rows, 2
sar Cols, 2

mov dh,Rows
mov dl,Cols

call Gotoxy ; locate cursor
ret
LocateCursor ENDP

sum PROC
call LocateCursor
mov edx, offset str3 ;mov the new string to edx
call writestring ; write edx
mov eax, val1
add eax, val2
call writeint
call crlf


ret
sum ENDP


END main
