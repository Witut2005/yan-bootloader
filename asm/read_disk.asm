
mov [disk_number], dl

mov ah, 0x2
mov al, SECTORS_TO_LOAD1
mov ch, 0x0
mov cl, START_SECTOR1 
mov dh, 0x0
mov dl, [disk_number]

mov bx, MEMORY_START1 
mov es, bx
mov bx, 0x0       
int 0x13


mov [disk_number], dl

mov ah, 0x2
mov al, SECTORS_TO_LOAD2
mov ch, 0x0
mov cl, START_SECTOR2 
mov dh, 0x0
mov dl, [disk_number]

mov bx, MEMORY_START2 
mov es, bx
mov bx, 0x0       
int 0x13

mov [disk_number], dl

mov ah, 0x2
mov al, SECTORS_TO_LOAD3 
mov ch, 0x0
mov cl, START_SECTOR3 
mov dh, 0x0
mov dl, [disk_number]

mov bx, MEMORY_START3 
mov es, bx
mov bx, 0x0       
int 0x13

mov [disk_number], dl

mov ah, 0x2
mov al, SECTORS_TO_LOAD4 
mov ch, 0x0
mov cl, START_SECTOR4 
mov dh, 0x0
mov dl, [disk_number]

mov bx, MEMORY_START4 
mov es, bx
mov bx, 0x0       
int 0x13



mov [disk_number], dl

mov ah, 0x2
mov al, SECTORS_TO_LOAD5
mov ch, 0x0
mov cl, START_SECTOR5 
mov dh, 0x0
mov dl, [disk_number]

mov bx, MEMORY_START5 
mov es, bx
mov bx, 0x0       
int 0x13
