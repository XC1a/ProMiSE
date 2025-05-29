	.file	"test.c"
	.option nopic
	.globl	data
	.section	.sdata,"aw",@progbits
	.align	3
	.type	data, @object
	.size	data, 8
data:
	.dword	13345
	.text
	.align	1
	.globl	add
	.type	add, @function
add:
	.word 0xc800000b
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	.word 0xa000008b
	jr	ra
	.size	add, .-add
	.globl	i
	.section	.sbss,"aw",@nobits
	.align	2
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.text
	.align	1
	.globl	DFG_init
	.type	DFG_init, @function
DFG_init:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	lla	a5,i
	sw	zero,0(a5)
	j	.L4
.L5:
	lla	a5,i
	lw	a5,0(a5)
	slli	a5,a5,3
	ld	a4,-32(s0)
	add	a5,a4,a5
	sd	zero,0(a5)
	lla	a5,i
	lw	a5,0(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	lla	a5,i
	sw	a4,0(a5)
.L4:
	lla	a5,i
	lw	a5,0(a5)
	mv	a4,a5
	li	a5,1023
	ble	a4,a5,.L5
	ld	a5,-24(s0)
	sd	zero,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,8
	li	a4,-2147483648
	addi	a4,a4,1
	slli	a4,a4,32
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,16
	lla	a4,.LC0
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,24
	lla	a4,.LC1
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,32
	lla	a4,.LC2
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,40
	lla	a4,.LC3
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,48
	lla	a4,.LC4
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,56
	lla	a4,.LC5
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,64
	lla	a4,.LC6
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,72
	lla	a4,.LC7
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,80
	li	a4,536875008
	slli	a4,a4,4
	sd	a4,0(a5)
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	DFG_init, .-DFG_init
	.align	1
	.globl	dfi_v1
	.type	dfi_v1, @function
dfi_v1:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	ld	a5,-32(s0)
	slli	a5,a5,12
	addi	a4,a5,1097
	ld	a5,-24(s0)
	sd	a4,0(a5)
	ld	a5,-40(s0)
	slli	a4,a5,12
	ld	a5,-24(s0)
	addi	a5,a5,8
	addi	a4,a4,1161
	sd	a4,0(a5)
	ld	a5,-48(s0)
	slli	a4,a5,12
	ld	a5,-24(s0)
	addi	a5,a5,16
	addi	a4,a4,1225
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,24
	lla	a4,.LC8
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,32
	li	a4,85
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,40
	lla	a4,.LC9
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,48
	li	a4,1040125952
	addi	a4,a4,-167
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,56
	li	a4,4726784
	addi	a4,a4,-752
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,64
	lla	a4,.LC10
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,72
	lla	a4,.LC11
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,80
	li	a4,4198400
	addi	a4,a4,-944
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,88
	li	a4,117514240
	addi	a4,a4,1987
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,96
	li	a4,1310720
	addi	a4,a4,2000
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,104
	lla	a4,.LC12
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,112
	li	a4,5324800
	addi	a4,a4,1798
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,120
	li	a4,321
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,128
	li	a4,251736064
	addi	a4,a4,-1020
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,136
	li	a4,321
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,144
	lla	a4,.LC13
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,152
	lla	a4,.LC14
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,160
	li	a4,13111296
	addi	a4,a4,-944
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,168
	li	a4,11800576
	addi	a4,a4,-624
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,176
	lla	a4,.LC15
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,184
	li	a4,15712256
	addi	a4,a4,-442
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,192
	lla	a4,.LC16
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,200
	lla	a4,.LC17
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,208
	li	a4,1310720
	addi	a4,a4,144
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,216
	li	a4,9703424
	addi	a4,a4,-816
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,224
	lla	a4,.LC18
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,232
	li	a4,118300672
	addi	a4,a4,1987
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,240
	li	a4,8650752
	addi	a4,a4,2000
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,248
	lla	a4,.LC12
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,256
	li	a4,5324800
	addi	a4,a4,1798
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,264
	lla	a4,.LC19
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,272
	li	a4,2629632
	addi	a4,a4,581
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,280
	lla	a4,.LC20
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,288
	li	a4,7340032
	addi	a4,a4,656
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,296
	li	a4,11800576
	addi	a4,a4,-880
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,304
	li	a4,585
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,312
	lla	a4,.LC21
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,320
	li	a4,252522496
	addi	a4,a4,-1020
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,328
	lla	a4,.LC19
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,336
	li	a4,2629632
	addi	a4,a4,581
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,344
	lla	a4,.LC22
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,352
	lla	a4,.LC23
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,360
	lla	a4,.LC24
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,368
	lla	a4,.LC25
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,376
	lla	a4,.LC21
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,384
	li	a4,252522496
	addi	a4,a4,-1020
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,392
	li	a4,321
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,400
	lla	a4,.LC24
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,408
	lla	a4,.LC21
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,416
	li	a4,118300672
	addi	a4,a4,1987
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,424
	li	a4,1310720
	addi	a4,a4,2000
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,432
	lla	a4,.LC26
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,440
	li	a4,5324800
	addi	a4,a4,646
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,448
	li	a4,321
	sd	a4,0(a5)
	nop
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	dfi_v1, .-dfi_v1
	.align	1
	.globl	reg_clean
	.type	reg_clean, @function
reg_clean:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	ld	a5,-32(s0)
	slli	a5,a5,12
	addi	a4,a5,1097
	ld	a5,-24(s0)
	sd	a4,0(a5)
	ld	a5,-40(s0)
	slli	a4,a5,12
	ld	a5,-24(s0)
	addi	a5,a5,8
	addi	a4,a4,1161
	sd	a4,0(a5)
	ld	a5,-48(s0)
	slli	a4,a5,12
	ld	a5,-24(s0)
	addi	a5,a5,16
	addi	a4,a4,1225
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,24
	lla	a4,.LC27
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,32
	lla	a4,.LC28
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,40
	li	a4,85
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,48
	lla	a4,.LC29
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,56
	li	a4,4096
	addi	a4,a4,1996
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,64
	li	a4,5242880
	addi	a4,a4,2000
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,72
	lla	a4,.LC30
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,80
	lla	a4,.LC31
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,88
	li	a4,4460544
	addi	a4,a4,-816
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,96
	li	a4,16785408
	addi	a4,a4,26
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,104
	li	a4,100737024
	addi	a4,a4,1987
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,112
	li	a4,4194304
	addi	a4,a4,2000
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,120
	lla	a4,.LC32
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,128
	lla	a4,.LC33
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,136
	li	a4,16785408
	addi	a4,a4,26
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,144
	li	a4,234958848
	addi	a4,a4,-700
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,152
	lla	a4,.LC34
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,160
	li	a4,-1
	slli	a4,a4,63
	addi	a4,a4,1996
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,168
	lla	a4,.LC10
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,176
	lla	a4,.LC35
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,184
	lla	a4,.LC36
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,192
	li	a4,1014960128
	addi	a4,a4,-231
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,200
	lla	a4,.LC37
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,208
	li	a4,1793
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,216
	li	a4,15208448
	addi	a4,a4,-944
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,224
	lla	a4,.LC38
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,232
	li	a4,15437824
	addi	a4,a4,-378
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,240
	lla	a4,.LC39
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,248
	lla	a4,.LC40
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,256
	li	a4,1835008
	addi	a4,a4,144
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,264
	li	a4,-1
	slli	a4,a4,63
	addi	a4,a4,70
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,272
	lla	a4,.LC41
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,280
	lla	a4,.LC42
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,288
	lla	a4,.LC43
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,296
	li	a4,15208448
	addi	a4,a4,-880
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,304
	li	a4,12587008
	addi	a4,a4,-752
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,312
	li	a4,585
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,320
	li	a4,769
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,328
	li	a4,24
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,336
	lla	a4,.LC19
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,344
	li	a4,2629632
	addi	a4,a4,581
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,352
	lla	a4,.LC20
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,360
	li	a4,-1
	slli	a4,a4,63
	addi	a4,a4,70
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,368
	li	a4,12587008
	addi	a4,a4,656
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,376
	li	a4,769
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,384
	li	a4,1835008
	addi	a4,a4,464
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,392
	li	a4,585
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,400
	li	a4,-1
	slli	a4,a4,63
	addi	a4,a4,710
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,408
	li	a4,1089
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,416
	lla	a4,.LC19
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,424
	li	a4,2629632
	addi	a4,a4,581
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,432
	lla	a4,.LC44
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,440
	li	a4,-1
	slli	a4,a4,63
	addi	a4,a4,710
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,448
	li	a4,1839104
	addi	a4,a4,656
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,456
	li	a4,1089
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,464
	lla	a4,.LC45
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,472
	li	a4,268435456
	addi	a4,a4,-695
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,480
	li	a4,1089
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,488
	lla	a4,.LC45
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,496
	li	a4,16785408
	addi	a4,a4,26
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,504
	li	a4,100737024
	addi	a4,a4,1987
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,512
	li	a4,1835008
	addi	a4,a4,2000
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,520
	lla	a4,.LC46
	ld	a4,0(a4)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,528
	li	a4,5324800
	addi	a4,a4,646
	sd	a4,0(a5)
	ld	a5,-24(s0)
	addi	a5,a5,536
	li	a4,449
	sd	a4,0(a5)
	nop
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	reg_clean, .-reg_clean
	.align	1
	.globl	foo
	.type	foo, @function
foo:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	li	a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	foo, .-foo
	.section	.rodata
	.align	3
.LC47:
	.string	"Begin test...\n"
	.align	3
.LC48:
	.string	"a_char addr is%x...\n"
	.align	3
.LC49:
	.string	"b_char addr is%x...\n"
	.align	3
.LC50:
	.string	"Reg clean\n"
	.align	3
.LC51:
	.string	"inst18 %lx\n"
	.align	3
.LC52:
	.string	"inst19 %lx\n"
	.align	3
.LC53:
	.string	"inst20 %lx\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-544
	sd	ra,536(sp)
	sd	s0,528(sp)
	sd	s1,520(sp)
	addi	s0,sp,544
	li	t1,-16384
	add	sp,sp,t1
	lla	a0,.LC47
	call	printf
	li	a5,-8192
	addi	a5,a5,-2048
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a5,-12288
	addi	a3,s0,-32
	add	a5,a3,a5
	mv	a1,a4
	mv	a0,a5
	call	DFG_init
	li	a5,-12288
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a5,-8192
	addi	a5,a5,-2048
	addi	a3,s0,-32
	add	a2,a3,a5
	li	a5,-12288
	addi	a3,s0,-32
	add	a5,a3,a5
	addi	a5,a5,40
	mv	a3,a5
	li	s1,-4096
	addi	a5,s1,2032
	addi	a1,s0,-16
	add	a5,a1,a5
	mv	a1,a4
	mv	a0,a5
	call	dfi_v1
	li	a5,12345344
	addi	a1,a5,334
	li	a2,0
 #APP
# 244 "test.c" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 32) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	a5,s1,2032
	addi	a4,s0,-16
	add	a5,a4,a5
	mv	a1,a5
	li	a2,128
 #APP
# 245 "test.c" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	mv	a4,a5
	li	a5,4096
	mv	a2,a5
	li	a1,0
	mv	a0,a4
	call	memset
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	addi	a5,a5,-256
	li	a4,256
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	addi	a5,a5,-512
	li	a4,256
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-256(a5)
 #APP
# 253 "test.c" 1
	.word 0x0000008b
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-252(a5)
 #APP
# 255 "test.c" 1
	.word 0x0000008b
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-248(a5)
 #APP
# 257 "test.c" 1
	.word 0x0000008b
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-244(a5)
 #APP
# 259 "test.c" 1
	.word 0x0000008b
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-244(a5)
 #APP
# 261 "test.c" 1
	.word 0x0000008b
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-244(a5)
 #APP
# 263 "test.c" 1
	.word 0x0000008b
# 0 "" 2
# 264 "test.c" 1
	.word 0x0000008b
# 0 "" 2
# 265 "test.c" 1
	.word 0x0000008b
# 0 "" 2
# 266 "test.c" 1
	.word 0x0400008b
# 0 "" 2
# 267 "test.c" 1
	.word 0x0400010b
# 0 "" 2
 #NO_APP
	lla	a5,i
	sw	zero,0(a5)
	j	.L11
.L12:
	lla	a5,i
	lw	a5,0(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	lla	a5,i
	sw	a4,0(a5)
.L11:
	lla	a5,i
	lw	a5,0(a5)
	mv	a4,a5
	li	a5,31
	ble	a4,a5,.L12
	li	a5,-16384
	addi	a5,a5,-256
	addi	a4,s0,-32
	add	a5,a4,a5
	mv	a1,a5
	lla	a0,.LC48
	call	printf
	li	a5,-16384
	addi	a5,a5,-512
	addi	a4,s0,-32
	add	a5,a4,a5
	mv	a1,a5
	lla	a0,.LC49
	call	printf
 #APP
# 281 "test.c" 1
	.word 0x6000000b
# 0 "" 2
 #NO_APP
	li	a5,-8192
	addi	a5,a5,-2048
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a5,-12288
	addi	a3,s0,-32
	add	a5,a3,a5
	mv	a1,a4
	mv	a0,a5
	call	DFG_init
	li	a5,12345344
	addi	a1,a5,334
	li	a2,0
 #APP
# 284 "test.c" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 32) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	s1,-4096
	addi	a5,s1,2032
	addi	a4,s0,-16
	add	a5,a4,a5
	mv	a1,a5
	li	a2,128
 #APP
# 285 "test.c" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a4,1
	sw	a4,-244(a5)
 #APP
# 290 "test.c" 1
	.word 0x0000008b
# 0 "" 2
# 291 "test.c" 1
	.word 0x0400008b
# 0 "" 2
# 292 "test.c" 1
	.word 0x0400010b
# 0 "" 2
# 293 "test.c" 1
	.word 0x0400018b
# 0 "" 2
# 294 "test.c" 1
	.word 0x0400020b
# 0 "" 2
 #NO_APP
	li	a5,-16384
	addi	a5,a5,-256
	addi	a4,s0,-32
	add	a5,a4,a5
	mv	a1,a5
	lla	a0,.LC48
	call	printf
	li	a5,-16384
	addi	a5,a5,-512
	addi	a4,s0,-32
	add	a5,a4,a5
	mv	a1,a5
	lla	a0,.LC49
	call	printf
	li	a5,-16384
	addi	a5,a5,-256
	addi	a4,s0,-32
	add	a5,a4,a5
	li	a2,31
	li	a1,0
	mv	a0,a5
	add a0,zero,a0
	add a1,zero,a1
	add a2,zero,a2
	.word 0xac00018b
	call	memset
	li	a5,-16384
	addi	a5,a5,-256
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a5,-16384
	addi	a5,a5,-512
	addi	a3,s0,-32
	add	a5,a3,a5
	li	a2,31
	mv	a1,a4
	mv	a0,a5
	add a0,zero,a0
	add a1,zero,a1
	add a2,zero,a2
	.word 0xbc00018b
	call	memcpy
	li	a1,2
	li	a0,1
	add a0,zero,a0
	add a1,zero,a1
	add a2,zero,a2
	.word 0xac00018b
	call	add
 #APP
# 306 "test.c" 1
	.word 0x6000000b
# 0 "" 2
 #NO_APP
	li	a5,-12288
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a5,-8192
	addi	a5,a5,-2048
	addi	a3,s0,-32
	add	a2,a3,a5
	li	a5,-12288
	addi	a3,s0,-32
	add	a5,a3,a5
	addi	a5,a5,40
	mv	a3,a5
	addi	a5,s1,2032
	addi	a1,s0,-16
	add	a5,a1,a5
	mv	a1,a4
	mv	a0,a5
	call	dfi_v1
	li	a5,-8192
	addi	a5,a5,-2048
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a5,-12288
	addi	a3,s0,-32
	add	a5,a3,a5
	mv	a1,a4
	mv	a0,a5
	call	DFG_init
	li	a5,12345344
	addi	a1,a5,334
	li	a2,0
 #APP
# 312 "test.c" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 32) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	a5,s1,2032
	addi	a4,s0,-16
	add	a5,a4,a5
	mv	a1,a5
	li	a2,128
 #APP
# 313 "test.c" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
# 315 "test.c" 1
	.word 0x2022830b
# 0 "" 2
 #NO_APP
	lla	a0,.LC50
	call	printf
	ld	a5,-1936(s0)
	mv	a1,a5
	lla	a0,.LC51
	call	printf
	ld	a5,-1928(s0)
	mv	a1,a5
	lla	a0,.LC52
	call	printf
	ld	a5,-1920(s0)
	mv	a1,a5
	lla	a0,.LC53
	call	printf
 #APP
# 321 "test.c" 1
	.word 0x2429818b
# 0 "" 2
# 322 "test.c" 1
	.word 0x6000000b
# 0 "" 2
 #NO_APP
	li	a5,0
	mv	a0,a5
	li	t1,16384
	add	sp,sp,t1
	ld	ra,536(sp)
	ld	s0,528(sp)
	ld	s1,520(sp)
	addi	sp,sp,544
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.dword	-9223371950955429887
	.align	3
.LC1:
	.dword	-9223372032559808491
	.align	3
.LC2:
	.dword	-9223372032559808490
	.align	3
.LC3:
	.dword	433752952029642752
	.align	3
.LC4:
	.dword	1446519769808830465
	.align	3
.LC5:
	.dword	2459282163671438869
	.align	3
.LC6:
	.dword	3470349136474481699
	.align	3
.LC7:
	.dword	4050765991979987505
	.align	3
.LC8:
	.dword	-9223372032559814718
	.align	3
.LC9:
	.dword	-9223372036854738996
	.align	3
.LC10:
	.dword	-9221120237057864177
	.align	3
.LC11:
	.dword	-9223372036821221362
	.align	3
.LC12:
	.dword	6917529027648620485
	.align	3
.LC13:
	.dword	-9221120237057864113
	.align	3
.LC14:
	.dword	-9221120237057601905
	.align	3
.LC15:
	.dword	-9223372036789498289
	.align	3
.LC16:
	.dword	-9223372036788973882
	.align	3
.LC17:
	.dword	-9223372036820693298
	.align	3
.LC18:
	.dword	-9223372036820434866
	.align	3
.LC19:
	.dword	-9223372036835638714
	.align	3
.LC20:
	.dword	-9223372036787404730
	.align	3
.LC21:
	.dword	-9223372036820434930
	.align	3
.LC22:
	.dword	-9223372036787666938
	.align	3
.LC23:
	.dword	-9223372035502374256
	.align	3
.LC24:
	.dword	-9221120237057863921
	.align	3
.LC25:
	.dword	-9223372036842189818
	.align	3
.LC26:
	.dword	6917529027643901893
	.align	3
.LC27:
	.dword	-9223372036317903998
	.align	3
.LC28:
	.dword	2305843013508653122
	.align	3
.LC29:
	.dword	17202315722
	.align	3
.LC30:
	.dword	1117241192155097
	.align	3
.LC31:
	.dword	-9221120237057865777
	.align	3
.LC32:
	.dword	6355508606038
	.align	3
.LC33:
	.dword	-9223372034964975088
	.align	3
.LC34:
	.dword	-9223372034962091568
	.align	3
.LC35:
	.dword	-9221120237057601969
	.align	3
.LC36:
	.dword	-9223372036851892218
	.align	3
.LC37:
	.dword	-9223372020473127792
	.align	3
.LC38:
	.dword	-9223372036789760497
	.align	3
.LC39:
	.dword	-9223372036789236090
	.align	3
.LC40:
	.dword	-9223372036820693362
	.align	3
.LC41:
	.dword	-9223372036852937530
	.align	3
.LC42:
	.dword	-9223372036852675322
	.align	3
.LC43:
	.dword	-9223372036840879098
	.align	3
.LC44:
	.dword	-9223372036784782650
	.align	3
.LC45:
	.dword	-9221120237057863985
	.align	3
.LC46:
	.dword	-4611684918929913915
	.ident	"GCC: (GNU) 7.2.0"
