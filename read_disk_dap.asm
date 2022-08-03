
%include "boot_info.inc"

DiskAddressPacket: 
    .size: db 0x10
    .reserved: db 0x0
    .sectors_to_load: dw 0x0
    .offset: dw 0x0 
    .segment: dw 0x0 
    .lba: dd 0x0
    .lba48: dd 0x0

read:
    mov [disk_number], dl

    mov ah, 0x42
    mov dl, [disk_number]
    mov si, DiskAddressPacket
    mov word [DiskAddressPacket.sectors_to_load], SECTORS_TO_LOAD1 
    mov word [DiskAddressPacket.segment], MEMORY_START1
    mov word [DiskAddressPacket.lba], START_SECTOR1
    int 0x13


    mov [disk_number], dl

    mov ah, 0x42
    mov dl, [disk_number]
    mov si, DiskAddressPacket
    mov word [DiskAddressPacket.sectors_to_load], SECTORS_TO_LOAD2 
    mov word [DiskAddressPacket.segment], MEMORY_START2
    mov word [DiskAddressPacket.lba], START_SECTOR2
    int 0x13



    mov [disk_number], dl

    mov ah, 0x42
    mov dl, [disk_number]
    mov si, DiskAddressPacket
    mov word [DiskAddressPacket.sectors_to_load], SECTORS_TO_LOAD3 
    mov word [DiskAddressPacket.segment], MEMORY_START3
    mov word [DiskAddressPacket.lba], START_SECTOR3
    int 0x13


    
    mov [disk_number], dl

    mov ah, 0x42
    mov dl, [disk_number]
    mov si, DiskAddressPacket
    mov word [DiskAddressPacket.sectors_to_load], SECTORS_TO_LOAD4 
    mov word [DiskAddressPacket.segment], MEMORY_START4
    mov word [DiskAddressPacket.lba], START_SECTOR4
    int 0x13



    mov [disk_number], dl

    mov ah, 0x42
    mov dl, [disk_number]
    mov si, DiskAddressPacket
    mov word [DiskAddressPacket.sectors_to_load], SECTORS_TO_LOAD4 
    mov word [DiskAddressPacket.segment], MEMORY_START4
    mov word [DiskAddressPacket.lba], START_SECTOR4
    int 0x13

    jnc ok


