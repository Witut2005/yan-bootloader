[org 0x7C00]
[bits 16]
%include "boot_info.inc"
%include "read_disk.asm"


; jnc ok


; mov si, error_message
; print_loop:
; mov ah, 0xe
; mov bh, 0x0
; mov bl, 0x0
; lodsb
; cmp al, 0x0
; je ok
; int 0x10
; jmp print_loop


ok:

mov si, menu 
.print_loop:
mov ah, 0xe
mov bh, 0x0
mov bl, 0x0
lodsb
cmp al, 0x0
je end 
int 0x10
jmp .print_loop

end:

jmp $


disk_number: db 0x0
error_message: db "Yan bootloader error", 0x0
menu: db "Yan bootloader version 0.1",0xd, 0xa,"Choose your operating system:", 0x0



times 510 - ($ - $$) db 0x0
dw 0xaa55