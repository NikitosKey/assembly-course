; @echo off
; set name=hw
; goto l1
org 100h
section .text

start:
	mov ah, 09h
	lea dx, strochka
	int 21h
exit:
	mov ax, 4C00h
	int 21h
section .data
	strochka db "Hello, world!",13,10,'$'
; :l1
;	nasm %name%.bat -fbin -o %name%.com
