INCLUDE Irvine32.inc
TITLE Random Screen Locations

CHAR_VAL = 'A'
COUNT = 100

.data
.code
main PROC
	call Clrscr
	mov  ecx,COUNT	

L1:	
mov  eax,25	;
	call RandomRange
	mov  dh,al
	mov  eax,80	
	call RandomRange
	mov  dl,al
	call Gotoxy	
	mov  al,CHAR_VAL	; display the character
	call WriteChar
	call RandomDelay	; optional: create a delay
	loop L1	; next character
	mov dx,0	
	call Gotoxy

	exit
main ENDP

RandomDelay Proc
push eax
mov  eax,291
call RandomRange	
add  eax,10	
call Delay	
pop  eax
ret
RandomDelay ENDP

END main
