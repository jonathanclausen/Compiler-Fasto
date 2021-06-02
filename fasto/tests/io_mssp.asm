	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _aaMSSPa_194_
# was:	la	_aaMSSPa_194__addr, _aaMSSPa_194_
	ori	$3, $0, 18
# was:	ori	_aaMSSPa_194__init, $0, 18
	sw	$3, 0($4)
# was:	sw	_aaMSSPa_194__init, 0(_aaMSSPa_194__addr)
	la	$4, _a__str__33_
# was:	la	_a__str__33__addr, _a__str__33_
	ori	$3, $0, 1
# was:	ori	_a__str__33__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__33__init, 0(_a__str__33__addr)
	la	$4, _aa__str_29_
# was:	la	_aa__str_29__addr, _aa__str_29_
	ori	$3, $0, 2
# was:	ori	_aa__str_29__init, $0, 2
	sw	$3, 0($4)
# was:	sw	_aa__str_29__init, 0(_aa__str_29__addr)
	la	$4, _Introdu_24_
# was:	la	_Introdu_24__addr, _Introdu_24_
	ori	$3, $0, 17
# was:	ori	_Introdu_24__init, $0, 17
	sw	$3, 0($4)
# was:	sw	_Introdu_24__init, 0(_Introdu_24__addr)
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
	ori	$2, $0, 8
# was:	ori	_size_reg_3_, $0, 8
	bgez	$2, _safe_lab_4_
# was:	bgez	_size_reg_3_, _safe_lab_4_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_4_:
	ori	$3, $28, 0
# was:	ori	_letBind_2_, $28, 0
	sll	$4, $2, 2
# was:	sll	_tmp_10_, _size_reg_3_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_10_, _tmp_10_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_10_
	sw	$2, 0($3)
# was:	sw	_size_reg_3_, 0(_letBind_2_)
	addi	$5, $3, 4
# was:	addi	_addr_reg_5_, _letBind_2_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_6_, $0, 0
_loop_beg_7_:
	sub	$4, $6, $2
# was:	sub	_tmp_reg_9_, _i_reg_6_, _size_reg_3_
	bgez	$4, _loop_end_8_
# was:	bgez	_tmp_reg_9_, _loop_end_8_
	sw	$6, 0($5)
# was:	sw	_i_reg_6_, 0(_addr_reg_5_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_5_, _addr_reg_5_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_6_, _i_reg_6_, 1
	j	_loop_beg_7_
_loop_end_8_:
	ori	$2, $3, 0
# was:	ori	_arr_reg_13_, _letBind_2_, 0
	lw	$16, 0($2)
# was:	lw	_size_reg_12_, 0(_arr_reg_13_)
	ori	$17, $28, 0
# was:	ori	_letBind_11_, $28, 0
	sll	$3, $16, 2
# was:	sll	_tmp_34_, _size_reg_12_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_34_, _tmp_34_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_34_
	sw	$16, 0($17)
# was:	sw	_size_reg_12_, 0(_letBind_11_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_16_, _letBind_11_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_17_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_14_, _arr_reg_13_, 4
_loop_beg_18_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_20_, _i_reg_17_, _size_reg_12_
	bgez	$2, _loop_end_19_
# was:	bgez	_tmp_reg_20_, _loop_end_19_
	lw	$21, 0($20)
# was:	lw	_res_reg_15_, 0(_elem_reg_14_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_14_, _elem_reg_14_, 4
	la	$2, _Introdu_24_
# was:	la	_tmp_23_, _Introdu_24_
# _Introdu_24_: string "Introduce number "
# 	ori	_letBind_22_,_tmp_23_,0
# 	ori	$2,_tmp_23_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $21, 0
# was:	ori	_tmp_26_, _res_reg_15_, 0
# 	ori	_letBind_25_,_tmp_26_,0
# 	ori	$2,_letBind_25_,0
	jal	putint
