	.text	0x00400000
	.globl	main
	la	$28, _heap_
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
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
	jal	getint
# was:	jal	getint, $2
# 	ori	_letBind_2_,$2,0
	ori	$4, $2, 0
# was:	ori	_letBind_3_, _letBind_2_, 0
# 	ori	_size_reg_9_,_letBind_3_,0
	bgez	$4, _safe_lab_10_
# was:	bgez	_size_reg_9_, _safe_lab_10_
	ori	$5, $0, 3
# was:	ori	$5, $0, 3
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_10_:
	ori	$3, $28, 0
# was:	ori	_arr_reg_6_, $28, 0
	sll	$5, $4, 2
# was:	sll	_tmp_16_, _size_reg_9_, 2
	addi	$5, $5, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $5
# was:	add	$28, $28, _tmp_16_
	sw	$4, 0($3)
# was:	sw	_size_reg_9_, 0(_arr_reg_6_)
	addi	$5, $3, 4
# was:	addi	_addr_reg_11_, _arr_reg_6_, 4
	ori	$7, $0, 0
# was:	ori	_i_reg_12_, $0, 0
_loop_beg_13_:
	sub	$6, $7, $4
# was:	sub	_tmp_reg_15_, _i_reg_12_, _size_reg_9_
	bgez	$6, _loop_end_14_
# was:	bgez	_tmp_reg_15_, _loop_end_14_
	sw	$7, 0($5)
# was:	sw	_i_reg_12_, 0(_addr_reg_11_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_11_, _addr_reg_11_, 4
	addi	$7, $7, 1
# was:	addi	_i_reg_12_, _i_reg_12_, 1
	j	_loop_beg_13_
_loop_end_14_:
	lw	$17, 0($3)
# was:	lw	_size_reg_5_, 0(_arr_reg_6_)
	ori	$18, $28, 0
# was:	ori	_letBind_4_, $28, 0
	addi	$4, $17, 3
# was:	addi	_tmp_23_, _size_reg_5_, 3
	sra	$4, $4, 2
# was:	sra	_tmp_23_, _tmp_23_, 2
	sll	$4, $4, 2
# was:	sll	_tmp_23_, _tmp_23_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_23_, _tmp_23_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_23_
	sw	$17, 0($18)
# was:	sw	_size_reg_5_, 0(_letBind_4_)
	addi	$16, $18, 4
# was:	addi	_addr_reg_17_, _letBind_4_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_18_, $0, 0
	addi	$20, $3, 4
# was:	addi	_elem_reg_7_, _arr_reg_6_, 4
_loop_beg_19_:
	sub	$3, $19, $17
# was:	sub	_tmp_reg_21_, _i_reg_18_, _size_reg_5_
	bgez	$3, _loop_end_20_
# was:	bgez	_tmp_reg_21_, _loop_end_20_
	lw	$3, 0($20)
# was:	lw	_res_reg_8_, 0(_elem_reg_7_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_7_, _elem_reg_7_, 4
	jal	getchar
# was:	jal	getchar, $2
# 	ori	_fun_arg_res_22_,$2,0
	ori	$3, $2, 0
# was:	ori	_res_reg_8_, _fun_arg_res_22_, 0
	sb	$3, 0($16)
# was:	sb	_res_reg_8_, 0(_addr_reg_17_)
	addi	$16, $16, 1
# was:	addi	_addr_reg_17_, _addr_reg_17_, 1
	addi	$19, $19, 1
# was:	addi	_i_reg_18_, _i_reg_18_, 1
	j	_loop_beg_19_
_loop_end_20_:
	ori	$2, $18, 0
# was:	ori	_arr_reg_34_, _letBind_4_, 0
	lw	$18, 0($2)
# was:	lw	_size_reg_33_, 0(_arr_reg_34_)
	ori	$16, $28, 0
# was:	ori	_arr_reg_30_, $28, 0
	sll	$3, $18, 2
# was:	sll	_tmp_43_, _size_reg_33_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_43_, _tmp_43_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_43_
	sw	$18, 0($16)
# was:	sw	_size_reg_33_, 0(_arr_reg_30_)
	addi	$19, $16, 4
# was:	addi	_addr_reg_37_, _arr_reg_30_, 4
	ori	$17, $0, 0
# was:	ori	_i_reg_38_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_35_, _arr_reg_34_, 4
_loop_beg_39_:
	sub	$2, $17, $18
# was:	sub	_tmp_reg_41_, _i_reg_38_, _size_reg_33_
	bgez	$2, _loop_end_40_
