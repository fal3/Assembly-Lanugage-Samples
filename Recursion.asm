TITLE Recursive Procedure 

INCLUDE Irvine32.inc

recCount=15

.data
str1 BYTE "The recursion run correct number of times.",0
str2 BYTE "The recursion run incorrect number of times.",0
counter DWORD ? 
.code

main PROC

mov counter,0 
mov ecx, recCount
L1:
call RecProcedure
loop L1
.IF counter == recCount
mov edx,OFFSET str1
call writeString ; writes str1

call Crlf

.ELSE
mov edx,OFFSET str2
call writeString ; writes str2
call Crlf
.ENDIF

exit

main ENDP
RecProcedure PROC 
inc counter ; increment the counter value
ret
RecProcedure ENDP

END main