# was:	jal	putint, $2
	la	$2, _aa__str_29_
# was:	la	_tmp_28_, _aa__str_29_
# _aa__str_29_: string ": "
# 	ori	_letBind_27_,_tmp_28_,0
# 	ori	$2,_tmp_28_,0
	jal	putstring
# was:	jal	putstring, $2
	jal	getint
# was:	jal	getint, $2
	ori	$21, $2, 0
# was:	ori	_letBind_30_, $2, 0
	la	$2, _a__str__33_
# was:	la	_tmp_32_, _a__str__33_
# _a__str__33_: string "\n"
# 	ori	_letBind_31_,_tmp_32_,0
# 	ori	$2,_tmp_32_,0
	jal	putstring
# was:	jal	putstring, $2
# 	ori	_fun_arg_res_21_,_letBind_30_,0
# 	ori	_res_reg_15_,_fun_arg_res_21_,0
	sw	$21, 0($18)
# was:	sw	_res_reg_15_, 0(_addr_reg_16_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_16_, _addr_reg_16_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_17_, _i_reg_17_, 1
	j	_loop_beg_18_
_loop_end_19_:
# 	ori	_arr_reg_37_,_letBind_11_,0
	lw	$9, 0($17)
# was:	lw	_size_reg_36_, 0(_arr_reg_37_)
	ori	$6, $28, 0
# was:	ori	_letBind_35_, $28, 0
	sll	$2, $9, 2
# was:	sll	_tmp_58_, _size_reg_36_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_58_, _tmp_58_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_58_
	sw	$9, 0($6)
# was:	sw	_size_reg_36_, 0(_letBind_35_)
	addi	$8, $6, 4
# was:	addi	_addr_reg_40_, _letBind_35_, 4
	ori	$7, $0, 0
# was:	ori	_i_reg_41_, $0, 0
	addi	$10, $17, 4
# was:	addi	_elem_reg_38_, _arr_reg_37_, 4
_loop_beg_42_:
	sub	$2, $7, $9
# was:	sub	_tmp_reg_44_, _i_reg_41_, _size_reg_36_
	bgez	$2, _loop_end_43_
# was:	bgez	_tmp_reg_44_, _loop_end_43_
	lw	$4, 0($10)
# was:	lw	_res_reg_39_, 0(_elem_reg_38_)
	addi	$10, $10, 4
# was:	addi	_elem_reg_38_, _elem_reg_38_, 4
# 	ori	_letBind_46_,_res_reg_39_,0
# 	ori	_lt_L_52_,_letBind_46_,0
	ori	$2, $0, 0
# was:	ori	_lt_R_53_, $0, 0
	slt	$2, $4, $2
# was:	slt	_cond_51_, _lt_L_52_, _lt_R_53_
	bne	$2, $0, _then_48_
# was:	bne	_cond_51_, $0, _then_48_
	j	_else_49_
_then_48_:
	ori	$3, $0, 0
# was:	ori	_letBind_47_, $0, 0
	j	_endif_50_
_else_49_:
	ori	$3, $4, 0
# was:	ori	_letBind_47_, _letBind_46_, 0
_endif_50_:
	ori	$2, $0, 4
# was:	ori	_size_reg_54_, $0, 4
	ori	$5, $28, 0
# was:	ori	_fun_arg_res_45_, $28, 0
	sll	$11, $2, 2
# was:	sll	_tmp_57_, _size_reg_54_, 2
	addi	$11, $11, 4
# was:	addi	_tmp_57_, _tmp_57_, 4
	add	$28, $28, $11
# was:	add	$28, $28, _tmp_57_
	sw	$2, 0($5)
# was:	sw	_size_reg_54_, 0(_fun_arg_res_45_)
	addi	$2, $5, 4
