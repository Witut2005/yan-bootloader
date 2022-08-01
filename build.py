
import os 
import sys
import argparse 

def arguments_check(args):
    if args.sectors < 1:
        sys.exit("ERROR: Number of sectors must be greater than zero.")

Parser = argparse.ArgumentParser()
Parser.add_argument('-sectors', help='how many sectors to load', type=int, default=1, required=False)
Args = Parser.parse_args()


arguments_check(Args)

if os.path.isfile('boot_info.inc'):
    os.remove('boot_info.inc')


boot_info = open('boot_info.inc', 'a+')
boot_info.write('SECTORS_TO_LOAD equ ' + str(Args.sectors))
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

sys.exit(0)

