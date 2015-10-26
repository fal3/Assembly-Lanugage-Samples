TITLE Filling an array with a range(main.asm)
INCLUDE Irvine32.inc

;use random range for the values of j and k


.data
str1 BYTE "Enter element j (lower limit): ",0
str2 BYTE "Enter element k (upper limit): ", 0
jkArray DWORD 100,200,300,400,500



jVal SDWORD ?
kVal SDWORD ?
randomNumber SDWORD ?

.code
main PROC
mov esi,0 ;pointer
call randomize
mov ecx, 2

call promptJK


op1: ; need eax to be greater than jVal
mov eax, kVal ;kVal denoting the upper limit
call randomrange

cmp eax, jVal
jnl op2
jl op1
jge op2

op2: ;lets fill the array using the pointer

mov ecx, 4
L1:
call dumpregs
;mov randomNumber, eax
;add to the array
mov jkArray[esi], eax
mov edx, jkArray[esi]
add esi, 4
call writeint
jmp op1

loop L1;

	exit
main ENDP

;get values for j and k
promptJK PROC

mov edx, offset str1
call writestring
call readint 
mov jVal, eax
call crlf

mov edx, offset str2
call writestring
call readint 
mov kVal, eax
call crlf

ret
promptJK ENDP



END main