# was:	addi	_addr_reg_55_, _fun_arg_res_45_, 4
# 	ori	_tmp_reg_56_,_letBind_47_,0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_56_, 0(_addr_reg_55_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_55_, _addr_reg_55_, 4
# 	ori	_tmp_reg_56_,_letBind_47_,0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_56_, 0(_addr_reg_55_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_55_, _addr_reg_55_, 4
# 	ori	_tmp_reg_56_,_letBind_47_,0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_56_, 0(_addr_reg_55_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_55_, _addr_reg_55_, 4
	ori	$3, $4, 0
# was:	ori	_tmp_reg_56_, _letBind_46_, 0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_56_, 0(_addr_reg_55_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_55_, _addr_reg_55_, 4
	ori	$4, $5, 0
# was:	ori	_res_reg_39_, _fun_arg_res_45_, 0
	sw	$4, 0($8)
# was:	sw	_res_reg_39_, 0(_addr_reg_40_)
	addi	$8, $8, 4
# was:	addi	_addr_reg_40_, _addr_reg_40_, 4
	addi	$7, $7, 1
# was:	addi	_i_reg_41_, _i_reg_41_, 1
	j	_loop_beg_42_
_loop_end_43_:
	ori	$2, $0, 4
# was:	ori	_size_reg_60_, $0, 4
	ori	$16, $28, 0
# was:	ori	_letBind_59_, $28, 0
	sll	$3, $2, 2
# was:	sll	_tmp_63_, _size_reg_60_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_63_, _tmp_63_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_63_
	sw	$2, 0($16)
# was:	sw	_size_reg_60_, 0(_letBind_59_)
	addi	$2, $16, 4
# was:	addi	_addr_reg_61_, _letBind_59_, 4
	ori	$3, $0, 0
# was:	ori	_tmp_reg_62_, $0, 0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_62_, 0(_addr_reg_61_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_61_, _addr_reg_61_, 4
	ori	$3, $0, 0
# was:	ori	_tmp_reg_62_, $0, 0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_62_, 0(_addr_reg_61_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_61_, _addr_reg_61_, 4
	ori	$3, $0, 0
# was:	ori	_tmp_reg_62_, $0, 0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_62_, 0(_addr_reg_61_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_61_, _addr_reg_61_, 4
	ori	$3, $0, 0
# was:	ori	_tmp_reg_62_, $0, 0
	sw	$3, 0($2)
# was:	sw	_tmp_reg_62_, 0(_addr_reg_61_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_61_, _addr_reg_61_, 4
	ori	$2, $6, 0
# was:	ori	_arr_reg_65_, _letBind_35_, 0
	lw	$3, 0($2)
# was:	lw	_size_reg_66_, 0(_arr_reg_65_)
# 	ori	_letBind_64_,_letBind_59_,0
	addi	$2, $2, 4
# was:	addi	_arr_reg_65_, _arr_reg_65_, 4
	ori	$4, $0, 0
# was:	ori	_ind_var_67_, $0, 0
_loop_beg_69_:
	sub	$5, $4, $3
# was:	sub	_tmp_reg_68_, _ind_var_67_, _size_reg_66_
	bgez	$5, _loop_end_70_
# was:	bgez	_tmp_reg_68_, _loop_end_70_
	lw	$5, 0($2)
# was:	lw	_tmp_reg_68_, 0(_arr_reg_65_)
	addi	$2, $2, 4
# was:	addi	_arr_reg_65_, _arr_reg_65_, 4
	ori	$6, $0, 0
# was:	ori	_arr_ind_73_, $0, 0
	addi	$7, $16, 4
# was:	addi	_arr_reg_74_, _letBind_64_, 4
	lw	$8, 0($16)
# was:	lw	_size_reg_75_, 0(_letBind_64_)
	bgez	$6, _safe_lab_78_
# was:	bgez	_arr_ind_73_, _safe_lab_78_
_error_lab_77_:
	ori	$5, $0, 28
# was:	ori	$5, $0, 28
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_78_:
	sub	$8, $6, $8
