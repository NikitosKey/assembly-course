[org 0x7c00] ; MBR start address
; code starts here
times 510-($-$$) db 0 ; byte padding
dw 0xAA55 ; boot signature
