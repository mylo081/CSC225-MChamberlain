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

	handle dword ?
	written dword ?

.code
	main PROC near
	_main:
		push -11
		call _GetStdHandle@4
		mov handle, eax

		mov eax, 3				;eax is the 'i' in the for loop and is initialized to 3
		mov ebx, [previous]
		mov ecx, [current]
		mov edx, [next]

		_loop_start:
		cmp eax, 8				;in this case, n is 8, which means there will be 5 iterations
		jz _loop_end
		add eax, 1
		mov esi, ecx			;saving value of current
		add ecx, ebx			;adding value of previous to value of current
		mov edx, ecx			;moving current+previous into next
		mov ebx, esi			;moving previously saved current into previous
		mov ecx, edx			;moving next into current
		jmp _loop_start

		_loop_end:
		mov eax, edx			;moving final next value into eax
		push eax				;pushing eax into stack so exitprocess shows the value
		call _ExitProcess@4
		
		main ENDP
		
END