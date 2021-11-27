.386P
.model flat
	extern _GetStdHandle@4:near
	extern _ExitProcess@4:near
	extern _WriteConsoleA@20:near
	extern _ReadConsoleA@20:near

.data

	previous dword 1
	current dword 1
	next dword 0

	inputnumber dword 12				;THIS IS WHERE YOU WILL INPUT YOUR NUMBER, PROFESSOR MENEZES

	handle dword ?
	written dword ?

.code
	main PROC near
	_main:
		push -11
		call _GetStdHandle@4
		mov handle, eax
		mov ecx, [inputnumber]
		mov ebx, [previous]
		mov edi, [current]
		mov edx, [next]

		.if ecx == 1
		mov edx, 0
		jmp _loop_end
		.elseif ecx < 4
		mov edx, 1
		jmp _loop_end
		.else
		jmp _loop_start
		.endif

		_loop_start:
		cmp ecx, 4
		js _loop_end
		mov esi, edi				;saving value of current
		add edi, ebx				;adding value of previous to value of current
		mov edx, edi				;moving current+previous into next
		mov ebx, esi				;moving previously saved current into previous
		mov edi, edx				;moving next into current
		loop _loop_start

		_loop_end:
		mov eax, edx				;moving final next value into eax
		push eax					;pushing eax into stack so exitprocess shows the value for testing purposes
		call _ExitProcess@4
		
		main ENDP
END