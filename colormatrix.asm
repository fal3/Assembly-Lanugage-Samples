
INCLUDE Irvine32.inc
TITLE Color Matrix
DELAY_TIME = 1000

.data
charVal    BYTE 'A'
greeting   BYTE "HIT ENTER",0dh,0ah,0

rowCol LABEL WORD
column BYTE 0
row    BYTE 0

.code
main PROC
	mov  eax,white
	call SetTextColor
	call Clrscr
	mov  edx,offset greeting
	call WriteString
	call WaitMsg
	call Clrscr

	mov  ecx,6	; loop 6 times

L0:
	push ecx	
	mov  rowCol,0	
	mov  dx,0	
	call Gotoxy

	mov  eax,0	
	mov  ecx,16

L1:	push ecx	
	mov  dx,rowCol	
	call Gotoxy
	mov  ecx,16	

L2:	call SetTextColor	
	push eax
	mov  al,charVal	
	call WriteChar	
	pop  eax
	inc  al	
	loop L2	


	inc  row	; go to next row
	pop  ecx	; restore loop counter
	loop L1

	mov  eax,DELAY_TIME	; delay for a while
	call Delay
	inc  charVal	; next character
	pop  ecx	; restore loop counter
	loop L0	; go to next character

	mov  eax,lightGray	; restore screen to normal color
	call SetTextColor

	exit
main ENDP
END main