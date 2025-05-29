**Notice**
**Func count inst .word(0xc800000b)** and this func count is designed for normal function(exclude lib func)
**NOTICE DFI** DFI custom is func(6,5) is free to use

**NEW RULES!!!!** 
1.....use ,word(0x4000000b) to flag new rocc program(the register is reset in this state)
2.....use .word(0x6000000b) to flang the main tail

**CFI instrumentation**
**End of the main, should instrument cfi_all_dsiable**
main(){
call void init_cfi()
**cfi_en_all,.word(0x0200000b)** cfi all enable
**cfi_jarl_en,.word(0x0800000b)**cfi jarl enable//this 2insts can be put into init_cfi


**cfi_jarl_dis,.word(0x0600000b)**cfi jarl disable
lib func call
**cfi_jarl_en,.word(0x0800000b)**cfi jarl enable //this instrumentation is in genrds.py (def inst_ll())


**cfi_dis_all,.word(0x0400000b)** cfi all disable
}



**CFI instrumentation**
Need to sysc func argv[] whih add a0,

	.word 0x0ab5300b
	.word 0x0c06200b
	.word 0x3800018b