# was:	sub	_tmp_reg_76_, _arr_ind_73_, _size_reg_75_
	bgez	$8, _error_lab_77_
# was:	bgez	_tmp_reg_76_, _error_lab_77_
	sll	$6, $6, 2
# was:	sll	_arr_ind_73_, _arr_ind_73_, 2
	add	$7, $7, $6
# was:	add	_arr_reg_74_, _arr_reg_74_, _arr_ind_73_
	lw	$8, 0($7)
# was:	lw	_letBind_72_, 0(_arr_reg_74_)
	ori	$6, $0, 0
# was:	ori	_arr_ind_80_, $0, 0
	addi	$7, $5, 4
# was:	addi	_arr_reg_81_, _tmp_reg_68_, 4
	lw	$9, 0($5)
# was:	lw	_size_reg_82_, 0(_tmp_reg_68_)
	bgez	$6, _safe_lab_85_
# was:	bgez	_arr_ind_80_, _safe_lab_85_
_error_lab_84_:
	ori	$5, $0, 28
# was:	ori	$5, $0, 28
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_85_:
	sub	$9, $6, $9
# was:	sub	_tmp_reg_83_, _arr_ind_80_, _size_reg_82_
	bgez	$9, _error_lab_84_
# was:	bgez	_tmp_reg_83_, _error_lab_84_
	sll	$6, $6, 2
# was:	sll	_arr_ind_80_, _arr_ind_80_, 2
	add	$7, $7, $6
# was:	add	_arr_reg_81_, _arr_reg_81_, _arr_ind_80_
	lw	$6, 0($7)
# was:	lw	_letBind_79_, 0(_arr_reg_81_)
# 	ori	_lt_L_91_,_letBind_72_,0
# 	ori	_lt_R_92_,_letBind_79_,0
	slt	$7, $8, $6
# was:	slt	_cond_90_, _lt_L_91_, _lt_R_92_
	bne	$7, $0, _then_87_
# was:	bne	_cond_90_, $0, _then_87_
	j	_else_88_
_then_87_:
	ori	$8, $6, 0
# was:	ori	_letBind_86_, _letBind_79_, 0
	j	_endif_89_
_else_88_:
# 	ori	_letBind_86_,_letBind_72_,0
_endif_89_:
	ori	$7, $0, 2
# was:	ori	_arr_ind_96_, $0, 2
	addi	$6, $16, 4
# was:	addi	_arr_reg_97_, _letBind_64_, 4
	lw	$9, 0($16)
# was:	lw	_size_reg_98_, 0(_letBind_64_)
	bgez	$7, _safe_lab_101_
# was:	bgez	_arr_ind_96_, _safe_lab_101_
_error_lab_100_:
	ori	$5, $0, 28
# was:	ori	$5, $0, 28
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_101_:
	sub	$9, $7, $9
# was:	sub	_tmp_reg_99_, _arr_ind_96_, _size_reg_98_
	bgez	$9, _error_lab_100_
# was:	bgez	_tmp_reg_99_, _error_lab_100_
	sll	$7, $7, 2
# was:	sll	_arr_ind_96_, _arr_ind_96_, 2
	add	$6, $6, $7
# was:	add	_arr_reg_97_, _arr_reg_97_, _arr_ind_96_
	lw	$9, 0($6)
# was:	lw	_plus_L_94_, 0(_arr_reg_97_)
	ori	$6, $0, 1
# was:	ori	_arr_ind_102_, $0, 1
	addi	$7, $5, 4
# was:	addi	_arr_reg_103_, _tmp_reg_68_, 4
	lw	$10, 0($5)
# was:	lw	_size_reg_104_, 0(_tmp_reg_68_)
	bgez	$6, _safe_lab_107_
# was:	bgez	_arr_ind_102_, _safe_lab_107_
_error_lab_106_:
	ori	$5, $0, 28
# was:	ori	$5, $0, 28
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_107_:
	sub	$10, $6, $10
