; Author: Patrick Duane
; Last Modified: 07/11/2022
; OSU email address: duanep@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number: 1            Due Date: 07/10/2022
; Description: Take user input in the form of three integers and perform basic arithmetic. Return results to user.

INCLUDE Irvine32.inc

; declaring variables needed for calculations, user input, console output
.data
intro_string	BYTE	"My name is Patrick Duane. Welcome to Project 1 for CS 271.",0
user_prompt		BYTE	"Please enter three numbers in descending order.",0
one_string		BYTE	"first number: ",0
two_string		BYTE	"second number: ",0
three_string	BYTE	"third number: ",0
add_string		BYTE	" + ",0
sub_string		BYTE	" - ",0
equal_string	BYTE	" = ",0
exit_string		BYTE	"Goodbye...",0
first			DWORD	?
second			DWORD	?
third			DWORD	?
a_plus_b		DWORD	?
a_minus_b		DWORD	?
a_plus_c		DWORD	?
a_minus_c		DWORD	?
b_plus_c		DWORD	?
b_minus_c		DWORD	?
a_b_c			DWORD	?

.code
main PROC
; introduction
	mov		edx, OFFSET intro_string
	call	WriteString
	call	CrLf
	call	CrLf
	
; prompt user input 
	mov		edx, OFFSET user_prompt
	call	WriteString
	call	CrLf
	call	CrLf
	call	CrLf

; gather first number from user
	mov		edx, OFFSET one_string
	call	WriteString
	call	ReadInt
	mov		first, eax
	call	CrLf

; gather second number from user
	mov		edx, OFFSET two_string
	call	WriteString
	call	ReadInt
	mov		second, eax
	call	CrLf

; gather third number from user
	mov		edx, OFFSET three_string
	call	WriteString
	call	ReadInt
	mov		third, eax
	call	CrLf

; perform required calculations and store in variables
	mov		eax, first
	add		eax, second
	mov		a_plus_b, eax
	sub		eax, second
	sub		eax, second
	mov		a_minus_b, eax
	mov		eax, first
	add		eax, third
	mov		a_plus_c, eax
	sub		eax, third
	sub		eax, third
	mov		a_minus_c, eax
	mov		eax, second
	add		eax, third
	mov		b_plus_c, eax
	sub		eax, third
	sub		eax, third
	mov		b_minus_c, eax
	mov		eax, a_plus_b
	add		eax, third
	mov		a_b_c, eax

; output calculations
; A + B
	mov		eax, first
	call	WriteDec
	mov		edx, OFFSET add_string
	call	WriteString
	mov		eax, second
	call	WriteDec
	mov		edx, OFFSET equal_string
	call	WriteString
	mov		eax, a_plus_b
	call	WriteDec
	call	CrLf

; A - B
	mov		eax, first
	call	WriteDec
	mov		edx, OFFSET sub_string
	call	WriteString
	mov		eax, second
	call	WriteDec
	mov		edx, OFFSET	equal_string
	call	WriteString
	mov		eax, a_minus_b
	call	WriteDec
	call	CrLf

; A + C
	mov		eax, first
	call	WriteDec
	mov		edx, OFFSET add_string
	call	WriteString
	mov		eax, third
	call	WriteDec
	mov		edx, OFFSET	equal_string
	call	WriteString
	mov		eax, a_plus_c
	call	WriteDec
	call	CrLf

; A - C
	mov		eax, first
	call	WriteDec
	mov		edx, OFFSET	sub_string
	call	WriteString
	mov		eax, third
	call	WriteDec
	mov		edx, OFFSET equal_string
	call	WriteString
	mov		eax, a_minus_c
	call	WriteDec
	call	CrLf

; B + C
	mov		eax, second
	call	WriteDec
	mov		edx, OFFSET add_string
	call	WriteString
	mov		eax, third
	call	WriteDec
	mov		edx, OFFSET	equal_string
	call	WriteString
	mov		eax, b_plus_c
	call	WriteDec
	call	CrLf

; B - C
	mov		eax, second
	call	WriteDec
	mov		edx, OFFSET	sub_string
	call	WriteString
	mov		eax, third
	call	WriteDec
	mov		edx, OFFSET	equal_string
	call	WriteString
	mov		eax, b_minus_c
	call	WriteDec
	call	CrLf

; A + B + C
	mov		eax, first
	call	WriteDec
	mov		edx, OFFSET add_string
	call	WriteString
	mov		eax, second
	call	WriteDec
	call	WriteString
	mov		eax, third
	call	WriteDec
	mov		edx, OFFSET equal_string
	call	WriteString
	mov		eax, a_b_c
	call	WriteDec
	call	CrLf
	call	CrLf

; goodbye message
	mov		edx, OFFSET exit_string
	call	WriteString
	call	CrLf


INVOKE ExitProcess,0	; exit to operating system
main ENDP

END main
