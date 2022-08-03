
import os 
import sys
import argparse 
import csv_read 

# def arguments_check(args):

Parser = argparse.ArgumentParser()
Parser.add_argument('-f', help='Yan configuration file', type=str,  required=False)
Parser.add_argument('-dap', help='Use Disk Address Packet or not', action='store_true', default=False,  required=False)
Parser.add_argument('-os', help='Operating system name', type=str,  required=True)
Args = Parser.parse_args()


with open('normal.asm', 'r+') as file:
    last_line = file.readlines()[-1]
    print(last_line[0:7])
    if last_line[0:7] == 'os_name':
        file.seek(0, os.SEEK_SET)
        list_tmp =  file.readlines()[:-1]
        file.seek(0, os.SEEK_SET)
        for x in list_tmp:
            file.write(x)
        for x in range(50):
            file.write(' ')
        
    file.seek(0, os.SEEK_END)
    file.write('\nos_name: db "' + '1. ' + Args.os + '"' + ',0xa,0xd,0x0')



disk_read = open('disk.asm', 'w+')

if Args.dap is True:
    disk_read.write('%include "read_disk_dap.asm"')
else:
    disk_read.write('%include "read_disk.asm"')

disk_read.close()
    

boot_info = open('boot_info.inc', 'w+')

how_many_loads = 0

for x in csv_read.config:
    boot_info.write('START_SECTOR' + str(x[0]) + ' equ ' + str(x[1]) + '\n')
    boot_info.write('SECTORS_TO_LOAD' + str(x[0]) + ' equ ' + str(x[2]) + '\n')
    boot_info.write('MEMORY_START' + str(x[0]) + ' equ ' + str(x[3][:-1]) + '\n')
    how_many_loads += 1 


boot_info.close()


base = '[org 0x7C00]\n[bits 16]'

output = None

if os.path.isfile('base.asm'):
    os.remove('base.asm')

output = open('base.asm', 'a+')
normal = open('normal.asm', 'r')
end = open('end.asm', 'r')

output.write(base)
output.write(normal.read())
output.write(end.read())

output.close()

os.system('nasm -fbin base.asm -o base.bin')

sys.exit('Yan bootloader image successfully created')

