[org 0x7C00]
[bits 16]
%include "boot_info.inc"
%include "disk.asm"


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

menu:
mov si, menu_str
.print_loop:
mov ah, 0xe
mov bh, 0x0
mov bl, 0x0
lodsb
cmp al, 0x0
je os_name_print 
int 0x10
jmp .print_loop


os_name_print:
mov si, os_name 
print_loop_os:
mov ah, 0xe
mov bh, 0x0
mov bl, 0x0
lodsb
cmp al, 0x0
je end 
int 0x10
jmp print_loop_os

end:
jmp $

jmp word MEMORY_START1:0x0


disk_number: db 0x0
error_message: db "Yan bootloader error", 0x0
menu_str: db "Yan bootloader version 0.1",0xd, 0xa,"Choose your operating system:",0xd,0xa,0x0
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
os_name: db "1. XaninOS",0xa,0xd,0x0

times 510 - ($ - $$) db 0x0
dw 0xaa55