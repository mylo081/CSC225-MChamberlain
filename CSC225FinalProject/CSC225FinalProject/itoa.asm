.386 
	extern _ExitProcess@4:near
.model flat
.data
	divnum dword 10
.code
    itoa PROC near
	_itoa:
	pop esi
	pop ecx	;this is empty string address
	pop eax	;this is num
	push esi
	push ebx
	mov ebx, ecx
	add ecx, 80
	mov edi, 10
	mov [ecx], edi

	_loop_start:
	mov edx, 0
	div [divnum]
	add edx, 48
	dec ecx
	mov [ecx], dl
	cmp eax, 0
	jg _loop_start

	_reverse_end: ;ur joking
	mov eax, ecx
	pop ebx
	ret

	push 5
	call _ExitProcess@4 ;to identify if for some reason it exits here
    itoa ENDP
END