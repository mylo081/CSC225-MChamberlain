.386P

.model flat
	extern itoa:near
	extern atoi:near
	extern readline:near
	extern writeline:near
	extern _ExitProcess@4:near
	buffsize = 80
.data
	input byte buffsize DUP(00h)
	finalnum byte buffsize DUP(00h)
	number1 dd ?
	number2 dd ?
	string1 db "Enter number 1: ",10
	string2 db "Enter number 2: ",10
	string3 db "The multiplication result is: ",10
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
	push offset finalnum		;NOT AN INPUT ANYMORE, IS empty NUMBER
	call itoa 
	mov output, eax

	push offset string3
	call writeline

	push [output]
	call writeline

	push 6
	call _ExitProcess@4
	main ENDP
END