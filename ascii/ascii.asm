[org 0x7c00] ; MBR start address

mov ah, 00h
mov al, 03h
int 10h

mov cx, 16 ; count rows
mov bl, 0 ; start char
mov dl, 8 ; column
mov dh, 4 ; row
mov si, pattern ; iter

lp1:
    push cx
    push bx
    mov cx, 16 ; count columns
    mov dl, 6 ; reset column

   	mov ah, 02h
    pop di
    pop bx
    mov al, [si + bx - 1]
    push bx
    push di
   	mov bh, 0
   	int 10h
    add dl, 2

   	mov ah, 0Eh
   	mov bh, 0
   	mov bl, 0
   	int 10h

    pop bx
    lp2:
       	push cx
        push bx

       	mov ah, 02h
        pop di
        pop bx
        mov al, [si + bx - 1]; load char from pattern
        push bx
        push di
       	mov bh, 0
        push dx
        mov dh, 2
       	int 10h
        pop dx

       	mov ah, 0Eh
       	mov bh, 0
       	mov bl, 0
       	int 10h

    	mov ah, 02h
    	mov bh, 0
    	int 10h

    	mov ah, 0Eh
    	pop bx
    	mov al, bl
    	push bx
    	mov bh, 0
    	mov bl, 0
    	int 10h

    	add dl, 2
    	pop bx
    	inc bl
    	pop cx
    	loop lp2
    pop cx
    inc dh
    loop lp1

pattern db "FEDCBA9876543210", '$'

times 510-($-$$) db 0 ; byte padding
dw 0xAA55 ; boot signature
