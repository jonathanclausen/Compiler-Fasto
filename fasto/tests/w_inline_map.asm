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
	ori	$6, $0, 8
# was:	ori	_arr_reg_5_, $0, 8
	lw	$2, 0($6)
# was:	lw	_size_reg_4_, 0(_arr_reg_5_)
	ori	$3, $28, 0
# was:	ori	_letBind_3_, $28, 0
	sll	$4, $2, 2
# was:	sll	_tmp_16_, _size_reg_4_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_16_
	sw	$2, 0($3)
# was:	sw	_size_reg_4_, 0(_letBind_3_)
	addi	$4, $3, 4
# was:	addi	_addr_reg_8_, _letBind_3_, 4
	ori	$5, $0, 0
# was:	ori	_i_reg_9_, $0, 0
	addi	$6, $6, 4
# was:	addi	_elem_reg_6_, _arr_reg_5_, 4
_loop_beg_10_:
	sub	$7, $5, $2
# was:	sub	_tmp_reg_12_, _i_reg_9_, _size_reg_4_
	bgez	$7, _loop_end_11_
# was:	bgez	_tmp_reg_12_, _loop_end_11_
	lw	$7, 0($6)
# was:	lw	_res_reg_7_, 0(_elem_reg_6_)
	addi	$6, $6, 4
# was:	addi	_elem_reg_6_, _elem_reg_6_, 4
	ori	$8, $7, 0
# was:	ori	_plus_L_14_, _res_reg_7_, 0
# 	ori	_plus_R_15_,_res_reg_7_,0
	add	$7, $8, $7
# was:	add	_fun_arg_res_13_, _plus_L_14_, _plus_R_15_
# 	ori	_res_reg_7_,_fun_arg_res_13_,0
	sw	$7, 0($4)
# was:	sw	_res_reg_7_, 0(_addr_reg_8_)
	addi	$4, $4, 4
# was:	addi	_addr_reg_8_, _addr_reg_8_, 4
	addi	$5, $5, 1
# was:	addi	_i_reg_9_, _i_reg_9_, 1
	j	_loop_beg_10_
_loop_end_11_:
# 	ori	_arr_reg_18_,_letBind_3_,0
	lw	$16, 0($3)
# was:	lw	_size_reg_17_, 0(_arr_reg_18_)
	ori	$17, $28, 0
# was:	ori	_mainres_1_, $28, 0
	sll	$2, $16, 2
# was:	sll	_tmp_28_, _size_reg_17_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_28_
	sw	$16, 0($17)
# was:	sw	_size_reg_17_, 0(_mainres_1_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_21_, _mainres_1_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_22_, $0, 0
	addi	$20, $3, 4
# was:	addi	_elem_reg_19_, _arr_reg_18_, 4
_loop_beg_23_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_25_, _i_reg_22_, _size_reg_17_
	bgez	$2, _loop_end_24_
# was:	bgez	_tmp_reg_25_, _loop_end_24_
	lw	$21, 0($20)
# was:	lw	_res_reg_20_, 0(_elem_reg_19_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_19_, _elem_reg_19_, 4
# 	ori	_tmp_27_,_res_reg_20_,0
# 	ori	_fun_arg_res_26_,_tmp_27_,0
	ori	$2, $21, 0
# was:	ori	$2, _fun_arg_res_26_, 0
	jal	putint
# was:	jal	putint, $2
# 	ori	_res_reg_20_,_fun_arg_res_26_,0
	sw	$21, 0($18)
# was:	sw	_res_reg_20_, 0(_addr_reg_21_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_21_, _addr_reg_21_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_22_, _i_reg_22_, 1
	j	_loop_beg_23_
_loop_end_24_:
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