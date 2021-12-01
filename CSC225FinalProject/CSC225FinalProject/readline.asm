.386P

.model flat
	extern _ReadConsoleA@20:near
	extern _GetStdHandle@4:near
	extern _ExitProcess@4:near
	extern writeline:near

.data
	handle dword ?
	written dword ?
.code
	readline PROC near
	_readline:

		push -10
		call _GetStdHandle@4
		mov handle, eax

		pop ecx
		pop eax
		push ecx

		push 0
		push offset written
		push 80
		push eax
		push handle
		call _ReadConsoleA@20

		mov eax, [written]
		sub eax, 2
		ret

		push 0
		call _ExitProcess@4
	readline ENDP
END