	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _a__str__44_
# was:	la	_a__str__44__addr, _a__str__44_
	ori	$3, $0, 1
# was:	ori	_a__str__44__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__44__init, 0(_a__str__44__addr)
	la	$4, _a__str__25_
# was:	la	_a__str__25__addr, _a__str__25_
	ori	$3, $0, 1
# was:	ori	_a__str__25__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__25__init, 0(_a__str__25__addr)
	la	$4, _a__str__19_
# was:	la	_a__str__19__addr, _a__str__19_
	ori	$3, $0, 1
# was:	ori	_a__str__19__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__19__init, 0(_a__str__19__addr)
	la	$4, _a__str__13_
# was:	la	_a__str__13__addr, _a__str__13_
	ori	$3, $0, 1
# was:	ori	_a__str__13__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__13__init, 0(_a__str__13__addr)
	la	$4, _a__str__7_
# was:	la	_a__str__7__addr, _a__str__7_
	ori	$3, $0, 1
# was:	ori	_a__str__7__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__7__init, 0(_a__str__7__addr)
	la	$4, _true
# was:	la	_true_addr, _true
	ori	$3, $0, 4
# was:	ori	_true_init, $0, 4
	sw	$3, 0($4)
# was:	sw	_true_init, 0(_true_addr)
	la	$3, _false
# was:	la	_false_addr, _false
	ori	$4, $0, 5
# was:	ori	_false_init, $0, 5
	sw	$4, 0($3)
# was:	sw	_false_init, 0(_false_addr)
	jal	main
_stop_:
	ori	$2, $0, 10
	syscall
# Function main
main:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
	ori	$3, $0, 1
# was:	ori	_tmp_3_, $0, 1
# 	ori	_letBind_2_,_tmp_3_,0
	la	$2, _true
# was:	la	$2, _true
	bne	$3, $0, _wBoolF_4_
# was:	bne	_letBind_2_, $0, _wBoolF_4_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_4_:
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _a__str__7_
# was:	la	_tmp_6_, _a__str__7_
# _a__str__7_: string "\n"
# 	ori	_letBind_5_,_tmp_6_,0
# 	ori	$2,_tmp_6_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$3, $0, 0
# was:	ori	_tmp_9_, $0, 0
# 	ori	_letBind_8_,_tmp_9_,0
	la	$2, _true
# was:	la	$2, _true
	bne	$3, $0, _wBoolF_10_
# was:	bne	_letBind_8_, $0, _wBoolF_10_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_10_:
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _a__str__13_
# was:	la	_tmp_12_, _a__str__13_
# _a__str__13_: string "\n"
# 	ori	_letBind_11_,_tmp_12_,0
# 	ori	$2,_tmp_12_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$3, $0, 0
# was:	ori	_tmp_15_, $0, 0
# 	ori	_letBind_14_,_tmp_15_,0
	la	$2, _true
# was:	la	$2, _true
	bne	$3, $0, _wBoolF_16_
# was:	bne	_letBind_14_, $0, _wBoolF_16_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_16_:
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _a__str__19_
# was:	la	_tmp_18_, _a__str__19_
# _a__str__19_: string "\n"
# 	ori	_letBind_17_,_tmp_18_,0
# 	ori	$2,_tmp_18_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$16, $0, 1
# was:	ori	_tmp_21_, $0, 1
# 	ori	_letBind_20_,_tmp_21_,0
	la	$2, _true
# was:	la	$2, _true
	bne	$16, $0, _wBoolF_22_
# was:	bne	_letBind_20_, $0, _wBoolF_22_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_22_:
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _a__str__25_
# was:	la	_tmp_24_, _a__str__25_
# _a__str__25_: string "\n"
# 	ori	_letBind_23_,_tmp_24_,0
# 	ori	$2,_tmp_24_,0
	jal	putstring
# was:	jal	putstring, $2
# 	ori	_or_L_31_,_letBind_20_,0
	ori	$3, $0, 0
# was:	ori	_or_L_29_, $0, 0
	bne	$16, $0, _true_33_
# was:	bne	_or_L_31_, $0, _true_33_
# 	ori	_or_R_32_,_letBind_20_,0
	beq	$16, $0, _false_34_
# was:	beq	_or_R_32_, $0, _false_34_
_true_33_:
	ori	$3, $0, 1
