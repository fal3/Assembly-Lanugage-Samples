TITLE Copy a string in reverse order

INCLUDE Irvine32.inc
.data
val1 DWORD ?
val2 DWORD ?
str1 BYTE "Enter a signed integer: ",0
.code 
main PROC
call clrscr
call readInp

exit
main ENDP

readInp PROC
	call readint 
	mov val1, eax
	mov ebx, eax
	call readint
	mov val2, ebx
	call dumpregs
ret
readInp ENDP


END main
