.386P

.model flat

extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near
extern _ExitProcess@4: near

.data
	handle				dword		?
	inputstring			byte		'Hello World',10,0

.code
	PrintLine PROC near
		push	ebp
		mov		ebp, esp
		sub		esp, 4
		push	edi				
		push	esi
		mov		esi, [ebp + 8]	
		mov		edi, 0			
		_loop:
			mov		cl,	[esi]		
			cmp		cl, 0
			jz		_loop_end
			inc		esi
			inc		edi
			jmp		_loop
		_loop_end:
			push	0
			push	[ebp]
			push	edi
			push	[ebp + 8]
			push	handle
			call	_WriteConsoleA@20
			pop		esi
			pop		edi
			mov		eax, [ebp]
			add		esp, 4			
			pop		ebp
			ret 8
	PrintLine ENDP

	main PROC near
		_main:
			push	-11
			call	_GetStdHandle@4
			mov		handle, eax
			push	offset inputstring
			call	PrintLine
			push	0
			call	_ExitProcess@4

	main ENDP
END

