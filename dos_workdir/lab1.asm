org 100h
section .text
start:
	mov cx,5
	mov dl, 10
	mov dh, 5
lp1:
	push cx
	mov ah, 02h
	mov bh, 0
	int 10h

	mov ah, 0Ah
	mov al, 'X'
	mov bh, 0
	mov cx, 1
	int 10h
	inc dl
	pop cx
	loop lp1

exit:
	mov ax, 4C00h
	int 21h
