circuit ibex_id_stage: @[ibex_id_stage.v:1.1-484.10]
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

    wire _and_ibex_decoder_v_445_323_Y: UInt<1> @[ibex_decoder.v:445.25-445.56]
    wire _not_ibex_decoder_v_445_322_Y: UInt<1> @[ibex_decoder.v:445.38-445.56]
    wire _or_ibex_decoder_v_444_321_Y: UInt<1> @[ibex_decoder.v:444.27-444.59]
    wire _2_branch_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_data_we_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_data_req_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_div_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_mult_en_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _7_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _18_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _3_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _7_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _17_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _logic_or_ibex_decoder_v_406_320_Y: UInt<1> @[ibex_decoder.v:406.11-406.59]
    wire _ne_ibex_decoder_v_406_319_Y: UInt<1> @[ibex_decoder.v:406.38-406.58]
    wire _ne_ibex_decoder_v_406_318_Y: UInt<1> @[ibex_decoder.v:406.12-406.32]
    wire _16_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_wfi_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_ecall_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_dret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_mret_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_ebrk_insn_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _2_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _15_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
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
    wire _6_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _eq_ibex_decoder_v_395_317_Y: UInt<1> @[ibex_decoder.v:395.10-395.32]
    wire _5_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _14_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _11_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _6_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _4_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
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
    wire _eq_ibex_decoder_v_290_316_Y: UInt<1> @[ibex_decoder.v:290.17-290.44]
    wire _10_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _7_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _eq_ibex_decoder_v_288_315_Y: UInt<1> @[ibex_decoder.v:288.12-288.32]
    wire _9_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _ne_ibex_decoder_v_284_314_Y: UInt<1> @[ibex_decoder.v:284.12-284.32]
    wire _8_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _7_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _6_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _not_ibex_decoder_v_243_313_Y: UInt<1> @[ibex_decoder.v:243.29-243.39]
    wire _5_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _4_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _5_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _logic_not_ibex_decoder_v_221_312_Y: UInt<1> @[ibex_decoder.v:221.9-221.19]
    wire _4_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _5_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _4_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _4_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _2_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _ne_ibex_decoder_v_189_311_Y: UInt<1> @[ibex_decoder.v:189.10-189.30]
    wire _3_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _3_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _3_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _3_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _3_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_alu_op_b_mux_sel_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_alu_op_a_mux_sel_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _2_alu_operator_o_4_0_: UInt<5> @[ibex_decoder.v:124.2-443.5]
    wire _2_imm_b_mux_sel_o_2_0_: UInt<3> @[ibex_decoder.v:124.2-443.5]
    wire _2_jump_set_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _2_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_branch_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_sign_extension_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_we_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_data_req_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
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
    wire _1_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _1_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_sv2v_cast_DB892_func_ibex_decoder_v_152_249_inp_6_0__310: UInt<7> @[ibex_decoder.v:124.2-443.5]
    wire _0_sv2v_cast_DB892_func_ibex_decoder_v_152_249__result_6_0__309: UInt<7> @[ibex_decoder.v:124.2-443.5]
    wire _0_opcode_6_0_: UInt<7> @[ibex_decoder.v:124.2-443.5]
    wire _0_csr_op_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_csr_illegal_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_illegal_insn_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_branch_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_jump_in_dec_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_sign_extension_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_type_o_1_0_: UInt<2> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_we_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_data_req_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
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
    wire _0_regfile_we_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _0_csr_access_o_0_0_: UInt<1> @[ibex_decoder.v:124.2-443.5]
    wire _4_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_or_ibex_decoder_v_121_307_Y: UInt<1> @[ibex_decoder.v:121.9-121.206]
    wire _eq_ibex_decoder_v_121_306_Y: UInt<1> @[ibex_decoder.v:121.159-121.205]
    wire _logic_or_ibex_decoder_v_121_305_Y: UInt<1> @[ibex_decoder.v:121.10-121.153]
    wire _eq_ibex_decoder_v_121_304_Y: UInt<1> @[ibex_decoder.v:121.106-121.152]
    wire _logic_or_ibex_decoder_v_121_303_Y: UInt<1> @[ibex_decoder.v:121.11-121.100]
    wire _eq_ibex_decoder_v_121_302_Y: UInt<1> @[ibex_decoder.v:121.59-121.99]
    wire _eq_ibex_decoder_v_121_301_Y: UInt<1> @[ibex_decoder.v:121.12-121.53]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp_11_0__300: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_248__result_11_0__299: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp_11_0__298: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_247__result_11_0__297: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp_11_0__296: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_246__result_11_0__295: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp_11_0__294: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _2_sv2v_cast_290A1_func_ibex_decoder_v_121_245__result_11_0__293: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _3_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_and_ibex_decoder_v_120_292_Y: UInt<1> @[ibex_decoder.v:120.13-120.64]
    wire _ne_ibex_decoder_v_120_291_Y: UInt<1> @[ibex_decoder.v:120.40-120.63]
    wire _eq_ibex_decoder_v_120_290_Y: UInt<1> @[ibex_decoder.v:120.14-120.34]
    wire _2_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_or_ibex_decoder_v_117_289_Y: UInt<1> @[ibex_decoder.v:117.9-117.101]
    wire _eq_ibex_decoder_v_117_288_Y: UInt<1> @[ibex_decoder.v:117.60-117.100]
    wire _eq_ibex_decoder_v_117_287_Y: UInt<1> @[ibex_decoder.v:117.10-117.54]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp_11_0__286: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_248__result_11_0__285: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp_11_0__284: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_247__result_11_0__283: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp_11_0__282: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_246__result_11_0__281: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp_11_0__280: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_121_245__result_11_0__279: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_244_inp_11_0__278: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_244__result_11_0__277: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_243_inp_11_0__276: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_sv2v_cast_290A1_func_ibex_decoder_v_117_243__result_11_0__275: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _1_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _logic_and_ibex_decoder_v_116_274_Y: UInt<1> @[ibex_decoder.v:116.8-116.90]
    wire _logic_or_ibex_decoder_v_116_273_Y: UInt<1> @[ibex_decoder.v:116.35-116.89]
    wire _eq_ibex_decoder_v_116_272_Y: UInt<1> @[ibex_decoder.v:116.66-116.88]
    wire _eq_ibex_decoder_v_116_271_Y: UInt<1> @[ibex_decoder.v:116.36-116.60]
    wire _eq_ibex_decoder_v_116_270_Y: UInt<1> @[ibex_decoder.v:116.9-116.29]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp_11_0__269: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_248__result_11_0__268: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp_11_0__267: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_247__result_11_0__266: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp_11_0__265: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_246__result_11_0__264: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp_11_0__263: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_121_245__result_11_0__262: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_244_inp_11_0__261: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_244__result_11_0__260: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_243_inp_11_0__259: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_sv2v_cast_290A1_func_ibex_decoder_v_117_243__result_11_0__258: UInt<12> @[ibex_decoder.v:114.2-123.5]
    wire _0_csr_pipe_flush_o_0_0_: UInt<1> @[ibex_decoder.v:114.2-123.5]
    wire _1_csr_op_o_1_0_: UInt<2> @[ibex_decoder.v:109.2-113.5]
    wire _logic_and_ibex_decoder_v_111_256_Y: UInt<1> @[ibex_decoder.v:111.8-111.87]
    wire _eq_ibex_decoder_v_111_255_Y: UInt<1> @[ibex_decoder.v:111.65-111.86]
    wire _logic_or_ibex_decoder_v_111_254_Y: UInt<1> @[ibex_decoder.v:111.9-111.59]
    wire _eq_ibex_decoder_v_111_253_Y: UInt<1> @[ibex_decoder.v:111.36-111.58]
    wire _eq_ibex_decoder_v_111_252_Y: UInt<1> @[ibex_decoder.v:111.10-111.30]
    wire _0_csr_op_o_1_0_: UInt<2> @[ibex_decoder.v:109.2-113.5]
    wire sv2v_cast_DB892_func_ibex_decoder_v_152_249_inp: UInt<7> @[ibex_decoder.v:455.21-455.24]
    wire sv2v_cast_DB892_func_ibex_decoder_v_152_249__result: UInt<7> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_248__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_247__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_246__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_121_245__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_244_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_244__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_243_inp: UInt<12> @[ibex_decoder.v:451.22-451.25]
    wire sv2v_cast_290A1_func_ibex_decoder_v_117_243__result: UInt<12> @[ibex_decoder.v:0.0-0.0]
    wire opcode: UInt<7> @[ibex_decoder.v:90.12-90.18]
    wire csr_op: UInt<2> @[ibex_decoder.v:89.12-89.18]
    wire instr: UInt<32> @[ibex_decoder.v:88.14-88.19]
    wire regfile_we: UInt<1> @[ibex_decoder.v:87.6-87.16]
    wire csr_illegal: UInt<1> @[ibex_decoder.v:86.6-86.17]
    wire illegal_reg_rv32e: UInt<1> @[ibex_decoder.v:85.7-85.24]
    wire illegal_insn: UInt<1> @[ibex_decoder.v:84.6-84.18]
    wire _and_ibex_decoder_v_445_323: UInt<1> @[ibex_decoder.v:445.25-445.56]
    wire _not_ibex_decoder_v_445_322: UInt<1> @[ibex_decoder.v:445.38-445.56]
    wire _or_ibex_decoder_v_444_321: UInt<1> @[ibex_decoder.v:444.27-444.59]
    wire _logic_or_ibex_decoder_v_406_320: UInt<1> @[ibex_decoder.v:406.11-406.59]
    wire _ne_ibex_decoder_v_406_319: UInt<1> @[ibex_decoder.v:406.38-406.58]
    wire _ne_ibex_decoder_v_406_318: UInt<1> @[ibex_decoder.v:406.12-406.32]
    wire _eq_ibex_decoder_v_395_317: UInt<1> @[ibex_decoder.v:395.10-395.32]
    wire _eq_ibex_decoder_v_290_316: UInt<1> @[ibex_decoder.v:290.17-290.44]
    wire _eq_ibex_decoder_v_288_315: UInt<1> @[ibex_decoder.v:288.12-288.32]
    wire _ne_ibex_decoder_v_284_314: UInt<1> @[ibex_decoder.v:284.12-284.32]
    wire _not_ibex_decoder_v_243_313: UInt<1> @[ibex_decoder.v:243.29-243.39]
    wire _logic_not_ibex_decoder_v_221_312: UInt<1> @[ibex_decoder.v:221.9-221.19]
    wire _ne_ibex_decoder_v_189_311: UInt<1> @[ibex_decoder.v:189.10-189.30]
    wire _logic_or_ibex_decoder_v_121_307: UInt<1> @[ibex_decoder.v:121.9-121.206]
    wire _eq_ibex_decoder_v_121_306: UInt<1> @[ibex_decoder.v:121.159-121.205]
    wire _logic_or_ibex_decoder_v_121_305: UInt<1> @[ibex_decoder.v:121.10-121.153]
    wire _eq_ibex_decoder_v_121_304: UInt<1> @[ibex_decoder.v:121.106-121.152]
    wire _logic_or_ibex_decoder_v_121_303: UInt<1> @[ibex_decoder.v:121.11-121.100]
    wire _eq_ibex_decoder_v_121_302: UInt<1> @[ibex_decoder.v:121.59-121.99]
    wire _eq_ibex_decoder_v_121_301: UInt<1> @[ibex_decoder.v:121.12-121.53]
    wire _logic_and_ibex_decoder_v_120_292: UInt<1> @[ibex_decoder.v:120.13-120.64]
    wire _ne_ibex_decoder_v_120_291: UInt<1> @[ibex_decoder.v:120.40-120.63]
    wire _eq_ibex_decoder_v_120_290: UInt<1> @[ibex_decoder.v:120.14-120.34]
    wire _logic_or_ibex_decoder_v_117_289: UInt<1> @[ibex_decoder.v:117.9-117.101]
    wire _eq_ibex_decoder_v_117_288: UInt<1> @[ibex_decoder.v:117.60-117.100]
    wire _eq_ibex_decoder_v_117_287: UInt<1> @[ibex_decoder.v:117.10-117.54]
    wire _logic_and_ibex_decoder_v_116_274: UInt<1> @[ibex_decoder.v:116.8-116.90]
    wire _logic_or_ibex_decoder_v_116_273: UInt<1> @[ibex_decoder.v:116.35-116.89]
    wire _eq_ibex_decoder_v_116_272: UInt<1> @[ibex_decoder.v:116.66-116.88]
    wire _eq_ibex_decoder_v_116_271: UInt<1> @[ibex_decoder.v:116.36-116.60]
    wire _eq_ibex_decoder_v_116_270: UInt<1> @[ibex_decoder.v:116.9-116.29]
    wire _logic_and_ibex_decoder_v_111_256: UInt<1> @[ibex_decoder.v:111.8-111.87]
    wire _eq_ibex_decoder_v_111_255: UInt<1> @[ibex_decoder.v:111.65-111.86]
    wire _logic_or_ibex_decoder_v_111_254: UInt<1> @[ibex_decoder.v:111.9-111.59]
    wire _eq_ibex_decoder_v_111_253: UInt<1> @[ibex_decoder.v:111.36-111.58]
    wire _eq_ibex_decoder_v_111_252: UInt<1> @[ibex_decoder.v:111.10-111.30]
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
    _2_branch_in_dec_o_0_0_ is invalid
    _3_jump_in_dec_o_0_0_ is invalid
    _2_data_we_o_0_0_ is invalid
    _2_data_req_o_0_0_ is invalid
    _4_div_en_o_0_0_ is invalid
    _4_mult_en_o_0_0_ is invalid
    _6_jump_set_o_0_0_ is invalid
    _7_regfile_we_0_0_ is invalid
    _3_csr_access_o_0_0_ is invalid
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
    _2_csr_illegal_0_0_ is invalid
    _15_illegal_insn_0_0_ is invalid
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
    _6_regfile_we_0_0_ is invalid
    _2_csr_access_o_0_0_ is invalid
    _5_jump_set_o_0_0_ is invalid
    _14_illegal_insn_0_0_ is invalid
    _2_jump_in_dec_o_0_0_ is invalid
    _6_alu_op_b_mux_sel_o_0_0_ is invalid
    _5_alu_op_a_mux_sel_o_1_0_ is invalid
    _11_alu_operator_o_4_0_ is invalid
    _6_imm_b_mux_sel_o_2_0_ is invalid
    _4_jump_set_o_0_0_ is invalid
    _5_regfile_we_0_0_ is invalid
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
    _4_alu_op_b_mux_sel_o_0_0_ is invalid
    _4_alu_op_a_mux_sel_o_1_0_ is invalid
    _5_alu_operator_o_4_0_ is invalid
    _4_imm_b_mux_sel_o_2_0_ is invalid
    _4_regfile_we_0_0_ is invalid
    _3_illegal_insn_0_0_ is invalid
    _4_alu_operator_o_4_0_ is invalid
    _2_illegal_insn_0_0_ is invalid
    _3_alu_op_b_mux_sel_o_0_0_ is invalid
    _3_alu_op_a_mux_sel_o_1_0_ is invalid
    _3_alu_operator_o_4_0_ is invalid
    _3_imm_b_mux_sel_o_2_0_ is invalid
    _3_jump_set_o_0_0_ is invalid
    _3_regfile_we_0_0_ is invalid
    _2_alu_op_b_mux_sel_o_0_0_ is invalid
    _2_alu_op_a_mux_sel_o_1_0_ is invalid
    _2_alu_operator_o_4_0_ is invalid
    _2_imm_b_mux_sel_o_2_0_ is invalid
    _2_jump_set_o_0_0_ is invalid
    _2_regfile_we_0_0_ is invalid
    _1_csr_op_1_0_ is invalid
    _1_csr_illegal_0_0_ is invalid
    _1_illegal_insn_0_0_ is invalid
    _1_branch_in_dec_o_0_0_ is invalid
    _1_jump_in_dec_o_0_0_ is invalid
    _1_data_sign_extension_o_0_0_ is invalid
    _1_data_type_o_1_0_ is invalid
    _1_data_we_o_0_0_ is invalid
    _1_data_req_o_0_0_ is invalid
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
    _1_regfile_we_0_0_ is invalid
    _1_csr_access_o_0_0_ is invalid
    _0_sv2v_cast_DB892_func_ibex_decoder_v_152_249_inp_6_0__310 is invalid
    _0_sv2v_cast_DB892_func_ibex_decoder_v_152_249__result_6_0__309 is invalid
    _0_opcode_6_0_ is invalid
    _0_csr_op_1_0_ is invalid
    _0_csr_illegal_0_0_ is invalid
    _0_illegal_insn_0_0_ is invalid
    _0_branch_in_dec_o_0_0_ is invalid
    _0_jump_in_dec_o_0_0_ is invalid
    _0_data_sign_extension_o_0_0_ is invalid
    _0_data_type_o_1_0_ is invalid
    _0_data_we_o_0_0_ is invalid
    _0_data_req_o_0_0_ is invalid
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
    _0_regfile_we_0_0_ is invalid
    _0_csr_access_o_0_0_ is invalid
    _4_csr_pipe_flush_o_0_0_ is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp_11_0__300 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_248__result_11_0__299 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp_11_0__298 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_247__result_11_0__297 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp_11_0__296 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_246__result_11_0__295 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp_11_0__294 is invalid
    _2_sv2v_cast_290A1_func_ibex_decoder_v_121_245__result_11_0__293 is invalid
    _3_csr_pipe_flush_o_0_0_ is invalid
    _2_csr_pipe_flush_o_0_0_ is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp_11_0__286 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_248__result_11_0__285 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp_11_0__284 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_247__result_11_0__283 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp_11_0__282 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_246__result_11_0__281 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp_11_0__280 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_121_245__result_11_0__279 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_244_inp_11_0__278 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_244__result_11_0__277 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_243_inp_11_0__276 is invalid
    _1_sv2v_cast_290A1_func_ibex_decoder_v_117_243__result_11_0__275 is invalid
    _1_csr_pipe_flush_o_0_0_ is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp_11_0__269 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_248__result_11_0__268 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp_11_0__267 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_247__result_11_0__266 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp_11_0__265 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_246__result_11_0__264 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp_11_0__263 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_121_245__result_11_0__262 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_244_inp_11_0__261 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_244__result_11_0__260 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_243_inp_11_0__259 is invalid
    _0_sv2v_cast_290A1_func_ibex_decoder_v_117_243__result_11_0__258 is invalid
    _0_csr_pipe_flush_o_0_0_ is invalid
    _1_csr_op_o_1_0_ is invalid
    _0_csr_op_o_1_0_ is invalid
    sv2v_cast_DB892_func_ibex_decoder_v_152_249_inp is invalid
    sv2v_cast_DB892_func_ibex_decoder_v_152_249__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_248_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_248__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_247_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_247__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_246_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_246__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_245_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_121_245__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_244_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_244__result is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_243_inp is invalid
    sv2v_cast_290A1_func_ibex_decoder_v_117_243__result is invalid
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


    _and_ibex_decoder_v_445_323 <= and(regfile_we, asUInt(_not_ibex_decoder_v_445_322_Y)) @[ibex_decoder.v:445.25-445.56]
    _not_ibex_decoder_v_445_322 <= not(pad(illegal_reg_rv32e, 1)) @[ibex_decoder.v:445.38-445.56]
    _or_ibex_decoder_v_444_321 <= or(illegal_insn, asUInt(illegal_reg_rv32e)) @[ibex_decoder.v:444.27-444.59]
    _logic_or_ibex_decoder_v_406_320 <= or(neq(_ne_ibex_decoder_v_406_318_Y, UInt(0)), asUInt(neq(_ne_ibex_decoder_v_406_319_Y, UInt(0)))) @[ibex_decoder.v:406.11-406.59]
    _ne_ibex_decoder_v_406_319 <= neq(bits(instr, 11, 7), asUInt(UInt<5>("h00"))) @[ibex_decoder.v:406.38-406.58]
    _ne_ibex_decoder_v_406_318 <= neq(bits(instr, 19, 15), asUInt(UInt<5>("h00"))) @[ibex_decoder.v:406.12-406.32]
    _eq_ibex_decoder_v_395_317 <= eq(bits(instr, 14, 12), asUInt(UInt<3>("h0"))) @[ibex_decoder.v:395.10-395.32]
    _eq_ibex_decoder_v_290_316 <= eq(bits(instr, 31, 25), asUInt(UInt<7>("h20"))) @[ibex_decoder.v:290.17-290.44]
    _eq_ibex_decoder_v_288_315 <= eq(bits(instr, 31, 25), asUInt(UInt<7>("h00"))) @[ibex_decoder.v:288.12-288.32]
    _ne_ibex_decoder_v_284_314 <= neq(bits(instr, 31, 25), asUInt(UInt<7>("h00"))) @[ibex_decoder.v:284.12-284.32]
    _not_ibex_decoder_v_243_313 <= not(pad(bits(instr, 14, 14), 1)) @[ibex_decoder.v:243.29-243.39]
    _logic_not_ibex_decoder_v_221_312 <= eq(bits(instr, 14, 14), UInt(0)) @[ibex_decoder.v:221.9-221.19]
    _ne_ibex_decoder_v_189_311 <= neq(bits(instr, 14, 12), asUInt(UInt<3>("h0"))) @[ibex_decoder.v:189.10-189.30]
    _logic_or_ibex_decoder_v_121_307 <= or(neq(_logic_or_ibex_decoder_v_121_305_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_121_306_Y, UInt(0)))) @[ibex_decoder.v:121.9-121.206]
    _eq_ibex_decoder_v_121_306 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b3"))) @[ibex_decoder.v:121.159-121.205]
    _logic_or_ibex_decoder_v_121_305 <= or(neq(_logic_or_ibex_decoder_v_121_303_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_121_304_Y, UInt(0)))) @[ibex_decoder.v:121.10-121.153]
    _eq_ibex_decoder_v_121_304 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b2"))) @[ibex_decoder.v:121.106-121.152]
    _logic_or_ibex_decoder_v_121_303 <= or(neq(_eq_ibex_decoder_v_121_301_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_121_302_Y, UInt(0)))) @[ibex_decoder.v:121.11-121.100]
    _eq_ibex_decoder_v_121_302 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b1"))) @[ibex_decoder.v:121.59-121.99]
    _eq_ibex_decoder_v_121_301 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h7b0"))) @[ibex_decoder.v:121.12-121.53]
    _logic_and_ibex_decoder_v_120_292 <= and(neq(_eq_ibex_decoder_v_120_290_Y, UInt(0)), asUInt(neq(_ne_ibex_decoder_v_120_291_Y, UInt(0)))) @[ibex_decoder.v:120.13-120.64]
    _ne_ibex_decoder_v_120_291 <= neq(csr_op_o, asUInt(UInt<2>("h0"))) @[ibex_decoder.v:120.40-120.63]
    _eq_ibex_decoder_v_120_290 <= eq(csr_access_o, asUInt(UInt<1>("h1"))) @[ibex_decoder.v:120.14-120.34]
    _logic_or_ibex_decoder_v_117_289 <= or(neq(_eq_ibex_decoder_v_117_287_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_117_288_Y, UInt(0)))) @[ibex_decoder.v:117.9-117.101]
    _eq_ibex_decoder_v_117_288 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h304"))) @[ibex_decoder.v:117.60-117.100]
    _eq_ibex_decoder_v_117_287 <= eq(bits(instr, 31, 20), asUInt(UInt<12>("h300"))) @[ibex_decoder.v:117.10-117.54]
    _logic_and_ibex_decoder_v_116_274 <= and(neq(_eq_ibex_decoder_v_116_270_Y, UInt(0)), asUInt(neq(_logic_or_ibex_decoder_v_116_273_Y, UInt(0)))) @[ibex_decoder.v:116.8-116.90]
    _logic_or_ibex_decoder_v_116_273 <= or(neq(_eq_ibex_decoder_v_116_271_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_116_272_Y, UInt(0)))) @[ibex_decoder.v:116.35-116.89]
    _eq_ibex_decoder_v_116_272 <= eq(csr_op_o, asUInt(UInt<2>("h2"))) @[ibex_decoder.v:116.66-116.88]
    _eq_ibex_decoder_v_116_271 <= eq(csr_op_o, asUInt(UInt<2>("h1"))) @[ibex_decoder.v:116.36-116.60]
    _eq_ibex_decoder_v_116_270 <= eq(csr_access_o, asUInt(UInt<1>("h1"))) @[ibex_decoder.v:116.9-116.29]
    _logic_and_ibex_decoder_v_111_256 <= and(neq(_logic_or_ibex_decoder_v_111_254_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_111_255_Y, UInt(0)))) @[ibex_decoder.v:111.8-111.87]
    _eq_ibex_decoder_v_111_255 <= eq(bits(instr, 19, 15), asUInt(UInt<1>("h0"))) @[ibex_decoder.v:111.65-111.86]
    _logic_or_ibex_decoder_v_111_254 <= or(neq(_eq_ibex_decoder_v_111_252_Y, UInt(0)), asUInt(neq(_eq_ibex_decoder_v_111_253_Y, UInt(0)))) @[ibex_decoder.v:111.9-111.59]
    _eq_ibex_decoder_v_111_253 <= eq(csr_op, asUInt(UInt<2>("h3"))) @[ibex_decoder.v:111.36-111.58]
    _eq_ibex_decoder_v_111_252 <= eq(csr_op, asUInt(UInt<2>("h2"))) @[ibex_decoder.v:111.10-111.30]
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
    _10 <= _or_ibex_decoder_v_444_321_Y
    _11 <= _and_ibex_decoder_v_445_323_Y
    _12 <= UInt<1>("h0")

    _and_ibex_decoder_v_445_323_Y <= bits(_and_ibex_decoder_v_445_323, 0, 0) @[ibex_decoder.v:445.25-445.56]
    _not_ibex_decoder_v_445_322_Y <= bits(_not_ibex_decoder_v_445_322, 0, 0) @[ibex_decoder.v:445.38-445.56]
    _or_ibex_decoder_v_444_321_Y <= bits(_or_ibex_decoder_v_444_321, 0, 0) @[ibex_decoder.v:444.27-444.59]
    _logic_or_ibex_decoder_v_406_320_Y <= bits(_logic_or_ibex_decoder_v_406_320, 0, 0) @[ibex_decoder.v:406.11-406.59]
    _ne_ibex_decoder_v_406_319_Y <= bits(_ne_ibex_decoder_v_406_319, 0, 0) @[ibex_decoder.v:406.38-406.58]
    _ne_ibex_decoder_v_406_318_Y <= bits(_ne_ibex_decoder_v_406_318, 0, 0) @[ibex_decoder.v:406.12-406.32]
    _eq_ibex_decoder_v_395_317_Y <= bits(_eq_ibex_decoder_v_395_317, 0, 0) @[ibex_decoder.v:395.10-395.32]
    _eq_ibex_decoder_v_290_316_Y <= bits(_eq_ibex_decoder_v_290_316, 0, 0) @[ibex_decoder.v:290.17-290.44]
    _eq_ibex_decoder_v_288_315_Y <= bits(_eq_ibex_decoder_v_288_315, 0, 0) @[ibex_decoder.v:288.12-288.32]
    _ne_ibex_decoder_v_284_314_Y <= bits(_ne_ibex_decoder_v_284_314, 0, 0) @[ibex_decoder.v:284.12-284.32]
    _not_ibex_decoder_v_243_313_Y <= bits(_not_ibex_decoder_v_243_313, 0, 0) @[ibex_decoder.v:243.29-243.39]
    _logic_not_ibex_decoder_v_221_312_Y <= bits(_logic_not_ibex_decoder_v_221_312, 0, 0) @[ibex_decoder.v:221.9-221.19]
    _ne_ibex_decoder_v_189_311_Y <= bits(_ne_ibex_decoder_v_189_311, 0, 0) @[ibex_decoder.v:189.10-189.30]
    _logic_or_ibex_decoder_v_121_307_Y <= bits(_logic_or_ibex_decoder_v_121_307, 0, 0) @[ibex_decoder.v:121.9-121.206]
    _eq_ibex_decoder_v_121_306_Y <= bits(_eq_ibex_decoder_v_121_306, 0, 0) @[ibex_decoder.v:121.159-121.205]
    _logic_or_ibex_decoder_v_121_305_Y <= bits(_logic_or_ibex_decoder_v_121_305, 0, 0) @[ibex_decoder.v:121.10-121.153]
    _eq_ibex_decoder_v_121_304_Y <= bits(_eq_ibex_decoder_v_121_304, 0, 0) @[ibex_decoder.v:121.106-121.152]
    _logic_or_ibex_decoder_v_121_303_Y <= bits(_logic_or_ibex_decoder_v_121_303, 0, 0) @[ibex_decoder.v:121.11-121.100]
    _eq_ibex_decoder_v_121_302_Y <= bits(_eq_ibex_decoder_v_121_302, 0, 0) @[ibex_decoder.v:121.59-121.99]
    _eq_ibex_decoder_v_121_301_Y <= bits(_eq_ibex_decoder_v_121_301, 0, 0) @[ibex_decoder.v:121.12-121.53]
    _logic_and_ibex_decoder_v_120_292_Y <= bits(_logic_and_ibex_decoder_v_120_292, 0, 0) @[ibex_decoder.v:120.13-120.64]
    _ne_ibex_decoder_v_120_291_Y <= bits(_ne_ibex_decoder_v_120_291, 0, 0) @[ibex_decoder.v:120.40-120.63]
    _eq_ibex_decoder_v_120_290_Y <= bits(_eq_ibex_decoder_v_120_290, 0, 0) @[ibex_decoder.v:120.14-120.34]
    _logic_or_ibex_decoder_v_117_289_Y <= bits(_logic_or_ibex_decoder_v_117_289, 0, 0) @[ibex_decoder.v:117.9-117.101]
    _eq_ibex_decoder_v_117_288_Y <= bits(_eq_ibex_decoder_v_117_288, 0, 0) @[ibex_decoder.v:117.60-117.100]
    _eq_ibex_decoder_v_117_287_Y <= bits(_eq_ibex_decoder_v_117_287, 0, 0) @[ibex_decoder.v:117.10-117.54]
    _logic_and_ibex_decoder_v_116_274_Y <= bits(_logic_and_ibex_decoder_v_116_274, 0, 0) @[ibex_decoder.v:116.8-116.90]
    _logic_or_ibex_decoder_v_116_273_Y <= bits(_logic_or_ibex_decoder_v_116_273, 0, 0) @[ibex_decoder.v:116.35-116.89]
    _eq_ibex_decoder_v_116_272_Y <= bits(_eq_ibex_decoder_v_116_272, 0, 0) @[ibex_decoder.v:116.66-116.88]
    _eq_ibex_decoder_v_116_271_Y <= bits(_eq_ibex_decoder_v_116_271, 0, 0) @[ibex_decoder.v:116.36-116.60]
    _eq_ibex_decoder_v_116_270_Y <= bits(_eq_ibex_decoder_v_116_270, 0, 0) @[ibex_decoder.v:116.9-116.29]
    _logic_and_ibex_decoder_v_111_256_Y <= bits(_logic_and_ibex_decoder_v_111_256, 0, 0) @[ibex_decoder.v:111.8-111.87]
    _eq_ibex_decoder_v_111_255_Y <= bits(_eq_ibex_decoder_v_111_255, 0, 0) @[ibex_decoder.v:111.65-111.86]
    _logic_or_ibex_decoder_v_111_254_Y <= bits(_logic_or_ibex_decoder_v_111_254, 0, 0) @[ibex_decoder.v:111.9-111.59]
    _eq_ibex_decoder_v_111_253_Y <= bits(_eq_ibex_decoder_v_111_253, 0, 0) @[ibex_decoder.v:111.36-111.58]
    _eq_ibex_decoder_v_111_252_Y <= bits(_eq_ibex_decoder_v_111_252, 0, 0) @[ibex_decoder.v:111.10-111.30]
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

  module ibex_controller: @[ibex_controller.v:1.1-459.10]
    output perf_tbranch_o: UInt<1> @[ibex_controller.v:126.13-126.27]
    output perf_jump_o: UInt<1> @[ibex_controller.v:125.13-125.24]
    input stall_branch_i: UInt<1> @[ibex_controller.v:124.13-124.27]
    input stall_jump_i: UInt<1> @[ibex_controller.v:123.13-123.25]
    input stall_multdiv_i: UInt<1> @[ibex_controller.v:122.13-122.28]
    input stall_lsu_i: UInt<1> @[ibex_controller.v:121.13-121.24]
    input csr_mstatus_tw_i: UInt<1> @[ibex_controller.v:120.13-120.29]
    input priv_mode_i: UInt<2> @[ibex_controller.v:119.19-119.30]
    output csr_mtval_o: UInt<32> @[ibex_controller.v:118.20-118.31]
    output csr_save_cause_o: UInt<1> @[ibex_controller.v:117.13-117.29]
    output csr_restore_dret_id_o: UInt<1> @[ibex_controller.v:116.13-116.34]
    output csr_restore_mret_id_o: UInt<1> @[ibex_controller.v:115.13-115.34]
    output csr_save_id_o: UInt<1> @[ibex_controller.v:114.13-114.26]
    output csr_save_if_o: UInt<1> @[ibex_controller.v:113.13-113.26]
    input debug_ebreaku_i: UInt<1> @[ibex_controller.v:112.13-112.28]
    input debug_ebreakm_i: UInt<1> @[ibex_controller.v:111.13-111.28]
    input debug_single_step_i: UInt<1> @[ibex_controller.v:110.13-110.32]
    output debug_mode_o: UInt<1> @[ibex_controller.v:109.14-109.26]
    output debug_csr_save_o: UInt<1> @[ibex_controller.v:108.13-108.29]
    output debug_cause_o: UInt<3> @[ibex_controller.v:107.19-107.32]
    input debug_req_i: UInt<1> @[ibex_controller.v:106.13-106.24]
    input irq_nm_i: UInt<1> @[ibex_controller.v:105.13-105.21]
    input irq_pending_i: UInt<1> @[ibex_controller.v:104.13-104.26]
    input csr_mfip_i: UInt<15> @[ibex_controller.v:103.20-103.30]
    input csr_meip_i: UInt<1> @[ibex_controller.v:102.13-102.23]
    input csr_mtip_i: UInt<1> @[ibex_controller.v:101.13-101.23]
    input csr_msip_i: UInt<1> @[ibex_controller.v:100.13-100.23]
    input csr_mstatus_mie_i: UInt<1> @[ibex_controller.v:99.13-99.30]
    input jump_set_i: UInt<1> @[ibex_controller.v:98.13-98.23]
    input branch_set_i: UInt<1> @[ibex_controller.v:97.13-97.25]
    input store_err_i: UInt<1> @[ibex_controller.v:96.13-96.24]
    input load_err_i: UInt<1> @[ibex_controller.v:95.13-95.23]
    input lsu_addr_last_i: UInt<32> @[ibex_controller.v:94.20-94.35]
    output exc_cause_o: UInt<6> @[ibex_controller.v:93.19-93.30]
    output exc_pc_mux_o: UInt<2> @[ibex_controller.v:92.19-92.31]
    output pc_mux_o: UInt<3> @[ibex_controller.v:91.19-91.27]
    output pc_set_o: UInt<1> @[ibex_controller.v:90.13-90.21]
    output instr_req_o: UInt<1> @[ibex_controller.v:89.13-89.24]
    output id_in_ready_o: UInt<1> @[ibex_controller.v:88.14-88.27]
    output instr_valid_clear_o: UInt<1> @[ibex_controller.v:87.14-87.33]
    input pc_id_i: UInt<32> @[ibex_controller.v:86.20-86.27]
    input instr_fetch_err_i: UInt<1> @[ibex_controller.v:85.13-85.30]
    input instr_is_compressed_i: UInt<1> @[ibex_controller.v:84.13-84.34]
    input instr_compressed_i: UInt<16> @[ibex_controller.v:83.20-83.38]
    input instr_i: UInt<32> @[ibex_controller.v:82.20-82.27]
    input instr_valid_i: UInt<1> @[ibex_controller.v:81.13-81.26]
    input csr_pipe_flush_i: UInt<1> @[ibex_controller.v:80.13-80.29]
    input ebrk_insn_i: UInt<1> @[ibex_controller.v:79.13-79.24]
    input wfi_insn_i: UInt<1> @[ibex_controller.v:78.13-78.23]
    input dret_insn_i: UInt<1> @[ibex_controller.v:77.13-77.24]
    input mret_insn_i: UInt<1> @[ibex_controller.v:76.13-76.24]
    input ecall_insn_i: UInt<1> @[ibex_controller.v:75.13-75.25]
    input illegal_insn_i: UInt<1> @[ibex_controller.v:74.13-74.27]
    output ctrl_busy_o: UInt<1> @[ibex_controller.v:73.13-73.24]
    input fetch_enable_i: UInt<1> @[ibex_controller.v:72.13-72.27]
    input rst_ni: UInt<1> @[ibex_controller.v:71.13-71.19]
    input clk_i: UInt<1> @[ibex_controller.v:70.13-70.18]

    wire _logic_not_ibex_controller_v_436_242_Y: UInt<1> @[ibex_controller.v:436.7-436.14]
    wire _0_illegal_insn_q_0_0_: UInt<1> @[ibex_controller.v:435.2-454.5]
    wire _0_exc_req_q_0_0_: UInt<1> @[ibex_controller.v:435.2-454.5]
    wire _0_store_err_q_0_0_: UInt<1> @[ibex_controller.v:435.2-454.5]
    wire _0_load_err_q_0_0_: UInt<1> @[ibex_controller.v:435.2-454.5]
    wire _0_debug_mode_q_0_0_: UInt<1> @[ibex_controller.v:435.2-454.5]
    wire _0_nmi_mode_q_0_0_: UInt<1> @[ibex_controller.v:435.2-454.5]
    wire _0_ctrl_fsm_cs_3_0_: UInt<4> @[ibex_controller.v:435.2-454.5]
    wire _or_ibex_controller_v_434_240_Y: UInt<1> @[ibex_controller.v:434.32-434.61]
    wire _not_ibex_controller_v_434_239_Y: UInt<1> @[ibex_controller.v:434.32-434.50]
    wire _or_ibex_controller_v_434_238_Y: UInt<1> @[ibex_controller.v:434.34-434.49]
    wire _and_ibex_controller_v_433_237_Y: UInt<1> @[ibex_controller.v:433.26-433.43]
    wire _not_ibex_controller_v_433_236_Y: UInt<1> @[ibex_controller.v:433.35-433.43]
    wire _not_ibex_controller_v_433_235_Y: UInt<1> @[ibex_controller.v:433.26-433.32]
    wire _or_ibex_controller_v_432_234_Y: UInt<1> @[ibex_controller.v:432.18-432.83]
    wire _or_ibex_controller_v_432_233_Y: UInt<1> @[ibex_controller.v:432.19-432.65]
    wire _or_ibex_controller_v_432_232_Y: UInt<1> @[ibex_controller.v:432.20-432.49]
    wire _22_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _21_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _logic_and_ibex_controller_v_420_231_Y: UInt<1> @[ibex_controller.v:420.15-420.43]
    wire _20_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _5_debug_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _19_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _4_csr_restore_dret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _9_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _14_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _6_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_debug_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _5_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _18_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _3_csr_restore_dret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_csr_restore_mret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _8_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _13_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _7_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _13_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _12_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _17_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _10_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _8_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _12_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _12_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _or_ibex_controller_v_386_230_Y: UInt<1> @[ibex_controller.v:386.12-386.44]
    wire _11_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _16_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _6_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _9_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _7_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _11_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _11_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _ternary_ibex_controller_v_384_229_Y: UInt<6> @[ibex_controller.v:384.22-384.97]
    wire _eq_ibex_controller_v_384_228_Y: UInt<1> @[ibex_controller.v:384.23-384.48]
    wire _10_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _15_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _5_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _8_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _6_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _10_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _10_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _ternary_ibex_controller_v_381_227_Y: UInt<32> @[ibex_controller.v:381.22-381.83]
    wire _9_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _14_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _4_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _7_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _5_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _9_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _9_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _8_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _13_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _3_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _6_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _8_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _8_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _ternary_ibex_controller_v_372_226_Y: UInt<2> @[ibex_controller.v:372.22-372.64]
    wire _7_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_debug_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _12_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _2_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _5_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_csr_restore_dret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_csr_restore_mret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _7_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _4_exc_pc_mux_o_1_0_: UInt<2> @[ibex_controller.v:221.2-430.5]
    wire _7_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _7_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _logic_or_ibex_controller_v_369_225_Y: UInt<1> @[ibex_controller.v:369.10-369.50]
    wire _logic_or_ibex_controller_v_369_224_Y: UInt<1> @[ibex_controller.v:369.11-369.35]
    wire _3_debug_csr_save_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_debug_cause_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _4_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _logic_and_ibex_controller_v_356_223_Y: UInt<1> @[ibex_controller.v:356.10-356.44]
    wire _logic_not_ibex_controller_v_356_222_Y: UInt<1> @[ibex_controller.v:356.31-356.44]
    wire _3_debug_cause_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _6_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_debug_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_debug_csr_save_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_debug_cause_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _3_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_csr_save_if_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_exc_pc_mux_o_1_0_: UInt<2> @[ibex_controller.v:221.2-430.5]
    wire _6_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _6_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _logic_or_ibex_controller_v_335_221_Y: UInt<1> @[ibex_controller.v:335.10-335.44]
    wire _6_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _5_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _4_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__220: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _4_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__219: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _4_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _ne_ibex_controller_v_323_218_Y: UInt<1> @[ibex_controller.v:323.16-323.35]
    wire _3_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__217: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _3_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__216: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _3_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _logic_and_ibex_controller_v_319_215_Y: UInt<1> @[ibex_controller.v:319.11-319.34]
    wire _logic_not_ibex_controller_v_319_214_Y: UInt<1> @[ibex_controller.v:319.23-319.34]
    wire _2_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__213: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _2_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__212: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _2_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_csr_save_if_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _2_exc_pc_mux_o_1_0_: UInt<2> @[ibex_controller.v:221.2-430.5]
    wire _5_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _5_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _5_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _9_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _11_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _4_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _8_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _10_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _3_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _7_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _9_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _logic_and_ibex_controller_v_301_211_Y: UInt<1> @[ibex_controller.v:301.10-301.32]
    wire _logic_not_ibex_controller_v_301_210_Y: UInt<1> @[ibex_controller.v:301.20-301.32]
    wire _logic_not_ibex_controller_v_301_209_Y: UInt<1> @[ibex_controller.v:301.10-301.16]
    wire _6_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _logic_and_ibex_controller_v_298_208_Y: UInt<1> @[ibex_controller.v:298.11-298.52]
    wire _logic_or_ibex_controller_v_298_207_Y: UInt<1> @[ibex_controller.v:298.12-298.42]
    wire _4_perf_tbranch_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_perf_jump_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _4_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _logic_or_ibex_controller_v_292_206_Y: UInt<1> @[ibex_controller.v:292.16-292.42]
    wire _5_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _8_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _3_perf_tbranch_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_perf_jump_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _3_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _4_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _7_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _2_perf_tbranch_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_perf_jump_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _2_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _3_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _6_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _2_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _2_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _5_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _4_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _3_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _2_ctrl_busy_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _logic_or_ibex_controller_v_268_205_Y: UInt<1> @[ibex_controller.v:268.10-268.95]
    wire _logic_or_ibex_controller_v_268_204_Y: UInt<1> @[ibex_controller.v:268.11-268.71]
    wire _logic_or_ibex_controller_v_268_203_Y: UInt<1> @[ibex_controller.v:268.12-268.54]
    wire _logic_or_ibex_controller_v_268_202_Y: UInt<1> @[ibex_controller.v:268.13-268.38]
    wire _2_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _1_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__201: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _1_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__200: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _1_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_debug_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _1_perf_tbranch_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_perf_jump_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_debug_csr_save_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_debug_cause_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _1_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _1_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_csr_restore_dret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_csr_restore_mret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_csr_save_if_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _1_exc_pc_mux_o_1_0_: UInt<2> @[ibex_controller.v:221.2-430.5]
    wire _1_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _1_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_instr_req_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _1_ctrl_busy_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__199: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _0_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__198: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _0_flush_id_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_halt_if_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_debug_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_nmi_mode_d_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_ctrl_fsm_ns_3_0_: UInt<4> @[ibex_controller.v:221.2-430.5]
    wire _0_perf_tbranch_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_perf_jump_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_debug_csr_save_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_debug_cause_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _0_csr_mtval_o_31_0_: UInt<32> @[ibex_controller.v:221.2-430.5]
    wire _0_csr_save_cause_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_csr_restore_dret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_csr_restore_mret_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_csr_save_id_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_csr_save_if_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_exc_cause_o_5_0_: UInt<6> @[ibex_controller.v:221.2-430.5]
    wire _0_exc_pc_mux_o_1_0_: UInt<2> @[ibex_controller.v:221.2-430.5]
    wire _0_pc_mux_o_2_0_: UInt<3> @[ibex_controller.v:221.2-430.5]
    wire _0_pc_set_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_instr_req_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _0_ctrl_busy_o_0_0_: UInt<1> @[ibex_controller.v:221.2-430.5]
    wire _15_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _14_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _13_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _12_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _11_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _10_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _9_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _8_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _7_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _6_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _5_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _4_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _3_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _2_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _1_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _0_mfip_id_3_0_: UInt<4> @[ibex_controller.v:186.2-219.5]
    wire _and_ibex_controller_v_185_195_Y: UInt<1> @[ibex_controller.v:185.23-185.103]
    wire _or_ibex_controller_v_185_194_Y: UInt<1> @[ibex_controller.v:185.40-185.102]
    wire _and_ibex_controller_v_185_193_Y: UInt<1> @[ibex_controller.v:185.68-185.101]
    wire _and_ibex_controller_v_185_192_Y: UInt<1> @[ibex_controller.v:185.41-185.63]
    wire _not_ibex_controller_v_185_191_Y: UInt<1> @[ibex_controller.v:185.52-185.63]
    wire _not_ibex_controller_v_185_190_Y: UInt<1> @[ibex_controller.v:185.23-185.36]
    wire _ternary_ibex_controller_v_184_189_Y: UInt<1> @[ibex_controller.v:184.30-184.132]
    wire _ternary_ibex_controller_v_184_188_Y: UInt<1> @[ibex_controller.v:184.79-184.131]
    wire _eq_ibex_controller_v_184_187_Y: UInt<1> @[ibex_controller.v:184.80-184.105]
    wire _eq_ibex_controller_v_184_186_Y: UInt<1> @[ibex_controller.v:184.31-184.56]
    wire _and_ibex_controller_v_183_185_Y: UInt<1> @[ibex_controller.v:183.29-183.98]
    wire _not_ibex_controller_v_183_184_Y: UInt<1> @[ibex_controller.v:183.85-183.98]
    wire _or_ibex_controller_v_183_183_Y: UInt<1> @[ibex_controller.v:183.30-183.81]
    wire _and_ibex_controller_v_183_182_Y: UInt<1> @[ibex_controller.v:183.45-183.80]
    wire _or_ibex_controller_v_182_181_Y: UInt<1> @[ibex_controller.v:182.24-182.107]
    wire _or_ibex_controller_v_182_180_Y: UInt<1> @[ibex_controller.v:182.25-182.92]
    wire _or_ibex_controller_v_182_179_Y: UInt<1> @[ibex_controller.v:182.26-182.79]
    wire _or_ibex_controller_v_182_178_Y: UInt<1> @[ibex_controller.v:182.27-182.61]
    wire _or_ibex_controller_v_182_177_Y: UInt<1> @[ibex_controller.v:182.28-182.49]
    wire _or_ibex_controller_v_181_176_Y: UInt<1> @[ibex_controller.v:181.24-181.48]
    wire _and_ibex_controller_v_180_175_Y: UInt<1> @[ibex_controller.v:180.22-180.110]
    wire _ne_ibex_controller_v_180_174_Y: UInt<1> @[ibex_controller.v:180.89-180.109]
    wire _or_ibex_controller_v_180_173_Y: UInt<1> @[ibex_controller.v:180.23-180.84]
    wire _or_ibex_controller_v_180_172_Y: UInt<1> @[ibex_controller.v:180.24-180.65]
    wire _or_ibex_controller_v_180_171_Y: UInt<1> @[ibex_controller.v:180.25-180.47]
    wire _and_ibex_controller_v_179_170_Y: UInt<1> @[ibex_controller.v:179.27-179.101]
    wire _ne_ibex_controller_v_179_169_Y: UInt<1> @[ibex_controller.v:179.80-179.100]
    wire _or_ibex_controller_v_179_168_Y: UInt<1> @[ibex_controller.v:179.28-179.75]
    wire _or_ibex_controller_v_179_167_Y: UInt<1> @[ibex_controller.v:179.29-179.58]
    wire _and_ibex_controller_v_178_166_Y: UInt<1> @[ibex_controller.v:178.26-178.99]
    wire _or_ibex_controller_v_178_165_Y: UInt<1> @[ibex_controller.v:178.57-178.98]
    wire _and_ibex_controller_v_178_164_Y: UInt<1> @[ibex_controller.v:178.70-178.97]
    wire _ne_ibex_controller_v_178_163_Y: UInt<1> @[ibex_controller.v:178.27-178.52]
    wire _and_ibex_controller_v_177_162_Y: UInt<1> @[ibex_controller.v:177.25-177.50]
    wire _not_ibex_controller_v_177_161_Y: UInt<1> @[ibex_controller.v:177.37-177.50]
    wire _and_ibex_controller_v_176_160_Y: UInt<1> @[ibex_controller.v:176.28-176.61]
    wire _and_ibex_controller_v_175_159_Y: UInt<1> @[ibex_controller.v:175.27-175.59]
    wire _and_ibex_controller_v_174_158_Y: UInt<1> @[ibex_controller.v:174.22-174.49]
    wire _and_ibex_controller_v_173_157_Y: UInt<1> @[ibex_controller.v:173.21-173.47]
    wire _and_ibex_controller_v_172_156_Y: UInt<1> @[ibex_controller.v:172.22-172.49]
    wire _and_ibex_controller_v_171_155_Y: UInt<1> @[ibex_controller.v:171.22-171.49]
    wire _and_ibex_controller_v_170_154_Y: UInt<1> @[ibex_controller.v:170.23-170.51]
    wire sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp: UInt<6> @[ibex_controller.v:456.21-456.24]
    wire sv2v_cast_89EA8_func_ibex_controller_v_324_153__result: UInt<6> @[ibex_controller.v:0.0-0.0]
    wire instr_fetch_err: UInt<1> @[ibex_controller.v:160.7-160.22]
    wire csr_pipe_flush: UInt<1> @[ibex_controller.v:159.7-159.21]
    wire ebrk_insn: UInt<1> @[ibex_controller.v:158.7-158.16]
    wire wfi_insn: UInt<1> @[ibex_controller.v:157.7-157.15]
    wire dret_insn: UInt<1> @[ibex_controller.v:156.7-156.16]
    wire mret_insn: UInt<1> @[ibex_controller.v:155.7-155.16]
    wire ecall_insn: UInt<1> @[ibex_controller.v:154.7-154.17]
    wire unused_csr_mtip: UInt<1> @[ibex_controller.v:153.7-153.22]
    wire mfip_id: UInt<4> @[ibex_controller.v:152.12-152.19]
    wire handle_irq: UInt<1> @[ibex_controller.v:151.7-151.17]
    wire ebreak_into_debug: UInt<1> @[ibex_controller.v:150.7-150.24]
    wire enter_debug_mode: UInt<1> @[ibex_controller.v:149.7-149.23]
    wire special_req: UInt<1> @[ibex_controller.v:148.7-148.18]
    wire exc_req_lsu: UInt<1> @[ibex_controller.v:147.7-147.18]
    wire illegal_umode: UInt<1> @[ibex_controller.v:146.7-146.20]
    wire illegal_dret: UInt<1> @[ibex_controller.v:145.7-145.19]
    wire flush_id: UInt<1> @[ibex_controller.v:144.6-144.14]
    wire halt_if: UInt<1> @[ibex_controller.v:143.6-143.13]
    wire stall: UInt<1> @[ibex_controller.v:142.7-142.12]
    wire illegal_insn_d: UInt<1> @[ibex_controller.v:141.7-141.21]
    wire illegal_insn_q: UInt<1> @[ibex_controller.v:140.6-140.20]
    wire exc_req_d: UInt<1> @[ibex_controller.v:139.7-139.16]
    wire exc_req_q: UInt<1> @[ibex_controller.v:138.6-138.15]
    wire store_err_d: UInt<1> @[ibex_controller.v:137.7-137.18]
    wire store_err_q: UInt<1> @[ibex_controller.v:136.6-136.17]
    wire load_err_d: UInt<1> @[ibex_controller.v:135.7-135.17]
    wire load_err_q: UInt<1> @[ibex_controller.v:134.6-134.16]
    wire debug_mode_d: UInt<1> @[ibex_controller.v:133.6-133.18]
    wire debug_mode_q: UInt<1> @[ibex_controller.v:132.6-132.18]
    wire nmi_mode_d: UInt<1> @[ibex_controller.v:131.6-131.16]
    wire nmi_mode_q: UInt<1> @[ibex_controller.v:130.6-130.16]
    wire ctrl_fsm_ns: UInt<4> @[ibex_controller.v:129.12-129.23]
    wire ctrl_fsm_cs: UInt<4> @[ibex_controller.v:128.12-128.23]
    wire _logic_not_ibex_controller_v_436_242: UInt<1> @[ibex_controller.v:436.7-436.14]
    wire _or_ibex_controller_v_434_240: UInt<1> @[ibex_controller.v:434.32-434.61]
    wire _not_ibex_controller_v_434_239: UInt<1> @[ibex_controller.v:434.32-434.50]
    wire _or_ibex_controller_v_434_238: UInt<1> @[ibex_controller.v:434.34-434.49]
    wire _and_ibex_controller_v_433_237: UInt<1> @[ibex_controller.v:433.26-433.43]
    wire _not_ibex_controller_v_433_236: UInt<1> @[ibex_controller.v:433.35-433.43]
    wire _not_ibex_controller_v_433_235: UInt<1> @[ibex_controller.v:433.26-433.32]
    wire _or_ibex_controller_v_432_234: UInt<1> @[ibex_controller.v:432.18-432.83]
    wire _or_ibex_controller_v_432_233: UInt<1> @[ibex_controller.v:432.19-432.65]
    wire _or_ibex_controller_v_432_232: UInt<1> @[ibex_controller.v:432.20-432.49]
    wire _logic_and_ibex_controller_v_420_231: UInt<1> @[ibex_controller.v:420.15-420.43]
    wire _or_ibex_controller_v_386_230: UInt<1> @[ibex_controller.v:386.12-386.44]
    wire _ternary_ibex_controller_v_384_229: UInt<6> @[ibex_controller.v:384.22-384.97]
    wire _eq_ibex_controller_v_384_228: UInt<1> @[ibex_controller.v:384.23-384.48]
    wire _ternary_ibex_controller_v_381_227: UInt<32> @[ibex_controller.v:381.22-381.83]
    wire _ternary_ibex_controller_v_372_226: UInt<2> @[ibex_controller.v:372.22-372.64]
    wire _logic_or_ibex_controller_v_369_225: UInt<1> @[ibex_controller.v:369.10-369.50]
    wire _logic_or_ibex_controller_v_369_224: UInt<1> @[ibex_controller.v:369.11-369.35]
    wire _logic_and_ibex_controller_v_356_223: UInt<1> @[ibex_controller.v:356.10-356.44]
    wire _logic_not_ibex_controller_v_356_222: UInt<1> @[ibex_controller.v:356.31-356.44]
    wire _logic_or_ibex_controller_v_335_221: UInt<1> @[ibex_controller.v:335.10-335.44]
    wire _ne_ibex_controller_v_323_218: UInt<1> @[ibex_controller.v:323.16-323.35]
    wire _logic_and_ibex_controller_v_319_215: UInt<1> @[ibex_controller.v:319.11-319.34]
    wire _logic_not_ibex_controller_v_319_214: UInt<1> @[ibex_controller.v:319.23-319.34]
    wire _logic_and_ibex_controller_v_301_211: UInt<1> @[ibex_controller.v:301.10-301.32]
    wire _logic_not_ibex_controller_v_301_210: UInt<1> @[ibex_controller.v:301.20-301.32]
    wire _logic_not_ibex_controller_v_301_209: UInt<1> @[ibex_controller.v:301.10-301.16]
    wire _logic_and_ibex_controller_v_298_208: UInt<1> @[ibex_controller.v:298.11-298.52]
    wire _logic_or_ibex_controller_v_298_207: UInt<1> @[ibex_controller.v:298.12-298.42]
    wire _logic_or_ibex_controller_v_292_206: UInt<1> @[ibex_controller.v:292.16-292.42]
    wire _logic_or_ibex_controller_v_268_205: UInt<1> @[ibex_controller.v:268.10-268.95]
    wire _logic_or_ibex_controller_v_268_204: UInt<1> @[ibex_controller.v:268.11-268.71]
    wire _logic_or_ibex_controller_v_268_203: UInt<1> @[ibex_controller.v:268.12-268.54]
    wire _logic_or_ibex_controller_v_268_202: UInt<1> @[ibex_controller.v:268.13-268.38]
    wire _and_ibex_controller_v_185_195: UInt<1> @[ibex_controller.v:185.23-185.103]
    wire _or_ibex_controller_v_185_194: UInt<1> @[ibex_controller.v:185.40-185.102]
    wire _and_ibex_controller_v_185_193: UInt<1> @[ibex_controller.v:185.68-185.101]
    wire _and_ibex_controller_v_185_192: UInt<1> @[ibex_controller.v:185.41-185.63]
    wire _not_ibex_controller_v_185_191: UInt<1> @[ibex_controller.v:185.52-185.63]
    wire _not_ibex_controller_v_185_190: UInt<1> @[ibex_controller.v:185.23-185.36]
    wire _ternary_ibex_controller_v_184_189: UInt<1> @[ibex_controller.v:184.30-184.132]
    wire _ternary_ibex_controller_v_184_188: UInt<1> @[ibex_controller.v:184.79-184.131]
    wire _eq_ibex_controller_v_184_187: UInt<1> @[ibex_controller.v:184.80-184.105]
    wire _eq_ibex_controller_v_184_186: UInt<1> @[ibex_controller.v:184.31-184.56]
    wire _and_ibex_controller_v_183_185: UInt<1> @[ibex_controller.v:183.29-183.98]
    wire _not_ibex_controller_v_183_184: UInt<1> @[ibex_controller.v:183.85-183.98]
    wire _or_ibex_controller_v_183_183: UInt<1> @[ibex_controller.v:183.30-183.81]
    wire _and_ibex_controller_v_183_182: UInt<1> @[ibex_controller.v:183.45-183.80]
    wire _or_ibex_controller_v_182_181: UInt<1> @[ibex_controller.v:182.24-182.107]
    wire _or_ibex_controller_v_182_180: UInt<1> @[ibex_controller.v:182.25-182.92]
    wire _or_ibex_controller_v_182_179: UInt<1> @[ibex_controller.v:182.26-182.79]
    wire _or_ibex_controller_v_182_178: UInt<1> @[ibex_controller.v:182.27-182.61]
    wire _or_ibex_controller_v_182_177: UInt<1> @[ibex_controller.v:182.28-182.49]
    wire _or_ibex_controller_v_181_176: UInt<1> @[ibex_controller.v:181.24-181.48]
    wire _and_ibex_controller_v_180_175: UInt<1> @[ibex_controller.v:180.22-180.110]
    wire _ne_ibex_controller_v_180_174: UInt<1> @[ibex_controller.v:180.89-180.109]
    wire _or_ibex_controller_v_180_173: UInt<1> @[ibex_controller.v:180.23-180.84]
    wire _or_ibex_controller_v_180_172: UInt<1> @[ibex_controller.v:180.24-180.65]
    wire _or_ibex_controller_v_180_171: UInt<1> @[ibex_controller.v:180.25-180.47]
    wire _and_ibex_controller_v_179_170: UInt<1> @[ibex_controller.v:179.27-179.101]
    wire _ne_ibex_controller_v_179_169: UInt<1> @[ibex_controller.v:179.80-179.100]
    wire _or_ibex_controller_v_179_168: UInt<1> @[ibex_controller.v:179.28-179.75]
    wire _or_ibex_controller_v_179_167: UInt<1> @[ibex_controller.v:179.29-179.58]
    wire _and_ibex_controller_v_178_166: UInt<1> @[ibex_controller.v:178.26-178.99]
    wire _or_ibex_controller_v_178_165: UInt<1> @[ibex_controller.v:178.57-178.98]
    wire _and_ibex_controller_v_178_164: UInt<1> @[ibex_controller.v:178.70-178.97]
    wire _ne_ibex_controller_v_178_163: UInt<1> @[ibex_controller.v:178.27-178.52]
    wire _and_ibex_controller_v_177_162: UInt<1> @[ibex_controller.v:177.25-177.50]
    wire _not_ibex_controller_v_177_161: UInt<1> @[ibex_controller.v:177.37-177.50]
    wire _and_ibex_controller_v_176_160: UInt<1> @[ibex_controller.v:176.28-176.61]
    wire _and_ibex_controller_v_175_159: UInt<1> @[ibex_controller.v:175.27-175.59]
    wire _and_ibex_controller_v_174_158: UInt<1> @[ibex_controller.v:174.22-174.49]
    wire _and_ibex_controller_v_173_157: UInt<1> @[ibex_controller.v:173.21-173.47]
    wire _and_ibex_controller_v_172_156: UInt<1> @[ibex_controller.v:172.22-172.49]
    wire _and_ibex_controller_v_171_155: UInt<1> @[ibex_controller.v:171.22-171.49]
    wire _and_ibex_controller_v_170_154: UInt<1> @[ibex_controller.v:170.23-170.51]
    wire _244: UInt<1>
    wire _245: UInt<1>
    wire _246: UInt<1>
    wire _247: UInt<1>
    wire _248: UInt<1>
    wire _249: UInt<1>
    wire _250: UInt<1>
    wire _251: UInt<1>
    wire _252: UInt<1>
    wire _253: UInt<1>
    wire _254: UInt<1>
    wire _255: UInt<1>
    wire _256: UInt<1>
    wire _257: UInt<1>
    wire _258: UInt<1>
    wire _259: UInt<1>
    wire _260: UInt<1>
    wire _261: UInt<1>
    wire _262: UInt<1>
    wire _263: UInt<1>
    wire _264: UInt<1>
    wire _265: UInt<1>
    wire _266: UInt<1>
    _0_illegal_insn_q_0_0_ is invalid
    _0_exc_req_q_0_0_ is invalid
    _0_store_err_q_0_0_ is invalid
    _0_load_err_q_0_0_ is invalid
    _0_debug_mode_q_0_0_ is invalid
    _0_nmi_mode_q_0_0_ is invalid
    _0_ctrl_fsm_cs_3_0_ is invalid
    _22_ctrl_fsm_ns_3_0_ is invalid
    _21_ctrl_fsm_ns_3_0_ is invalid
    _20_ctrl_fsm_ns_3_0_ is invalid
    _5_debug_mode_d_0_0_ is invalid
    _19_ctrl_fsm_ns_3_0_ is invalid
    _4_csr_restore_dret_id_o_0_0_ is invalid
    _9_pc_mux_o_2_0_ is invalid
    _14_pc_set_o_0_0_ is invalid
    _6_nmi_mode_d_0_0_ is invalid
    _4_debug_mode_d_0_0_ is invalid
    _5_nmi_mode_d_0_0_ is invalid
    _18_ctrl_fsm_ns_3_0_ is invalid
    _3_csr_restore_dret_id_o_0_0_ is invalid
    _3_csr_restore_mret_id_o_0_0_ is invalid
    _8_pc_mux_o_2_0_ is invalid
    _13_pc_set_o_0_0_ is invalid
    _7_csr_mtval_o_31_0_ is invalid
    _13_exc_cause_o_5_0_ is invalid
    _12_flush_id_0_0_ is invalid
    _17_ctrl_fsm_ns_3_0_ is invalid
    _10_csr_save_cause_o_0_0_ is invalid
    _8_csr_save_id_o_0_0_ is invalid
    _12_exc_cause_o_5_0_ is invalid
    _12_pc_set_o_0_0_ is invalid
    _11_flush_id_0_0_ is invalid
    _16_ctrl_fsm_ns_3_0_ is invalid
    _6_csr_mtval_o_31_0_ is invalid
    _9_csr_save_cause_o_0_0_ is invalid
    _7_csr_save_id_o_0_0_ is invalid
    _11_exc_cause_o_5_0_ is invalid
    _11_pc_set_o_0_0_ is invalid
    _10_flush_id_0_0_ is invalid
    _15_ctrl_fsm_ns_3_0_ is invalid
    _5_csr_mtval_o_31_0_ is invalid
    _8_csr_save_cause_o_0_0_ is invalid
    _6_csr_save_id_o_0_0_ is invalid
    _10_exc_cause_o_5_0_ is invalid
    _10_pc_set_o_0_0_ is invalid
    _9_flush_id_0_0_ is invalid
    _14_ctrl_fsm_ns_3_0_ is invalid
    _4_csr_mtval_o_31_0_ is invalid
    _7_csr_save_cause_o_0_0_ is invalid
    _5_csr_save_id_o_0_0_ is invalid
    _9_exc_cause_o_5_0_ is invalid
    _9_pc_set_o_0_0_ is invalid
    _8_flush_id_0_0_ is invalid
    _13_ctrl_fsm_ns_3_0_ is invalid
    _3_csr_mtval_o_31_0_ is invalid
    _6_csr_save_cause_o_0_0_ is invalid
    _4_csr_save_id_o_0_0_ is invalid
    _8_exc_cause_o_5_0_ is invalid
    _8_pc_set_o_0_0_ is invalid
    _7_flush_id_0_0_ is invalid
    _3_debug_mode_d_0_0_ is invalid
    _4_nmi_mode_d_0_0_ is invalid
    _12_ctrl_fsm_ns_3_0_ is invalid
    _2_csr_mtval_o_31_0_ is invalid
    _5_csr_save_cause_o_0_0_ is invalid
    _2_csr_restore_dret_id_o_0_0_ is invalid
    _2_csr_restore_mret_id_o_0_0_ is invalid
    _3_csr_save_id_o_0_0_ is invalid
    _7_exc_cause_o_5_0_ is invalid
    _4_exc_pc_mux_o_1_0_ is invalid
    _7_pc_mux_o_2_0_ is invalid
    _7_pc_set_o_0_0_ is invalid
    _3_debug_csr_save_o_0_0_ is invalid
    _4_debug_cause_o_2_0_ is invalid
    _4_csr_save_cause_o_0_0_ is invalid
    _2_csr_save_id_o_0_0_ is invalid
    _3_debug_cause_o_2_0_ is invalid
    _6_flush_id_0_0_ is invalid
    _2_debug_mode_d_0_0_ is invalid
    _2_debug_csr_save_o_0_0_ is invalid
    _2_debug_cause_o_2_0_ is invalid
    _3_csr_save_cause_o_0_0_ is invalid
    _3_csr_save_if_o_0_0_ is invalid
    _3_exc_pc_mux_o_1_0_ is invalid
    _6_pc_mux_o_2_0_ is invalid
    _6_pc_set_o_0_0_ is invalid
    _6_exc_cause_o_5_0_ is invalid
    _5_exc_cause_o_5_0_ is invalid
    _4_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__220 is invalid
    _4_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__219 is invalid
    _4_exc_cause_o_5_0_ is invalid
    _3_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__217 is invalid
    _3_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__216 is invalid
    _3_nmi_mode_d_0_0_ is invalid
    _3_exc_cause_o_5_0_ is invalid
    _2_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__213 is invalid
    _2_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__212 is invalid
    _2_nmi_mode_d_0_0_ is invalid
    _2_csr_save_cause_o_0_0_ is invalid
    _2_csr_save_if_o_0_0_ is invalid
    _2_exc_cause_o_5_0_ is invalid
    _2_exc_pc_mux_o_1_0_ is invalid
    _5_pc_mux_o_2_0_ is invalid
    _5_pc_set_o_0_0_ is invalid
    _5_flush_id_0_0_ is invalid
    _9_halt_if_0_0_ is invalid
    _11_ctrl_fsm_ns_3_0_ is invalid
    _4_flush_id_0_0_ is invalid
    _8_halt_if_0_0_ is invalid
    _10_ctrl_fsm_ns_3_0_ is invalid
    _3_flush_id_0_0_ is invalid
    _7_halt_if_0_0_ is invalid
    _9_ctrl_fsm_ns_3_0_ is invalid
    _6_halt_if_0_0_ is invalid
    _4_perf_tbranch_o_0_0_ is invalid
    _4_perf_jump_o_0_0_ is invalid
    _4_pc_mux_o_2_0_ is invalid
    _4_pc_set_o_0_0_ is invalid
    _5_halt_if_0_0_ is invalid
    _8_ctrl_fsm_ns_3_0_ is invalid
    _3_perf_tbranch_o_0_0_ is invalid
    _3_perf_jump_o_0_0_ is invalid
    _3_pc_mux_o_2_0_ is invalid
    _3_pc_set_o_0_0_ is invalid
    _4_halt_if_0_0_ is invalid
    _7_ctrl_fsm_ns_3_0_ is invalid
    _2_perf_tbranch_o_0_0_ is invalid
    _2_perf_jump_o_0_0_ is invalid
    _2_pc_mux_o_2_0_ is invalid
    _2_pc_set_o_0_0_ is invalid
    _3_halt_if_0_0_ is invalid
    _6_ctrl_fsm_ns_3_0_ is invalid
    _2_flush_id_0_0_ is invalid
    _2_halt_if_0_0_ is invalid
    _5_ctrl_fsm_ns_3_0_ is invalid
    _4_ctrl_fsm_ns_3_0_ is invalid
    _3_ctrl_fsm_ns_3_0_ is invalid
    _2_ctrl_busy_o_0_0_ is invalid
    _2_ctrl_fsm_ns_3_0_ is invalid
    _1_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__201 is invalid
    _1_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__200 is invalid
    _1_flush_id_0_0_ is invalid
    _1_halt_if_0_0_ is invalid
    _1_debug_mode_d_0_0_ is invalid
    _1_nmi_mode_d_0_0_ is invalid
    _1_ctrl_fsm_ns_3_0_ is invalid
    _1_perf_tbranch_o_0_0_ is invalid
    _1_perf_jump_o_0_0_ is invalid
    _1_debug_csr_save_o_0_0_ is invalid
    _1_debug_cause_o_2_0_ is invalid
    _1_csr_mtval_o_31_0_ is invalid
    _1_csr_save_cause_o_0_0_ is invalid
    _1_csr_restore_dret_id_o_0_0_ is invalid
    _1_csr_restore_mret_id_o_0_0_ is invalid
    _1_csr_save_id_o_0_0_ is invalid
    _1_csr_save_if_o_0_0_ is invalid
    _1_exc_cause_o_5_0_ is invalid
    _1_exc_pc_mux_o_1_0_ is invalid
    _1_pc_mux_o_2_0_ is invalid
    _1_pc_set_o_0_0_ is invalid
    _1_instr_req_o_0_0_ is invalid
    _1_ctrl_busy_o_0_0_ is invalid
    _0_sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp_5_0__199 is invalid
    _0_sv2v_cast_89EA8_func_ibex_controller_v_324_153__result_5_0__198 is invalid
    _0_flush_id_0_0_ is invalid
    _0_halt_if_0_0_ is invalid
    _0_debug_mode_d_0_0_ is invalid
    _0_nmi_mode_d_0_0_ is invalid
    _0_ctrl_fsm_ns_3_0_ is invalid
    _0_perf_tbranch_o_0_0_ is invalid
    _0_perf_jump_o_0_0_ is invalid
    _0_debug_csr_save_o_0_0_ is invalid
    _0_debug_cause_o_2_0_ is invalid
    _0_csr_mtval_o_31_0_ is invalid
    _0_csr_save_cause_o_0_0_ is invalid
    _0_csr_restore_dret_id_o_0_0_ is invalid
    _0_csr_restore_mret_id_o_0_0_ is invalid
    _0_csr_save_id_o_0_0_ is invalid
    _0_csr_save_if_o_0_0_ is invalid
    _0_exc_cause_o_5_0_ is invalid
    _0_exc_pc_mux_o_1_0_ is invalid
    _0_pc_mux_o_2_0_ is invalid
    _0_pc_set_o_0_0_ is invalid
    _0_instr_req_o_0_0_ is invalid
    _0_ctrl_busy_o_0_0_ is invalid
    _15_mfip_id_3_0_ is invalid
    _14_mfip_id_3_0_ is invalid
    _13_mfip_id_3_0_ is invalid
    _12_mfip_id_3_0_ is invalid
    _11_mfip_id_3_0_ is invalid
    _10_mfip_id_3_0_ is invalid
    _9_mfip_id_3_0_ is invalid
    _8_mfip_id_3_0_ is invalid
    _7_mfip_id_3_0_ is invalid
    _6_mfip_id_3_0_ is invalid
    _5_mfip_id_3_0_ is invalid
    _4_mfip_id_3_0_ is invalid
    _3_mfip_id_3_0_ is invalid
    _2_mfip_id_3_0_ is invalid
    _1_mfip_id_3_0_ is invalid
    _0_mfip_id_3_0_ is invalid
    sv2v_cast_89EA8_func_ibex_controller_v_324_153_inp is invalid
    sv2v_cast_89EA8_func_ibex_controller_v_324_153__result is invalid
    mfip_id is invalid
    flush_id is invalid
    halt_if is invalid
    illegal_insn_q is invalid
    exc_req_q is invalid
    store_err_q is invalid
    load_err_q is invalid
    debug_mode_d is invalid
    debug_mode_q is invalid
    nmi_mode_d is invalid
    nmi_mode_q is invalid
    ctrl_fsm_ns is invalid
    ctrl_fsm_cs is invalid
    perf_tbranch_o is invalid
    perf_jump_o is invalid
    csr_mtval_o is invalid
    csr_save_cause_o is invalid
    csr_restore_dret_id_o is invalid
    csr_restore_mret_id_o is invalid
    csr_save_id_o is invalid
    csr_save_if_o is invalid
    debug_csr_save_o is invalid
    debug_cause_o is invalid
    exc_cause_o is invalid
    exc_pc_mux_o is invalid
    pc_mux_o is invalid
    pc_set_o is invalid
    instr_req_o is invalid
    ctrl_busy_o is invalid


    _logic_not_ibex_controller_v_436_242 <= eq(rst_ni, UInt(0)) @[ibex_controller.v:436.7-436.14]
    _or_ibex_controller_v_434_240 <= or(_not_ibex_controller_v_434_239_Y, asUInt(flush_id)) @[ibex_controller.v:434.32-434.61]
    _not_ibex_controller_v_434_239 <= not(pad(_or_ibex_controller_v_434_238_Y, 1)) @[ibex_controller.v:434.32-434.50]
    _or_ibex_controller_v_434_238 <= or(stall, asUInt(halt_if)) @[ibex_controller.v:434.34-434.49]
    _and_ibex_controller_v_433_237 <= and(_not_ibex_controller_v_433_235_Y, asUInt(_not_ibex_controller_v_433_236_Y)) @[ibex_controller.v:433.26-433.43]
    _not_ibex_controller_v_433_236 <= not(pad(halt_if, 1)) @[ibex_controller.v:433.35-433.43]
    _not_ibex_controller_v_433_235 <= not(pad(stall, 1)) @[ibex_controller.v:433.26-433.32]
    _or_ibex_controller_v_432_234 <= or(_or_ibex_controller_v_432_233_Y, asUInt(stall_branch_i)) @[ibex_controller.v:432.18-432.83]
    _or_ibex_controller_v_432_233 <= or(_or_ibex_controller_v_432_232_Y, asUInt(stall_jump_i)) @[ibex_controller.v:432.19-432.65]
    _or_ibex_controller_v_432_232 <= or(stall_lsu_i, asUInt(stall_multdiv_i)) @[ibex_controller.v:432.20-432.49]
    _logic_and_ibex_controller_v_420_231 <= and(neq(csr_pipe_flush, UInt(0)), asUInt(neq(handle_irq, UInt(0)))) @[ibex_controller.v:420.15-420.43]
    _or_ibex_controller_v_386_230 <= or(debug_mode_q, asUInt(ebreak_into_debug)) @[ibex_controller.v:386.12-386.44]
    _ternary_ibex_controller_v_384_229 <= mux(_eq_ibex_controller_v_384_228_Y, UInt<6>("h0b"), UInt<6>("h08")) @[ibex_controller.v:384.22-384.97]
    _eq_ibex_controller_v_384_228 <= eq(priv_mode_i, asUInt(UInt<2>("h3"))) @[ibex_controller.v:384.23-384.48]
    _ternary_ibex_controller_v_381_227 <= mux(instr_is_compressed_i, cat(UInt<16>("h0000"), instr_compressed_i), instr_i) @[ibex_controller.v:381.22-381.83]
    _ternary_ibex_controller_v_372_226 <= mux(debug_mode_q, UInt<2>("h3"), UInt<2>("h0")) @[ibex_controller.v:372.22-372.64]
    _logic_or_ibex_controller_v_369_225 <= or(neq(_logic_or_ibex_controller_v_369_224_Y, UInt(0)), asUInt(neq(load_err_q, UInt(0)))) @[ibex_controller.v:369.10-369.50]
    _logic_or_ibex_controller_v_369_224 <= or(neq(exc_req_q, UInt(0)), asUInt(neq(store_err_q, UInt(0)))) @[ibex_controller.v:369.11-369.35]
    _logic_and_ibex_controller_v_356_223 <= and(neq(ebreak_into_debug, UInt(0)), asUInt(neq(_logic_not_ibex_controller_v_356_222_Y, UInt(0)))) @[ibex_controller.v:356.10-356.44]
    _logic_not_ibex_controller_v_356_222 <= eq(debug_mode_q, UInt(0)) @[ibex_controller.v:356.31-356.44]
    _logic_or_ibex_controller_v_335_221 <= or(neq(debug_single_step_i, UInt(0)), asUInt(neq(debug_req_i, UInt(0)))) @[ibex_controller.v:335.10-335.44]
    _ne_ibex_controller_v_323_218 <= neq(csr_mfip_i, asUInt(UInt<15>("h0000"))) @[ibex_controller.v:323.16-323.35]
    _logic_and_ibex_controller_v_319_215 <= and(neq(irq_nm_i, UInt(0)), asUInt(neq(_logic_not_ibex_controller_v_319_214_Y, UInt(0)))) @[ibex_controller.v:319.11-319.34]
    _logic_not_ibex_controller_v_319_214 <= eq(nmi_mode_q, UInt(0)) @[ibex_controller.v:319.23-319.34]
    _logic_and_ibex_controller_v_301_211 <= and(neq(_logic_not_ibex_controller_v_301_209_Y, UInt(0)), asUInt(neq(_logic_not_ibex_controller_v_301_210_Y, UInt(0)))) @[ibex_controller.v:301.10-301.32]
    _logic_not_ibex_controller_v_301_210 <= eq(special_req, UInt(0)) @[ibex_controller.v:301.20-301.32]
    _logic_not_ibex_controller_v_301_209 <= eq(stall, UInt(0)) @[ibex_controller.v:301.10-301.16]
    _logic_and_ibex_controller_v_298_208 <= and(neq(_logic_or_ibex_controller_v_298_207_Y, UInt(0)), asUInt(neq(stall, UInt(0)))) @[ibex_controller.v:298.11-298.52]
    _logic_or_ibex_controller_v_298_207 <= or(neq(enter_debug_mode, UInt(0)), asUInt(neq(handle_irq, UInt(0)))) @[ibex_controller.v:298.12-298.42]
    _logic_or_ibex_controller_v_292_206 <= or(neq(branch_set_i, UInt(0)), asUInt(neq(jump_set_i, UInt(0)))) @[ibex_controller.v:292.16-292.42]
    _logic_or_ibex_controller_v_268_205 <= or(neq(_logic_or_ibex_controller_v_268_204_Y, UInt(0)), asUInt(neq(debug_single_step_i, UInt(0)))) @[ibex_controller.v:268.10-268.95]
    _logic_or_ibex_controller_v_268_204 <= or(neq(_logic_or_ibex_controller_v_268_203_Y, UInt(0)), asUInt(neq(debug_mode_q, UInt(0)))) @[ibex_controller.v:268.11-268.71]
    _logic_or_ibex_controller_v_268_203 <= or(neq(_logic_or_ibex_controller_v_268_202_Y, UInt(0)), asUInt(neq(debug_req_i, UInt(0)))) @[ibex_controller.v:268.12-268.54]
    _logic_or_ibex_controller_v_268_202 <= or(neq(irq_nm_i, UInt(0)), asUInt(neq(irq_pending_i, UInt(0)))) @[ibex_controller.v:268.13-268.38]
    _and_ibex_controller_v_185_195 <= and(_not_ibex_controller_v_185_190_Y, asUInt(_or_ibex_controller_v_185_194_Y)) @[ibex_controller.v:185.23-185.103]
    _or_ibex_controller_v_185_194 <= or(_and_ibex_controller_v_185_192_Y, asUInt(_and_ibex_controller_v_185_193_Y)) @[ibex_controller.v:185.40-185.102]
    _and_ibex_controller_v_185_193 <= and(irq_pending_i, asUInt(csr_mstatus_mie_i)) @[ibex_controller.v:185.68-185.101]
    _and_ibex_controller_v_185_192 <= and(irq_nm_i, asUInt(_not_ibex_controller_v_185_191_Y)) @[ibex_controller.v:185.41-185.63]
    _not_ibex_controller_v_185_191 <= not(pad(nmi_mode_q, 1)) @[ibex_controller.v:185.52-185.63]
    _not_ibex_controller_v_185_190 <= not(pad(debug_mode_q, 1)) @[ibex_controller.v:185.23-185.36]
    _ternary_ibex_controller_v_184_189 <= mux(_eq_ibex_controller_v_184_186_Y, debug_ebreakm_i, _ternary_ibex_controller_v_184_188_Y) @[ibex_controller.v:184.30-184.132]
    _ternary_ibex_controller_v_184_188 <= mux(_eq_ibex_controller_v_184_187_Y, debug_ebreaku_i, UInt<1>("h0")) @[ibex_controller.v:184.79-184.131]
    _eq_ibex_controller_v_184_187 <= eq(priv_mode_i, asUInt(UInt<2>("h0"))) @[ibex_controller.v:184.80-184.105]
    _eq_ibex_controller_v_184_186 <= eq(priv_mode_i, asUInt(UInt<2>("h3"))) @[ibex_controller.v:184.31-184.56]
    _and_ibex_controller_v_183_185 <= and(_or_ibex_controller_v_183_183_Y, asUInt(_not_ibex_controller_v_183_184_Y)) @[ibex_controller.v:183.29-183.98]
    _not_ibex_controller_v_183_184 <= not(pad(debug_mode_q, 1)) @[ibex_controller.v:183.85-183.98]
    _or_ibex_controller_v_183_183 <= or(debug_req_i, asUInt(_and_ibex_controller_v_183_182_Y)) @[ibex_controller.v:183.30-183.81]
    _and_ibex_controller_v_183_182 <= and(debug_single_step_i, asUInt(instr_valid_i)) @[ibex_controller.v:183.45-183.80]
    _or_ibex_controller_v_182_181 <= or(_or_ibex_controller_v_182_180_Y, asUInt(exc_req_lsu)) @[ibex_controller.v:182.24-182.107]
    _or_ibex_controller_v_182_180 <= or(_or_ibex_controller_v_182_179_Y, asUInt(exc_req_d)) @[ibex_controller.v:182.25-182.92]
    _or_ibex_controller_v_182_179 <= or(_or_ibex_controller_v_182_178_Y, asUInt(csr_pipe_flush)) @[ibex_controller.v:182.26-182.79]
    _or_ibex_controller_v_182_178 <= or(_or_ibex_controller_v_182_177_Y, asUInt(wfi_insn)) @[ibex_controller.v:182.27-182.61]
    _or_ibex_controller_v_182_177 <= or(mret_insn, asUInt(dret_insn)) @[ibex_controller.v:182.28-182.49]
    _or_ibex_controller_v_181_176 <= or(store_err_i, asUInt(load_err_i)) @[ibex_controller.v:181.24-181.48]
    _and_ibex_controller_v_180_175 <= and(_or_ibex_controller_v_180_173_Y, asUInt(_ne_ibex_controller_v_180_174_Y)) @[ibex_controller.v:180.22-180.110]
    _ne_ibex_controller_v_180_174 <= neq(ctrl_fsm_cs, asUInt(UInt<4>("h6"))) @[ibex_controller.v:180.89-180.109]
    _or_ibex_controller_v_180_173 <= or(_or_ibex_controller_v_180_172_Y, asUInt(instr_fetch_err)) @[ibex_controller.v:180.23-180.84]
    _or_ibex_controller_v_180_172 <= or(_or_ibex_controller_v_180_171_Y, asUInt(illegal_insn_d)) @[ibex_controller.v:180.24-180.65]
    _or_ibex_controller_v_180_171 <= or(ecall_insn, asUInt(ebrk_insn)) @[ibex_controller.v:180.25-180.47]
    _and_ibex_controller_v_179_170 <= and(_or_ibex_controller_v_179_168_Y, asUInt(_ne_ibex_controller_v_179_169_Y)) @[ibex_controller.v:179.27-179.101]
    _ne_ibex_controller_v_179_169 <= neq(ctrl_fsm_cs, asUInt(UInt<4>("h6"))) @[ibex_controller.v:179.80-179.100]
    _or_ibex_controller_v_179_168 <= or(_or_ibex_controller_v_179_167_Y, asUInt(illegal_umode)) @[ibex_controller.v:179.28-179.75]
    _or_ibex_controller_v_179_167 <= or(illegal_insn_i, asUInt(illegal_dret)) @[ibex_controller.v:179.29-179.58]
    _and_ibex_controller_v_178_166 <= and(_ne_ibex_controller_v_178_163_Y, asUInt(_or_ibex_controller_v_178_165_Y)) @[ibex_controller.v:178.26-178.99]
    _or_ibex_controller_v_178_165 <= or(mret_insn, asUInt(_and_ibex_controller_v_178_164_Y)) @[ibex_controller.v:178.57-178.98]
    _and_ibex_controller_v_178_164 <= and(csr_mstatus_tw_i, asUInt(wfi_insn)) @[ibex_controller.v:178.70-178.97]
    _ne_ibex_controller_v_178_163 <= neq(priv_mode_i, asUInt(UInt<2>("h3"))) @[ibex_controller.v:178.27-178.52]
    _and_ibex_controller_v_177_162 <= and(dret_insn, asUInt(_not_ibex_controller_v_177_161_Y)) @[ibex_controller.v:177.25-177.50]
    _not_ibex_controller_v_177_161 <= not(pad(debug_mode_q, 1)) @[ibex_controller.v:177.37-177.50]
    _and_ibex_controller_v_176_160 <= and(instr_fetch_err_i, asUInt(instr_valid_i)) @[ibex_controller.v:176.28-176.61]
    _and_ibex_controller_v_175_159 <= and(csr_pipe_flush_i, asUInt(instr_valid_i)) @[ibex_controller.v:175.27-175.59]
    _and_ibex_controller_v_174_158 <= and(ebrk_insn_i, asUInt(instr_valid_i)) @[ibex_controller.v:174.22-174.49]
    _and_ibex_controller_v_173_157 <= and(wfi_insn_i, asUInt(instr_valid_i)) @[ibex_controller.v:173.21-173.47]
    _and_ibex_controller_v_172_156 <= and(dret_insn_i, asUInt(instr_valid_i)) @[ibex_controller.v:172.22-172.49]
    _and_ibex_controller_v_171_155 <= and(mret_insn_i, asUInt(instr_valid_i)) @[ibex_controller.v:171.22-171.49]
    _and_ibex_controller_v_170_154 <= and(ecall_insn_i, asUInt(instr_valid_i)) @[ibex_controller.v:170.23-170.51]
    _244 <= load_err_i
    _245 <= store_err_i
    _246 <= _and_ibex_controller_v_170_154_Y
    _247 <= _and_ibex_controller_v_171_155_Y
    _248 <= _and_ibex_controller_v_172_156_Y
    _249 <= _and_ibex_controller_v_173_157_Y
    _250 <= _and_ibex_controller_v_174_158_Y
    _251 <= _and_ibex_controller_v_175_159_Y
    _252 <= _and_ibex_controller_v_176_160_Y
    _253 <= _and_ibex_controller_v_177_162_Y
    _254 <= _and_ibex_controller_v_178_166_Y
    _255 <= _and_ibex_controller_v_179_170_Y
    _256 <= _and_ibex_controller_v_180_175_Y
    _257 <= _or_ibex_controller_v_181_176_Y
    _258 <= _or_ibex_controller_v_182_181_Y
    _259 <= _and_ibex_controller_v_183_185_Y
    _260 <= _ternary_ibex_controller_v_184_189_Y
    _261 <= _and_ibex_controller_v_185_195_Y
    _262 <= csr_mtip_i
    _263 <= debug_mode_q
    _264 <= _or_ibex_controller_v_432_234_Y
    _265 <= _and_ibex_controller_v_433_237_Y
    _266 <= _or_ibex_controller_v_434_240_Y

    _logic_not_ibex_controller_v_436_242_Y <= bits(_logic_not_ibex_controller_v_436_242, 0, 0) @[ibex_controller.v:436.7-436.14]
    _or_ibex_controller_v_434_240_Y <= bits(_or_ibex_controller_v_434_240, 0, 0) @[ibex_controller.v:434.32-434.61]
    _not_ibex_controller_v_434_239_Y <= bits(_not_ibex_controller_v_434_239, 0, 0) @[ibex_controller.v:434.32-434.50]
    _or_ibex_controller_v_434_238_Y <= bits(_or_ibex_controller_v_434_238, 0, 0) @[ibex_controller.v:434.34-434.49]
    _and_ibex_controller_v_433_237_Y <= bits(_and_ibex_controller_v_433_237, 0, 0) @[ibex_controller.v:433.26-433.43]
    _not_ibex_controller_v_433_236_Y <= bits(_not_ibex_controller_v_433_236, 0, 0) @[ibex_controller.v:433.35-433.43]
    _not_ibex_controller_v_433_235_Y <= bits(_not_ibex_controller_v_433_235, 0, 0) @[ibex_controller.v:433.26-433.32]
    _or_ibex_controller_v_432_234_Y <= bits(_or_ibex_controller_v_432_234, 0, 0) @[ibex_controller.v:432.18-432.83]
    _or_ibex_controller_v_432_233_Y <= bits(_or_ibex_controller_v_432_233, 0, 0) @[ibex_controller.v:432.19-432.65]
    _or_ibex_controller_v_432_232_Y <= bits(_or_ibex_controller_v_432_232, 0, 0) @[ibex_controller.v:432.20-432.49]
    _logic_and_ibex_controller_v_420_231_Y <= bits(_logic_and_ibex_controller_v_420_231, 0, 0) @[ibex_controller.v:420.15-420.43]
    _or_ibex_controller_v_386_230_Y <= bits(_or_ibex_controller_v_386_230, 0, 0) @[ibex_controller.v:386.12-386.44]
    _ternary_ibex_controller_v_384_229_Y <= bits(_ternary_ibex_controller_v_384_229, 5, 0) @[ibex_controller.v:384.22-384.97]
    _eq_ibex_controller_v_384_228_Y <= bits(_eq_ibex_controller_v_384_228, 0, 0) @[ibex_controller.v:384.23-384.48]
    _ternary_ibex_controller_v_381_227_Y <= bits(_ternary_ibex_controller_v_381_227, 31, 0) @[ibex_controller.v:381.22-381.83]
    _ternary_ibex_controller_v_372_226_Y <= bits(_ternary_ibex_controller_v_372_226, 1, 0) @[ibex_controller.v:372.22-372.64]
    _logic_or_ibex_controller_v_369_225_Y <= bits(_logic_or_ibex_controller_v_369_225, 0, 0) @[ibex_controller.v:369.10-369.50]
    _logic_or_ibex_controller_v_369_224_Y <= bits(_logic_or_ibex_controller_v_369_224, 0, 0) @[ibex_controller.v:369.11-369.35]
    _logic_and_ibex_controller_v_356_223_Y <= bits(_logic_and_ibex_controller_v_356_223, 0, 0) @[ibex_controller.v:356.10-356.44]
    _logic_not_ibex_controller_v_356_222_Y <= bits(_logic_not_ibex_controller_v_356_222, 0, 0) @[ibex_controller.v:356.31-356.44]
    _logic_or_ibex_controller_v_335_221_Y <= bits(_logic_or_ibex_controller_v_335_221, 0, 0) @[ibex_controller.v:335.10-335.44]
    _ne_ibex_controller_v_323_218_Y <= bits(_ne_ibex_controller_v_323_218, 0, 0) @[ibex_controller.v:323.16-323.35]
    _logic_and_ibex_controller_v_319_215_Y <= bits(_logic_and_ibex_controller_v_319_215, 0, 0) @[ibex_controller.v:319.11-319.34]
    _logic_not_ibex_controller_v_319_214_Y <= bits(_logic_not_ibex_controller_v_319_214, 0, 0) @[ibex_controller.v:319.23-319.34]
    _logic_and_ibex_controller_v_301_211_Y <= bits(_logic_and_ibex_controller_v_301_211, 0, 0) @[ibex_controller.v:301.10-301.32]
    _logic_not_ibex_controller_v_301_210_Y <= bits(_logic_not_ibex_controller_v_301_210, 0, 0) @[ibex_controller.v:301.20-301.32]
    _logic_not_ibex_controller_v_301_209_Y <= bits(_logic_not_ibex_controller_v_301_209, 0, 0) @[ibex_controller.v:301.10-301.16]
    _logic_and_ibex_controller_v_298_208_Y <= bits(_logic_and_ibex_controller_v_298_208, 0, 0) @[ibex_controller.v:298.11-298.52]
    _logic_or_ibex_controller_v_298_207_Y <= bits(_logic_or_ibex_controller_v_298_207, 0, 0) @[ibex_controller.v:298.12-298.42]
    _logic_or_ibex_controller_v_292_206_Y <= bits(_logic_or_ibex_controller_v_292_206, 0, 0) @[ibex_controller.v:292.16-292.42]
    _logic_or_ibex_controller_v_268_205_Y <= bits(_logic_or_ibex_controller_v_268_205, 0, 0) @[ibex_controller.v:268.10-268.95]
    _logic_or_ibex_controller_v_268_204_Y <= bits(_logic_or_ibex_controller_v_268_204, 0, 0) @[ibex_controller.v:268.11-268.71]
    _logic_or_ibex_controller_v_268_203_Y <= bits(_logic_or_ibex_controller_v_268_203, 0, 0) @[ibex_controller.v:268.12-268.54]
    _logic_or_ibex_controller_v_268_202_Y <= bits(_logic_or_ibex_controller_v_268_202, 0, 0) @[ibex_controller.v:268.13-268.38]
    _and_ibex_controller_v_185_195_Y <= bits(_and_ibex_controller_v_185_195, 0, 0) @[ibex_controller.v:185.23-185.103]
    _or_ibex_controller_v_185_194_Y <= bits(_or_ibex_controller_v_185_194, 0, 0) @[ibex_controller.v:185.40-185.102]
    _and_ibex_controller_v_185_193_Y <= bits(_and_ibex_controller_v_185_193, 0, 0) @[ibex_controller.v:185.68-185.101]
    _and_ibex_controller_v_185_192_Y <= bits(_and_ibex_controller_v_185_192, 0, 0) @[ibex_controller.v:185.41-185.63]
    _not_ibex_controller_v_185_191_Y <= bits(_not_ibex_controller_v_185_191, 0, 0) @[ibex_controller.v:185.52-185.63]
    _not_ibex_controller_v_185_190_Y <= bits(_not_ibex_controller_v_185_190, 0, 0) @[ibex_controller.v:185.23-185.36]
    _ternary_ibex_controller_v_184_189_Y <= bits(_ternary_ibex_controller_v_184_189, 0, 0) @[ibex_controller.v:184.30-184.132]
    _ternary_ibex_controller_v_184_188_Y <= bits(_ternary_ibex_controller_v_184_188, 0, 0) @[ibex_controller.v:184.79-184.131]
    _eq_ibex_controller_v_184_187_Y <= bits(_eq_ibex_controller_v_184_187, 0, 0) @[ibex_controller.v:184.80-184.105]
    _eq_ibex_controller_v_184_186_Y <= bits(_eq_ibex_controller_v_184_186, 0, 0) @[ibex_controller.v:184.31-184.56]
    _and_ibex_controller_v_183_185_Y <= bits(_and_ibex_controller_v_183_185, 0, 0) @[ibex_controller.v:183.29-183.98]
    _not_ibex_controller_v_183_184_Y <= bits(_not_ibex_controller_v_183_184, 0, 0) @[ibex_controller.v:183.85-183.98]
    _or_ibex_controller_v_183_183_Y <= bits(_or_ibex_controller_v_183_183, 0, 0) @[ibex_controller.v:183.30-183.81]
    _and_ibex_controller_v_183_182_Y <= bits(_and_ibex_controller_v_183_182, 0, 0) @[ibex_controller.v:183.45-183.80]
    _or_ibex_controller_v_182_181_Y <= bits(_or_ibex_controller_v_182_181, 0, 0) @[ibex_controller.v:182.24-182.107]
    _or_ibex_controller_v_182_180_Y <= bits(_or_ibex_controller_v_182_180, 0, 0) @[ibex_controller.v:182.25-182.92]
    _or_ibex_controller_v_182_179_Y <= bits(_or_ibex_controller_v_182_179, 0, 0) @[ibex_controller.v:182.26-182.79]
    _or_ibex_controller_v_182_178_Y <= bits(_or_ibex_controller_v_182_178, 0, 0) @[ibex_controller.v:182.27-182.61]
    _or_ibex_controller_v_182_177_Y <= bits(_or_ibex_controller_v_182_177, 0, 0) @[ibex_controller.v:182.28-182.49]
    _or_ibex_controller_v_181_176_Y <= bits(_or_ibex_controller_v_181_176, 0, 0) @[ibex_controller.v:181.24-181.48]
    _and_ibex_controller_v_180_175_Y <= bits(_and_ibex_controller_v_180_175, 0, 0) @[ibex_controller.v:180.22-180.110]
    _ne_ibex_controller_v_180_174_Y <= bits(_ne_ibex_controller_v_180_174, 0, 0) @[ibex_controller.v:180.89-180.109]
    _or_ibex_controller_v_180_173_Y <= bits(_or_ibex_controller_v_180_173, 0, 0) @[ibex_controller.v:180.23-180.84]
    _or_ibex_controller_v_180_172_Y <= bits(_or_ibex_controller_v_180_172, 0, 0) @[ibex_controller.v:180.24-180.65]
    _or_ibex_controller_v_180_171_Y <= bits(_or_ibex_controller_v_180_171, 0, 0) @[ibex_controller.v:180.25-180.47]
    _and_ibex_controller_v_179_170_Y <= bits(_and_ibex_controller_v_179_170, 0, 0) @[ibex_controller.v:179.27-179.101]
    _ne_ibex_controller_v_179_169_Y <= bits(_ne_ibex_controller_v_179_169, 0, 0) @[ibex_controller.v:179.80-179.100]
    _or_ibex_controller_v_179_168_Y <= bits(_or_ibex_controller_v_179_168, 0, 0) @[ibex_controller.v:179.28-179.75]
    _or_ibex_controller_v_179_167_Y <= bits(_or_ibex_controller_v_179_167, 0, 0) @[ibex_controller.v:179.29-179.58]
    _and_ibex_controller_v_178_166_Y <= bits(_and_ibex_controller_v_178_166, 0, 0) @[ibex_controller.v:178.26-178.99]
    _or_ibex_controller_v_178_165_Y <= bits(_or_ibex_controller_v_178_165, 0, 0) @[ibex_controller.v:178.57-178.98]
    _and_ibex_controller_v_178_164_Y <= bits(_and_ibex_controller_v_178_164, 0, 0) @[ibex_controller.v:178.70-178.97]
    _ne_ibex_controller_v_178_163_Y <= bits(_ne_ibex_controller_v_178_163, 0, 0) @[ibex_controller.v:178.27-178.52]
    _and_ibex_controller_v_177_162_Y <= bits(_and_ibex_controller_v_177_162, 0, 0) @[ibex_controller.v:177.25-177.50]
    _not_ibex_controller_v_177_161_Y <= bits(_not_ibex_controller_v_177_161, 0, 0) @[ibex_controller.v:177.37-177.50]
    _and_ibex_controller_v_176_160_Y <= bits(_and_ibex_controller_v_176_160, 0, 0) @[ibex_controller.v:176.28-176.61]
    _and_ibex_controller_v_175_159_Y <= bits(_and_ibex_controller_v_175_159, 0, 0) @[ibex_controller.v:175.27-175.59]
    _and_ibex_controller_v_174_158_Y <= bits(_and_ibex_controller_v_174_158, 0, 0) @[ibex_controller.v:174.22-174.49]
    _and_ibex_controller_v_173_157_Y <= bits(_and_ibex_controller_v_173_157, 0, 0) @[ibex_controller.v:173.21-173.47]
    _and_ibex_controller_v_172_156_Y <= bits(_and_ibex_controller_v_172_156, 0, 0) @[ibex_controller.v:172.22-172.49]
    _and_ibex_controller_v_171_155_Y <= bits(_and_ibex_controller_v_171_155, 0, 0) @[ibex_controller.v:171.22-171.49]
    _and_ibex_controller_v_170_154_Y <= bits(_and_ibex_controller_v_170_154, 0, 0) @[ibex_controller.v:170.23-170.51]
    instr_fetch_err <= bits(_252, 0, 0) @[ibex_controller.v:160.7-160.22]
    csr_pipe_flush <= bits(_251, 0, 0) @[ibex_controller.v:159.7-159.21]
    ebrk_insn <= bits(_250, 0, 0) @[ibex_controller.v:158.7-158.16]
    wfi_insn <= bits(_249, 0, 0) @[ibex_controller.v:157.7-157.15]
    dret_insn <= bits(_248, 0, 0) @[ibex_controller.v:156.7-156.16]
    mret_insn <= bits(_247, 0, 0) @[ibex_controller.v:155.7-155.16]
    ecall_insn <= bits(_246, 0, 0) @[ibex_controller.v:154.7-154.17]
    unused_csr_mtip <= bits(_262, 0, 0) @[ibex_controller.v:153.7-153.22]
    handle_irq <= bits(_261, 0, 0) @[ibex_controller.v:151.7-151.17]
    ebreak_into_debug <= bits(_260, 0, 0) @[ibex_controller.v:150.7-150.24]
    enter_debug_mode <= bits(_259, 0, 0) @[ibex_controller.v:149.7-149.23]
    special_req <= bits(_258, 0, 0) @[ibex_controller.v:148.7-148.18]
    exc_req_lsu <= bits(_257, 0, 0) @[ibex_controller.v:147.7-147.18]
    illegal_umode <= bits(_254, 0, 0) @[ibex_controller.v:146.7-146.20]
    illegal_dret <= bits(_253, 0, 0) @[ibex_controller.v:145.7-145.19]
    stall <= bits(_264, 0, 0) @[ibex_controller.v:142.7-142.12]
    illegal_insn_d <= bits(_255, 0, 0) @[ibex_controller.v:141.7-141.21]
    exc_req_d <= bits(_256, 0, 0) @[ibex_controller.v:139.7-139.16]
    store_err_d <= bits(_245, 0, 0) @[ibex_controller.v:137.7-137.18]
    load_err_d <= bits(_244, 0, 0) @[ibex_controller.v:135.7-135.17]
    debug_mode_o <= bits(_263, 0, 0) @[ibex_controller.v:109.14-109.26]
    id_in_ready_o <= bits(_265, 0, 0) @[ibex_controller.v:88.14-88.27]
    instr_valid_clear_o <= bits(_266, 0, 0) @[ibex_controller.v:87.14-87.33]

  module ibex_register_file: @[ibex_register_file_ff.v:1.1-65.10]
    input we_a_i: UInt<1> @[ibex_register_file_ff.v:27.13-27.19]
    input wdata_a_i: UInt<32> @[ibex_register_file_ff.v:26.20-26.29]
    input waddr_a_i: UInt<5> @[ibex_register_file_ff.v:24.19-24.28]
    output rdata_b_o: UInt<32> @[ibex_register_file_ff.v:23.21-23.30]
    input raddr_b_i: UInt<5> @[ibex_register_file_ff.v:21.19-21.28]
    output rdata_a_o: UInt<32> @[ibex_register_file_ff.v:20.21-20.30]
    input raddr_a_i: UInt<5> @[ibex_register_file_ff.v:18.19-18.28]
    input test_en_i: UInt<1> @[ibex_register_file_ff.v:17.13-17.22]
    input rst_ni: UInt<1> @[ibex_register_file_ff.v:16.13-16.19]
    input clk_i: UInt<1> @[ibex_register_file_ff.v:15.13-15.18]

    wire _shiftx_ibex_register_file_ff_v_0_152_Y: UInt<32> @[ibex_register_file_ff.v:0.0-0.0]
    wire _add_ibex_register_file_ff_v_0_151_Y: UInt<32> @[ibex_register_file_ff.v:0.0-0.0]
    wire _add_ibex_register_file_ff_v_60_150_Y: UInt<32> @[ibex_register_file_ff.v:60.29-60.211]
    wire _mul_ibex_register_file_ff_v_60_149_Y: UInt<32> @[ibex_register_file_ff.v:60.79-60.210]
    wire _shiftx_ibex_register_file_ff_v_0_148_Y: UInt<32> @[ibex_register_file_ff.v:0.0-0.0]
    wire _add_ibex_register_file_ff_v_0_147_Y: UInt<32> @[ibex_register_file_ff.v:0.0-0.0]
    wire _add_ibex_register_file_ff_v_59_146_Y: UInt<32> @[ibex_register_file_ff.v:59.29-59.211]
    wire _mul_ibex_register_file_ff_v_59_145_Y: UInt<32> @[ibex_register_file_ff.v:59.79-59.210]
    wire _1_sv2v_autoblock_3_r_31_0_: UInt<32> @[ibex_register_file_ff.v:48.2-56.6]
    wire _logic_not_ibex_register_file_ff_v_49_144_Y: UInt<1> @[ibex_register_file_ff.v:49.7-49.14]
    wire _0_sv2v_autoblock_3_r_31_0_: UInt<32> @[ibex_register_file_ff.v:48.2-56.6]
    wire _0_rf_reg_tmp_991_0_: UInt<992> @[ibex_register_file_ff.v:48.2-56.6]
    wire _ternary_ibex_register_file_ff_v_45_142_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_141_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_140_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_139_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_138_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_137_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_136_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_135_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_134_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_133_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_132_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_131_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_130_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_129_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_128_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_127_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_126_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_125_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_124_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_123_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_122_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_121_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_120_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_119_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_118_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_117_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_116_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_115_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_114_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_113_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_112_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_111_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_110_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_109_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_108_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_107_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_106_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_105_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_104_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_103_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_102_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_101_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_100_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_99_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_98_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_97_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_96_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_95_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_94_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_93_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_92_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_91_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_90_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_89_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_88_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_87_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_86_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_85_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_84_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_83_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_82_Y: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_81_Y: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _0_we_a_decoder_sv2v_autoblock_2_i_31_0_: UInt<32> @[ibex_register_file_ff.v:41.5-47.5]
    wire _0_we_a_dec_30_0_: UInt<31> @[ibex_register_file_ff.v:41.5-47.5]
    wire sv2v_autoblock_3_r: UInt<32> @[ibex_register_file_ff.v:52.22-52.23]
    wire we_a_decoder_sv2v_autoblock_2_i: UInt<32> @[ibex_register_file_ff.v:43.15-43.16]
    wire we_a_dec: UInt<31> @[ibex_register_file_ff.v:39.13-39.21]
    wire rf_reg_tmp: UInt<992> @[ibex_register_file_ff.v:38.19-38.29]
    wire rf_reg: UInt<1024> @[ibex_register_file_ff.v:37.19-37.25]
    wire _shiftx_ibex_register_file_ff_v_0_152: UInt<32>
    wire _add_ibex_register_file_ff_v_0_151: UInt<32> @[ibex_register_file_ff.v:0.0-0.0]
    wire _add_ibex_register_file_ff_v_60_150: UInt<32> @[ibex_register_file_ff.v:60.29-60.211]
    wire _mul_ibex_register_file_ff_v_60_149: UInt<32> @[ibex_register_file_ff.v:60.79-60.210]
    wire _shiftx_ibex_register_file_ff_v_0_148: UInt<32>
    wire _add_ibex_register_file_ff_v_0_147: UInt<32> @[ibex_register_file_ff.v:0.0-0.0]
    wire _add_ibex_register_file_ff_v_59_146: UInt<32> @[ibex_register_file_ff.v:59.29-59.211]
    wire _mul_ibex_register_file_ff_v_59_145: UInt<32> @[ibex_register_file_ff.v:59.79-59.210]
    wire _logic_not_ibex_register_file_ff_v_49_144: UInt<1> @[ibex_register_file_ff.v:49.7-49.14]
    wire _ternary_ibex_register_file_ff_v_45_142: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_141: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_140: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_139: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_138: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_137: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_136: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_135: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_134: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_133: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_132: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_131: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_130: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_129: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_128: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_127: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_126: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_125: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_124: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_123: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_122: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_121: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_120: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_119: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_118: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_117: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_116: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_115: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_114: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_113: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_112: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_111: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_110: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_109: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_108: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_107: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_106: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_105: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_104: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_103: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_102: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_101: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_100: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_99: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_98: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_97: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_96: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_95: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_94: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_93: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_92: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_91: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_90: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_89: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_88: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_87: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_86: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_85: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_84: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_83: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _ternary_ibex_register_file_ff_v_45_82: UInt<1> @[ibex_register_file_ff.v:45.20-45.65]
    wire _eq_ibex_register_file_ff_v_45_81: UInt<1> @[ibex_register_file_ff.v:45.21-45.48]
    wire _499: UInt<32>
    wire _500: UInt<992>
    wire _501: UInt<32>
    wire _502: UInt<32>
    _1_sv2v_autoblock_3_r_31_0_ is invalid
    _0_sv2v_autoblock_3_r_31_0_ is invalid
    _0_rf_reg_tmp_991_0_ is invalid
    _0_we_a_decoder_sv2v_autoblock_2_i_31_0_ is invalid
    _0_we_a_dec_30_0_ is invalid
    sv2v_autoblock_3_r is invalid
    we_a_decoder_sv2v_autoblock_2_i is invalid
    we_a_dec is invalid
    rf_reg_tmp is invalid


    _shiftx_ibex_register_file_ff_v_0_152 <= dshr(rf_reg, validif(not(bits(_add_ibex_register_file_ff_v_0_151_Y, 31, 31)), _add_ibex_register_file_ff_v_0_151_Y))
    _add_ibex_register_file_ff_v_0_151 <= add(_add_ibex_register_file_ff_v_60_150_Y, asUInt(UInt<32>("h00000000"))) @[ibex_register_file_ff.v:0.0-0.0]
    _add_ibex_register_file_ff_v_60_150 <= add(UInt<32>("h00000000"), asUInt(_mul_ibex_register_file_ff_v_60_149_Y)) @[ibex_register_file_ff.v:60.29-60.211]
    _mul_ibex_register_file_ff_v_60_149 <= mul(cat(UInt<27>("h0000000"), raddr_b_i), asUInt(UInt<32>("h00000020"))) @[ibex_register_file_ff.v:60.79-60.210]
    _shiftx_ibex_register_file_ff_v_0_148 <= dshr(rf_reg, validif(not(bits(_add_ibex_register_file_ff_v_0_147_Y, 31, 31)), _add_ibex_register_file_ff_v_0_147_Y))
    _add_ibex_register_file_ff_v_0_147 <= add(_add_ibex_register_file_ff_v_59_146_Y, asUInt(UInt<32>("h00000000"))) @[ibex_register_file_ff.v:0.0-0.0]
    _add_ibex_register_file_ff_v_59_146 <= add(UInt<32>("h00000000"), asUInt(_mul_ibex_register_file_ff_v_59_145_Y)) @[ibex_register_file_ff.v:59.29-59.211]
    _mul_ibex_register_file_ff_v_59_145 <= mul(cat(UInt<27>("h0000000"), raddr_a_i), asUInt(UInt<32>("h00000020"))) @[ibex_register_file_ff.v:59.79-59.210]
    _logic_not_ibex_register_file_ff_v_49_144 <= eq(rst_ni, UInt(0)) @[ibex_register_file_ff.v:49.7-49.14]
    _ternary_ibex_register_file_ff_v_45_142 <= mux(_eq_ibex_register_file_ff_v_45_141_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_141 <= eq(waddr_a_i, asUInt(UInt<5>("h1f"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_140 <= mux(_eq_ibex_register_file_ff_v_45_139_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_139 <= eq(waddr_a_i, asUInt(UInt<5>("h1e"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_138 <= mux(_eq_ibex_register_file_ff_v_45_137_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_137 <= eq(waddr_a_i, asUInt(UInt<5>("h1d"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_136 <= mux(_eq_ibex_register_file_ff_v_45_135_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_135 <= eq(waddr_a_i, asUInt(UInt<5>("h1c"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_134 <= mux(_eq_ibex_register_file_ff_v_45_133_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_133 <= eq(waddr_a_i, asUInt(UInt<5>("h1b"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_132 <= mux(_eq_ibex_register_file_ff_v_45_131_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_131 <= eq(waddr_a_i, asUInt(UInt<5>("h1a"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_130 <= mux(_eq_ibex_register_file_ff_v_45_129_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_129 <= eq(waddr_a_i, asUInt(UInt<5>("h19"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_128 <= mux(_eq_ibex_register_file_ff_v_45_127_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_127 <= eq(waddr_a_i, asUInt(UInt<5>("h18"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_126 <= mux(_eq_ibex_register_file_ff_v_45_125_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_125 <= eq(waddr_a_i, asUInt(UInt<5>("h17"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_124 <= mux(_eq_ibex_register_file_ff_v_45_123_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_123 <= eq(waddr_a_i, asUInt(UInt<5>("h16"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_122 <= mux(_eq_ibex_register_file_ff_v_45_121_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_121 <= eq(waddr_a_i, asUInt(UInt<5>("h15"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_120 <= mux(_eq_ibex_register_file_ff_v_45_119_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_119 <= eq(waddr_a_i, asUInt(UInt<5>("h14"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_118 <= mux(_eq_ibex_register_file_ff_v_45_117_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_117 <= eq(waddr_a_i, asUInt(UInt<5>("h13"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_116 <= mux(_eq_ibex_register_file_ff_v_45_115_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_115 <= eq(waddr_a_i, asUInt(UInt<5>("h12"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_114 <= mux(_eq_ibex_register_file_ff_v_45_113_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_113 <= eq(waddr_a_i, asUInt(UInt<5>("h11"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_112 <= mux(_eq_ibex_register_file_ff_v_45_111_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_111 <= eq(waddr_a_i, asUInt(UInt<5>("h10"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_110 <= mux(_eq_ibex_register_file_ff_v_45_109_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_109 <= eq(waddr_a_i, asUInt(UInt<5>("h0f"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_108 <= mux(_eq_ibex_register_file_ff_v_45_107_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_107 <= eq(waddr_a_i, asUInt(UInt<5>("h0e"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_106 <= mux(_eq_ibex_register_file_ff_v_45_105_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_105 <= eq(waddr_a_i, asUInt(UInt<5>("h0d"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_104 <= mux(_eq_ibex_register_file_ff_v_45_103_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_103 <= eq(waddr_a_i, asUInt(UInt<5>("h0c"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_102 <= mux(_eq_ibex_register_file_ff_v_45_101_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_101 <= eq(waddr_a_i, asUInt(UInt<5>("h0b"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_100 <= mux(_eq_ibex_register_file_ff_v_45_99_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_99 <= eq(waddr_a_i, asUInt(UInt<5>("h0a"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_98 <= mux(_eq_ibex_register_file_ff_v_45_97_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_97 <= eq(waddr_a_i, asUInt(UInt<5>("h09"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_96 <= mux(_eq_ibex_register_file_ff_v_45_95_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_95 <= eq(waddr_a_i, asUInt(UInt<5>("h08"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_94 <= mux(_eq_ibex_register_file_ff_v_45_93_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_93 <= eq(waddr_a_i, asUInt(UInt<5>("h07"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_92 <= mux(_eq_ibex_register_file_ff_v_45_91_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_91 <= eq(waddr_a_i, asUInt(UInt<5>("h06"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_90 <= mux(_eq_ibex_register_file_ff_v_45_89_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_89 <= eq(waddr_a_i, asUInt(UInt<5>("h05"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_88 <= mux(_eq_ibex_register_file_ff_v_45_87_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_87 <= eq(waddr_a_i, asUInt(UInt<5>("h04"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_86 <= mux(_eq_ibex_register_file_ff_v_45_85_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_85 <= eq(waddr_a_i, asUInt(UInt<5>("h03"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_84 <= mux(_eq_ibex_register_file_ff_v_45_83_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_83 <= eq(waddr_a_i, asUInt(UInt<5>("h02"))) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_82 <= mux(_eq_ibex_register_file_ff_v_45_81_Y, we_a_i, UInt<1>("h0")) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_81 <= eq(waddr_a_i, asUInt(UInt<5>("h01"))) @[ibex_register_file_ff.v:45.21-45.48]
    _499 <= UInt<32>("h00000000")
    _500 <= rf_reg_tmp
    _501 <= _shiftx_ibex_register_file_ff_v_0_148_Y
    _502 <= _shiftx_ibex_register_file_ff_v_0_152_Y

    _shiftx_ibex_register_file_ff_v_0_152_Y <= bits(_shiftx_ibex_register_file_ff_v_0_152, 31, 0) @[ibex_register_file_ff.v:0.0-0.0]
    _add_ibex_register_file_ff_v_0_151_Y <= bits(_add_ibex_register_file_ff_v_0_151, 31, 0) @[ibex_register_file_ff.v:0.0-0.0]
    _add_ibex_register_file_ff_v_60_150_Y <= bits(_add_ibex_register_file_ff_v_60_150, 31, 0) @[ibex_register_file_ff.v:60.29-60.211]
    _mul_ibex_register_file_ff_v_60_149_Y <= bits(_mul_ibex_register_file_ff_v_60_149, 31, 0) @[ibex_register_file_ff.v:60.79-60.210]
    _shiftx_ibex_register_file_ff_v_0_148_Y <= bits(_shiftx_ibex_register_file_ff_v_0_148, 31, 0) @[ibex_register_file_ff.v:0.0-0.0]
    _add_ibex_register_file_ff_v_0_147_Y <= bits(_add_ibex_register_file_ff_v_0_147, 31, 0) @[ibex_register_file_ff.v:0.0-0.0]
    _add_ibex_register_file_ff_v_59_146_Y <= bits(_add_ibex_register_file_ff_v_59_146, 31, 0) @[ibex_register_file_ff.v:59.29-59.211]
    _mul_ibex_register_file_ff_v_59_145_Y <= bits(_mul_ibex_register_file_ff_v_59_145, 31, 0) @[ibex_register_file_ff.v:59.79-59.210]
    _logic_not_ibex_register_file_ff_v_49_144_Y <= bits(_logic_not_ibex_register_file_ff_v_49_144, 0, 0) @[ibex_register_file_ff.v:49.7-49.14]
    _ternary_ibex_register_file_ff_v_45_142_Y <= bits(_ternary_ibex_register_file_ff_v_45_142, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_141_Y <= bits(_eq_ibex_register_file_ff_v_45_141, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_140_Y <= bits(_ternary_ibex_register_file_ff_v_45_140, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_139_Y <= bits(_eq_ibex_register_file_ff_v_45_139, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_138_Y <= bits(_ternary_ibex_register_file_ff_v_45_138, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_137_Y <= bits(_eq_ibex_register_file_ff_v_45_137, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_136_Y <= bits(_ternary_ibex_register_file_ff_v_45_136, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_135_Y <= bits(_eq_ibex_register_file_ff_v_45_135, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_134_Y <= bits(_ternary_ibex_register_file_ff_v_45_134, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_133_Y <= bits(_eq_ibex_register_file_ff_v_45_133, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_132_Y <= bits(_ternary_ibex_register_file_ff_v_45_132, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_131_Y <= bits(_eq_ibex_register_file_ff_v_45_131, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_130_Y <= bits(_ternary_ibex_register_file_ff_v_45_130, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_129_Y <= bits(_eq_ibex_register_file_ff_v_45_129, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_128_Y <= bits(_ternary_ibex_register_file_ff_v_45_128, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_127_Y <= bits(_eq_ibex_register_file_ff_v_45_127, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_126_Y <= bits(_ternary_ibex_register_file_ff_v_45_126, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_125_Y <= bits(_eq_ibex_register_file_ff_v_45_125, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_124_Y <= bits(_ternary_ibex_register_file_ff_v_45_124, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_123_Y <= bits(_eq_ibex_register_file_ff_v_45_123, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_122_Y <= bits(_ternary_ibex_register_file_ff_v_45_122, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_121_Y <= bits(_eq_ibex_register_file_ff_v_45_121, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_120_Y <= bits(_ternary_ibex_register_file_ff_v_45_120, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_119_Y <= bits(_eq_ibex_register_file_ff_v_45_119, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_118_Y <= bits(_ternary_ibex_register_file_ff_v_45_118, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_117_Y <= bits(_eq_ibex_register_file_ff_v_45_117, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_116_Y <= bits(_ternary_ibex_register_file_ff_v_45_116, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_115_Y <= bits(_eq_ibex_register_file_ff_v_45_115, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_114_Y <= bits(_ternary_ibex_register_file_ff_v_45_114, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_113_Y <= bits(_eq_ibex_register_file_ff_v_45_113, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_112_Y <= bits(_ternary_ibex_register_file_ff_v_45_112, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_111_Y <= bits(_eq_ibex_register_file_ff_v_45_111, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_110_Y <= bits(_ternary_ibex_register_file_ff_v_45_110, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_109_Y <= bits(_eq_ibex_register_file_ff_v_45_109, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_108_Y <= bits(_ternary_ibex_register_file_ff_v_45_108, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_107_Y <= bits(_eq_ibex_register_file_ff_v_45_107, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_106_Y <= bits(_ternary_ibex_register_file_ff_v_45_106, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_105_Y <= bits(_eq_ibex_register_file_ff_v_45_105, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_104_Y <= bits(_ternary_ibex_register_file_ff_v_45_104, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_103_Y <= bits(_eq_ibex_register_file_ff_v_45_103, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_102_Y <= bits(_ternary_ibex_register_file_ff_v_45_102, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_101_Y <= bits(_eq_ibex_register_file_ff_v_45_101, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_100_Y <= bits(_ternary_ibex_register_file_ff_v_45_100, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_99_Y <= bits(_eq_ibex_register_file_ff_v_45_99, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_98_Y <= bits(_ternary_ibex_register_file_ff_v_45_98, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_97_Y <= bits(_eq_ibex_register_file_ff_v_45_97, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_96_Y <= bits(_ternary_ibex_register_file_ff_v_45_96, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_95_Y <= bits(_eq_ibex_register_file_ff_v_45_95, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_94_Y <= bits(_ternary_ibex_register_file_ff_v_45_94, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_93_Y <= bits(_eq_ibex_register_file_ff_v_45_93, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_92_Y <= bits(_ternary_ibex_register_file_ff_v_45_92, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_91_Y <= bits(_eq_ibex_register_file_ff_v_45_91, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_90_Y <= bits(_ternary_ibex_register_file_ff_v_45_90, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_89_Y <= bits(_eq_ibex_register_file_ff_v_45_89, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_88_Y <= bits(_ternary_ibex_register_file_ff_v_45_88, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_87_Y <= bits(_eq_ibex_register_file_ff_v_45_87, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_86_Y <= bits(_ternary_ibex_register_file_ff_v_45_86, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_85_Y <= bits(_eq_ibex_register_file_ff_v_45_85, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_84_Y <= bits(_ternary_ibex_register_file_ff_v_45_84, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_83_Y <= bits(_eq_ibex_register_file_ff_v_45_83, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    _ternary_ibex_register_file_ff_v_45_82_Y <= bits(_ternary_ibex_register_file_ff_v_45_82, 0, 0) @[ibex_register_file_ff.v:45.20-45.65]
    _eq_ibex_register_file_ff_v_45_81_Y <= bits(_eq_ibex_register_file_ff_v_45_81, 0, 0) @[ibex_register_file_ff.v:45.21-45.48]
    rf_reg <= cat(bits(_500, 991, 0), bits(_499, 31, 0)) @[ibex_register_file_ff.v:37.19-37.25]
    rdata_b_o <= bits(_502, 31, 0) @[ibex_register_file_ff.v:23.21-23.30]
    rdata_a_o <= bits(_501, 31, 0) @[ibex_register_file_ff.v:20.21-20.30]

  module ibex_id_stage: @[ibex_id_stage.v:1.1-484.10]
    output instr_ret_compressed_o: UInt<1> @[ibex_id_stage.v:170.14-170.36]
    output instr_ret_o: UInt<1> @[ibex_id_stage.v:169.13-169.24]
    output perf_tbranch_o: UInt<1> @[ibex_id_stage.v:168.14-168.28]
    output perf_branch_o: UInt<1> @[ibex_id_stage.v:167.13-167.26]
    output perf_jump_o: UInt<1> @[ibex_id_stage.v:166.14-166.25]
    output rfvi_reg_we_o: UInt<1> @[ibex_id_stage.v:165.14-165.27]
    output rfvi_reg_wdata_rd_o: UInt<32> @[ibex_id_stage.v:164.21-164.40]
    output rfvi_reg_waddr_rd_o: UInt<5> @[ibex_id_stage.v:163.20-163.39]
    output rfvi_reg_rdata_rb_o: UInt<32> @[ibex_id_stage.v:162.21-162.40]
    output rfvi_reg_raddr_rb_o: UInt<5> @[ibex_id_stage.v:161.20-161.39]
    output rfvi_reg_rdata_ra_o: UInt<32> @[ibex_id_stage.v:160.21-160.40]
    output rfvi_reg_raddr_ra_o: UInt<5> @[ibex_id_stage.v:159.20-159.39]
    input csr_rdata_i: UInt<32> @[ibex_id_stage.v:158.20-158.31]
    input regfile_wdata_ex_i: UInt<32> @[ibex_id_stage.v:157.20-157.38]
    input regfile_wdata_lsu_i: UInt<32> @[ibex_id_stage.v:156.20-156.39]
    input debug_ebreaku_i: UInt<1> @[ibex_id_stage.v:155.13-155.28]
    input debug_ebreakm_i: UInt<1> @[ibex_id_stage.v:154.13-154.28]
    input debug_single_step_i: UInt<1> @[ibex_id_stage.v:153.13-153.32]
    input debug_req_i: UInt<1> @[ibex_id_stage.v:152.13-152.24]
    output debug_csr_save_o: UInt<1> @[ibex_id_stage.v:151.14-151.30]
    output debug_cause_o: UInt<3> @[ibex_id_stage.v:150.20-150.33]
    output debug_mode_o: UInt<1> @[ibex_id_stage.v:149.14-149.26]
    input lsu_store_err_i: UInt<1> @[ibex_id_stage.v:148.13-148.28]
    input lsu_load_err_i: UInt<1> @[ibex_id_stage.v:147.13-147.27]
    input irq_nm_i: UInt<1> @[ibex_id_stage.v:146.13-146.21]
    input irq_pending_i: UInt<1> @[ibex_id_stage.v:145.13-145.26]
    input csr_mfip_i: UInt<15> @[ibex_id_stage.v:144.20-144.30]
    input csr_meip_i: UInt<1> @[ibex_id_stage.v:143.13-143.23]
    input csr_mtip_i: UInt<1> @[ibex_id_stage.v:142.13-142.23]
    input csr_msip_i: UInt<1> @[ibex_id_stage.v:141.13-141.23]
    input csr_mstatus_mie_i: UInt<1> @[ibex_id_stage.v:140.13-140.30]
    input lsu_addr_last_i: UInt<32> @[ibex_id_stage.v:139.20-139.35]
    input lsu_addr_incr_req_i: UInt<1> @[ibex_id_stage.v:138.13-138.32]
    output data_wdata_ex_o: UInt<32> @[ibex_id_stage.v:137.21-137.36]
    output data_sign_ext_ex_o: UInt<1> @[ibex_id_stage.v:136.14-136.32]
    output data_type_ex_o: UInt<2> @[ibex_id_stage.v:135.20-135.34]
    output data_we_ex_o: UInt<1> @[ibex_id_stage.v:134.14-134.26]
    output data_req_ex_o: UInt<1> @[ibex_id_stage.v:133.14-133.27]
    input illegal_csr_insn_i: UInt<1> @[ibex_id_stage.v:132.13-132.31]
    input csr_mstatus_tw_i: UInt<1> @[ibex_id_stage.v:131.13-131.29]
    input priv_mode_i: UInt<2> @[ibex_id_stage.v:130.14-130.25]
    output csr_mtval_o: UInt<32> @[ibex_id_stage.v:129.21-129.32]
    output csr_save_cause_o: UInt<1> @[ibex_id_stage.v:128.14-128.30]
    output csr_restore_dret_id_o: UInt<1> @[ibex_id_stage.v:127.14-127.35]
    output csr_restore_mret_id_o: UInt<1> @[ibex_id_stage.v:126.14-126.35]
    output csr_save_id_o: UInt<1> @[ibex_id_stage.v:125.14-125.27]
    output csr_save_if_o: UInt<1> @[ibex_id_stage.v:124.14-124.27]
    output csr_op_o: UInt<2> @[ibex_id_stage.v:123.20-123.28]
    output csr_access_o: UInt<1> @[ibex_id_stage.v:122.14-122.26]
    output multdiv_operand_b_ex_o: UInt<32> @[ibex_id_stage.v:121.21-121.43]
    output multdiv_operand_a_ex_o: UInt<32> @[ibex_id_stage.v:120.21-120.43]
    output multdiv_signed_mode_ex_o: UInt<2> @[ibex_id_stage.v:119.20-119.44]
    output multdiv_operator_ex_o: UInt<2> @[ibex_id_stage.v:118.20-118.41]
    output div_en_ex_o: UInt<1> @[ibex_id_stage.v:117.14-117.25]
    output mult_en_ex_o: UInt<1> @[ibex_id_stage.v:116.14-116.26]
    output alu_operand_b_ex_o: UInt<32> @[ibex_id_stage.v:115.21-115.39]
    output alu_operand_a_ex_o: UInt<32> @[ibex_id_stage.v:114.21-114.39]
    output alu_operator_ex_o: UInt<5> @[ibex_id_stage.v:113.20-113.37]
    input lsu_valid_i: UInt<1> @[ibex_id_stage.v:112.13-112.24]
    input ex_valid_i: UInt<1> @[ibex_id_stage.v:111.13-111.23]
    input pc_id_i: UInt<32> @[ibex_id_stage.v:110.20-110.27]
    input instr_fetch_err_i: UInt<1> @[ibex_id_stage.v:109.13-109.30]
    input illegal_c_insn_i: UInt<1> @[ibex_id_stage.v:108.13-108.29]
    output exc_cause_o: UInt<6> @[ibex_id_stage.v:107.20-107.31]
    output exc_pc_mux_o: UInt<2> @[ibex_id_stage.v:106.20-106.32]
    output pc_mux_o: UInt<3> @[ibex_id_stage.v:105.20-105.28]
    output pc_set_o: UInt<1> @[ibex_id_stage.v:104.14-104.22]
    input branch_decision_i: UInt<1> @[ibex_id_stage.v:103.13-103.30]
    output id_in_ready_o: UInt<1> @[ibex_id_stage.v:102.14-102.27]
    output instr_valid_clear_o: UInt<1> @[ibex_id_stage.v:101.14-101.33]
    output instr_req_o: UInt<1> @[ibex_id_stage.v:100.14-100.25]
    input instr_is_compressed_i: UInt<1> @[ibex_id_stage.v:99.13-99.34]
    input instr_rdata_c_i: UInt<16> @[ibex_id_stage.v:98.20-98.35]
    input instr_rdata_i: UInt<32> @[ibex_id_stage.v:97.20-97.33]
    input instr_new_i: UInt<1> @[ibex_id_stage.v:96.13-96.24]
    input instr_valid_i: UInt<1> @[ibex_id_stage.v:95.13-95.26]
    output illegal_insn_o: UInt<1> @[ibex_id_stage.v:94.14-94.28]
    output ctrl_busy_o: UInt<1> @[ibex_id_stage.v:93.14-93.25]
    input fetch_enable_i: UInt<1> @[ibex_id_stage.v:92.13-92.27]
    input test_en_i: UInt<1> @[ibex_id_stage.v:91.13-91.22]
    input rst_ni: UInt<1> @[ibex_id_stage.v:90.13-90.19]
    input clk_i: UInt<1> @[ibex_id_stage.v:89.13-89.18]

    wire _and_ibex_id_stage_v_483_46_Y: UInt<1> @[ibex_id_stage.v:483.35-483.70]
    wire _and_ibex_id_stage_v_471_45_Y: UInt<1> @[ibex_id_stage.v:471.23-471.55]
    wire _not_ibex_id_stage_v_471_44_Y: UInt<1> @[ibex_id_stage.v:471.40-471.55]
    wire _4_id_wb_fsm_ns_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_regfile_we_wb_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _4_stall_jump_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _4_stall_branch_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _4_stall_multdiv_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _4_stall_lsu_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _4_instr_multicycle_done_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _4_instr_ret_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _or_ibex_id_stage_v_468_43_Y: UInt<1> @[ibex_id_stage.v:468.10-468.69]
    wire _and_ibex_id_stage_v_468_42_Y: UInt<1> @[ibex_id_stage.v:468.42-468.68]
    wire _not_ibex_id_stage_v_468_41_Y: UInt<1> @[ibex_id_stage.v:468.42-468.55]
    wire _and_ibex_id_stage_v_468_40_Y: UInt<1> @[ibex_id_stage.v:468.11-468.37]
    wire _not_ibex_id_stage_v_455_39_Y: UInt<1> @[ibex_id_stage.v:455.22-455.40]
    wire _not_ibex_id_stage_v_452_38_Y: UInt<1> @[ibex_id_stage.v:452.34-452.52]
    wire _ternary_ibex_id_stage_v_450_37_Y: UInt<1> @[ibex_id_stage.v:450.24-450.66]
    wire _3_id_wb_fsm_ns_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_stall_jump_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_stall_branch_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_stall_multdiv_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_stall_lsu_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_instr_multicycle_done_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_branch_set_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_instr_ret_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _3_perf_branch_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_id_wb_fsm_ns_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_stall_jump_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_stall_branch_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_stall_multdiv_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_stall_lsu_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_instr_multicycle_done_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_branch_set_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_instr_ret_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _2_perf_branch_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _and_ibex_id_stage_v_437_36_Y: UInt<1> @[ibex_id_stage.v:437.10-437.42]
    wire _not_ibex_id_stage_v_437_35_Y: UInt<1> @[ibex_id_stage.v:437.24-437.42]
    wire _1_id_wb_fsm_ns_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_regfile_we_wb_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_stall_jump_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_stall_branch_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_stall_multdiv_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_stall_lsu_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_instr_multicycle_done_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_branch_set_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_instr_ret_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _1_perf_branch_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_id_wb_fsm_ns_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_regfile_we_wb_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_stall_jump_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_stall_branch_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_stall_multdiv_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_stall_lsu_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_instr_multicycle_done_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_branch_set_n_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_instr_ret_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _0_perf_branch_o_0_0_: UInt<1> @[ibex_id_stage.v:424.2-482.5]
    wire _logic_not_ibex_id_stage_v_413_33_Y: UInt<1> @[ibex_id_stage.v:413.7-413.14]
    wire _0_id_wb_fsm_cs_0_0_: UInt<1> @[ibex_id_stage.v:412.2-423.5]
    wire _0_instr_multicycle_done_q_0_0_: UInt<1> @[ibex_id_stage.v:412.2-423.5]
    wire _0_branch_set_q_0_0_: UInt<1> @[ibex_id_stage.v:412.2-423.5]
    wire _ternary_ibex_id_stage_v_395_31_Y: UInt<1> @[ibex_id_stage.v:395.22-395.57]
    wire _ternary_ibex_id_stage_v_394_30_Y: UInt<1> @[ibex_id_stage.v:394.23-394.59]
    wire _ternary_ibex_id_stage_v_393_29_Y: UInt<1> @[ibex_id_stage.v:393.24-393.61]
    wire _and_ibex_id_stage_v_392_28_Y: UInt<1> @[ibex_id_stage.v:392.28-392.110]
    wire _not_ibex_id_stage_v_392_27_Y: UInt<1> @[ibex_id_stage.v:392.92-392.110]
    wire _or_ibex_id_stage_v_392_26_Y: UInt<1> @[ibex_id_stage.v:392.29-392.88]
    wire _and_ibex_id_stage_v_392_25_Y: UInt<1> @[ibex_id_stage.v:392.44-392.87]
    wire _not_ibex_id_stage_v_392_24_Y: UInt<1> @[ibex_id_stage.v:392.63-392.87]
    wire _or_ibex_id_stage_v_391_23_Y: UInt<1> @[ibex_id_stage.v:391.29-391.92]
    wire _or_ibex_id_stage_v_391_22_Y: UInt<1> @[ibex_id_stage.v:391.30-391.77]
    wire _or_ibex_id_stage_v_391_21_Y: UInt<1> @[ibex_id_stage.v:391.31-391.60]
    wire _or_ibex_id_stage_v_390_20_Y: UInt<1> @[ibex_id_stage.v:390.27-390.51]
    wire _and_ibex_id_stage_v_330_19_Y: UInt<1> @[ibex_id_stage.v:330.27-330.82]
    wire _or_ibex_id_stage_v_330_18_Y: UInt<1> @[ibex_id_stage.v:330.44-330.81]
    wire _1_regfile_wdata_31_0_: UInt<32> @[ibex_id_stage.v:259.2-266.5]
    wire _0_regfile_wdata_31_0_: UInt<32> @[ibex_id_stage.v:259.2-266.5]
    wire _ternary_ibex_id_stage_v_258_16_Y: UInt<1> @[ibex_id_stage.v:258.23-258.140]
    wire _ternary_ibex_id_stage_v_258_15_Y: UInt<1> @[ibex_id_stage.v:258.74-258.139]
    wire _logic_or_ibex_id_stage_v_258_14_Y: UInt<1> @[ibex_id_stage.v:258.75-258.105]
    wire _logic_or_ibex_id_stage_v_258_13_Y: UInt<1> @[ibex_id_stage.v:258.24-258.62]
    wire _logic_not_ibex_id_stage_v_258_12_Y: UInt<1> @[ibex_id_stage.v:258.46-258.62]
    wire _ternary_ibex_id_stage_v_257_11_Y: UInt<32> @[ibex_id_stage.v:257.26-257.82]
    wire _eq_ibex_id_stage_v_257_10_Y: UInt<1> @[ibex_id_stage.v:257.27-257.55]
    wire _ternary_ibex_id_stage_v_252_9_Y: UInt<32> @[ibex_id_stage.v:252.28-252.65]
    wire _1_imm_b_31_0_: UInt<32> @[ibex_id_stage.v:245.2-256.5]
    wire _0_imm_b_31_0_: UInt<32> @[ibex_id_stage.v:245.2-256.5]
    wire _1_alu_operand_a_31_0_: UInt<32> @[ibex_id_stage.v:236.2-244.5]
    wire _0_alu_operand_a_31_0_: UInt<32> @[ibex_id_stage.v:236.2-244.5]
    wire _ternary_ibex_id_stage_v_235_6_Y: UInt<32> @[ibex_id_stage.v:235.18-235.67]
    wire _extend_ibex_id_stage_v_235_5_Y: UInt<32> @[ibex_id_stage.v:235.18-235.67]
    wire _eq_ibex_id_stage_v_235_4_Y: UInt<1> @[ibex_id_stage.v:235.19-235.43]
    wire _ternary_ibex_id_stage_v_234_3_Y: UInt<3> @[ibex_id_stage.v:234.26-234.83]
    wire _ternary_ibex_id_stage_v_233_2_Y: UInt<1> @[ibex_id_stage.v:233.29-233.82]
    wire _ternary_ibex_id_stage_v_232_1_Y: UInt<2> @[ibex_id_stage.v:232.29-232.82]
    wire id_wb_fsm_ns: UInt<1> @[ibex_id_stage.v:411.12-411.24]
    wire id_wb_fsm_cs: UInt<1> @[ibex_id_stage.v:410.12-410.24]
    wire alu_operand_b: UInt<32> @[ibex_id_stage.v:231.14-231.27]
    wire alu_operand_a: UInt<32> @[ibex_id_stage.v:230.13-230.26]
    wire csr_pipe_flush: UInt<1> @[ibex_id_stage.v:229.7-229.21]
    wire data_req_dec: UInt<1> @[ibex_id_stage.v:228.7-228.19]
    wire data_req_id: UInt<1> @[ibex_id_stage.v:227.7-227.18]
    wire data_sign_ext_id: UInt<1> @[ibex_id_stage.v:226.7-226.23]
    wire data_type_id: UInt<2> @[ibex_id_stage.v:225.13-225.25]
    wire data_we_id: UInt<1> @[ibex_id_stage.v:224.7-224.17]
    wire multdiv_signed_mode: UInt<2> @[ibex_id_stage.v:223.13-223.32]
    wire multdiv_operator: UInt<2> @[ibex_id_stage.v:222.13-222.29]
    wire multdiv_en_dec: UInt<1> @[ibex_id_stage.v:221.7-221.21]
    wire div_en_dec: UInt<1> @[ibex_id_stage.v:220.7-220.17]
    wire div_en_id: UInt<1> @[ibex_id_stage.v:219.7-219.16]
    wire mult_en_dec: UInt<1> @[ibex_id_stage.v:218.7-218.18]
    wire mult_en_id: UInt<1> @[ibex_id_stage.v:217.7-217.17]
    wire imm_b_mux_sel_dec: UInt<3> @[ibex_id_stage.v:216.13-216.30]
    wire imm_b_mux_sel: UInt<3> @[ibex_id_stage.v:215.13-215.26]
    wire imm_a_mux_sel: UInt<1> @[ibex_id_stage.v:214.7-214.20]
    wire alu_op_b_mux_sel_dec: UInt<1> @[ibex_id_stage.v:213.7-213.27]
    wire alu_op_b_mux_sel: UInt<1> @[ibex_id_stage.v:212.7-212.23]
    wire alu_op_a_mux_sel_dec: UInt<2> @[ibex_id_stage.v:211.13-211.33]
    wire alu_op_a_mux_sel: UInt<2> @[ibex_id_stage.v:210.13-210.29]
    wire alu_operator: UInt<5> @[ibex_id_stage.v:209.13-209.25]
    wire regfile_we_dec: UInt<1> @[ibex_id_stage.v:208.7-208.21]
    wire regfile_we_wb: UInt<1> @[ibex_id_stage.v:207.6-207.19]
    wire regfile_we: UInt<1> @[ibex_id_stage.v:206.7-206.17]
    wire regfile_wdata_sel: UInt<2> @[ibex_id_stage.v:205.13-205.30]
    wire regfile_wdata: UInt<32> @[ibex_id_stage.v:204.13-204.26]
    wire regfile_rdata_b: UInt<32> @[ibex_id_stage.v:203.14-203.29]
    wire regfile_rdata_a: UInt<32> @[ibex_id_stage.v:202.14-202.29]
    wire regfile_waddr: UInt<5> @[ibex_id_stage.v:201.13-201.26]
    wire regfile_raddr_b: UInt<5> @[ibex_id_stage.v:200.13-200.28]
    wire regfile_raddr_a: UInt<5> @[ibex_id_stage.v:199.13-199.28]
    wire imm_b: UInt<32> @[ibex_id_stage.v:198.13-198.18]
    wire imm_a: UInt<32> @[ibex_id_stage.v:197.14-197.19]
    wire zimm_rs1_type: UInt<32> @[ibex_id_stage.v:196.14-196.27]
    wire imm_j_type: UInt<32> @[ibex_id_stage.v:195.14-195.24]
    wire imm_u_type: UInt<32> @[ibex_id_stage.v:194.14-194.24]
    wire imm_b_type: UInt<32> @[ibex_id_stage.v:193.14-193.24]
    wire imm_s_type: UInt<32> @[ibex_id_stage.v:192.14-192.24]
    wire imm_i_type: UInt<32> @[ibex_id_stage.v:191.14-191.24]
    wire stall_jump: UInt<1> @[ibex_id_stage.v:190.6-190.16]
    wire stall_branch: UInt<1> @[ibex_id_stage.v:189.6-189.18]
    wire stall_multdiv: UInt<1> @[ibex_id_stage.v:188.6-188.19]
    wire stall_lsu: UInt<1> @[ibex_id_stage.v:187.6-187.15]
    wire instr_multicycle_done_q: UInt<1> @[ibex_id_stage.v:186.6-186.29]
    wire instr_multicycle_done_n: UInt<1> @[ibex_id_stage.v:185.6-185.29]
    wire instr_multicycle: UInt<1> @[ibex_id_stage.v:184.7-184.23]
    wire instr_executing: UInt<1> @[ibex_id_stage.v:183.7-183.22]
    wire jump_set: UInt<1> @[ibex_id_stage.v:182.7-182.15]
    wire jump_in_dec: UInt<1> @[ibex_id_stage.v:181.7-181.18]
    wire branch_set_q: UInt<1> @[ibex_id_stage.v:180.6-180.18]
    wire branch_set_n: UInt<1> @[ibex_id_stage.v:179.6-179.18]
    wire branch_in_dec: UInt<1> @[ibex_id_stage.v:178.7-178.20]
    wire wfi_insn_dec: UInt<1> @[ibex_id_stage.v:177.7-177.19]
    wire ecall_insn_dec: UInt<1> @[ibex_id_stage.v:176.7-176.21]
    wire dret_insn_dec: UInt<1> @[ibex_id_stage.v:175.7-175.20]
    wire mret_insn_dec: UInt<1> @[ibex_id_stage.v:174.7-174.20]
    wire ebrk_insn: UInt<1> @[ibex_id_stage.v:173.7-173.16]
    wire illegal_insn_dec: UInt<1> @[ibex_id_stage.v:172.7-172.23]
    wire _and_ibex_id_stage_v_483_46: UInt<1> @[ibex_id_stage.v:483.35-483.70]
    wire _and_ibex_id_stage_v_471_45: UInt<1> @[ibex_id_stage.v:471.23-471.55]
    wire _not_ibex_id_stage_v_471_44: UInt<1> @[ibex_id_stage.v:471.40-471.55]
    wire _or_ibex_id_stage_v_468_43: UInt<1> @[ibex_id_stage.v:468.10-468.69]
    wire _and_ibex_id_stage_v_468_42: UInt<1> @[ibex_id_stage.v:468.42-468.68]
    wire _not_ibex_id_stage_v_468_41: UInt<1> @[ibex_id_stage.v:468.42-468.55]
    wire _and_ibex_id_stage_v_468_40: UInt<1> @[ibex_id_stage.v:468.11-468.37]
    wire _not_ibex_id_stage_v_455_39: UInt<1> @[ibex_id_stage.v:455.22-455.40]
    wire _not_ibex_id_stage_v_452_38: UInt<1> @[ibex_id_stage.v:452.34-452.52]
    wire _ternary_ibex_id_stage_v_450_37: UInt<1> @[ibex_id_stage.v:450.24-450.66]
    wire _and_ibex_id_stage_v_437_36: UInt<1> @[ibex_id_stage.v:437.10-437.42]
    wire _not_ibex_id_stage_v_437_35: UInt<1> @[ibex_id_stage.v:437.24-437.42]
    wire _logic_not_ibex_id_stage_v_413_33: UInt<1> @[ibex_id_stage.v:413.7-413.14]
    wire _ternary_ibex_id_stage_v_395_31: UInt<1> @[ibex_id_stage.v:395.22-395.57]
    wire _ternary_ibex_id_stage_v_394_30: UInt<1> @[ibex_id_stage.v:394.23-394.59]
    wire _ternary_ibex_id_stage_v_393_29: UInt<1> @[ibex_id_stage.v:393.24-393.61]
    wire _and_ibex_id_stage_v_392_28: UInt<1> @[ibex_id_stage.v:392.28-392.110]
    wire _not_ibex_id_stage_v_392_27: UInt<1> @[ibex_id_stage.v:392.92-392.110]
    wire _or_ibex_id_stage_v_392_26: UInt<1> @[ibex_id_stage.v:392.29-392.88]
    wire _and_ibex_id_stage_v_392_25: UInt<1> @[ibex_id_stage.v:392.44-392.87]
    wire _not_ibex_id_stage_v_392_24: UInt<1> @[ibex_id_stage.v:392.63-392.87]
    wire _or_ibex_id_stage_v_391_23: UInt<1> @[ibex_id_stage.v:391.29-391.92]
    wire _or_ibex_id_stage_v_391_22: UInt<1> @[ibex_id_stage.v:391.30-391.77]
    wire _or_ibex_id_stage_v_391_21: UInt<1> @[ibex_id_stage.v:391.31-391.60]
    wire _or_ibex_id_stage_v_390_20: UInt<1> @[ibex_id_stage.v:390.27-390.51]
    wire _and_ibex_id_stage_v_330_19: UInt<1> @[ibex_id_stage.v:330.27-330.82]
    wire _or_ibex_id_stage_v_330_18: UInt<1> @[ibex_id_stage.v:330.44-330.81]
    wire _ternary_ibex_id_stage_v_258_16: UInt<1> @[ibex_id_stage.v:258.23-258.140]
    wire _ternary_ibex_id_stage_v_258_15: UInt<1> @[ibex_id_stage.v:258.74-258.139]
    wire _logic_or_ibex_id_stage_v_258_14: UInt<1> @[ibex_id_stage.v:258.75-258.105]
    wire _logic_or_ibex_id_stage_v_258_13: UInt<1> @[ibex_id_stage.v:258.24-258.62]
    wire _logic_not_ibex_id_stage_v_258_12: UInt<1> @[ibex_id_stage.v:258.46-258.62]
    wire _ternary_ibex_id_stage_v_257_11: UInt<32> @[ibex_id_stage.v:257.26-257.82]
    wire _eq_ibex_id_stage_v_257_10: UInt<1> @[ibex_id_stage.v:257.27-257.55]
    wire _ternary_ibex_id_stage_v_252_9: UInt<32> @[ibex_id_stage.v:252.28-252.65]
    wire _ternary_ibex_id_stage_v_235_6: UInt<32> @[ibex_id_stage.v:235.18-235.67]
    wire _extend_ibex_id_stage_v_235_5: UInt<32>
    wire _eq_ibex_id_stage_v_235_4: UInt<1> @[ibex_id_stage.v:235.19-235.43]
    wire _ternary_ibex_id_stage_v_234_3: UInt<3> @[ibex_id_stage.v:234.26-234.83]
    wire _ternary_ibex_id_stage_v_233_2: UInt<1> @[ibex_id_stage.v:233.29-233.82]
    wire _ternary_ibex_id_stage_v_232_1: UInt<2> @[ibex_id_stage.v:232.29-232.82]
    wire _512: UInt<2>
    wire _513: UInt<1>
    wire _514: UInt<3>
    wire _515: UInt<32>
    wire _516: UInt<32>
    wire _517: UInt<1>
    wire _518: UInt<5>
    wire _519: UInt<32>
    wire _520: UInt<5>
    wire _521: UInt<32>
    wire _522: UInt<5>
    wire _523: UInt<32>
    wire _524: UInt<1>
    wire _525: UInt<1>
    wire _526: UInt<1>
    wire _527: UInt<1>
    wire _528: UInt<1>
    wire _529: UInt<1>
    wire _530: UInt<1>
    wire _531: UInt<1>
    wire _532: UInt<1>
    wire _533: UInt<1>
    wire _534: UInt<2>
    wire _535: UInt<1>
    wire _536: UInt<32>
    wire _537: UInt<5>
    wire _538: UInt<32>
    wire _539: UInt<32>
    wire _540: UInt<1>
    wire _541: UInt<1>
    wire _542: UInt<2>
    wire _543: UInt<2>
    wire _544: UInt<32>
    wire _545: UInt<32>
    wire _546: UInt<1>
    _4_id_wb_fsm_ns_0_0_ is invalid
    _2_regfile_we_wb_0_0_ is invalid
    _4_stall_jump_0_0_ is invalid
    _4_stall_branch_0_0_ is invalid
    _4_stall_multdiv_0_0_ is invalid
    _4_stall_lsu_0_0_ is invalid
    _4_instr_multicycle_done_n_0_0_ is invalid
    _4_instr_ret_o_0_0_ is invalid
    _3_id_wb_fsm_ns_0_0_ is invalid
    _3_stall_jump_0_0_ is invalid
    _3_stall_branch_0_0_ is invalid
    _3_stall_multdiv_0_0_ is invalid
    _3_stall_lsu_0_0_ is invalid
    _3_instr_multicycle_done_n_0_0_ is invalid
    _3_branch_set_n_0_0_ is invalid
    _3_instr_ret_o_0_0_ is invalid
    _3_perf_branch_o_0_0_ is invalid
    _2_id_wb_fsm_ns_0_0_ is invalid
    _2_stall_jump_0_0_ is invalid
    _2_stall_branch_0_0_ is invalid
    _2_stall_multdiv_0_0_ is invalid
    _2_stall_lsu_0_0_ is invalid
    _2_instr_multicycle_done_n_0_0_ is invalid
    _2_branch_set_n_0_0_ is invalid
    _2_instr_ret_o_0_0_ is invalid
    _2_perf_branch_o_0_0_ is invalid
    _1_id_wb_fsm_ns_0_0_ is invalid
    _1_regfile_we_wb_0_0_ is invalid
    _1_stall_jump_0_0_ is invalid
    _1_stall_branch_0_0_ is invalid
    _1_stall_multdiv_0_0_ is invalid
    _1_stall_lsu_0_0_ is invalid
    _1_instr_multicycle_done_n_0_0_ is invalid
    _1_branch_set_n_0_0_ is invalid
    _1_instr_ret_o_0_0_ is invalid
    _1_perf_branch_o_0_0_ is invalid
    _0_id_wb_fsm_ns_0_0_ is invalid
    _0_regfile_we_wb_0_0_ is invalid
    _0_stall_jump_0_0_ is invalid
    _0_stall_branch_0_0_ is invalid
    _0_stall_multdiv_0_0_ is invalid
    _0_stall_lsu_0_0_ is invalid
    _0_instr_multicycle_done_n_0_0_ is invalid
    _0_branch_set_n_0_0_ is invalid
    _0_instr_ret_o_0_0_ is invalid
    _0_perf_branch_o_0_0_ is invalid
    _0_id_wb_fsm_cs_0_0_ is invalid
    _0_instr_multicycle_done_q_0_0_ is invalid
    _0_branch_set_q_0_0_ is invalid
    _1_regfile_wdata_31_0_ is invalid
    _0_regfile_wdata_31_0_ is invalid
    _1_imm_b_31_0_ is invalid
    _0_imm_b_31_0_ is invalid
    _1_alu_operand_a_31_0_ is invalid
    _0_alu_operand_a_31_0_ is invalid
    id_wb_fsm_ns is invalid
    id_wb_fsm_cs is invalid
    alu_operand_a is invalid
    csr_pipe_flush is invalid
    data_req_dec is invalid
    data_sign_ext_id is invalid
    data_type_id is invalid
    data_we_id is invalid
    multdiv_signed_mode is invalid
    multdiv_operator is invalid
    div_en_dec is invalid
    mult_en_dec is invalid
    imm_b_mux_sel_dec is invalid
    imm_a_mux_sel is invalid
    alu_op_b_mux_sel_dec is invalid
    alu_op_a_mux_sel_dec is invalid
    alu_operator is invalid
    regfile_we_dec is invalid
    regfile_we_wb is invalid
    regfile_wdata_sel is invalid
    regfile_wdata is invalid
    regfile_rdata_b is invalid
    regfile_rdata_a is invalid
    regfile_waddr is invalid
    regfile_raddr_b is invalid
    regfile_raddr_a is invalid
    imm_b is invalid
    zimm_rs1_type is invalid
    imm_j_type is invalid
    imm_u_type is invalid
    imm_b_type is invalid
    imm_s_type is invalid
    imm_i_type is invalid
    stall_jump is invalid
    stall_branch is invalid
    stall_multdiv is invalid
    stall_lsu is invalid
    instr_multicycle_done_q is invalid
    instr_multicycle_done_n is invalid
    jump_set is invalid
    jump_in_dec is invalid
    branch_set_q is invalid
    branch_set_n is invalid
    branch_in_dec is invalid
    wfi_insn_dec is invalid
    ecall_insn_dec is invalid
    dret_insn_dec is invalid
    mret_insn_dec is invalid
    ebrk_insn is invalid
    illegal_insn_dec is invalid
    instr_ret_o is invalid
    perf_tbranch_o is invalid
    perf_branch_o is invalid
    perf_jump_o is invalid
    debug_csr_save_o is invalid
    debug_cause_o is invalid
    debug_mode_o is invalid
    csr_mtval_o is invalid
    csr_save_cause_o is invalid
    csr_restore_dret_id_o is invalid
    csr_restore_mret_id_o is invalid
    csr_save_id_o is invalid
    csr_save_if_o is invalid
    csr_op_o is invalid
    csr_access_o is invalid
    exc_cause_o is invalid
    exc_pc_mux_o is invalid
    pc_mux_o is invalid
    pc_set_o is invalid
    id_in_ready_o is invalid
    instr_valid_clear_o is invalid
    instr_req_o is invalid
    ctrl_busy_o is invalid


    _and_ibex_id_stage_v_483_46 <= and(instr_ret_o, asUInt(instr_is_compressed_i)) @[ibex_id_stage.v:483.35-483.70]
    _and_ibex_id_stage_v_471_45 <= and(regfile_we_dec, asUInt(_not_ibex_id_stage_v_471_44_Y)) @[ibex_id_stage.v:471.23-471.55]
    _not_ibex_id_stage_v_471_44 <= not(pad(lsu_load_err_i, 1)) @[ibex_id_stage.v:471.40-471.55]
    _or_ibex_id_stage_v_468_43 <= or(_and_ibex_id_stage_v_468_40_Y, asUInt(_and_ibex_id_stage_v_468_42_Y)) @[ibex_id_stage.v:468.10-468.69]
    _and_ibex_id_stage_v_468_42 <= and(_not_ibex_id_stage_v_468_41_Y, asUInt(ex_valid_i)) @[ibex_id_stage.v:468.42-468.68]
    _not_ibex_id_stage_v_468_41 <= not(pad(data_req_dec, 1)) @[ibex_id_stage.v:468.42-468.55]
    _and_ibex_id_stage_v_468_40 <= and(data_req_dec, asUInt(lsu_valid_i)) @[ibex_id_stage.v:468.11-468.37]
    _not_ibex_id_stage_v_455_39 <= not(pad(branch_decision_i, 1)) @[ibex_id_stage.v:455.22-455.40]
    _not_ibex_id_stage_v_452_38 <= not(pad(branch_decision_i, 1)) @[ibex_id_stage.v:452.34-452.52]
    _ternary_ibex_id_stage_v_450_37 <= mux(branch_decision_i, UInt<1>("h1"), UInt<1>("h0")) @[ibex_id_stage.v:450.24-450.66]
    _and_ibex_id_stage_v_437_36 <= and(instr_new_i, asUInt(_not_ibex_id_stage_v_437_35_Y)) @[ibex_id_stage.v:437.10-437.42]
    _not_ibex_id_stage_v_437_35 <= not(pad(instr_fetch_err_i, 1)) @[ibex_id_stage.v:437.24-437.42]
    _logic_not_ibex_id_stage_v_413_33 <= eq(rst_ni, UInt(0)) @[ibex_id_stage.v:413.7-413.14]
    _ternary_ibex_id_stage_v_395_31 <= mux(instr_executing, div_en_dec, UInt<1>("h0")) @[ibex_id_stage.v:395.22-395.57]
    _ternary_ibex_id_stage_v_394_30 <= mux(instr_executing, mult_en_dec, UInt<1>("h0")) @[ibex_id_stage.v:394.23-394.59]
    _ternary_ibex_id_stage_v_393_29 <= mux(instr_executing, data_req_dec, UInt<1>("h0")) @[ibex_id_stage.v:393.24-393.61]
    _and_ibex_id_stage_v_392_28 <= and(_or_ibex_id_stage_v_392_26_Y, asUInt(_not_ibex_id_stage_v_392_27_Y)) @[ibex_id_stage.v:392.28-392.110]
    _not_ibex_id_stage_v_392_27 <= not(pad(instr_fetch_err_i, 1)) @[ibex_id_stage.v:392.92-392.110]
    _or_ibex_id_stage_v_392_26 <= or(instr_new_i, asUInt(_and_ibex_id_stage_v_392_25_Y)) @[ibex_id_stage.v:392.29-392.88]
    _and_ibex_id_stage_v_392_25 <= and(instr_multicycle, asUInt(_not_ibex_id_stage_v_392_24_Y)) @[ibex_id_stage.v:392.44-392.87]
    _not_ibex_id_stage_v_392_24 <= not(pad(instr_multicycle_done_q, 1)) @[ibex_id_stage.v:392.63-392.87]
    _or_ibex_id_stage_v_391_23 <= or(_or_ibex_id_stage_v_391_22_Y, asUInt(jump_in_dec)) @[ibex_id_stage.v:391.29-391.92]
    _or_ibex_id_stage_v_391_22 <= or(_or_ibex_id_stage_v_391_21_Y, asUInt(branch_in_dec)) @[ibex_id_stage.v:391.30-391.77]
    _or_ibex_id_stage_v_391_21 <= or(data_req_dec, asUInt(multdiv_en_dec)) @[ibex_id_stage.v:391.31-391.60]
    _or_ibex_id_stage_v_390_20 <= or(mult_en_dec, asUInt(div_en_dec)) @[ibex_id_stage.v:390.27-390.51]
    _and_ibex_id_stage_v_330_19 <= and(instr_valid_i, asUInt(_or_ibex_id_stage_v_330_18_Y)) @[ibex_id_stage.v:330.27-330.82]
    _or_ibex_id_stage_v_330_18 <= or(illegal_insn_dec, asUInt(illegal_csr_insn_i)) @[ibex_id_stage.v:330.44-330.81]
    _ternary_ibex_id_stage_v_258_16 <= mux(_logic_or_ibex_id_stage_v_258_13_Y, UInt<1>("h0"), _ternary_ibex_id_stage_v_258_15_Y) @[ibex_id_stage.v:258.23-258.140]
    _ternary_ibex_id_stage_v_258_15 <= mux(_logic_or_ibex_id_stage_v_258_14_Y, regfile_we_wb, regfile_we_dec) @[ibex_id_stage.v:258.74-258.139]
    _logic_or_ibex_id_stage_v_258_14 <= or(neq(data_req_dec, UInt(0)), asUInt(neq(multdiv_en_dec, UInt(0)))) @[ibex_id_stage.v:258.75-258.105]
    _logic_or_ibex_id_stage_v_258_13 <= or(neq(illegal_csr_insn_i, UInt(0)), asUInt(neq(_logic_not_ibex_id_stage_v_258_12_Y, UInt(0)))) @[ibex_id_stage.v:258.24-258.62]
    _logic_not_ibex_id_stage_v_258_12 <= eq(instr_executing, UInt(0)) @[ibex_id_stage.v:258.46-258.62]
    _ternary_ibex_id_stage_v_257_11 <= mux(_eq_ibex_id_stage_v_257_10_Y, imm_b, regfile_rdata_b) @[ibex_id_stage.v:257.26-257.82]
    _eq_ibex_id_stage_v_257_10 <= eq(alu_op_b_mux_sel, asUInt(UInt<1>("h1"))) @[ibex_id_stage.v:257.27-257.55]
    _ternary_ibex_id_stage_v_252_9 <= mux(instr_is_compressed_i, UInt<32>("h00000002"), UInt<32>("h00000004")) @[ibex_id_stage.v:252.28-252.65]
    _ternary_ibex_id_stage_v_235_6 <= mux(_eq_ibex_id_stage_v_235_4_Y, zimm_rs1_type, _extend_ibex_id_stage_v_235_5_Y) @[ibex_id_stage.v:235.18-235.67]
    _extend_ibex_id_stage_v_235_5 <= pad(UInt<1>("h0"), 32)
    _eq_ibex_id_stage_v_235_4 <= eq(imm_a_mux_sel, asUInt(UInt<1>("h0"))) @[ibex_id_stage.v:235.19-235.43]
    _ternary_ibex_id_stage_v_234_3 <= mux(lsu_addr_incr_req_i, UInt<3>("h5"), imm_b_mux_sel_dec) @[ibex_id_stage.v:234.26-234.83]
    _ternary_ibex_id_stage_v_233_2 <= mux(lsu_addr_incr_req_i, UInt<1>("h1"), alu_op_b_mux_sel_dec) @[ibex_id_stage.v:233.29-233.82]
    _ternary_ibex_id_stage_v_232_1 <= mux(lsu_addr_incr_req_i, UInt<2>("h1"), alu_op_a_mux_sel_dec) @[ibex_id_stage.v:232.29-232.82]
    _512 <= _ternary_ibex_id_stage_v_232_1_Y
    _513 <= _ternary_ibex_id_stage_v_233_2_Y
    _514 <= _ternary_ibex_id_stage_v_234_3_Y
    _515 <= _ternary_ibex_id_stage_v_235_6_Y
    _516 <= _ternary_ibex_id_stage_v_257_11_Y
    _517 <= _ternary_ibex_id_stage_v_258_16_Y
    _518 <= regfile_raddr_a
    _519 <= regfile_rdata_a
    _520 <= regfile_raddr_b
    _521 <= regfile_rdata_b
    _522 <= regfile_waddr
    _523 <= regfile_wdata
    _524 <= regfile_we
    _525 <= _and_ibex_id_stage_v_330_19_Y
    _526 <= _or_ibex_id_stage_v_390_20_Y
    _527 <= _or_ibex_id_stage_v_391_23_Y
    _528 <= _and_ibex_id_stage_v_392_28_Y
    _529 <= _ternary_ibex_id_stage_v_393_29_Y
    _530 <= _ternary_ibex_id_stage_v_394_30_Y
    _531 <= _ternary_ibex_id_stage_v_395_31_Y
    _532 <= data_req_id
    _533 <= data_we_id
    _534 <= data_type_id
    _535 <= data_sign_ext_id
    _536 <= regfile_rdata_b
    _537 <= alu_operator
    _538 <= alu_operand_a
    _539 <= alu_operand_b
    _540 <= mult_en_id
    _541 <= div_en_id
    _542 <= multdiv_operator
    _543 <= multdiv_signed_mode
    _544 <= regfile_rdata_a
    _545 <= regfile_rdata_b
    _546 <= _and_ibex_id_stage_v_483_46_Y

    inst controller_i of ibex_controller @[ibex_id_stage.v:331.18-389.3]
    perf_tbranch_o <= controller_i.perf_tbranch_o @[ibex_id_stage.v:331.18-389.3]
    perf_jump_o <= controller_i.perf_jump_o @[ibex_id_stage.v:331.18-389.3]
    controller_i.stall_branch_i <= stall_branch @[ibex_id_stage.v:331.18-389.3]
    controller_i.stall_jump_i <= stall_jump @[ibex_id_stage.v:331.18-389.3]
    controller_i.stall_multdiv_i <= stall_multdiv @[ibex_id_stage.v:331.18-389.3]
    controller_i.stall_lsu_i <= stall_lsu @[ibex_id_stage.v:331.18-389.3]
    controller_i.debug_ebreaku_i <= debug_ebreaku_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.debug_ebreakm_i <= debug_ebreakm_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.debug_single_step_i <= debug_single_step_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.debug_req_i <= debug_req_i @[ibex_id_stage.v:331.18-389.3]
    debug_csr_save_o <= controller_i.debug_csr_save_o @[ibex_id_stage.v:331.18-389.3]
    debug_cause_o <= controller_i.debug_cause_o @[ibex_id_stage.v:331.18-389.3]
    debug_mode_o <= controller_i.debug_mode_o @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_mstatus_tw_i <= csr_mstatus_tw_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.priv_mode_i <= priv_mode_i @[ibex_id_stage.v:331.18-389.3]
    csr_mtval_o <= controller_i.csr_mtval_o @[ibex_id_stage.v:331.18-389.3]
    csr_save_cause_o <= controller_i.csr_save_cause_o @[ibex_id_stage.v:331.18-389.3]
    csr_restore_dret_id_o <= controller_i.csr_restore_dret_id_o @[ibex_id_stage.v:331.18-389.3]
    csr_restore_mret_id_o <= controller_i.csr_restore_mret_id_o @[ibex_id_stage.v:331.18-389.3]
    csr_save_id_o <= controller_i.csr_save_id_o @[ibex_id_stage.v:331.18-389.3]
    csr_save_if_o <= controller_i.csr_save_if_o @[ibex_id_stage.v:331.18-389.3]
    controller_i.irq_nm_i <= irq_nm_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.irq_pending_i <= irq_pending_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_mfip_i <= csr_mfip_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_meip_i <= csr_meip_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_mtip_i <= csr_mtip_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_msip_i <= csr_msip_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_mstatus_mie_i <= csr_mstatus_mie_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.jump_set_i <= jump_set @[ibex_id_stage.v:331.18-389.3]
    controller_i.branch_set_i <= branch_set_q @[ibex_id_stage.v:331.18-389.3]
    controller_i.store_err_i <= lsu_store_err_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.load_err_i <= lsu_load_err_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.lsu_addr_last_i <= lsu_addr_last_i @[ibex_id_stage.v:331.18-389.3]
    exc_cause_o <= controller_i.exc_cause_o @[ibex_id_stage.v:331.18-389.3]
    exc_pc_mux_o <= controller_i.exc_pc_mux_o @[ibex_id_stage.v:331.18-389.3]
    pc_mux_o <= controller_i.pc_mux_o @[ibex_id_stage.v:331.18-389.3]
    pc_set_o <= controller_i.pc_set_o @[ibex_id_stage.v:331.18-389.3]
    instr_req_o <= controller_i.instr_req_o @[ibex_id_stage.v:331.18-389.3]
    id_in_ready_o <= controller_i.id_in_ready_o @[ibex_id_stage.v:331.18-389.3]
    instr_valid_clear_o <= controller_i.instr_valid_clear_o @[ibex_id_stage.v:331.18-389.3]
    controller_i.pc_id_i <= pc_id_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.instr_fetch_err_i <= instr_fetch_err_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.instr_is_compressed_i <= instr_is_compressed_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.instr_compressed_i <= instr_rdata_c_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.instr_i <= instr_rdata_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.instr_valid_i <= instr_valid_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.csr_pipe_flush_i <= csr_pipe_flush @[ibex_id_stage.v:331.18-389.3]
    controller_i.ebrk_insn_i <= ebrk_insn @[ibex_id_stage.v:331.18-389.3]
    controller_i.wfi_insn_i <= wfi_insn_dec @[ibex_id_stage.v:331.18-389.3]
    controller_i.dret_insn_i <= dret_insn_dec @[ibex_id_stage.v:331.18-389.3]
    controller_i.mret_insn_i <= mret_insn_dec @[ibex_id_stage.v:331.18-389.3]
    controller_i.ecall_insn_i <= ecall_insn_dec @[ibex_id_stage.v:331.18-389.3]
    controller_i.illegal_insn_i <= illegal_insn_o @[ibex_id_stage.v:331.18-389.3]
    ctrl_busy_o <= controller_i.ctrl_busy_o @[ibex_id_stage.v:331.18-389.3]
    controller_i.fetch_enable_i <= fetch_enable_i @[ibex_id_stage.v:331.18-389.3]
    controller_i.rst_ni <= rst_ni @[ibex_id_stage.v:331.18-389.3]
    controller_i.clk_i <= clk_i @[ibex_id_stage.v:331.18-389.3]
    inst decoder_i of ibex_decoder @[ibex_id_stage.v:289.4-329.3]
    branch_in_dec <= decoder_i.branch_in_dec_o @[ibex_id_stage.v:289.4-329.3]
    jump_in_dec <= decoder_i.jump_in_dec_o @[ibex_id_stage.v:289.4-329.3]
    data_sign_ext_id <= decoder_i.data_sign_extension_o @[ibex_id_stage.v:289.4-329.3]
    data_type_id <= decoder_i.data_type_o @[ibex_id_stage.v:289.4-329.3]
    data_we_id <= decoder_i.data_we_o @[ibex_id_stage.v:289.4-329.3]
    data_req_dec <= decoder_i.data_req_o @[ibex_id_stage.v:289.4-329.3]
    csr_pipe_flush <= decoder_i.csr_pipe_flush_o @[ibex_id_stage.v:289.4-329.3]
    csr_op_o <= decoder_i.csr_op_o @[ibex_id_stage.v:289.4-329.3]
    csr_access_o <= decoder_i.csr_access_o @[ibex_id_stage.v:289.4-329.3]
    multdiv_signed_mode <= decoder_i.multdiv_signed_mode_o @[ibex_id_stage.v:289.4-329.3]
    multdiv_operator <= decoder_i.multdiv_operator_o @[ibex_id_stage.v:289.4-329.3]
    div_en_dec <= decoder_i.div_en_o @[ibex_id_stage.v:289.4-329.3]
    mult_en_dec <= decoder_i.mult_en_o @[ibex_id_stage.v:289.4-329.3]
    alu_op_b_mux_sel_dec <= decoder_i.alu_op_b_mux_sel_o @[ibex_id_stage.v:289.4-329.3]
    alu_op_a_mux_sel_dec <= decoder_i.alu_op_a_mux_sel_o @[ibex_id_stage.v:289.4-329.3]
    alu_operator <= decoder_i.alu_operator_o @[ibex_id_stage.v:289.4-329.3]
    regfile_waddr <= decoder_i.regfile_waddr_o @[ibex_id_stage.v:289.4-329.3]
    regfile_raddr_b <= decoder_i.regfile_raddr_b_o @[ibex_id_stage.v:289.4-329.3]
    regfile_raddr_a <= decoder_i.regfile_raddr_a_o @[ibex_id_stage.v:289.4-329.3]
    regfile_we_dec <= decoder_i.regfile_we_o @[ibex_id_stage.v:289.4-329.3]
    regfile_wdata_sel <= decoder_i.regfile_wdata_sel_o @[ibex_id_stage.v:289.4-329.3]
    zimm_rs1_type <= decoder_i.zimm_rs1_type_o @[ibex_id_stage.v:289.4-329.3]
    imm_j_type <= decoder_i.imm_j_type_o @[ibex_id_stage.v:289.4-329.3]
    imm_u_type <= decoder_i.imm_u_type_o @[ibex_id_stage.v:289.4-329.3]
    imm_b_type <= decoder_i.imm_b_type_o @[ibex_id_stage.v:289.4-329.3]
    imm_s_type <= decoder_i.imm_s_type_o @[ibex_id_stage.v:289.4-329.3]
    imm_i_type <= decoder_i.imm_i_type_o @[ibex_id_stage.v:289.4-329.3]
    imm_b_mux_sel_dec <= decoder_i.imm_b_mux_sel_o @[ibex_id_stage.v:289.4-329.3]
    imm_a_mux_sel <= decoder_i.imm_a_mux_sel_o @[ibex_id_stage.v:289.4-329.3]
    decoder_i.illegal_c_insn_i <= illegal_c_insn_i @[ibex_id_stage.v:289.4-329.3]
    decoder_i.instr_rdata_i <= instr_rdata_i @[ibex_id_stage.v:289.4-329.3]
    decoder_i.instr_new_i <= instr_new_i @[ibex_id_stage.v:289.4-329.3]
    jump_set <= decoder_i.jump_set_o @[ibex_id_stage.v:289.4-329.3]
    wfi_insn_dec <= decoder_i.wfi_insn_o @[ibex_id_stage.v:289.4-329.3]
    ecall_insn_dec <= decoder_i.ecall_insn_o @[ibex_id_stage.v:289.4-329.3]
    dret_insn_dec <= decoder_i.dret_insn_o @[ibex_id_stage.v:289.4-329.3]
    mret_insn_dec <= decoder_i.mret_insn_o @[ibex_id_stage.v:289.4-329.3]
    ebrk_insn <= decoder_i.ebrk_insn_o @[ibex_id_stage.v:289.4-329.3]
    illegal_insn_dec <= decoder_i.illegal_insn_o @[ibex_id_stage.v:289.4-329.3]
    inst registers_i of ibex_register_file @[ibex_id_stage.v:267.38-278.3]
    registers_i.we_a_i <= regfile_we @[ibex_id_stage.v:267.38-278.3]
    registers_i.wdata_a_i <= regfile_wdata @[ibex_id_stage.v:267.38-278.3]
    registers_i.waddr_a_i <= regfile_waddr @[ibex_id_stage.v:267.38-278.3]
    regfile_rdata_b <= registers_i.rdata_b_o @[ibex_id_stage.v:267.38-278.3]
    registers_i.raddr_b_i <= regfile_raddr_b @[ibex_id_stage.v:267.38-278.3]
    regfile_rdata_a <= registers_i.rdata_a_o @[ibex_id_stage.v:267.38-278.3]
    registers_i.raddr_a_i <= regfile_raddr_a @[ibex_id_stage.v:267.38-278.3]
    registers_i.test_en_i <= test_en_i @[ibex_id_stage.v:267.38-278.3]
    registers_i.rst_ni <= rst_ni @[ibex_id_stage.v:267.38-278.3]
    registers_i.clk_i <= clk_i @[ibex_id_stage.v:267.38-278.3]
    _and_ibex_id_stage_v_483_46_Y <= bits(_and_ibex_id_stage_v_483_46, 0, 0) @[ibex_id_stage.v:483.35-483.70]
    _and_ibex_id_stage_v_471_45_Y <= bits(_and_ibex_id_stage_v_471_45, 0, 0) @[ibex_id_stage.v:471.23-471.55]
    _not_ibex_id_stage_v_471_44_Y <= bits(_not_ibex_id_stage_v_471_44, 0, 0) @[ibex_id_stage.v:471.40-471.55]
    _or_ibex_id_stage_v_468_43_Y <= bits(_or_ibex_id_stage_v_468_43, 0, 0) @[ibex_id_stage.v:468.10-468.69]
    _and_ibex_id_stage_v_468_42_Y <= bits(_and_ibex_id_stage_v_468_42, 0, 0) @[ibex_id_stage.v:468.42-468.68]
    _not_ibex_id_stage_v_468_41_Y <= bits(_not_ibex_id_stage_v_468_41, 0, 0) @[ibex_id_stage.v:468.42-468.55]
    _and_ibex_id_stage_v_468_40_Y <= bits(_and_ibex_id_stage_v_468_40, 0, 0) @[ibex_id_stage.v:468.11-468.37]
    _not_ibex_id_stage_v_455_39_Y <= bits(_not_ibex_id_stage_v_455_39, 0, 0) @[ibex_id_stage.v:455.22-455.40]
    _not_ibex_id_stage_v_452_38_Y <= bits(_not_ibex_id_stage_v_452_38, 0, 0) @[ibex_id_stage.v:452.34-452.52]
    _ternary_ibex_id_stage_v_450_37_Y <= bits(_ternary_ibex_id_stage_v_450_37, 0, 0) @[ibex_id_stage.v:450.24-450.66]
    _and_ibex_id_stage_v_437_36_Y <= bits(_and_ibex_id_stage_v_437_36, 0, 0) @[ibex_id_stage.v:437.10-437.42]
    _not_ibex_id_stage_v_437_35_Y <= bits(_not_ibex_id_stage_v_437_35, 0, 0) @[ibex_id_stage.v:437.24-437.42]
    _logic_not_ibex_id_stage_v_413_33_Y <= bits(_logic_not_ibex_id_stage_v_413_33, 0, 0) @[ibex_id_stage.v:413.7-413.14]
    _ternary_ibex_id_stage_v_395_31_Y <= bits(_ternary_ibex_id_stage_v_395_31, 0, 0) @[ibex_id_stage.v:395.22-395.57]
    _ternary_ibex_id_stage_v_394_30_Y <= bits(_ternary_ibex_id_stage_v_394_30, 0, 0) @[ibex_id_stage.v:394.23-394.59]
    _ternary_ibex_id_stage_v_393_29_Y <= bits(_ternary_ibex_id_stage_v_393_29, 0, 0) @[ibex_id_stage.v:393.24-393.61]
    _and_ibex_id_stage_v_392_28_Y <= bits(_and_ibex_id_stage_v_392_28, 0, 0) @[ibex_id_stage.v:392.28-392.110]
    _not_ibex_id_stage_v_392_27_Y <= bits(_not_ibex_id_stage_v_392_27, 0, 0) @[ibex_id_stage.v:392.92-392.110]
    _or_ibex_id_stage_v_392_26_Y <= bits(_or_ibex_id_stage_v_392_26, 0, 0) @[ibex_id_stage.v:392.29-392.88]
    _and_ibex_id_stage_v_392_25_Y <= bits(_and_ibex_id_stage_v_392_25, 0, 0) @[ibex_id_stage.v:392.44-392.87]
    _not_ibex_id_stage_v_392_24_Y <= bits(_not_ibex_id_stage_v_392_24, 0, 0) @[ibex_id_stage.v:392.63-392.87]
    _or_ibex_id_stage_v_391_23_Y <= bits(_or_ibex_id_stage_v_391_23, 0, 0) @[ibex_id_stage.v:391.29-391.92]
    _or_ibex_id_stage_v_391_22_Y <= bits(_or_ibex_id_stage_v_391_22, 0, 0) @[ibex_id_stage.v:391.30-391.77]
    _or_ibex_id_stage_v_391_21_Y <= bits(_or_ibex_id_stage_v_391_21, 0, 0) @[ibex_id_stage.v:391.31-391.60]
    _or_ibex_id_stage_v_390_20_Y <= bits(_or_ibex_id_stage_v_390_20, 0, 0) @[ibex_id_stage.v:390.27-390.51]
    _and_ibex_id_stage_v_330_19_Y <= bits(_and_ibex_id_stage_v_330_19, 0, 0) @[ibex_id_stage.v:330.27-330.82]
    _or_ibex_id_stage_v_330_18_Y <= bits(_or_ibex_id_stage_v_330_18, 0, 0) @[ibex_id_stage.v:330.44-330.81]
    _ternary_ibex_id_stage_v_258_16_Y <= bits(_ternary_ibex_id_stage_v_258_16, 0, 0) @[ibex_id_stage.v:258.23-258.140]
    _ternary_ibex_id_stage_v_258_15_Y <= bits(_ternary_ibex_id_stage_v_258_15, 0, 0) @[ibex_id_stage.v:258.74-258.139]
    _logic_or_ibex_id_stage_v_258_14_Y <= bits(_logic_or_ibex_id_stage_v_258_14, 0, 0) @[ibex_id_stage.v:258.75-258.105]
    _logic_or_ibex_id_stage_v_258_13_Y <= bits(_logic_or_ibex_id_stage_v_258_13, 0, 0) @[ibex_id_stage.v:258.24-258.62]
    _logic_not_ibex_id_stage_v_258_12_Y <= bits(_logic_not_ibex_id_stage_v_258_12, 0, 0) @[ibex_id_stage.v:258.46-258.62]
    _ternary_ibex_id_stage_v_257_11_Y <= bits(_ternary_ibex_id_stage_v_257_11, 31, 0) @[ibex_id_stage.v:257.26-257.82]
    _eq_ibex_id_stage_v_257_10_Y <= bits(_eq_ibex_id_stage_v_257_10, 0, 0) @[ibex_id_stage.v:257.27-257.55]
    _ternary_ibex_id_stage_v_252_9_Y <= bits(_ternary_ibex_id_stage_v_252_9, 31, 0) @[ibex_id_stage.v:252.28-252.65]
    _ternary_ibex_id_stage_v_235_6_Y <= bits(_ternary_ibex_id_stage_v_235_6, 31, 0) @[ibex_id_stage.v:235.18-235.67]
    _extend_ibex_id_stage_v_235_5_Y <= bits(_extend_ibex_id_stage_v_235_5, 31, 0) @[ibex_id_stage.v:235.18-235.67]
    _eq_ibex_id_stage_v_235_4_Y <= bits(_eq_ibex_id_stage_v_235_4, 0, 0) @[ibex_id_stage.v:235.19-235.43]
    _ternary_ibex_id_stage_v_234_3_Y <= bits(_ternary_ibex_id_stage_v_234_3, 2, 0) @[ibex_id_stage.v:234.26-234.83]
    _ternary_ibex_id_stage_v_233_2_Y <= bits(_ternary_ibex_id_stage_v_233_2, 0, 0) @[ibex_id_stage.v:233.29-233.82]
    _ternary_ibex_id_stage_v_232_1_Y <= bits(_ternary_ibex_id_stage_v_232_1, 1, 0) @[ibex_id_stage.v:232.29-232.82]
    alu_operand_b <= bits(_516, 31, 0) @[ibex_id_stage.v:231.14-231.27]
    data_req_id <= bits(_529, 0, 0) @[ibex_id_stage.v:227.7-227.18]
    multdiv_en_dec <= bits(_526, 0, 0) @[ibex_id_stage.v:221.7-221.21]
    div_en_id <= bits(_531, 0, 0) @[ibex_id_stage.v:219.7-219.16]
    mult_en_id <= bits(_530, 0, 0) @[ibex_id_stage.v:217.7-217.17]
    imm_b_mux_sel <= bits(_514, 2, 0) @[ibex_id_stage.v:215.13-215.26]
    alu_op_b_mux_sel <= bits(_513, 0, 0) @[ibex_id_stage.v:212.7-212.23]
    alu_op_a_mux_sel <= bits(_512, 1, 0) @[ibex_id_stage.v:210.13-210.29]
    regfile_we <= bits(_517, 0, 0) @[ibex_id_stage.v:206.7-206.17]
    imm_a <= bits(_515, 31, 0) @[ibex_id_stage.v:197.14-197.19]
    instr_multicycle <= bits(_527, 0, 0) @[ibex_id_stage.v:184.7-184.23]
    instr_executing <= bits(_528, 0, 0) @[ibex_id_stage.v:183.7-183.22]
    instr_ret_compressed_o <= bits(_546, 0, 0) @[ibex_id_stage.v:170.14-170.36]
    rfvi_reg_we_o <= bits(_524, 0, 0) @[ibex_id_stage.v:165.14-165.27]
    rfvi_reg_wdata_rd_o <= bits(_523, 31, 0) @[ibex_id_stage.v:164.21-164.40]
    rfvi_reg_waddr_rd_o <= bits(_522, 4, 0) @[ibex_id_stage.v:163.20-163.39]
    rfvi_reg_rdata_rb_o <= bits(_521, 31, 0) @[ibex_id_stage.v:162.21-162.40]
    rfvi_reg_raddr_rb_o <= bits(_520, 4, 0) @[ibex_id_stage.v:161.20-161.39]
    rfvi_reg_rdata_ra_o <= bits(_519, 31, 0) @[ibex_id_stage.v:160.21-160.40]
    rfvi_reg_raddr_ra_o <= bits(_518, 4, 0) @[ibex_id_stage.v:159.20-159.39]
    data_wdata_ex_o <= bits(_536, 31, 0) @[ibex_id_stage.v:137.21-137.36]
    data_sign_ext_ex_o <= bits(_535, 0, 0) @[ibex_id_stage.v:136.14-136.32]
    data_type_ex_o <= bits(_534, 1, 0) @[ibex_id_stage.v:135.20-135.34]
    data_we_ex_o <= bits(_533, 0, 0) @[ibex_id_stage.v:134.14-134.26]
    data_req_ex_o <= bits(_532, 0, 0) @[ibex_id_stage.v:133.14-133.27]
    multdiv_operand_b_ex_o <= bits(_545, 31, 0) @[ibex_id_stage.v:121.21-121.43]
    multdiv_operand_a_ex_o <= bits(_544, 31, 0) @[ibex_id_stage.v:120.21-120.43]
    multdiv_signed_mode_ex_o <= bits(_543, 1, 0) @[ibex_id_stage.v:119.20-119.44]
    multdiv_operator_ex_o <= bits(_542, 1, 0) @[ibex_id_stage.v:118.20-118.41]
    div_en_ex_o <= bits(_541, 0, 0) @[ibex_id_stage.v:117.14-117.25]
    mult_en_ex_o <= bits(_540, 0, 0) @[ibex_id_stage.v:116.14-116.26]
    alu_operand_b_ex_o <= bits(_539, 31, 0) @[ibex_id_stage.v:115.21-115.39]
    alu_operand_a_ex_o <= bits(_538, 31, 0) @[ibex_id_stage.v:114.21-114.39]
    alu_operator_ex_o <= bits(_537, 4, 0) @[ibex_id_stage.v:113.20-113.37]
    illegal_insn_o <= bits(_525, 0, 0) @[ibex_id_stage.v:94.14-94.28]