# was:	sub	_tmp_reg_105_, _arr_ind_102_, _size_reg_104_
	bgez	$10, _error_lab_106_
# was:	bgez	_tmp_reg_105_, _error_lab_106_
	sll	$6, $6, 2
# was:	sll	_arr_ind_102_, _arr_ind_102_, 2
	add	$7, $7, $6
# was:	add	_arr_reg_103_, _arr_reg_103_, _arr_ind_102_
	lw	$6, 0($7)
# was:	lw	_plus_R_95_, 0(_arr_reg_103_)
	add	$7, $9, $6
# was:	add	_letBind_93_, _plus_L_94_, _plus_R_95_
# 	ori	_lt_L_113_,_letBind_86_,0
# 	ori	_lt_R_114_,_letBind_93_,0
	slt	$6, $8, $7
# was:	slt	_cond_112_, _lt_L_113_, _lt_R_114_
	bne	$6, $0, _then_109_
# was:	bne	_cond_112_, $0, _then_109_
	j	_else_110_
_then_109_:
	ori	$6, $7, 0
# was:	ori	_letBind_108_, _letBind_93_, 0
	j	_endif_111_
_else_110_:
	ori	$6, $8, 0
# was:	ori	_letBind_108_, _letBind_86_, 0
_endif_111_:
	ori	$7, $0, 1
# was:	ori	_arr_ind_116_, $0, 1
	addi	$8, $16, 4
# was:	addi	_arr_reg_117_, _letBind_64_, 4
	lw	$9, 0($16)
# was:	lw	_size_reg_118_, 0(_letBind_64_)
	bgez	$7, _safe_lab_121_
# was:	bgez	_arr_ind_116_, _safe_lab_121_
_error_lab_120_:
	ori	$5, $0, 29
# was:	ori	$5, $0, 29
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_121_:
	sub	$9, $7, $9
# was:	sub	_tmp_reg_119_, _arr_ind_116_, _size_reg_118_
	bgez	$9, _error_lab_120_
# was:	bgez	_tmp_reg_119_, _error_lab_120_
	sll	$7, $7, 2
# was:	sll	_arr_ind_116_, _arr_ind_116_, 2
	add	$8, $8, $7
# was:	add	_arr_reg_117_, _arr_reg_117_, _arr_ind_116_
	lw	$9, 0($8)
# was:	lw	_letBind_115_, 0(_arr_reg_117_)
	ori	$7, $0, 3
# was:	ori	_arr_ind_125_, $0, 3
	addi	$8, $16, 4
# was:	addi	_arr_reg_126_, _letBind_64_, 4
	lw	$10, 0($16)
# was:	lw	_size_reg_127_, 0(_letBind_64_)
	bgez	$7, _safe_lab_130_
# was:	bgez	_arr_ind_125_, _safe_lab_130_
_error_lab_129_:
	ori	$5, $0, 29
# was:	ori	$5, $0, 29
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_130_:
	sub	$10, $7, $10
# was:	sub	_tmp_reg_128_, _arr_ind_125_, _size_reg_127_
	bgez	$10, _error_lab_129_
# was:	bgez	_tmp_reg_128_, _error_lab_129_
	sll	$7, $7, 2
# was:	sll	_arr_ind_125_, _arr_ind_125_, 2
	add	$8, $8, $7
# was:	add	_arr_reg_126_, _arr_reg_126_, _arr_ind_125_
	lw	$10, 0($8)
# was:	lw	_plus_L_123_, 0(_arr_reg_126_)
	ori	$7, $0, 1
# was:	ori	_arr_ind_131_, $0, 1
	addi	$8, $5, 4
# was:	addi	_arr_reg_132_, _tmp_reg_68_, 4
	lw	$11, 0($5)
# was:	lw	_size_reg_133_, 0(_tmp_reg_68_)
	bgez	$7, _safe_lab_136_
