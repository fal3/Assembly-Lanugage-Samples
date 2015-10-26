TITLE College Registration 
; This program clears the screen, inputs grade average and ;credits from user, and

; performs range checking on credits; where valid range is ;1-30, displays if the

; student can register or not

INCLUDE Irvine32.inc

.data

TRUE = 1

FALSE = 0

gradeAverage DWORD ?

credits DWORD ?

OkToRegister BYTE ?

str1 BYTE "Enter your grade average between 0 to 400: ", 0

str2 BYTE "Enter your credits between 1 to 30: ", 0

str3 BYTE "The credits are out of range.",0

strReg BYTE "The student can register.",0

strNoReg BYTE "The student cannot register.",0

.code

main PROC
call Clrscr 
call PromptForGrdCrd
call Display
exit

main ENDP

PromptForGrdCrd PROC USES edx

; inputs grade average and credits from user
mov edx, OFFSET str1
call WriteString ; writes the string str1
call ReadInt ; reads integer from console,
mov gradeAverage,eax
call Crlf ; takes control to next line
mov edx, OFFSET str2
call WriteString ; writes the string str2
call ReadInt ; reads integer from console, stores in EAX
mov credits,eax
call Crlf ; takes control to next line
ret
PromptForGrdCrd ENDP

Display PROC USES edx

; displays if the student can register or not
mov OkToRegister,FALSE ; set initial value to FALSE

; make comparisons for credits out of range
cmp credits,1
jb Error ; if credits <1, jump to label Error
cmp credits,30
ja Error ; if credits>30, jump to label Error
jmp ChkReg

Error:
mov edx, OFFSET str3
call WriteString ; writes the string str3
jmp Label4 ; check if a student can be registered

ChkReg:
cmp gradeAverage,350
jbe Label1
mov OkToRegister,TRUE
jmp Label3

Label1:
cmp gradeAverage,250
jbe Label2
cmp credits,16

ja Label2
mov OkToRegister,TRUE
jmp Label3

Label2:

	cmp credits,12
	ja Label3
	mov OkToRegister,TRUE

Label3:

	cmp OkToRegister,0
	je NotReg

; student can register
mov edx, OFFSET strReg
call WriteString ; writes the string strReg
jmp Label4

NotReg:
	mov edx, OFFSET strNoReg
	call WriteString ; writes the string strNoReg

Label4:
	call Crlf

ret

Display ENDP

END main