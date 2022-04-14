circuit ibex_decoder: @[ibex_decoder.v:1.1-458.10]
  module ibex_decoder: @[ibex_decoder.v:1.1-458.10]
    output branch_in_dec_o: UInt<1> @[ibex_decoder.v:82.13-82.28]
    output jump_in_dec_o: UInt<1> @[ibex_decoder.v:81.13-81.26]
    output data_sign_extension_o: UInt<1> @[ibex_decoder.v:80.13-80.34]
    output data_type_o: UInt<2> @[ibex_decoder.v:79.19-79.30]
    output data_we_o: UInt<1> @[ibex_decoder.v:78.13-78.22]
    output data_req_o: UInt<1> @[ibex_decoder.v:77.13-77.23]
    output csr_pipe_flush_o: UInt<1> @[ibex_decoder.v:76.13-76.29]
    output csr_op_o: UInt<2> @[ibex_decoder.v:75.19-75.27]
    output csr_access_o: UInt<1> @[ibex_decoder.v:74.13-74.25]
    output multdiv_signed_mode_o: UInt<2> @[ibex_decoder.v:73.19-73.40]
    output multdiv_operator_o: UInt<2> @[ibex_decoder.v:72.19-72.37]
    output div_en_o: UInt<1> @[ibex_decoder.v:71.13-71.21]
    output mult_en_o: UInt<1> @[ibex_decoder.v:70.13-70.22]
    output alu_op_b_mux_sel_o: UInt<1> @[ibex_decoder.v:69.13-69.31]
    output alu_op_a_mux_sel_o: UInt<2> @[ibex_decoder.v:68.19-68.37]
    output alu_operator_o: UInt<5> @[ibex_decoder.v:67.19-67.33]
    output regfile_waddr_o: UInt<5> @[ibex_decoder.v:66.20-66.35]
    output regfile_raddr_b_o: UInt<5> @[ibex_decoder.v:65.20-65.37]
    output regfile_raddr_a_o: UInt<5> @[ibex_decoder.v:64.20-64.37]
    output regfile_we_o: UInt<1> @[ibex_decoder.v:63.14-63.26]
    output regfile_wdata_sel_o: UInt<2> @[ibex_decoder.v:62.19-62.38]
    output zimm_rs1_type_o: UInt<32> @[ibex_decoder.v:61.21-61.36]
    output imm_j_type_o: UInt<32> @[ibex_decoder.v:60.21-60.33]
    output imm_u_type_o: UInt<32> @[ibex_decoder.v:59.21-59.33]
    output imm_b_type_o: UInt<32> @[ibex_decoder.v:58.21-58.33]
    output imm_s_type_o: UInt<32> @[ibex_decoder.v:57.21-57.33]
    output imm_i_type_o: UInt<32> @[ibex_decoder.v:56.21-56.33]
    output imm_b_mux_sel_o: UInt<3> @[ibex_decoder.v:55.19-55.34]
    output imm_a_mux_sel_o: UInt<1> @[ibex_decoder.v:54.13-54.28]
    input illegal_c_insn_i: UInt<1> @[ibex_decoder.v:53.13-53.29]
    input instr_rdata_i: UInt<32> @[ibex_decoder.v:52.20-52.33]
    input instr_new_i: UInt<1> @[ibex_decoder.v:51.13-51.24]
    output jump_set_o: UInt<1> @[ibex_decoder.v:50.13-50.23]
    output wfi_insn_o: UInt<1> @[ibex_decoder.v:49.13-49.23]
    output ecall_insn_o: UInt<1> @[ibex_decoder.v:48.13-48.25]
    output dret_insn_o: UInt<1> @[ibex_decoder.v:47.13-47.24]
    output mret_insn_o: UInt<1> @[ibex_decoder.v:46.13-46.24]
    output ebrk_insn_o: UInt<1> @[ibex_decoder.v:45.13-45.24]
    output illegal_insn_o: UInt<1> @[ibex_decoder.v:44.14-44.28]

    wire _and_ibex_decoder_v_445_81_Y: UInt<1> @[ibex_decoder.v:445.25-445.56]
    wire _not_ibex_decoder_v_445_80_Y: UInt<1> @[ibex_decoder.v:445.38-445.56]
    wire _or_ibex_decoder_v_444_79_Y: UInt<1> @[ibex_decoder.v:444.27-444.59]
    wire _7_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_branch_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_data_we_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_data_req_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_div_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_mult_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _18_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _3_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _7_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _17_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _logic_or_ibex_decoder_v_406_78_Y: UInt<1> @[ibex_decoder.v:406.11-406.59]
    wire _ne_ibex_decoder_v_406_77_Y: UInt<1> @[ibex_decoder.v:406.38-406.58]
    wire _ne_ibex_decoder_v_406_76_Y: UInt<1> @[ibex_decoder.v:406.12-406.32]
    wire _16_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_wfi_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_ecall_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_dret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_mret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_ebrk_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _6_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _15_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _7_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _2_regfile_wdata_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _7_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _2_imm_a_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_wfi_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_ecall_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_dret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_mret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_ebrk_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _eq_ibex_decoder_v_395_75_Y: UInt<1> @[ibex_decoder.v:395.10-395.32]
    wire _5_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _14_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _11_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _6_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _4_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _13_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_multdiv_signed_mode_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _3_multdiv_operator_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _3_div_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_mult_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _10_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _12_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_multdiv_signed_mode_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _2_multdiv_operator_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _2_div_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_mult_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _9_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _11_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _8_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _eq_ibex_decoder_v_290_74_Y: UInt<1> @[ibex_decoder.v:290.17-290.44]
    wire _10_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _7_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _eq_ibex_decoder_v_288_73_Y: UInt<1> @[ibex_decoder.v:288.12-288.32]
    wire _9_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _ne_ibex_decoder_v_284_72_Y: UInt<1> @[ibex_decoder.v:284.12-284.32]
    wire _8_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _7_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _not_ibex_decoder_v_243_71_Y: UInt<1> @[ibex_decoder.v:243.29-243.39]
    wire _5_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _4_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _logic_not_ibex_decoder_v_221_70_Y: UInt<1> @[ibex_decoder.v:221.9-221.19]
    wire _4_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _5_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _4_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _3_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _2_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _ne_ibex_decoder_v_189_69_Y: UInt<1> @[ibex_decoder.v:189.10-189.30]
    wire _3_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _3_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _3_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _3_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _2_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _2_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _2_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_branch_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_sign_extension_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_we_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_req_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_multdiv_signed_mode_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_multdiv_operator_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_div_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_mult_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _1_regfile_wdata_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _1_imm_a_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_wfi_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_ecall_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_dret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_mret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_ebrk_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_sv2v_cast_DB892_func_ibex_decoder_v_152_7_inp_6_0__68: UInt<7> @[ibex_decoder.v:124.2-443.5]
    wire _0_sv2v_cast_DB892_func_ibex_decoder_v_152_7__result_6_0__67: UInt<7> @[ibex_decoder.v:124.2-443.5]
    wire _0_opcode_6_0_: UInt<7> @[ibex_decoder.v:124.2-443.5]
    wire _0_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_branch_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_sign_extension_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_we_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_req_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_multdiv_signed_mode_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_multdiv_operator_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_div_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_mult_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _0_regfile_wdata_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _0_imm_a_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_wfi_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_ecall_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_dret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_mret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_ebrk_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_or_ibex_decoder_v_121_65_Y: UInt<1> @[ibex_decoder.v:121.9-121.206]
    wire _eq_ibex_decoder_v_121_64_Y: UInt<1> @[ibex_decoder.v:121.159-121.205]
    wire _logic_or_ibex_decoder_v_121_63_Y: UInt<1> @[ibex_decoder.v:121.10-121.153]
    wire _eq_ibex_decoder_v_121_62_Y: UInt<1> @[ibex_decoder.v:121.106-121.152]
    wire _logic_or_ibex_decoder_v_121_61_Y: UInt<1> @[ibex_decoder.v:121.11-121.100]
    wire _eq_ibex_decoder_v_121_60_Y: UInt<1> @[ibex_decoder.v:121.59-121.99]
    wire _eq_ibex_decoder_v_121_59_Y: UInt<1> @[ibex_decoder.v:121.12-121.53]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp_11_0__58: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_6__result_11_0__57: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp_11_0__56: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_5__result_11_0__55: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp_11_0__54: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_4__result_11_0__53: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp_11_0__52: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_3__result_11_0__51: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _3_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_and_ibex_decoder_v_120_50_Y: UInt<1> @[ibex_decoder.v:120.13-120.64]
    wire _ne_ibex_decoder_v_120_49_Y: UInt<1> @[ibex_decoder.v:120.40-120.63]
    wire _eq_ibex_decoder_v_120_48_Y: UInt<1> @[ibex_decoder.v:120.14-120.34]
    wire _2_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_or_ibex_decoder_v_117_47_Y: UInt<1> @[ibex_decoder.v:117.9-117.101]
    wire _eq_ibex_decoder_v_117_46_Y: UInt<1> @[ibex_decoder.v:117.60-117.100]
    wire _eq_ibex_decoder_v_117_45_Y: UInt<1> @[ibex_decoder.v:117.10-117.54]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp_11_0__44: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_6__result_11_0__43: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp_11_0__42: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_5__result_11_0__41: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp_11_0__40: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_4__result_11_0__39: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp_11_0__38: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_3__result_11_0__37: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_2_inp_11_0__36: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_2__result_11_0__35: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_1_inp_11_0__34: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_1__result_11_0__33: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_and_ibex_decoder_v_116_32_Y: UInt<1> @[ibex_decoder.v:116.8-116.90]
    wire _logic_or_ibex_decoder_v_116_31_Y: UInt<1> @[ibex_decoder.v:116.35-116.89]
    wire _eq_ibex_decoder_v_116_30_Y: UInt<1> @[ibex_decoder.v:116.66-116.88]
    wire _eq_ibex_decoder_v_116_29_Y: UInt<1> @[ibex_decoder.v:116.36-116.60]
    wire _eq_ibex_decoder_v_116_28_Y: UInt<1> @[ibex_decoder.v:116.9-116.29]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp_11_0__27: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_6__result_11_0__26: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp_11_0__25: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_5__result_11_0__24: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp_11_0__23: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_4__result_11_0__22: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp_11_0__21: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_3__result_11_0__20: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_2_inp_11_0__19: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_2__result_11_0__18: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_1_inp_11_0__17: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_1__result_11_0__16: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _1_csr_op_o_1_0_: UInt<2> @[ibex_decoder.v:109.2-113.5]
    wire _logic_and_ibex_decoder_v_111_14_Y: UInt<1> @[ibex_decoder.v:111.8-111.87]
    wire _eq_ibex_decoder_v_111_13_Y: UInt<1> @[ibex_decoder.v:111.65-111.86]
    wire _logic_or_ibex_decoder_v_111_12_Y: UInt<1> @[ibex_decoder.v:111.9-111.59]
    wire _eq_ibex_decoder_v_111_11_Y: UInt<1> @[ibex_decoder.v:111.36-111.58]
    wire _eq_ibex_decoder_v_111_10_Y: UInt<1> @[ibex_decoder.v:111.10-111.30]
    wire _0_csr_op_o_1_0_: UInt<2> @[ibex_decoder.v:109.2-113.5]
    wire sv2v_cast_DB892_func_ibex_decoder_v_152_7_inp: UInt<7> @[ibex_decoder.v:455.21-455.24]
    wire sv2v_cast_DB892_func_ibex_decoder_v_152_7__result: UInt<7> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_6__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_5__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_4__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_3__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_2_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_2__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_1_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_1__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire opcode: UInt<7> @[ibex_decoder.v:90.12-90.18]
    wire csr_op: UInt<2> @[ibex_decoder.v:89.12-89.18]
    wire instr: UInt<32> @[ibex_decoder.v:88.14-88.19]
    wire regfile_we: UInt<1> @[ibex_decoder.v:87.6-87.16]
    wire csr_illegal: UInt<1> @[ibex_decoder.v:86.6-86.17]
    wire illegal_reg_rv32e: UInt<1> @[ibex_decoder.v:85.7-85.24]
    wire illegal_insn: UInt<1> @[ibex_decoder.v:84.6-84.18]
    wire _and_ibex_decoder_v_445_81: UInt<1> @[ibex_decoder.v:445.25-445.56]
    wire _not_ibex_decoder_v_445_80: UInt<1> @[ibex_decoder.v:445.38-445.56]
    wire _or_ibex_decoder_v_444_79: UInt<1> @[ibex_decoder.v:444.27-444.59]
    wire _logic_or_ibex_decoder_v_406_78: UInt<1> @[ibex_decoder.v:406.11-406.59]
    wire _ne_ibex_decoder_v_406_77: UInt<1> @[ibex_decoder.v:406.38-406.58]
    wire _ne_ibex_decoder_v_406_76: UInt<1> @[ibex_decoder.v:406.12-406.32]
    wire _eq_ibex_decoder_v_395_75: UInt<1> @[ibex_decoder.v:395.10-395.32]
    wire _eq_ibex_decoder_v_290_74: UInt<1> @[ibex_decoder.v:290.17-290.44]
    wire _eq_ibex_decoder_v_288_73: UInt<1> @[ibex_decoder.v:288.12-288.32]
    wire _ne_ibex_decoder_v_284_72: UInt<1> @[ibex_decoder.v:284.12-284.32]
    wire _not_ibex_decoder_v_243_71: UInt<1> @[ibex_decoder.v:243.29-243.39]
    wire _logic_not_ibex_decoder_v_221_70: UInt<1> @[ibex_decoder.v:221.9-221.19]
    wire _ne_ibex_decoder_v_189_69: UInt<1> @[ibex_decoder.v:189.10-189.30]
    wire _logic_or_ibex_decoder_v_121_65: UInt<1> @[ibex_decoder.v:121.9-121.206]
    wire _eq_ibex_decoder_v_121_64: UInt<1> @[ibex_decoder.v:121.159-121.205]
    wire _logic_or_ibex_decoder_v_121_63: UInt<1> @[ibex_decoder.v:121.10-121.153]
    wire _eq_ibex_decoder_v_121_62: UInt<1> @[ibex_decoder.v:121.106-121.152]
    wire _logic_or_ibex_decoder_v_121_61: UInt<1> @[ibex_decoder.v:121.11-121.100]
    wire _eq_ibex_decoder_v_121_60: UInt<1> @[ibex_decoder.v:121.59-121.99]
    wire _eq_ibex_decoder_v_121_59: UInt<1> @[ibex_decoder.v:121.12-121.53]
    wire _logic_and_ibex_decoder_v_120_50: UInt<1> @[ibex_decoder.v:120.13-120.64]
    wire _ne_ibex_decoder_v_120_49: UInt<1> @[ibex_decoder.v:120.40-120.63]
    wire _eq_ibex_decoder_v_120_48: UInt<1> @[ibex_decoder.v:120.14-120.34]
    wire _logic_or_ibex_decoder_v_117_47: UInt<1> @[ibex_decoder.v:117.9-117.101]
    wire _eq_ibex_decoder_v_117_46: UInt<1> @[ibex_decoder.v:117.60-117.100]
    wire _eq_ibex_decoder_v_117_45: UInt<1> @[ibex_decoder.v:117.10-117.54]
    wire _logic_and_ibex_decoder_v_116_32: UInt<1> @[ibex_decoder.v:116.8-116.90]
    wire _logic_or_ibex_decoder_v_116_31: UInt<1> @[ibex_decoder.v:116.35-116.89]
    wire _eq_ibex_decoder_v_116_30: UInt<1> @[ibex_decoder.v:116.66-116.88]
    wire _eq_ibex_decoder_v_116_29: UInt<1> @[ibex_decoder.v:116.36-116.60]
    wire _eq_ibex_decoder_v_116_28: UInt<1> @[ibex_decoder.v:116.9-116.29]
    wire _logic_and_ibex_decoder_v_111_14: UInt<1> @[ibex_decoder.v:111.8-111.87]
    wire _eq_ibex_decoder_v_111_13: UInt<1> @[ibex_decoder.v:111.65-111.86]
    wire _logic_or_ibex_decoder_v_111_12: UInt<1> @[ibex_decoder.v:111.9-111.59]
    wire _eq_ibex_decoder_v_111_11: UInt<1> @[ibex_decoder.v:111.36-111.58]
    wire _eq_ibex_decoder_v_111_10: UInt<1> @[ibex_decoder.v:111.10-111.30]
    wire _0: UInt<32>
    wire _1: UInt<32>
    wire _2: UInt<32>
    wire _3: UInt<32>
    wire _4: UInt<32>
    wire _5: UInt<32>
    wire _6: UInt<32>
    wire _7: UInt<5>
    wire _8: UInt<5>
    wire _9: UInt<5>
    wire _10: UInt<1>
    wire _11: UInt<1>
    wire _12: UInt<1>
    _7_regfile_we_0_0_ is invalid
    _2_branch_in_dec_o_0_0_ is invalid
    _3_jump_in_dec_o_0_0_ is invalid
    _2_data_we_o_0_0_ is invalid
    _2_data_req_o_0_0_ is invalid
    _3_csr_access_o_0_0_ is invalid
    _4_div_en_o_0_0_ is invalid
    _4_mult_en_o_0_0_ is invalid
    _6_jump_set_o_0_0_ is invalid
    _18_illegal_insn_0_0_ is invalid
    _3_csr_op_1_0_ is invalid
    _3_csr_illegal_0_0_ is invalid
    _7_alu_op_a_mux_sel_o_1_0_ is invalid
    _17_illegal_insn_0_0_ is invalid
    _16_illegal_insn_0_0_ is invalid
    _3_wfi_insn_o_0_0_ is invalid
    _3_ecall_insn_o_0_0_ is invalid
    _3_dret_insn_o_0_0_ is invalid
    _3_mret_insn_o_0_0_ is invalid
    _3_ebrk_insn_o_0_0_ is invalid
    _2_csr_op_1_0_ is invalid
    _6_regfile_we_0_0_ is invalid
    _2_csr_illegal_0_0_ is invalid
    _15_illegal_insn_0_0_ is invalid
    _2_csr_access_o_0_0_ is invalid
    _7_alu_op_b_mux_sel_o_0_0_ is invalid
    _6_alu_op_a_mux_sel_o_1_0_ is invalid
    _2_regfile_wdata_sel_o_1_0_ is invalid
    _7_imm_b_mux_sel_o_2_0_ is invalid
    _2_imm_a_mux_sel_o_0_0_ is invalid
    _2_wfi_insn_o_0_0_ is invalid
    _2_ecall_insn_o_0_0_ is invalid
    _2_dret_insn_o_0_0_ is invalid
    _2_mret_insn_o_0_0_ is invalid
    _2_ebrk_insn_o_0_0_ is invalid
    _5_jump_set_o_0_0_ is invalid
    _5_regfile_we_0_0_ is invalid
    _14_illegal_insn_0_0_ is invalid
    _2_jump_in_dec_o_0_0_ is invalid
    _6_alu_op_b_mux_sel_o_0_0_ is invalid
    _5_alu_op_a_mux_sel_o_1_0_ is invalid
    _11_alu_operator_o_4_0_ is invalid
    _6_imm_b_mux_sel_o_2_0_ is invalid
    _4_jump_set_o_0_0_ is invalid
    _13_illegal_insn_0_0_ is invalid
    _3_multdiv_signed_mode_o_1_0_ is invalid
    _3_multdiv_operator_o_1_0_ is invalid
    _3_div_en_o_0_0_ is invalid
    _3_mult_en_o_0_0_ is invalid
    _10_alu_operator_o_4_0_ is invalid
    _12_illegal_insn_0_0_ is invalid
    _2_multdiv_signed_mode_o_1_0_ is invalid
    _2_multdiv_operator_o_1_0_ is invalid
    _2_div_en_o_0_0_ is invalid
    _2_mult_en_o_0_0_ is invalid
    _9_alu_operator_o_4_0_ is invalid
    _11_illegal_insn_0_0_ is invalid
    _8_alu_operator_o_4_0_ is invalid
    _10_illegal_insn_0_0_ is invalid
    _7_alu_operator_o_4_0_ is invalid
    _9_illegal_insn_0_0_ is invalid
    _8_illegal_insn_0_0_ is invalid
    _6_alu_operator_o_4_0_ is invalid
    _7_illegal_insn_0_0_ is invalid
    _6_illegal_insn_0_0_ is invalid
    _3_data_type_o_1_0_ is invalid
    _5_illegal_insn_0_0_ is invalid
    _2_data_type_o_1_0_ is invalid
    _4_illegal_insn_0_0_ is invalid
    _5_alu_op_b_mux_sel_o_0_0_ is invalid
    _5_imm_b_mux_sel_o_2_0_ is invalid
    _4_regfile_we_0_0_ is invalid
    _4_alu_op_b_mux_sel_o_0_0_ is invalid
    _4_alu_op_a_mux_sel_o_1_0_ is invalid
    _5_alu_operator_o_4_0_ is invalid
    _4_imm_b_mux_sel_o_2_0_ is invalid
    _3_illegal_insn_0_0_ is invalid
    _4_alu_operator_o_4_0_ is invalid
    _2_illegal_insn_0_0_ is invalid
    _3_regfile_we_0_0_ is invalid
    _3_alu_op_b_mux_sel_o_0_0_ is invalid
    _3_alu_op_a_mux_sel_o_1_0_ is invalid
    _3_alu_operator_o_4_0_ is invalid
    _3_imm_b_mux_sel_o_2_0_ is invalid
    _3_jump_set_o_0_0_ is invalid
    _2_regfile_we_0_0_ is invalid
    _2_alu_op_b_mux_sel_o_0_0_ is invalid
    _2_alu_op_a_mux_sel_o_1_0_ is invalid
    _2_alu_operator_o_4_0_ is invalid
    _2_imm_b_mux_sel_o_2_0_ is invalid
    _2_jump_set_o_0_0_ is invalid
    _1_csr_op_1_0_ is invalid
    _1_regfile_we_0_0_ is invalid
    _1_csr_illegal_0_0_ is invalid
    _1_illegal_insn_0_0_ is invalid
    _1_branch_in_dec_o_0_0_ is invalid
    _1_jump_in_dec_o_0_0_ is invalid
    _1_data_sign_extension_o_0_0_ is invalid
    _1_data_type_o_1_0_ is invalid
    _1_data_we_o_0_0_ is invalid
    _1_data_req_o_0_0_ is invalid
    _1_csr_access_o_0_0_ is invalid
    _1_multdiv_signed_mode_o_1_0_ is invalid
    _1_multdiv_operator_o_1_0_ is invalid
    _1_div_en_o_0_0_ is invalid
    _1_mult_en_o_0_0_ is invalid
    _1_alu_op_b_mux_sel_o_0_0_ is invalid
    _1_alu_op_a_mux_sel_o_1_0_ is invalid
    _1_alu_operator_o_4_0_ is invalid
    _1_regfile_wdata_sel_o_1_0_ is invalid
    _1_imm_b_mux_sel_o_2_0_ is invalid
    _1_imm_a_mux_sel_o_0_0_ is invalid
    _1_jump_set_o_0_0_ is invalid
    _1_wfi_insn_o_0_0_ is invalid
    _1_ecall_insn_o_0_0_ is invalid
    _1_dret_insn_o_0_0_ is invalid
    _1_mret_insn_o_0_0_ is invalid
    _1_ebrk_insn_o_0_0_ is invalid
    _0_sv2v_cast_DB892_func_ibex_decoder_v_152_7_inp_6_0__68 is invalid
    _0_sv2v_cast_DB892_func_ibex_decoder_v_152_7__result_6_0__67 is invalid
    _0_opcode_6_0_ is invalid
    _0_csr_op_1_0_ is invalid
    _0_regfile_we_0_0_ is invalid
    _0_csr_illegal_0_0_ is invalid
    _0_illegal_insn_0_0_ is invalid
    _0_branch_in_dec_o_0_0_ is invalid
    _0_jump_in_dec_o_0_0_ is invalid
    _0_data_sign_extension_o_0_0_ is invalid
    _0_data_type_o_1_0_ is invalid
    _0_data_we_o_0_0_ is invalid
    _0_data_req_o_0_0_ is invalid
    _0_csr_access_o_0_0_ is invalid
    _0_multdiv_signed_mode_o_1_0_ is invalid
    _0_multdiv_operator_o_1_0_ is invalid
    _0_div_en_o_0_0_ is invalid
    _0_mult_en_o_0_0_ is invalid
    _0_alu_op_b_mux_sel_o_0_0_ is invalid
    _0_alu_op_a_mux_sel_o_1_0_ is invalid
    _0_alu_operator_o_4_0_ is invalid
    _0_regfile_wdata_sel_o_1_0_ is invalid
    _0_imm_b_mux_sel_o_2_0_ is invalid
    _0_imm_a_mux_sel_o_0_0_ is invalid
    _0_jump_set_o_0_0_ is invalid
    _0_wfi_insn_o_0_0_ is invalid
    _0_ecall_insn_o_0_0_ is invalid
    _0_dret_insn_o_0_0_ is invalid
    _0_mret_insn_o_0_0_ is invalid
    _0_ebrk_insn_o_0_0_ is invalid
    _4_csr_pipe_flush_o_0_0_ is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp_11_0__58 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_6__result_11_0__57 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp_11_0__56 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_5__result_11_0__55 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp_11_0__54 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_4__result_11_0__53 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp_11_0__52 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_3__result_11_0__51 is invalid
    _3_csr_pipe_flush_o_0_0_ is invalid
    _2_csr_pipe_flush_o_0_0_ is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp_11_0__44 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_6__result_11_0__43 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp_11_0__42 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_5__result_11_0__41 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp_11_0__40 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_4__result_11_0__39 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp_11_0__38 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_3__result_11_0__37 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_2_inp_11_0__36 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_2__result_11_0__35 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_1_inp_11_0__34 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_1__result_11_0__33 is invalid
    _1_csr_pipe_flush_o_0_0_ is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp_11_0__27 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_6__result_11_0__26 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp_11_0__25 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_5__result_11_0__24 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp_11_0__23 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_4__result_11_0__22 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp_11_0__21 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_3__result_11_0__20 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_2_inp_11_0__19 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_2__result_11_0__18 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_1_inp_11_0__17 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_1__result_11_0__16 is invalid
    _0_csr_pipe_flush_o_0_0_ is invalid
    _1_csr_op_o_1_0_ is invalid
    _0_csr_op_o_1_0_ is invalid
    sv2v_cast_DB892_func_ibex_decoder_v_152_7_inp is invalid
    sv2v_cast_DB892_func_ibex_decoder_v_152_7__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_6_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_6__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_5_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_5__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_4_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_4__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_3_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_3__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_2_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_2__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_1_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_1__result is invalid
    opcode is invalid
    csr_op is invalid
    regfile_we is invalid
    csr_illegal is invalid
    illegal_insn is invalid
    branch_in_dec_o is invalid
    jump_in_dec_o is invalid
    data_sign_extension_o is invalid
    data_type_o is invalid
    data_we_o is invalid
    data_req_o is invalid
    csr_pipe_flush_o is invalid
    csr_op_o is invalid
    csr_access_o is invalid
    multdiv_signed_mode_o is invalid
    multdiv_operator_o is invalid
    div_en_o is invalid
    mult_en_o is invalid
    alu_op_b_mux_sel_o is invalid
    alu_op_a_mux_sel_o is invalid
    alu_operator_o is invalid
    regfile_wdata_sel_o is invalid
    imm_b_mux_sel_o is invalid
    imm_a_mux_sel_o is invalid
    jump_set_o is invalid
    wfi_insn_o is invalid
    ecall_insn_o is invalid
    dret_insn_o is invalid
    mret_insn_o is invalid
    ebrk_insn_o is invalid


    _and_ibex_decoder_v_445_81 <= and(regfile_we, asUInt(_not_ibex_decoder_v_445_80_Y)) @[ibex_decoder.v:445.25-445.56]
    _not_ibex_decoder_v_445_80 <= not(pad(illegal_reg_rv32e, 1)) @[ibex_decoder.v:445.38-445.56]
    _or_ibex_decoder_v_444_79 <= or(illegal_insn, asUInt(illegal_reg_rv32e)) @[ibex_decoder.v:444.27-444.59]
    _logic_or_ibex_decoder_v_406_78 <= or(neq(_ne_ibex_decoder_v_406_76_Y, UInt(0)), asUInt(neq(_ne_ibex_decoder_v_406_77_Y, UInt(0)))) @[ibex_decoder.v:406.11-406.59]
    _ne_ibex_decoder_v_406_77 <= neq(bits(instr, 11, 7), asUInt(UInt<5>("h00"))) @[ibex_decoder.v:406.38-406.58]
    _ne_ibex_decoder_v_406_76 <= neq(bits(instr, 19, 15), asUInt(UInt<5>("h00"))) @[ibex_decoder.v:406.12-406.32]
    _eq_ibex_decoder_v_395_75 <= eq(bits(instr, 14, 12), asUInt(UInt<3>("h0"))) @[ibex_decoder.v:395.10-395.32]
    _eq_ibex_decoder_v_290_74 <= eq(bits(instr, 31, 25), asUInt(UInt<7>("h20"))) @[ibex_decoder.v:290.17-290.44]
    _eq_ibex_decoder_v_288_73 <= eq(bits(instr, 31, 25), asUInt(UInt<7>("h00"))) @[ibex_decoder.v:288.12-288.32]
    _ne_ibex_decoder_v_284_72 <= neq(bits(instr, 31, 25), asUInt(UInt<7>("h00"))) @[ibex_decoder.v:284.12-284.32]
    _not_ibex_decoder_v_243_71 <= not(pad(bits(instr, 14, 14), 1)) @[ibex_decoder.v:243.29-243.39]
    _logic_not_ibex_decoder_v_221_70 <= eq(bits(instr, 14, 14), UInt(0)) @[ibex_decoder.v:221.9-221.19]
    _ne_ibex_decoder_v_189_69 <= neq(bits(instr, 14, 12), asUInt(UInt<3>("h0"))) @[ibex_decoder.v:189.10-189.30]
    _logic_or_ibex_decoder_v_121_65 <= or(neq(_logic_or_ibex_decoder_v_121_63_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_121_64_Y, UInt(0)))) @[ibex_decoder.v:121.9-121.206]
    _eq_ibex_decoder_v_121_64 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b3"))) @[ibex_decoder.v:121.159-121.205]
    _logic_or_ibex_decoder_v_121_63 <= or(neq(_logic_or_ibex_decoder_v_121_61_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_121_62_Y, UInt(0)))) @[ibex_decoder.v:121.10-121.153]
    _eq_ibex_decoder_v_121_62 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b2"))) @[ibex_decoder.v:121.106-121.152]
    _logic_or_ibex_decoder_v_121_61 <= or(neq(_eq_ibex_decoder_v_121_59_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_121_60_Y, UInt(0)))) @[ibex_decoder.v:121.11-121.100]
    _eq_ibex_decoder_v_121_60 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b1"))) @[ibex_decoder.v:121.59-121.99]
    _eq_ibex_decoder_v_121_59 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b0"))) @[ibex_decoder.v:121.12-121.53]
    _logic_and_ibex_decoder_v_120_50 <= and(neq(_eq_ibex_decoder_v_120_48_Y, UInt(0)), asUInt(neq(_ne_ibex_decoder_v_120_49_Y, UInt(0)))) @[ibex_decoder.v:120.13-120.64]
    _ne_ibex_decoder_v_120_49 <= neq(csr_op_o, asUInt(UInt<2>("h0"))) @[ibex_decoder.v:120.40-120.63]
    _eq_ibex_decoder_v_120_48 <= eq(csr_access_o, asUInt(UInt<1>("h1"))) @[ibex_decoder.v:120.14-120.34]
    _logic_or_ibex_decoder_v_117_47 <= or(neq(_eq_ibex_decoder_v_117_45_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_117_46_Y, UInt(0)))) @[ibex_decoder.v:117.9-117.101]
    _eq_ibex_decoder_v_117_46 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h304"))) @[ibex_decoder.v:117.60-117.100]
    _eq_ibex_decoder_v_117_45 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h300"))) @[ibex_decoder.v:117.10-117.54]
    _logic_and_ibex_decoder_v_116_32 <= and(neq(_eq_ibex_decoder_v_116_28_Y, UInt(0)), asUInt(neq(_logic_or_ibex_decoder_v_116_31_Y, UInt(0)))) @[ibex_decoder.v:116.8-116.90]
    _logic_or_ibex_decoder_v_116_31 <= or(neq(_eq_ibex_decoder_v_116_29_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_116_30_Y, UInt(0)))) @[ibex_decoder.v:116.35-116.89]
    _eq_ibex_decoder_v_116_30 <= eq(csr_op_o, asUInt(UInt<2>("h2"))) @[ibex_decoder.v:116.66-116.88]
    _eq_ibex_decoder_v_116_29 <= eq(csr_op_o, asUInt(UInt<2>("h1"))) @[ibex_decoder.v:116.36-116.60]
    _eq_ibex_decoder_v_116_28 <= eq(csr_access_o, asUInt(UInt<1>("h1"))) @[ibex_decoder.v:116.9-116.29]
    _logic_and_ibex_decoder_v_111_14 <= and(neq(_logic_or_ibex_decoder_v_111_12_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_111_13_Y, UInt(0)))) @[ibex_decoder.v:111.8-111.87]
    _eq_ibex_decoder_v_111_13 <= eq(bits(instr, 19, 15), asUInt(UInt<1>("h0"))) @[ibex_decoder.v:111.65-111.86]
    _logic_or_ibex_decoder_v_111_12 <= or(neq(_eq_ibex_decoder_v_111_10_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_111_11_Y, UInt(0)))) @[ibex_decoder.v:111.9-111.59]
    _eq_ibex_decoder_v_111_11 <= eq(csr_op, asUInt(UInt<2>("h3"))) @[ibex_decoder.v:111.36-111.58]
    _eq_ibex_decoder_v_111_10 <= eq(csr_op, asUInt(UInt<2>("h2"))) @[ibex_decoder.v:111.10-111.30]
    _0 <= instr_rdata_i
    _1 <= cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), bits(instr, 31, 20)))))))))))))))))))))
    _2 <= cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 25), bits(instr, 11, 7))))))))))))))))))))))
    _3 <= cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 7, 7), cat(bits(instr, 30, 25), cat(bits(instr, 11, 8), UInt<1>("h0"))))))))))))))))))))))))
    _4 <= cat(bits(instr, 31, 12), UInt<12>("h000"))
    _5 <= cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 31, 31), cat(bits(instr, 19, 12), cat(bits(instr, 20, 20), cat(bits(instr, 30, 21), UInt<1>("h0"))))))))))))))))
    _6 <= cat(UInt<27>("h0000000"), bits(instr, 19, 15))
    _7 <= bits(instr, 19, 15)
    _8 <= bits(instr, 24, 20)
    _9 <= bits(instr, 11, 7)
    _10 <= _or_ibex_decoder_v_444_79_Y
    _11 <= _and_ibex_decoder_v_445_81_Y
    _12 <= UInt<1>("h0")

    _and_ibex_decoder_v_445_81_Y <= bits(_and_ibex_decoder_v_445_81, 0, 0) @[ibex_decoder.v:445.25-445.56]
    _not_ibex_decoder_v_445_80_Y <= bits(_not_ibex_decoder_v_445_80, 0, 0) @[ibex_decoder.v:445.38-445.56]
    _or_ibex_decoder_v_444_79_Y <= bits(_or_ibex_decoder_v_444_79, 0, 0) @[ibex_decoder.v:444.27-444.59]
    _logic_or_ibex_decoder_v_406_78_Y <= bits(_logic_or_ibex_decoder_v_406_78, 0, 0) @[ibex_decoder.v:406.11-406.59]
    _ne_ibex_decoder_v_406_77_Y <= bits(_ne_ibex_decoder_v_406_77, 0, 0) @[ibex_decoder.v:406.38-406.58]
    _ne_ibex_decoder_v_406_76_Y <= bits(_ne_ibex_decoder_v_406_76, 0, 0) @[ibex_decoder.v:406.12-406.32]
    _eq_ibex_decoder_v_395_75_Y <= bits(_eq_ibex_decoder_v_395_75, 0, 0) @[ibex_decoder.v:395.10-395.32]
    _eq_ibex_decoder_v_290_74_Y <= bits(_eq_ibex_decoder_v_290_74, 0, 0) @[ibex_decoder.v:290.17-290.44]
    _eq_ibex_decoder_v_288_73_Y <= bits(_eq_ibex_decoder_v_288_73, 0, 0) @[ibex_decoder.v:288.12-288.32]
    _ne_ibex_decoder_v_284_72_Y <= bits(_ne_ibex_decoder_v_284_72, 0, 0) @[ibex_decoder.v:284.12-284.32]
    _not_ibex_decoder_v_243_71_Y <= bits(_not_ibex_decoder_v_243_71, 0, 0) @[ibex_decoder.v:243.29-243.39]
    _logic_not_ibex_decoder_v_221_70_Y <= bits(_logic_not_ibex_decoder_v_221_70, 0, 0) @[ibex_decoder.v:221.9-221.19]
    _ne_ibex_decoder_v_189_69_Y <= bits(_ne_ibex_decoder_v_189_69, 0, 0) @[ibex_decoder.v:189.10-189.30]
    _logic_or_ibex_decoder_v_121_65_Y <= bits(_logic_or_ibex_decoder_v_121_65, 0, 0) @[ibex_decoder.v:121.9-121.206]
    _eq_ibex_decoder_v_121_64_Y <= bits(_eq_ibex_decoder_v_121_64, 0, 0) @[ibex_decoder.v:121.159-121.205]
    _logic_or_ibex_decoder_v_121_63_Y <= bits(_logic_or_ibex_decoder_v_121_63, 0, 0) @[ibex_decoder.v:121.10-121.153]
    _eq_ibex_decoder_v_121_62_Y <= bits(_eq_ibex_decoder_v_121_62, 0, 0) @[ibex_decoder.v:121.106-121.152]
    _logic_or_ibex_decoder_v_121_61_Y <= bits(_logic_or_ibex_decoder_v_121_61, 0, 0) @[ibex_decoder.v:121.11-121.100]
    _eq_ibex_decoder_v_121_60_Y <= bits(_eq_ibex_decoder_v_121_60, 0, 0) @[ibex_decoder.v:121.59-121.99]
    _eq_ibex_decoder_v_121_59_Y <= bits(_eq_ibex_decoder_v_121_59, 0, 0) @[ibex_decoder.v:121.12-121.53]
    _logic_and_ibex_decoder_v_120_50_Y <= bits(_logic_and_ibex_decoder_v_120_50, 0, 0) @[ibex_decoder.v:120.13-120.64]
    _ne_ibex_decoder_v_120_49_Y <= bits(_ne_ibex_decoder_v_120_49, 0, 0) @[ibex_decoder.v:120.40-120.63]
    _eq_ibex_decoder_v_120_48_Y <= bits(_eq_ibex_decoder_v_120_48, 0, 0) @[ibex_decoder.v:120.14-120.34]
    _logic_or_ibex_decoder_v_117_47_Y <= bits(_logic_or_ibex_decoder_v_117_47, 0, 0) @[ibex_decoder.v:117.9-117.101]
    _eq_ibex_decoder_v_117_46_Y <= bits(_eq_ibex_decoder_v_117_46, 0, 0) @[ibex_decoder.v:117.60-117.100]
    _eq_ibex_decoder_v_117_45_Y <= bits(_eq_ibex_decoder_v_117_45, 0, 0) @[ibex_decoder.v:117.10-117.54]
    _logic_and_ibex_decoder_v_116_32_Y <= bits(_logic_and_ibex_decoder_v_116_32, 0, 0) @[ibex_decoder.v:116.8-116.90]
    _logic_or_ibex_decoder_v_116_31_Y <= bits(_logic_or_ibex_decoder_v_116_31, 0, 0) @[ibex_decoder.v:116.35-116.89]
    _eq_ibex_decoder_v_116_30_Y <= bits(_eq_ibex_decoder_v_116_30, 0, 0) @[ibex_decoder.v:116.66-116.88]
    _eq_ibex_decoder_v_116_29_Y <= bits(_eq_ibex_decoder_v_116_29, 0, 0) @[ibex_decoder.v:116.36-116.60]
    _eq_ibex_decoder_v_116_28_Y <= bits(_eq_ibex_decoder_v_116_28, 0, 0) @[ibex_decoder.v:116.9-116.29]
    _logic_and_ibex_decoder_v_111_14_Y <= bits(_logic_and_ibex_decoder_v_111_14, 0, 0) @[ibex_decoder.v:111.8-111.87]
    _eq_ibex_decoder_v_111_13_Y <= bits(_eq_ibex_decoder_v_111_13, 0, 0) @[ibex_decoder.v:111.65-111.86]
    _logic_or_ibex_decoder_v_111_12_Y <= bits(_logic_or_ibex_decoder_v_111_12, 0, 0) @[ibex_decoder.v:111.9-111.59]
    _eq_ibex_decoder_v_111_11_Y <= bits(_eq_ibex_decoder_v_111_11, 0, 0) @[ibex_decoder.v:111.36-111.58]
    _eq_ibex_decoder_v_111_10_Y <= bits(_eq_ibex_decoder_v_111_10, 0, 0) @[ibex_decoder.v:111.10-111.30]
    instr <= bits(_0, 31, 0) @[ibex_decoder.v:88.14-88.19]
    illegal_reg_rv32e <= bits(_12, 0, 0) @[ibex_decoder.v:85.7-85.24]
    regfile_waddr_o <= bits(_9, 4, 0) @[ibex_decoder.v:66.20-66.35]
    regfile_raddr_b_o <= bits(_8, 4, 0) @[ibex_decoder.v:65.20-65.37]
    regfile_raddr_a_o <= bits(_7, 4, 0) @[ibex_decoder.v:64.20-64.37]
    regfile_we_o <= bits(_11, 0, 0) @[ibex_decoder.v:63.14-63.26]
    zimm_rs1_type_o <= bits(_6, 31, 0) @[ibex_decoder.v:61.21-61.36]
    imm_j_type_o <= bits(_5, 31, 0) @[ibex_decoder.v:60.21-60.33]
    imm_u_type_o <= bits(_4, 31, 0) @[ibex_decoder.v:59.21-59.33]
    imm_b_type_o <= bits(_3, 31, 0) @[ibex_decoder.v:58.21-58.33]
    imm_s_type_o <= bits(_2, 31, 0) @[ibex_decoder.v:57.21-57.33]
    imm_i_type_o <= bits(_1, 31, 0) @[ibex_decoder.v:56.21-56.33]
    illegal_insn_o <= bits(_10, 0, 0) @[ibex_decoder.v:44.14-44.28]