# was:	bgez	_arr_ind_131_, _safe_lab_136_
_error_lab_135_:
	ori	$5, $0, 29
# was:	ori	$5, $0, 29
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_136_:
	sub	$11, $7, $11
# was:	sub	_tmp_reg_134_, _arr_ind_131_, _size_reg_133_
	bgez	$11, _error_lab_135_
# was:	bgez	_tmp_reg_134_, _error_lab_135_
	sll	$7, $7, 2
# was:	sll	_arr_ind_131_, _arr_ind_131_, 2
	add	$8, $8, $7
# was:	add	_arr_reg_132_, _arr_reg_132_, _arr_ind_131_
	lw	$7, 0($8)
# was:	lw	_plus_R_124_, 0(_arr_reg_132_)
	add	$10, $10, $7
# was:	add	_letBind_122_, _plus_L_123_, _plus_R_124_
# 	ori	_lt_L_142_,_letBind_115_,0
# 	ori	_lt_R_143_,_letBind_122_,0
	slt	$7, $9, $10
# was:	slt	_cond_141_, _lt_L_142_, _lt_R_143_
	bne	$7, $0, _then_138_
# was:	bne	_cond_141_, $0, _then_138_
	j	_else_139_
_then_138_:
# 	ori	_letBind_137_,_letBind_122_,0
	j	_endif_140_
_else_139_:
	ori	$10, $9, 0
# was:	ori	_letBind_137_, _letBind_115_, 0
_endif_140_:
	ori	$7, $0, 2
# was:	ori	_arr_ind_147_, $0, 2
	addi	$8, $16, 4
# was:	addi	_arr_reg_148_, _letBind_64_, 4
	lw	$9, 0($16)
# was:	lw	_size_reg_149_, 0(_letBind_64_)
	bgez	$7, _safe_lab_152_
# was:	bgez	_arr_ind_147_, _safe_lab_152_
_error_lab_151_:
	ori	$5, $0, 30
# was:	ori	$5, $0, 30
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_152_:
	sub	$9, $7, $9
# was:	sub	_tmp_reg_150_, _arr_ind_147_, _size_reg_149_
	bgez	$9, _error_lab_151_
# was:	bgez	_tmp_reg_150_, _error_lab_151_
	sll	$7, $7, 2
# was:	sll	_arr_ind_147_, _arr_ind_147_, 2
	add	$8, $8, $7
# was:	add	_arr_reg_148_, _arr_reg_148_, _arr_ind_147_
	lw	$8, 0($8)
# was:	lw	_plus_L_145_, 0(_arr_reg_148_)
	ori	$9, $0, 3
# was:	ori	_arr_ind_153_, $0, 3
	addi	$7, $5, 4
# was:	addi	_arr_reg_154_, _tmp_reg_68_, 4
	lw	$11, 0($5)
# was:	lw	_size_reg_155_, 0(_tmp_reg_68_)
	bgez	$9, _safe_lab_158_
# was:	bgez	_arr_ind_153_, _safe_lab_158_
_error_lab_157_:
	ori	$5, $0, 30
# was:	ori	$5, $0, 30
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_158_:
	sub	$11, $9, $11
# was:	sub	_tmp_reg_156_, _arr_ind_153_, _size_reg_155_
	bgez	$11, _error_lab_157_
# was:	bgez	_tmp_reg_156_, _error_lab_157_
	sll	$9, $9, 2
# was:	sll	_arr_ind_153_, _arr_ind_153_, 2
	add	$7, $7, $9
# was:	add	_arr_reg_154_, _arr_reg_154_, _arr_ind_153_
	lw	$7, 0($7)
# was:	lw	_plus_R_146_, 0(_arr_reg_154_)
	add	$9, $8, $7
# was:	add	_letBind_144_, _plus_L_145_, _plus_R_146_
	ori	$8, $0, 2
# was:	ori	_arr_ind_160_, $0, 2
	addi	$7, $5, 4
