.386P
.model flat
	extern _GetStdHandle@4:near
	extern _ExitProcess@4:near
	extern _WriteConsoleA@20:near
	extern _ReadConsoleA@20:near

.data
	number1 dword '10'
	number2 dword '20'
	number3 dword '30'
	number4 dword '40'
	handle dword ?
	written dword ?

.code
	main PROC near
	_main:

		push -11
		call _GetStdHandle@4
		mov handle, eax

		mov eax, [number1]
		mov ebx, [number4]
		mov [number4], eax
		mov [number1], ebx

		mov eax, [number2]
		mov ebx, [number3]
		mov [number3], eax
		mov [number2], ebx

		push 0
		call _ExitProcess@4
		
		main ENDP
		
END