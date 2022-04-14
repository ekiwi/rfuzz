module ibex_decoder (
	illegal_insn_o,
	ebrk_insn_o,
	mret_insn_o,
	dret_insn_o,
	ecall_insn_o,
	wfi_insn_o,
	jump_set_o,
	instr_new_i,
	instr_rdata_i,
	illegal_c_insn_i,
	imm_a_mux_sel_o,
	imm_b_mux_sel_o,
	imm_i_type_o,
	imm_s_type_o,
	imm_b_type_o,
	imm_u_type_o,
	imm_j_type_o,
	zimm_rs1_type_o,
	regfile_wdata_sel_o,
	regfile_we_o,
	regfile_raddr_a_o,
	regfile_raddr_b_o,
	regfile_waddr_o,
	alu_operator_o,
	alu_op_a_mux_sel_o,
	alu_op_b_mux_sel_o,
	mult_en_o,
	div_en_o,
	multdiv_operator_o,
	multdiv_signed_mode_o,
	csr_access_o,
	csr_op_o,
	csr_pipe_flush_o,
	data_req_o,
	data_we_o,
	data_type_o,
	data_sign_extension_o,
	jump_in_dec_o,
	branch_in_dec_o
);
	parameter RV32E = 0;
	parameter RV32M = 1;
	output wire illegal_insn_o;
	output reg ebrk_insn_o;
	output reg mret_insn_o;
	output reg dret_insn_o;
	output reg ecall_insn_o;
	output reg wfi_insn_o;
	output reg jump_set_o;
	input wire instr_new_i;
	input wire [31:0] instr_rdata_i;
	input wire illegal_c_insn_i;
	output reg imm_a_mux_sel_o;
	output reg [2:0] imm_b_mux_sel_o;
	output wire [31:0] imm_i_type_o;
	output wire [31:0] imm_s_type_o;
	output wire [31:0] imm_b_type_o;
	output wire [31:0] imm_u_type_o;
	output wire [31:0] imm_j_type_o;
	output wire [31:0] zimm_rs1_type_o;
	output reg [1:0] regfile_wdata_sel_o;
	output wire regfile_we_o;
	output wire [4:0] regfile_raddr_a_o;
	output wire [4:0] regfile_raddr_b_o;
	output wire [4:0] regfile_waddr_o;
	output reg [4:0] alu_operator_o;
	output reg [1:0] alu_op_a_mux_sel_o;
	output reg alu_op_b_mux_sel_o;
	output reg mult_en_o;
	output reg div_en_o;
	output reg [1:0] multdiv_operator_o;
	output reg [1:0] multdiv_signed_mode_o;
	output reg csr_access_o;
	output reg [1:0] csr_op_o;
	output reg csr_pipe_flush_o;
	output reg data_req_o;
	output reg data_we_o;
	output reg [1:0] data_type_o;
	output reg data_sign_extension_o;
	output reg jump_in_dec_o;
	output reg branch_in_dec_o;
	`include "ibex_pkg.v"
	reg illegal_insn;
	wire illegal_reg_rv32e;
	reg csr_illegal;
	reg regfile_we;
	wire [31:0] instr;
	reg [1:0] csr_op;
	reg [6:0] opcode;
	assign instr = instr_rdata_i;
	assign imm_i_type_o = {{20 {instr[31]}}, instr[31:20]};
	assign imm_s_type_o = {{20 {instr[31]}}, instr[31:25], instr[11:7]};
	assign imm_b_type_o = {{19 {instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
	assign imm_u_type_o = {instr[31:12], 12'b0};
	assign imm_j_type_o = {{12 {instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
	assign zimm_rs1_type_o = {27'b0, instr[19:15]};
	assign regfile_raddr_a_o = instr[19:15];
	assign regfile_raddr_b_o = instr[24:20];
	assign regfile_waddr_o = instr[11:07];
	generate
		if (RV32E) begin : gen_rv32e_reg_check_active
			assign illegal_reg_rv32e = (((regfile_raddr_a_o[4] & (alu_op_a_mux_sel_o == OP_A_REG_A)) | (regfile_raddr_b_o[4] & (alu_op_b_mux_sel_o == OP_B_REG_B))) | (regfile_waddr_o[4] & regfile_we));
		end
		else begin : gen_rv32e_reg_check_inactive
			assign illegal_reg_rv32e = 1'b0;
		end
	endgenerate
	always @(*) begin : csr_operand_check
		csr_op_o = csr_op;
		if ((((csr_op == CSR_OP_SET) || (csr_op == CSR_OP_CLEAR)) && (instr[19:15] == 1'sb0)))
			csr_op_o = CSR_OP_READ;
	end
	always @(*) begin : csr_pipeline_flushes
		csr_pipe_flush_o = 1'b0;
		if (((csr_access_o == 1'b1) && ((csr_op_o == CSR_OP_WRITE) || (csr_op_o == CSR_OP_SET)))) begin
			if (((sv2v_cast_290A1(instr[31:20]) == CSR_MSTATUS) || (sv2v_cast_290A1(instr[31:20]) == CSR_MIE)))
				csr_pipe_flush_o = 1'b1;
		end
		else if (((csr_access_o == 1'b1) && (csr_op_o != CSR_OP_READ)))
			if (((((sv2v_cast_290A1(instr[31:20]) == CSR_DCSR) || (sv2v_cast_290A1(instr[31:20]) == CSR_DPC)) || (sv2v_cast_290A1(instr[31:20]) == CSR_DSCRATCH0)) || (sv2v_cast_290A1(instr[31:20]) == CSR_DSCRATCH1)))
				csr_pipe_flush_o = 1'b1;
	end
	always @(*) begin
		jump_in_dec_o = 1'b0;
		jump_set_o = 1'b0;
		branch_in_dec_o = 1'b0;
		alu_operator_o = ALU_SLTU;
		alu_op_a_mux_sel_o = OP_A_IMM;
		alu_op_b_mux_sel_o = OP_B_IMM;
		imm_a_mux_sel_o = IMM_A_ZERO;
		imm_b_mux_sel_o = IMM_B_I;
		mult_en_o = 1'b0;
		div_en_o = 1'b0;
		multdiv_operator_o = MD_OP_MULL;
		multdiv_signed_mode_o = 2'b00;
		regfile_wdata_sel_o = RF_WD_EX;
		regfile_we = 1'b0;
		csr_access_o = 1'b0;
		csr_illegal = 1'b0;
		csr_op = CSR_OP_READ;
		data_we_o = 1'b0;
		data_type_o = 2'b00;
		data_sign_extension_o = 1'b0;
		data_req_o = 1'b0;
		illegal_insn = 1'b0;
		ebrk_insn_o = 1'b0;
		mret_insn_o = 1'b0;
		dret_insn_o = 1'b0;
		ecall_insn_o = 1'b0;
		wfi_insn_o = 1'b0;
		opcode = sv2v_cast_DB892(instr[6:0]);
		case (opcode)
			OPCODE_JAL: begin
				jump_in_dec_o = 1'b1;
				if (instr_new_i) begin
					alu_op_a_mux_sel_o = OP_A_CURRPC;
					alu_op_b_mux_sel_o = OP_B_IMM;
					imm_b_mux_sel_o = IMM_B_J;
					alu_operator_o = ALU_ADD;
					regfile_we = 1'b0;
					jump_set_o = 1'b1;
				end
				else begin
					alu_op_a_mux_sel_o = OP_A_CURRPC;
					alu_op_b_mux_sel_o = OP_B_IMM;
					imm_b_mux_sel_o = IMM_B_INCR_PC;
					alu_operator_o = ALU_ADD;
					regfile_we = 1'b1;
				end
			end
			OPCODE_JALR: begin
				jump_in_dec_o = 1'b1;
				if (instr_new_i) begin
					alu_op_a_mux_sel_o = OP_A_REG_A;
					alu_op_b_mux_sel_o = OP_B_IMM;
					imm_b_mux_sel_o = IMM_B_I;
					alu_operator_o = ALU_ADD;
					regfile_we = 1'b0;
					jump_set_o = 1'b1;
				end
				else begin
					alu_op_a_mux_sel_o = OP_A_CURRPC;
					alu_op_b_mux_sel_o = OP_B_IMM;
					imm_b_mux_sel_o = IMM_B_INCR_PC;
					alu_operator_o = ALU_ADD;
					regfile_we = 1'b1;
				end
				if ((instr[14:12] != 3'b0))
					illegal_insn = 1'b1;
			end
			OPCODE_BRANCH: begin
				branch_in_dec_o = 1'b1;
				case (instr[14:12])
					3'b000: alu_operator_o = ALU_EQ;
					3'b001: alu_operator_o = ALU_NE;
					3'b100: alu_operator_o = ALU_LT;
					3'b101: alu_operator_o = ALU_GE;
					3'b110: alu_operator_o = ALU_LTU;
					3'b111: alu_operator_o = ALU_GEU;
					default: illegal_insn = 1'b1;
				endcase
				if (instr_new_i) begin
					alu_op_a_mux_sel_o = OP_A_REG_A;
					alu_op_b_mux_sel_o = OP_B_REG_B;
				end
				else begin
					alu_op_a_mux_sel_o = OP_A_CURRPC;
					alu_op_b_mux_sel_o = OP_B_IMM;
					imm_b_mux_sel_o = IMM_B_B;
					alu_operator_o = ALU_ADD;
					regfile_we = 1'b0;
				end
			end
			OPCODE_STORE: begin
				alu_op_a_mux_sel_o = OP_A_REG_A;
				alu_op_b_mux_sel_o = OP_B_REG_B;
				data_req_o = 1'b1;
				data_we_o = 1'b1;
				alu_operator_o = ALU_ADD;
				if (!instr[14]) begin
					imm_b_mux_sel_o = IMM_B_S;
					alu_op_b_mux_sel_o = OP_B_IMM;
				end
				else
					illegal_insn = 1'b1;
				case (instr[13:12])
					2'b00: data_type_o = 2'b10;
					2'b01: data_type_o = 2'b01;
					2'b10: data_type_o = 2'b00;
					default: illegal_insn = 1'b1;
				endcase
			end
			OPCODE_LOAD: begin
				alu_op_a_mux_sel_o = OP_A_REG_A;
				data_req_o = 1'b1;
				regfile_wdata_sel_o = RF_WD_LSU;
				regfile_we = 1'b1;
				data_type_o = 2'b00;
				alu_operator_o = ALU_ADD;
				alu_op_b_mux_sel_o = OP_B_IMM;
				imm_b_mux_sel_o = IMM_B_I;
				data_sign_extension_o = ~instr[14];
				case (instr[13:12])
					2'b00: data_type_o = 2'b10;
					2'b01: data_type_o = 2'b01;
					2'b10: begin
						data_type_o = 2'b00;
						if (instr[14])
							illegal_insn = 1'b1;
					end
					default: illegal_insn = 1'b1;
				endcase
			end
			OPCODE_LUI: begin
				alu_op_a_mux_sel_o = OP_A_IMM;
				alu_op_b_mux_sel_o = OP_B_IMM;
				imm_a_mux_sel_o = IMM_A_ZERO;
				imm_b_mux_sel_o = IMM_B_U;
				alu_operator_o = ALU_ADD;
				regfile_we = 1'b1;
			end
			OPCODE_AUIPC: begin
				alu_op_a_mux_sel_o = OP_A_CURRPC;
				alu_op_b_mux_sel_o = OP_B_IMM;
				imm_b_mux_sel_o = IMM_B_U;
				alu_operator_o = ALU_ADD;
				regfile_we = 1'b1;
			end
			OPCODE_OP_IMM: begin
				alu_op_a_mux_sel_o = OP_A_REG_A;
				alu_op_b_mux_sel_o = OP_B_IMM;
				imm_b_mux_sel_o = IMM_B_I;
				regfile_we = 1'b1;
				case (instr[14:12])
					3'b000: alu_operator_o = ALU_ADD;
					3'b010: alu_operator_o = ALU_SLT;
					3'b011: alu_operator_o = ALU_SLTU;
					3'b100: alu_operator_o = ALU_XOR;
					3'b110: alu_operator_o = ALU_OR;
					3'b111: alu_operator_o = ALU_AND;
					3'b001: begin
						alu_operator_o = ALU_SLL;
						if ((instr[31:25] != 7'b0))
							illegal_insn = 1'b1;
					end
					3'b101:
						if ((instr[31:25] == 7'b0))
							alu_operator_o = ALU_SRL;
						else if ((instr[31:25] == 7'b010_0000))
							alu_operator_o = ALU_SRA;
						else
							illegal_insn = 1'b1;
					default: alu_operator_o = sv2v_cast_F99D1({6 {1'bX}});
				endcase
			end
			OPCODE_OP: begin
				alu_op_a_mux_sel_o = OP_A_REG_A;
				alu_op_b_mux_sel_o = OP_B_REG_B;
				regfile_we = 1'b1;
				if (instr[31])
					illegal_insn = 1'b1;
				else
					case ({instr[30:25], instr[14:12]})
						{6'b00_0000, 3'b000}: alu_operator_o = ALU_ADD;
						{6'b10_0000, 3'b000}: alu_operator_o = ALU_SUB;
						{6'b00_0000, 3'b010}: alu_operator_o = ALU_SLT;
						{6'b00_0000, 3'b011}: alu_operator_o = ALU_SLTU;
						{6'b00_0000, 3'b100}: alu_operator_o = ALU_XOR;
						{6'b00_0000, 3'b110}: alu_operator_o = ALU_OR;
						{6'b00_0000, 3'b111}: alu_operator_o = ALU_AND;
						{6'b00_0000, 3'b001}: alu_operator_o = ALU_SLL;
						{6'b00_0000, 3'b101}: alu_operator_o = ALU_SRL;
						{6'b10_0000, 3'b101}: alu_operator_o = ALU_SRA;
						{6'b00_0001, 3'b000}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_MULL;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b001}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_MULH;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b010}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_MULH;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b01;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b011}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_MULH;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b100}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_DIV;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b101}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_DIV;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b110}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_REM;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						{6'b00_0001, 3'b111}: begin
							alu_operator_o = ALU_ADD;
							multdiv_operator_o = MD_OP_REM;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						default: illegal_insn = 1'b1;
					endcase
			end
			OPCODE_MISC_MEM:
				case (instr[14:12])
					3'b000: begin
						alu_operator_o = ALU_ADD;
						alu_op_a_mux_sel_o = OP_A_REG_A;
						alu_op_b_mux_sel_o = OP_B_IMM;
						regfile_we = 1'b0;
					end
					3'b001: begin
						jump_in_dec_o = 1'b1;
						alu_op_a_mux_sel_o = OP_A_CURRPC;
						alu_op_b_mux_sel_o = OP_B_IMM;
						imm_b_mux_sel_o = IMM_B_INCR_PC;
						alu_operator_o = ALU_ADD;
						regfile_we = 1'b0;
						if (instr_new_i)
							jump_set_o = 1'b1;
					end
					default: illegal_insn = 1'b1;
				endcase
			OPCODE_SYSTEM:
				if ((instr[14:12] == 3'b000)) begin
					alu_op_a_mux_sel_o = OP_A_REG_A;
					alu_op_b_mux_sel_o = OP_B_IMM;
					case (instr[31:20])
						12'h000: ecall_insn_o = 1'b1;
						12'h001: ebrk_insn_o = 1'b1;
						12'h302: mret_insn_o = 1'b1;
						12'h7b2: dret_insn_o = 1'b1;
						12'h105: wfi_insn_o = 1'b1;
						default: illegal_insn = 1'b1;
					endcase
					if (((instr[19:15] != 5'b0) || (instr[11:07] != 5'b0)))
						illegal_insn = 1'b1;
				end
				else begin
					csr_access_o = 1'b1;
					regfile_wdata_sel_o = RF_WD_CSR;
					regfile_we = 1'b1;
					alu_op_b_mux_sel_o = OP_B_IMM;
					imm_a_mux_sel_o = IMM_A_Z;
					imm_b_mux_sel_o = IMM_B_I;
					if (instr[14])
						alu_op_a_mux_sel_o = OP_A_IMM;
					else
						alu_op_a_mux_sel_o = OP_A_REG_A;
					case (instr[13:12])
						2'b01: csr_op = CSR_OP_WRITE;
						2'b10: csr_op = CSR_OP_SET;
						2'b11: csr_op = CSR_OP_CLEAR;
						default: csr_illegal = 1'b1;
					endcase
					illegal_insn = csr_illegal;
				end
			default: illegal_insn = 1'b1;
		endcase
		if (illegal_c_insn_i)
			illegal_insn = 1'b1;
		if (illegal_insn) begin
			regfile_we = 1'b0;
			data_req_o = 1'b0;
			data_we_o = 1'b0;
			mult_en_o = 1'b0;
			div_en_o = 1'b0;
			jump_in_dec_o = 1'b0;
			jump_set_o = 1'b0;
			branch_in_dec_o = 1'b0;
			csr_access_o = 1'b0;
		end
	end
	assign illegal_insn_o = (illegal_insn | illegal_reg_rv32e);
	assign regfile_we_o = (regfile_we & ~illegal_reg_rv32e);
	function [(5 - 1):0] sv2v_cast_F99D1;
		input [(5 - 1):0] inp;
		sv2v_cast_F99D1 = inp;
	endfunction
	function [(12 - 1):0] sv2v_cast_290A1;
		input [(12 - 1):0] inp;
		sv2v_cast_290A1 = inp;
	endfunction
	function [(7 - 1):0] sv2v_cast_DB892;
		input [(7 - 1):0] inp;
		sv2v_cast_DB892 = inp;
	endfunction
endmodule
