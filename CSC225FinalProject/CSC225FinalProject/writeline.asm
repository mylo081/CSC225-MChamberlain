.386P

.model flat
	extern _WriteConsoleA@20:near
	extern _GetStdHandle@4:near
	extern _ExitProcess@4:near

.data
	string db ?
	handle dword ?
	written dword ?
.code
writeline PROC near
    push    -11
    call    _GetStdHandle@4
    mov        handle, eax

    push    ebp
    mov     ebp, esp
    sub     esp, 4
    push    edi
    push    esi
    mov     esi, [ebp + 8]
    mov     edi, 0
    mov     eax, 10
_strlen_loop:
    mov     cl,    [esi]
    cmp     al, cl
    je     _strlen_end
    inc     esi
    inc     edi
    jmp     _strlen_loop

_strlen_end:
    push    0
    push    [ebp]
    push    edi
    push    [ebp + 8]
    push    handle
    call    _WriteConsoleA@20

    pop     esi
    pop     edi
    mov     eax, [ebp]
    add     esp, 4
    pop     ebp
    ret 8

	push 7
	call _ExitProcess@4 ;to identify if for some reason it exits here
	writeline ENDP
END