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
	sw	$21, -28($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -32
	jal	getint
# was:	jal	getint, $2
# 	ori	_letBind_2_,$2,0
# 	ori	_size_reg_9_,_letBind_2_,0
	bgez	$2, _safe_lab_10_
# was:	bgez	_size_reg_9_, _safe_lab_10_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_10_:
	ori	$7, $28, 0
# was:	ori	_arr_reg_5_, $28, 0
	sll	$3, $2, 2
# was:	sll	_tmp_16_, _size_reg_9_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_16_
	sw	$2, 0($7)
# was:	sw	_size_reg_9_, 0(_arr_reg_5_)
	addi	$5, $7, 4
# was:	addi	_addr_reg_11_, _arr_reg_5_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_12_, $0, 0
_loop_beg_13_:
	sub	$3, $4, $2
# was:	sub	_tmp_reg_15_, _i_reg_12_, _size_reg_9_
	bgez	$3, _loop_end_14_
# was:	bgez	_tmp_reg_15_, _loop_end_14_
	sw	$4, 0($5)
# was:	sw	_i_reg_12_, 0(_addr_reg_11_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_11_, _addr_reg_11_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_12_, _i_reg_12_, 1
	j	_loop_beg_13_
_loop_end_14_:
	lw	$2, 0($7)
# was:	lw	_size_reg_4_, 0(_arr_reg_5_)
	ori	$6, $28, 0
# was:	ori	_letBind_3_, $28, 0
	sll	$3, $2, 2
# was:	sll	_tmp_33_, _size_reg_4_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_33_, _tmp_33_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_33_
	sw	$2, 0($6)
# was:	sw	_size_reg_4_, 0(_letBind_3_)
	addi	$3, $6, 4
# was:	addi	_addr_reg_17_, _letBind_3_, 4
	ori	$4, $0, 0
# was:	ori	_input_i_reg_18_, $0, 0
	ori	$5, $0, 0
# was:	ori	_res_i_reg_19_, $0, 0
	addi	$7, $7, 4
# was:	addi	_elem_reg_6_, _arr_reg_5_, 4
_loop_beg_20_:
	sub	$8, $4, $2
# was:	sub	_tmp_reg_22_, _input_i_reg_18_, _size_reg_4_
	bgez	$8, _loop_end_21_
# was:	bgez	_tmp_reg_22_, _loop_end_21_
	lw	$10, 0($7)
# was:	lw	_res_reg_7_, 0(_elem_reg_6_)
	addi	$7, $7, 4
# was:	addi	_elem_reg_6_, _elem_reg_6_, 4
# 	ori	_eq_L_25_,_res_reg_7_,0
	ori	$9, $10, 0
# was:	ori	_divide_L_29_, _res_reg_7_, 0
	ori	$8, $0, 2
# was:	ori	_divide_R_30_, $0, 2
	bne	$8, $0, _SafeLabel_31_
# was:	bne	_divide_R_30_, $0, _SafeLabel_31_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_SafeLabel_31_:
	div	$9, $9, $8
# was:	div	_times_L_27_, _divide_L_29_, _divide_R_30_
	ori	$8, $0, 2
# was:	ori	_times_R_28_, $0, 2
	mul	$9, $9, $8
# was:	mul	_eq_R_26_, _times_L_27_, _times_R_28_
	ori	$8, $0, 0
# was:	ori	_fun_arg_res_24_, $0, 0
	bne	$10, $9, _false_32_
# was:	bne	_eq_L_25_, _eq_R_26_, _false_32_
	ori	$8, $0, 1
# was:	ori	_fun_arg_res_24_, $0, 1
_false_32_:
# 	ori	_bool_reg_8_,_fun_arg_res_24_,0
	beq	$8, $0, _false_23_
# was:	beq	_bool_reg_8_, $0, _false_23_
	sw	$10, 0($3)
# was:	sw	_res_reg_7_, 0(_addr_reg_17_)
	addi	$3, $3, 4
# was:	addi	_addr_reg_17_, _addr_reg_17_, 4
	addi	$5, $5, 1
# was:	addi	_res_i_reg_19_, _res_i_reg_19_, 1
_false_23_:
	addi	$4, $4, 1
# was:	addi	_input_i_reg_18_, _input_i_reg_18_, 1
	j	_loop_beg_20_
_loop_end_21_:
	sw	$5, 0($6)
# was:	sw	_res_i_reg_19_, 0(_letBind_3_)
	ori	$2, $6, 0
# was:	ori	_arr_reg_36_, _letBind_3_, 0
	lw	$4, 0($2)
# was:	lw	_size_reg_35_, 0(_arr_reg_36_)
	ori	$5, $28, 0
# was:	ori	_letBind_34_, $28, 0
	sll	$3, $4, 2
# was:	sll	_tmp_47_, _size_reg_35_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_47_, _tmp_47_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_47_
	sw	$4, 0($5)
# was:	sw	_size_reg_35_, 0(_letBind_34_)
	addi	$7, $5, 4
# was:	addi	_addr_reg_39_, _letBind_34_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_40_, $0, 0
	addi	$3, $2, 4
# was:	addi	_elem_reg_37_, _arr_reg_36_, 4
_loop_beg_41_:
	sub	$2, $6, $4
# was:	sub	_tmp_reg_43_, _i_reg_40_, _size_reg_35_
	bgez	$2, _loop_end_42_
# was:	bgez	_tmp_reg_43_, _loop_end_42_
	lw	$2, 0($3)
# was:	lw	_res_reg_38_, 0(_elem_reg_37_)
	addi	$3, $3, 4
# was:	addi	_elem_reg_37_, _elem_reg_37_, 4
# 	ori	_times_L_45_,_res_reg_38_,0
	ori	$8, $2, 0
# was:	ori	_times_R_46_, _res_reg_38_, 0
	mul	$2, $2, $8
# was:	mul	_fun_arg_res_44_, _times_L_45_, _times_R_46_
# 	ori	_res_reg_38_,_fun_arg_res_44_,0
	sw	$2, 0($7)
# was:	sw	_res_reg_38_, 0(_addr_reg_39_)
	addi	$7, $7, 4
# was:	addi	_addr_reg_39_, _addr_reg_39_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_40_, _i_reg_40_, 1
	j	_loop_beg_41_
_loop_end_42_:
	ori	$2, $5, 0
# was:	ori	_arr_reg_50_, _letBind_34_, 0
	lw	$6, 0($2)
# was:	lw	_size_reg_49_, 0(_arr_reg_50_)
	ori	$7, $28, 0
# was:	ori	_letBind_48_, $28, 0
	sll	$3, $6, 2
# was:	sll	_tmp_70_, _size_reg_49_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_70_, _tmp_70_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_70_
	sw	$6, 0($7)
# was:	sw	_size_reg_49_, 0(_letBind_48_)
	addi	$4, $7, 4
# was:	addi	_addr_reg_54_, _letBind_48_, 4
	ori	$5, $0, 0
# was:	ori	_input_i_reg_55_, $0, 0
	ori	$3, $0, 0
# was:	ori	_res_i_reg_56_, $0, 0
	addi	$8, $2, 4
# was:	addi	_elem_reg_51_, _arr_reg_50_, 4
_loop_beg_57_:
	sub	$2, $5, $6
# was:	sub	_tmp_reg_59_, _input_i_reg_55_, _size_reg_49_
	bgez	$2, _loop_end_58_
# was:	bgez	_tmp_reg_59_, _loop_end_58_
	lw	$10, 0($8)
# was:	lw	_res_reg_52_, 0(_elem_reg_51_)
	addi	$8, $8, 4
# was:	addi	_elem_reg_51_, _elem_reg_51_, 4
# 	ori	_divide_L_66_,_res_reg_52_,0
	ori	$2, $0, 16
# was:	ori	_divide_R_67_, $0, 16
	bne	$2, $0, _SafeLabel_68_
# was:	bne	_divide_R_67_, $0, _SafeLabel_68_
	ori	$5, $0, 6
# was:	ori	$5, $0, 6
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_SafeLabel_68_:
	div	$2, $10, $2
# was:	div	_times_L_64_, _divide_L_66_, _divide_R_67_
	ori	$9, $0, 16
# was:	ori	_times_R_65_, $0, 16
	mul	$2, $2, $9
# was:	mul	_eq_L_62_, _times_L_64_, _times_R_65_
# 	ori	_eq_R_63_,_res_reg_52_,0
	ori	$9, $0, 0
# was:	ori	_fun_arg_res_61_, $0, 0
	bne	$2, $10, _false_69_
# was:	bne	_eq_L_62_, _eq_R_63_, _false_69_
	ori	$9, $0, 1
# was:	ori	_fun_arg_res_61_, $0, 1
_false_69_:
# 	ori	_bool_reg_53_,_fun_arg_res_61_,0
	beq	$9, $0, _false_60_
# was:	beq	_bool_reg_53_, $0, _false_60_
	sw	$10, 0($4)
# was:	sw	_res_reg_52_, 0(_addr_reg_54_)
	addi	$4, $4, 4
# was:	addi	_addr_reg_54_, _addr_reg_54_, 4
	addi	$3, $3, 1
# was:	addi	_res_i_reg_56_, _res_i_reg_56_, 1
_false_60_:
	addi	$5, $5, 1
# was:	addi	_input_i_reg_55_, _input_i_reg_55_, 1
	j	_loop_beg_57_
_loop_end_58_:
	sw	$3, 0($7)
# was:	sw	_res_i_reg_56_, 0(_letBind_48_)
# 	ori	_arr_reg_72_,_letBind_48_,0
	lw	$16, 0($7)
# was:	lw	_size_reg_71_, 0(_arr_reg_72_)
	ori	$17, $28, 0
# was:	ori	_mainres_1_, $28, 0
	sll	$2, $16, 2
# was:	sll	_tmp_82_, _size_reg_71_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_82_
	sw	$16, 0($17)
# was:	sw	_size_reg_71_, 0(_mainres_1_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_75_, _mainres_1_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_76_, $0, 0
	addi	$20, $7, 4
# was:	addi	_elem_reg_73_, _arr_reg_72_, 4
_loop_beg_77_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_79_, _i_reg_76_, _size_reg_71_
	bgez	$2, _loop_end_78_
# was:	bgez	_tmp_reg_79_, _loop_end_78_
	lw	$21, 0($20)
# was:	lw	_res_reg_74_, 0(_elem_reg_73_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_73_, _elem_reg_73_, 4
# 	ori	_tmp_81_,_res_reg_74_,0
# 	ori	_fun_arg_res_80_,_tmp_81_,0
	ori	$2, $21, 0
# was:	ori	$2, _fun_arg_res_80_, 0
	jal	putint
# was:	jal	putint, $2
# 	ori	_res_reg_74_,_fun_arg_res_80_,0
	sw	$21, 0($18)
# was:	sw	_res_reg_74_, 0(_addr_reg_75_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_75_, _addr_reg_75_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_76_, _i_reg_76_, 1
	j	_loop_beg_77_
_loop_end_78_:
	ori	$2, $17, 0
# was:	ori	$2, _mainres_1_, 0
	addi	$29, $29, 32
	lw	$21, -28($29)
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