# was:	bgez	_tmp_reg_41_, _loop_end_40_
	lb	$2, 0($20)
# was:	lb	_res_reg_36_, 0(_elem_reg_35_)
	addi	$20, $20, 1
# was:	addi	_elem_reg_35_, _elem_reg_35_, 1
# 	ori	$2,_res_reg_36_,0
	jal	ord
# was:	jal	ord, $2
# 	ori	_tmp_reg_42_,$2,0
# 	ori	_res_reg_36_,_tmp_reg_42_,0
	sw	$2, 0($19)
# was:	sw	_res_reg_36_, 0(_addr_reg_37_)
	addi	$19, $19, 4
# was:	addi	_addr_reg_37_, _addr_reg_37_, 4
	addi	$17, $17, 1
# was:	addi	_i_reg_38_, _i_reg_38_, 1
	j	_loop_beg_39_
_loop_end_40_:
	lw	$3, 0($16)
# was:	lw	_size_reg_29_, 0(_arr_reg_30_)
	ori	$2, $28, 0
# was:	ori	_arr_reg_26_, $28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_52_, _size_reg_29_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_52_
	sw	$3, 0($2)
# was:	sw	_size_reg_29_, 0(_arr_reg_26_)
	addi	$5, $2, 4
# was:	addi	_addr_reg_44_, _arr_reg_26_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_45_, $0, 0
	addi	$6, $16, 4
# was:	addi	_elem_reg_31_, _arr_reg_30_, 4
_loop_beg_46_:
	sub	$7, $4, $3
# was:	sub	_tmp_reg_48_, _i_reg_45_, _size_reg_29_
	bgez	$7, _loop_end_47_
# was:	bgez	_tmp_reg_48_, _loop_end_47_
	lw	$8, 0($6)
# was:	lw	_res_reg_32_, 0(_elem_reg_31_)
	addi	$6, $6, 4
# was:	addi	_elem_reg_31_, _elem_reg_31_, 4
# 	ori	_plus_L_50_,_res_reg_32_,0
	ori	$7, $0, 1
# was:	ori	_plus_R_51_, $0, 1
	add	$8, $8, $7
# was:	add	_fun_arg_res_49_, _plus_L_50_, _plus_R_51_
# 	ori	_res_reg_32_,_fun_arg_res_49_,0
	sw	$8, 0($5)
# was:	sw	_res_reg_32_, 0(_addr_reg_44_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_44_, _addr_reg_44_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_45_, _i_reg_45_, 1
	j	_loop_beg_46_
_loop_end_47_:
	lw	$17, 0($2)
# was:	lw	_size_reg_25_, 0(_arr_reg_26_)
	ori	$16, $28, 0
# was:	ori	_letBind_24_, $28, 0
	addi	$3, $17, 3
# was:	addi	_tmp_59_, _size_reg_25_, 3
	sra	$3, $3, 2
# was:	sra	_tmp_59_, _tmp_59_, 2
	sll	$3, $3, 2
# was:	sll	_tmp_59_, _tmp_59_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_59_
	sw	$17, 0($16)
# was:	sw	_size_reg_25_, 0(_letBind_24_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_53_, _letBind_24_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_54_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_27_, _arr_reg_26_, 4
_loop_beg_55_:
	sub	$2, $19, $17
# was:	sub	_tmp_reg_57_, _i_reg_54_, _size_reg_25_
	bgez	$2, _loop_end_56_
# was:	bgez	_tmp_reg_57_, _loop_end_56_
	lw	$2, 0($20)
# was:	lw	_res_reg_28_, 0(_elem_reg_27_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_27_, _elem_reg_27_, 4
# 	ori	$2,_res_reg_28_,0
	jal	chr
# was:	jal	chr, $2
# 	ori	_tmp_reg_58_,$2,0
# 	ori	_res_reg_28_,_tmp_reg_58_,0
	sb	$2, 0($18)
# was:	sb	_res_reg_28_, 0(_addr_reg_53_)
	addi	$18, $18, 1
# was:	addi	_addr_reg_53_, _addr_reg_53_, 1
	addi	$19, $19, 1
# was:	addi	_i_reg_54_, _i_reg_54_, 1
	j	_loop_beg_55_
_loop_end_56_:
	ori	$2, $16, 0
# was:	ori	_tmp_60_, _letBind_24_, 0
	ori	$16, $2, 0
# was:	ori	_mainres_1_, _tmp_60_, 0
# 	ori	$2,_tmp_60_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $16, 0
# was:	ori	$2, _mainres_1_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
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