# was:	addi	_arr_reg_161_, _tmp_reg_68_, 4
	lw	$11, 0($5)
# was:	lw	_size_reg_162_, 0(_tmp_reg_68_)
	bgez	$8, _safe_lab_165_
# was:	bgez	_arr_ind_160_, _safe_lab_165_
_error_lab_164_:
	ori	$5, $0, 30
# was:	ori	$5, $0, 30
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_165_:
	sub	$11, $8, $11
# was:	sub	_tmp_reg_163_, _arr_ind_160_, _size_reg_162_
	bgez	$11, _error_lab_164_
# was:	bgez	_tmp_reg_163_, _error_lab_164_
	sll	$8, $8, 2
# was:	sll	_arr_ind_160_, _arr_ind_160_, 2
	add	$7, $7, $8
# was:	add	_arr_reg_161_, _arr_reg_161_, _arr_ind_160_
	lw	$7, 0($7)
# was:	lw	_letBind_159_, 0(_arr_reg_161_)
# 	ori	_lt_L_171_,_letBind_144_,0
# 	ori	_lt_R_172_,_letBind_159_,0
	slt	$8, $9, $7
# was:	slt	_cond_170_, _lt_L_171_, _lt_R_172_
	bne	$8, $0, _then_167_
# was:	bne	_cond_170_, $0, _then_167_
	j	_else_168_
_then_167_:
	ori	$9, $7, 0
# was:	ori	_letBind_166_, _letBind_159_, 0
	j	_endif_169_
_else_168_:
# 	ori	_letBind_166_,_letBind_144_,0
_endif_169_:
	ori	$8, $0, 3
# was:	ori	_arr_ind_176_, $0, 3
	addi	$7, $16, 4
# was:	addi	_arr_reg_177_, _letBind_64_, 4
	lw	$11, 0($16)
# was:	lw	_size_reg_178_, 0(_letBind_64_)
	bgez	$8, _safe_lab_181_
# was:	bgez	_arr_ind_176_, _safe_lab_181_
_error_lab_180_:
	ori	$5, $0, 31
# was:	ori	$5, $0, 31
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_181_:
	sub	$11, $8, $11
# was:	sub	_tmp_reg_179_, _arr_ind_176_, _size_reg_178_
	bgez	$11, _error_lab_180_
# was:	bgez	_tmp_reg_179_, _error_lab_180_
	sll	$8, $8, 2
# was:	sll	_arr_ind_176_, _arr_ind_176_, 2
	add	$7, $7, $8
# was:	add	_arr_reg_177_, _arr_reg_177_, _arr_ind_176_
	lw	$11, 0($7)
# was:	lw	_plus_L_174_, 0(_arr_reg_177_)
	ori	$7, $0, 3
# was:	ori	_arr_ind_182_, $0, 3
	addi	$8, $5, 4
# was:	addi	_arr_reg_183_, _tmp_reg_68_, 4
	lw	$5, 0($5)
# was:	lw	_size_reg_184_, 0(_tmp_reg_68_)
	bgez	$7, _safe_lab_187_
# was:	bgez	_arr_ind_182_, _safe_lab_187_
_error_lab_186_:
	ori	$5, $0, 31
# was:	ori	$5, $0, 31
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_187_:
	sub	$5, $7, $5
# was:	sub	_tmp_reg_185_, _arr_ind_182_, _size_reg_184_
	bgez	$5, _error_lab_186_
# was:	bgez	_tmp_reg_185_, _error_lab_186_
	sll	$7, $7, 2
# was:	sll	_arr_ind_182_, _arr_ind_182_, 2
	add	$8, $8, $7
# was:	add	_arr_reg_183_, _arr_reg_183_, _arr_ind_182_
	lw	$5, 0($8)
# was:	lw	_plus_R_175_, 0(_arr_reg_183_)
	add	$7, $11, $5
