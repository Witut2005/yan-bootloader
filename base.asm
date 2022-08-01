[org 0x7C00]
[bits 16]
%include "boot_info.inc"

read_disk:
mov ah, 0x2
mov al, SECTORS_TO_LOAD 
mov ch, 0x0
mov cl, 0x1
mov dh, 0x0
mov dl, dl

mov bx, 0x2000    
mov es, bx
mov bx, 0x0       

jnc ok


mov si, error_message
mov ah, 0xe
mov bh, 0x0
mov bl, 0x0
lodsb
cmp al, 0x0
je ok
int 0x10


ok:
jmp $



error_message: db "yan bootloader error", 0xa,0x0



times 510 - ($ - $$) db 0x0
dw 0xaa55