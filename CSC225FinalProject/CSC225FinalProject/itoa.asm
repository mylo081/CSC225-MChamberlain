.386 
	extern _ExitProcess@4:near
.model flat
.data
	divnum dword 10
.code
    itoa PROC near
	_itoa:
	pop esi
	pop ecx	;this is emp T string
	pop eax	;this is num
	push esi
	mov esi, 0
	push ebx
	mov ebx, ecx

	_loop_start:
	mov edx, 0
	div [divnum]
	add edx, 48
	mov [ecx], dl
	inc ecx
	inc esi
	cmp eax, 0
	jz _loop_end
	jmp _loop_start

	_loop_end:
	mov eax, esi

	_second_loop: ;bruh
	cmp esi, 0
	jz _end_end
	dec esi











	mov dl, [ebx]
	mov bl, [ecx]
	mov 














	jmp _second_loop

	_end_end: ;ur joking
	pop ebx
	ret

	push 5
	call _ExitProcess@4 ;to identify if for some reason it exits here
    itoa ENDP
END