# was:	ori	_or_L_29_, $0, 1
_false_34_:
	ori	$2, $0, 0
# was:	ori	_or_L_27_, $0, 0
	bne	$3, $0, _true_35_
# was:	bne	_or_L_29_, $0, _true_35_
# 	ori	_or_R_30_,_letBind_20_,0
	beq	$16, $0, _false_36_
# was:	beq	_or_R_30_, $0, _false_36_
_true_35_:
	ori	$2, $0, 1
# was:	ori	_or_L_27_, $0, 1
_false_36_:
	ori	$3, $0, 0
# was:	ori	_letBind_26_, $0, 0
	bne	$2, $0, _true_37_
# was:	bne	_or_L_27_, $0, _true_37_
# 	ori	_or_R_28_,_letBind_20_,0
	beq	$16, $0, _false_38_
# was:	beq	_or_R_28_, $0, _false_38_
_true_37_:
	ori	$3, $0, 1
# was:	ori	_letBind_26_, $0, 1
_false_38_:
# 	ori	_tmp_40_,_letBind_26_,0
	ori	$16, $3, 0
# was:	ori	_letBind_39_, _tmp_40_, 0
	la	$2, _true
# was:	la	$2, _true
	bne	$16, $0, _wBoolF_41_
# was:	bne	_letBind_39_, $0, _wBoolF_41_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_41_:
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _a__str__44_
# was:	la	_tmp_43_, _a__str__44_
# _a__str__44_: string "\n"
# 	ori	_letBind_42_,_tmp_43_,0
# 	ori	$2,_tmp_43_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $16, 0
# was:	ori	_mainres_1_, _letBind_39_, 0
# 	ori	$2,_mainres_1_,0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
ord:
	jr	$31
chr:
	andi	$2, $2, 255
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putchar:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 11
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getchar:
	addi	$29, $29, -8
	sw	$4, 0($29)
	sw	$5, 4($29)
	ori	$2, $0, 12
	syscall
	ori	$5, $2, 0
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	ori	$2, $5, 0
	lw	$4, 0($29)
	lw	$5, 4($29)
	addi	$29, $29, 8
	jr	$31
putstring:
	addi	$29, $29, -16
	sw	$2, 0($29)
	sw	$4, 4($29)
	sw	$5, 8($29)
	sw	$6, 12($29)
	lw	$4, 0($2)
	addi	$5, $2, 4
	add	$6, $5, $4
	ori	$2, $0, 11
putstring_begin:
	sub	$4, $5, $6
	bgez	$4, putstring_done
	lb	$4, 0($5)
	syscall
	addi	$5, $5, 1
	j	putstring_begin
putstring_done:
	lw	$2, 0($29)
	lw	$4, 4($29)
	lw	$5, 8($29)
	lw	$6, 12($29)
	addi	$29, $29, 16
	jr	$31
_RuntimeError_:
	la	$4, _ErrMsg_
	ori	$2, $0, 4
	syscall
	ori	$4, $5, 0
	ori	$2, $0, 1
	syscall
	la	$4, _colon_space_
	ori	$2, $0, 4
	syscall
	ori	$4, $6, 0
	ori	$2, $0, 4
	syscall
	la	$4, _cr_
	ori	$2, $0, 4
	syscall
	j	_stop_
	.data	
# Fixed strings for I/O
_ErrMsg_:
	.asciiz	"Runtime error at line "
_colon_space_:
	.asciiz	": "
_cr_:
	.asciiz	"\n"
_space_:
	.asciiz	" "
# Message strings for specific errors
_Msg_IllegalArraySize_:
	.asciiz	"negative array size"
_Msg_IllegalIndex_:
	.asciiz	"array index out of bounds"
_Msg_DivZero_:
	.asciiz	"division by zero"
# String Literals
	.align	2
_a__str__44_:
	.space	4
	.asciiz	"\n"
	.align	2
_a__str__25_:
	.space	4
	.asciiz	"\n"
	.align	2
_a__str__19_:
	.space	4
	.asciiz	"\n"
	.align	2
_a__str__13_:
	.space	4
	.asciiz	"\n"
	.align	2
_a__str__7_:
	.space	4
	.asciiz	"\n"
	.align	2
_true:
	.space	4
	.asciiz	"true"
	.align	2
_false:
	.space	4
	.asciiz	"false"
	.align	2
_heap_:
	.space	100000