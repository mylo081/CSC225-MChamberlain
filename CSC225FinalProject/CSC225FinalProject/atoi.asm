.386 
	extern _ExitProcess@4:near
.model flat
.data
	mulnum dword 10
.code
    atoi PROC near

	_atoi:
	pop edx		;ret address
	pop ecx		;actual string address
	pop eax		;string size
	push edx	;ret address putaway
	push edi
	mov edi, eax
	push esi
	mov eax, 0

	mov esi, 0
	_loop_start:
	cmp esi, edi
	jz _loop_end
	mul mulnum
	mov dl, [ecx]
	sub dl, 48
	add al, dl
	inc esi
	inc ecx
	jmp _loop_start

	_loop_end:
	pop esi
	pop edi
	ret

	push 8
	call _ExitProcess@4 ;to identify if for some reason it exits here
    atoi ENDP
END