# was:	add	_letBind_173_, _plus_L_174_, _plus_R_175_
	ori	$8, $0, 4
# was:	ori	_size_reg_188_, $0, 4
	ori	$16, $28, 0
# was:	ori	_fun_arg_res_71_, $28, 0
	sll	$5, $8, 2
# was:	sll	_tmp_191_, _size_reg_188_, 2
	addi	$5, $5, 4
# was:	addi	_tmp_191_, _tmp_191_, 4
	add	$28, $28, $5
# was:	add	$28, $28, _tmp_191_
	sw	$8, 0($16)
# was:	sw	_size_reg_188_, 0(_fun_arg_res_71_)
	addi	$5, $16, 4
# was:	addi	_addr_reg_189_, _fun_arg_res_71_, 4
# 	ori	_tmp_reg_190_,_letBind_108_,0
	sw	$6, 0($5)
# was:	sw	_tmp_reg_190_, 0(_addr_reg_189_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_189_, _addr_reg_189_, 4
	ori	$6, $10, 0
# was:	ori	_tmp_reg_190_, _letBind_137_, 0
	sw	$6, 0($5)
# was:	sw	_tmp_reg_190_, 0(_addr_reg_189_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_189_, _addr_reg_189_, 4
	ori	$6, $9, 0
# was:	ori	_tmp_reg_190_, _letBind_166_, 0
	sw	$6, 0($5)
# was:	sw	_tmp_reg_190_, 0(_addr_reg_189_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_189_, _addr_reg_189_, 4
	ori	$6, $7, 0
# was:	ori	_tmp_reg_190_, _letBind_173_, 0
	sw	$6, 0($5)
# was:	sw	_tmp_reg_190_, 0(_addr_reg_189_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_189_, _addr_reg_189_, 4
# 	ori	_letBind_64_,_fun_arg_res_71_,0
	addi	$4, $4, 1
# was:	addi	_ind_var_67_, _ind_var_67_, 1
	j	_loop_beg_69_
_loop_end_70_:
	la	$2, _aaMSSPa_194_
# was:	la	_tmp_193_, _aaMSSPa_194_
# _aaMSSPa_194_: string "\n\nMSSP result is: "
# 	ori	_letBind_192_,_tmp_193_,0
# 	ori	$2,_tmp_193_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$3, $0, 0
# was:	ori	_arr_ind_196_, $0, 0
	addi	$2, $16, 4
# was:	addi	_arr_reg_197_, _letBind_64_, 4
	lw	$4, 0($16)
# was:	lw	_size_reg_198_, 0(_letBind_64_)
	bgez	$3, _safe_lab_201_
# was:	bgez	_arr_ind_196_, _safe_lab_201_
_error_lab_200_:
	ori	$5, $0, 44
# was:	ori	$5, $0, 44
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_201_:
	sub	$4, $3, $4
# was:	sub	_tmp_reg_199_, _arr_ind_196_, _size_reg_198_
	bgez	$4, _error_lab_200_
# was:	bgez	_tmp_reg_199_, _error_lab_200_
	sll	$3, $3, 2
# was:	sll	_arr_ind_196_, _arr_ind_196_, 2
	add	$2, $2, $3
# was:	add	_arr_reg_197_, _arr_reg_197_, _arr_ind_196_
	lw	$16, 0($2)
# was:	lw	_tmp_195_, 0(_arr_reg_197_)
# 	ori	_mainres_1_,_tmp_195_,0
	ori	$2, $16, 0
# was:	ori	$2, _mainres_1_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $16, 0
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
_aaMSSPa_194_:
	.space	4
	.asciiz	"\n\nMSSP result is: "
	.align	2
_a__str__33_:
	.space	4
	.asciiz	"\n"
	.align	2
_aa__str_29_:
	.space	4
	.asciiz	": "
	.align	2
_Introdu_24_:
	.space	4
	.asciiz	"Introduce number "
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