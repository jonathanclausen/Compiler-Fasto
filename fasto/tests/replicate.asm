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
	ori	$3, $0, 7
# was:	ori	_size_reg_3_, $0, 7
	ori	$7, $0, 0
# was:	ori	_a_reg_4_, $0, 0
	bgez	$3, _safe_lab_5_
# was:	bgez	_size_reg_3_, _safe_lab_5_
	ori	$5, $0, 4
# was:	ori	$5, $0, 4
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_5_:
	ori	$2, $28, 0
# was:	ori	_letBind_2_, $28, 0
	addi	$4, $3, 3
# was:	addi	_tmp_15_, _size_reg_3_, 3
	sra	$4, $4, 2
# was:	sra	_tmp_15_, _tmp_15_, 2
	sll	$4, $4, 2
# was:	sll	_tmp_15_, _tmp_15_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_15_
	sw	$3, 0($2)
# was:	sw	_size_reg_3_, 0(_letBind_2_)
	addi	$5, $2, 4
# was:	addi	_addr_reg_6_, _letBind_2_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_7_, $0, 0
_loop_beg_8_:
	sub	$6, $4, $3
# was:	sub	_tmp_reg_10_, _i_reg_7_, _size_reg_3_
	bgez	$6, _loop_end_9_
# was:	bgez	_tmp_reg_10_, _loop_end_9_
	addi	$6, $0, 1
# was:	addi	_elem_size_14_, $0, 1
	slti	$6, $6, 4
# was:	slti	_res_reg_13_, _elem_size_14_, 4
	bne	$6, $0, _byte_label_11_
# was:	bne	_res_reg_13_, $0, _byte_label_11_
	sw	$7, 0($5)
# was:	sw	_a_reg_4_, 0(_addr_reg_6_)
	j	_end_label_12_
_byte_label_11_:
	sb	$7, 0($5)
# was:	sb	_a_reg_4_, 0(_addr_reg_6_)
_end_label_12_:
	addi	$5, $5, 1
# was:	addi	_addr_reg_6_, _addr_reg_6_, 1
	addi	$4, $4, 1
# was:	addi	_i_reg_7_, _i_reg_7_, 1
	j	_loop_beg_8_
_loop_end_9_:
# 	ori	_arr_reg_17_,_letBind_2_,0
	lw	$16, 0($2)
# was:	lw	_size_reg_16_, 0(_arr_reg_17_)
	ori	$17, $28, 0
# was:	ori	_mainres_1_, $28, 0
	addi	$3, $16, 3
# was:	addi	_tmp_28_, _size_reg_16_, 3
	sra	$3, $3, 2
# was:	sra	_tmp_28_, _tmp_28_, 2
	sll	$3, $3, 2
# was:	sll	_tmp_28_, _tmp_28_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_28_
	sw	$16, 0($17)
# was:	sw	_size_reg_16_, 0(_mainres_1_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_20_, _mainres_1_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_21_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_18_, _arr_reg_17_, 4
_loop_beg_22_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_24_, _i_reg_21_, _size_reg_16_
	bgez	$2, _loop_end_23_
# was:	bgez	_tmp_reg_24_, _loop_end_23_
	lb	$21, 0($20)
# was:	lb	_res_reg_19_, 0(_elem_reg_18_)
	addi	$20, $20, 1
# was:	addi	_elem_reg_18_, _elem_reg_18_, 1
# 	ori	_tmp_26_,_res_reg_19_,0
# 	ori	_fun_arg_res_25_,_tmp_26_,0
	la	$2, _true
# was:	la	$2, _true
	bne	$21, $0, _wBoolF_27_
# was:	bne	_fun_arg_res_25_, $0, _wBoolF_27_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_27_:
	jal	putstring
# was:	jal	putstring, $2
# 	ori	_res_reg_19_,_fun_arg_res_25_,0
	sb	$21, 0($18)
# was:	sb	_res_reg_19_, 0(_addr_reg_20_)
	addi	$18, $18, 1
# was:	addi	_addr_reg_20_, _addr_reg_20_, 1
	addi	$19, $19, 1
# was:	addi	_i_reg_21_, _i_reg_21_, 1
	j	_loop_beg_22_
_loop_end_23_:
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