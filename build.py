
import os 
import sys
import argparse 
import csv_read 

# def arguments_check(args):

Parser = argparse.ArgumentParser()
Parser.add_argument('-f', help='Yan configuration file', type=str,  required=False)
Args = Parser.parse_args()

print(Args.f)


# arguments_check(Args)

if os.path.isfile('boot_info.inc'):
    os.remove('boot_info.inc')


boot_info = open('boot_info.inc', 'a+')

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

