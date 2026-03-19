; @echo off
; set name=dos_com
; goto l1
org 100
start:
    ; code goes here
exit:
	mov ax, 4C00h
	int 21h
; :l1
;	nasm %name%.bat -fbin -o %name%.com
