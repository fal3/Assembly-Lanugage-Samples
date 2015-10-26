TITLE Test Score Evaluation 

INCLUDE Irvine32.inc

.data

str1 BYTE "Score ", 0
.code

main PROC
call Clrscr ; clears the screen
mov ecx,10
L1:
call Score ; generates a random integer
; test score
loop L1
exit
main ENDP
Score PROC USES eax edx

; generates a random integer test score
mov eax,51
call RandomRange ; gives integer within range 0
add eax,50 ; convert integer in range 50
mov edx, OFFSET str1
call WriteString ; writes the string str1
call WriteDec ; writes EAX
call CalcGrade ; gets the letter grade in AL

ret

Score ENDP

CalcGrade PROC USES eax
; displays the letter grade as per the test score
; Receives: EAX = test score
; Returns: AL = capital letter grade
; make integer comparisons for corresponding letter grade

cmp eax,90
jae labA ; if score>=90,jump to label A

cmp eax,80
jae labB ; if score>=80,jump to label B

cmp eax,70
jae labC ; if score>=70,jump to label C

cmp eax,60
jae labD ; if score>=60,jump to label D

jmp labF ; else immediately jump to F

labA: mov al, 65
call crlf
call WriteChar ; displays character “A”
call crlf
jmp next

labB: 
mov al, 66
call crlf
call WriteChar ; displays character “B”
call crlf
jmp next

labC: 
mov al, 67
call crlf
call WriteChar ; displays character “C”
call crlf
jmp next

labD:
mov al, 68
call crlf
call WriteChar ; displays character “D”
call crlf

jmp next

labF: 
mov al, 70
call crlf
call WriteChar ; displays character “F”
call crlf 
jmp next
next: call Crlf

ret

CalcGrade ENDP

END main