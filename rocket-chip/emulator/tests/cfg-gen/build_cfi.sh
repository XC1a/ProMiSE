#!/bin/bash
source ../env.sh
riscv64-unknown-elf-objdump -d ../test.riscv > test.log
python cfitable.py test.log > cfi_emu.txt