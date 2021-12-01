.386P

.model flat
	extern itoa:near
	extern atoi:near
	extern readline:near
	extern writeline:near
	extern _ExitProcess@4:near
	buffsize = 80
.data
	input byte buffsize DUP(?),0,0
	number1 dd ?
	number2 dd ?
	string1 db "Enter number 1: ",0
	string2 db "Enter number 2: ",0
	string3 db "The multiplication result is: ",0
	output dword ?
.code
	main PROC near
	_main:
	push offset string1
	call writeline
	push offset input
	call readline				;input is now your actual input
	push eax
	push offset input
	call atoi
	mov number1, eax
	
	push offset string2
	call writeline
	push offset input
	call readline				;input is now your actual input
	push eax	;number
	push offset input
	call atoi
	mov number2, eax

	mov eax, [number1]
	mul [number2]

	push eax
	push offset input		;NOT AN INPUT ANYMORE, IS NUMBER
	call itoa 

	push offset input
	call writeline

	push 6
	call _ExitProcess@4
	main ENDP
END