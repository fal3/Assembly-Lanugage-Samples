TITLE Print out numbers from a lower limit to an upper limit

INCLUDE Irvine32.inc
.data
val1 DWORD ?
val2 DWORD ?
str1 BYTE "Enter lower limit: ",0
str2 BYTE "Enter upper limit: ",0
upperLim BYTE ?
lowerLim BYTE ?
.code 
main PROC
call clrscr
call readInp
call printing

exit
main ENDP

readInp PROC
	mov edx, offset str1 ;prompt user
	call writestring  ;print value into edx
	call readint ;read user input and store it into eax
	mov val1, eax 
	mov ebx, eax
	mov lowerlim, bl
	
	call writeint ; reads value from ebx
	mov edx, offset str2
	call writestring
	call readint ; input user value
	mov val2, ebx
	mov upperLim, bl
	call writeint
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


END main
