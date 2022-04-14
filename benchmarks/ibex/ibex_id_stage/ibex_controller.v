module ibex_controller (
	clk_i,
	rst_ni,
	fetch_enable_i,
	ctrl_busy_o,
	illegal_insn_i,
	ecall_insn_i,
	mret_insn_i,
	dret_insn_i,
	wfi_insn_i,
	ebrk_insn_i,
	csr_pipe_flush_i,
	instr_valid_i,
	instr_i,
	instr_compressed_i,
	instr_is_compressed_i,
	instr_fetch_err_i,
	pc_id_i,
	instr_valid_clear_o,
	id_in_ready_o,
	instr_req_o,
	pc_set_o,
	pc_mux_o,
	exc_pc_mux_o,
	exc_cause_o,
	lsu_addr_last_i,
	load_err_i,
	store_err_i,
	branch_set_i,
	jump_set_i,
	csr_mstatus_mie_i,
	csr_msip_i,
	csr_mtip_i,
	csr_meip_i,
	csr_mfip_i,
	irq_pending_i,
	irq_nm_i,
	debug_req_i,
	debug_cause_o,
	debug_csr_save_o,
	debug_mode_o,
	debug_single_step_i,
	debug_ebreakm_i,
	debug_ebreaku_i,
	csr_save_if_o,
	csr_save_id_o,
	csr_restore_mret_id_o,
	csr_restore_dret_id_o,
	csr_save_cause_o,
	csr_mtval_o,
	priv_mode_i,
	csr_mstatus_tw_i,
	stall_lsu_i,
	stall_multdiv_i,
	stall_jump_i,
	stall_branch_i,
	perf_jump_o,
	perf_tbranch_o
);
	localparam [3:0] RESET = 0;
	localparam [3:0] BOOT_SET = 1;
	localparam [3:0] WAIT_SLEEP = 2;
	localparam [3:0] SLEEP = 3;
	localparam [3:0] FIRST_FETCH = 4;
	localparam [3:0] DECODE = 5;
	localparam [3:0] FLUSH = 6;
	localparam [3:0] IRQ_TAKEN = 7;
	localparam [3:0] DBG_TAKEN_IF = 8;
	localparam [3:0] DBG_TAKEN_ID = 9;
	input wire clk_i;
	input wire rst_ni;
	input wire fetch_enable_i;
	output reg ctrl_busy_o;
	input wire illegal_insn_i;
	input wire ecall_insn_i;
	input wire mret_insn_i;
	input wire dret_insn_i;
	input wire wfi_insn_i;
	input wire ebrk_insn_i;
	input wire csr_pipe_flush_i;
	input wire instr_valid_i;
	input wire [31:0] instr_i;
	input wire [15:0] instr_compressed_i;
	input wire instr_is_compressed_i;
	input wire instr_fetch_err_i;
	input wire [31:0] pc_id_i;
	output wire instr_valid_clear_o;
	output wire id_in_ready_o;
	output reg instr_req_o;
	output reg pc_set_o;
	output reg [2:0] pc_mux_o;
	output reg [1:0] exc_pc_mux_o;
	output reg [5:0] exc_cause_o;
	input wire [31:0] lsu_addr_last_i;
	input wire load_err_i;
	input wire store_err_i;
	input wire branch_set_i;
	input wire jump_set_i;
	input wire csr_mstatus_mie_i;
	input wire csr_msip_i;
	input wire csr_mtip_i;
	input wire csr_meip_i;
	input wire [14:0] csr_mfip_i;
	input wire irq_pending_i;
	input wire irq_nm_i;
	input wire debug_req_i;
	output reg [2:0] debug_cause_o;
	output reg debug_csr_save_o;
	output wire debug_mode_o;
	input wire debug_single_step_i;
	input wire debug_ebreakm_i;
	input wire debug_ebreaku_i;
	output reg csr_save_if_o;
	output reg csr_save_id_o;
	output reg csr_restore_mret_id_o;
	output reg csr_restore_dret_id_o;
	output reg csr_save_cause_o;
	output reg [31:0] csr_mtval_o;
	input wire [1:0] priv_mode_i;
	input wire csr_mstatus_tw_i;
	input wire stall_lsu_i;
	input wire stall_multdiv_i;
	input wire stall_jump_i;
	input wire stall_branch_i;
	output reg perf_jump_o;
	output reg perf_tbranch_o;
	`include "ibex_pkg.v"
	reg [3:0] ctrl_fsm_cs;
	reg [3:0] ctrl_fsm_ns;
	reg nmi_mode_q;
	reg nmi_mode_d;
	reg debug_mode_q;
	reg debug_mode_d;
	reg load_err_q;
	wire load_err_d;
	reg store_err_q;
	wire store_err_d;
	reg exc_req_q;
	wire exc_req_d;
	reg illegal_insn_q;
	wire illegal_insn_d;
	wire stall;
	reg halt_if;
	reg flush_id;
	wire illegal_dret;
	wire illegal_umode;
	wire exc_req_lsu;
	wire special_req;
	wire enter_debug_mode;
	wire ebreak_into_debug;
	wire handle_irq;
	reg [3:0] mfip_id;
	wire unused_csr_mtip;
	wire ecall_insn;
	wire mret_insn;
	wire dret_insn;
	wire wfi_insn;
	wire ebrk_insn;
	wire csr_pipe_flush;
	wire instr_fetch_err;
	/* 
	NO $display allowed in Verilog code that will go thorugh GM static
	analysis
	always @(negedge clk_i)
		if (((((ctrl_fsm_cs == DECODE) && instr_valid_i) && !instr_fetch_err_i) && illegal_insn_d))
			$display("%t: Illegal instruction (hart %0x) at PC 0x%h: 0x%h", $time, ibex_core.hart_id_i, ibex_id_stage.pc_id_i, ibex_id_stage.instr_rdata_i);
	*/
	assign load_err_d = load_err_i;
	assign store_err_d = store_err_i;
	assign ecall_insn = (ecall_insn_i & instr_valid_i);
	assign mret_insn = (mret_insn_i & instr_valid_i);
	assign dret_insn = (dret_insn_i & instr_valid_i);
	assign wfi_insn = (wfi_insn_i & instr_valid_i);
	assign ebrk_insn = (ebrk_insn_i & instr_valid_i);
	assign csr_pipe_flush = (csr_pipe_flush_i & instr_valid_i);
	assign instr_fetch_err = (instr_fetch_err_i & instr_valid_i);
	assign illegal_dret = (dret_insn & ~debug_mode_q);
	assign illegal_umode = ((priv_mode_i != PRIV_LVL_M) & (mret_insn | (csr_mstatus_tw_i & wfi_insn)));
	assign illegal_insn_d = (((illegal_insn_i | illegal_dret) | illegal_umode) & (ctrl_fsm_cs != FLUSH));
	assign exc_req_d = ((((ecall_insn | ebrk_insn) | illegal_insn_d) | instr_fetch_err) & (ctrl_fsm_cs != FLUSH));
	assign exc_req_lsu = (store_err_i | load_err_i);
	assign special_req = (((((mret_insn | dret_insn) | wfi_insn) | csr_pipe_flush) | exc_req_d) | exc_req_lsu);
	assign enter_debug_mode = ((debug_req_i | (debug_single_step_i & instr_valid_i)) & ~debug_mode_q);
	assign ebreak_into_debug = ((priv_mode_i == PRIV_LVL_M) ? debug_ebreakm_i : ((priv_mode_i == PRIV_LVL_U) ? debug_ebreaku_i : 1'b0));
	assign handle_irq = (~debug_mode_q & ((irq_nm_i & ~nmi_mode_q) | (irq_pending_i & csr_mstatus_mie_i)));
	always @(*) begin : gen_mfip_id
		if (csr_mfip_i[14])
			mfip_id = 4'd14;
		else if (csr_mfip_i[13])
			mfip_id = 4'd13;
		else if (csr_mfip_i[12])
			mfip_id = 4'd12;
		else if (csr_mfip_i[11])
			mfip_id = 4'd11;
		else if (csr_mfip_i[10])
			mfip_id = 4'd10;
		else if (csr_mfip_i[9])
			mfip_id = 4'd9;
		else if (csr_mfip_i[8])
			mfip_id = 4'd8;
		else if (csr_mfip_i[7])
			mfip_id = 4'd7;
		else if (csr_mfip_i[6])
			mfip_id = 4'd6;
		else if (csr_mfip_i[5])
			mfip_id = 4'd5;
		else if (csr_mfip_i[5])
			mfip_id = 4'd5;
		else if (csr_mfip_i[4])
			mfip_id = 4'd4;
		else if (csr_mfip_i[3])
			mfip_id = 4'd3;
		else if (csr_mfip_i[2])
			mfip_id = 4'd2;
		else if (csr_mfip_i[1])
			mfip_id = 4'd1;
		else
			mfip_id = 4'd0;
	end
	assign unused_csr_mtip = csr_mtip_i;
	always @(*) begin
		instr_req_o = 1'b1;
		csr_save_if_o = 1'b0;
		csr_save_id_o = 1'b0;
		csr_restore_mret_id_o = 1'b0;
		csr_restore_dret_id_o = 1'b0;
		csr_save_cause_o = 1'b0;
		csr_mtval_o = 1'sb0;
		pc_mux_o = PC_BOOT;
		pc_set_o = 1'b0;
		exc_pc_mux_o = EXC_PC_IRQ;
		exc_cause_o = EXC_CAUSE_INSN_ADDR_MISA;
		ctrl_fsm_ns = ctrl_fsm_cs;
		ctrl_busy_o = 1'b1;
		halt_if = 1'b0;
		flush_id = 1'b0;
		debug_csr_save_o = 1'b0;
		debug_cause_o = DBG_CAUSE_EBREAK;
		debug_mode_d = debug_mode_q;
		nmi_mode_d = nmi_mode_q;
		perf_tbranch_o = 1'b0;
		perf_jump_o = 1'b0;
		case (ctrl_fsm_cs)
			RESET: begin
				instr_req_o = 1'b0;
				pc_mux_o = PC_BOOT;
				pc_set_o = 1'b1;
				if (fetch_enable_i)
					ctrl_fsm_ns = BOOT_SET;
			end
			BOOT_SET: begin
				instr_req_o = 1'b1;
				pc_mux_o = PC_BOOT;
				pc_set_o = 1'b1;
				ctrl_fsm_ns = FIRST_FETCH;
			end
			WAIT_SLEEP: begin
				ctrl_busy_o = 1'b0;
				instr_req_o = 1'b0;
				halt_if = 1'b1;
				flush_id = 1'b1;
				ctrl_fsm_ns = SLEEP;
			end
			SLEEP: begin
				instr_req_o = 1'b0;
				halt_if = 1'b1;
				flush_id = 1'b1;
				if (((((irq_nm_i || irq_pending_i) || debug_req_i) || debug_mode_q) || debug_single_step_i))
					ctrl_fsm_ns = FIRST_FETCH;
				else
					ctrl_busy_o = 1'b0;
			end
			FIRST_FETCH: begin
				if (id_in_ready_o)
					ctrl_fsm_ns = DECODE;
				if (handle_irq) begin
					ctrl_fsm_ns = IRQ_TAKEN;
					halt_if = 1'b1;
					flush_id = 1'b1;
				end
				if (enter_debug_mode) begin
					ctrl_fsm_ns = DBG_TAKEN_IF;
					halt_if = 1'b1;
				end
			end
			DECODE: begin
				if (instr_valid_i) begin
					if (special_req) begin
						ctrl_fsm_ns = FLUSH;
						halt_if = 1'b1;
					end
					else if ((branch_set_i || jump_set_i)) begin
						pc_mux_o = PC_JUMP;
						pc_set_o = 1'b1;
						perf_tbranch_o = branch_set_i;
						perf_jump_o = jump_set_i;
					end
					if (((enter_debug_mode || handle_irq) && stall))
						halt_if = 1'b1;
				end
				if ((!stall && !special_req))
					if (enter_debug_mode) begin
						ctrl_fsm_ns = DBG_TAKEN_IF;
						halt_if = 1'b1;
					end
					else if (handle_irq) begin
						ctrl_fsm_ns = IRQ_TAKEN;
						halt_if = 1'b1;
						flush_id = 1'b1;
					end
			end
			IRQ_TAKEN: begin
				if (handle_irq) begin
					pc_mux_o = PC_EXC;
					pc_set_o = 1'b1;
					exc_pc_mux_o = EXC_PC_IRQ;
					csr_save_if_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if ((irq_nm_i && !nmi_mode_q)) begin
						exc_cause_o = EXC_CAUSE_IRQ_NM;
						nmi_mode_d = 1'b1;
					end
					else if ((csr_mfip_i != 15'b0))
						exc_cause_o = sv2v_cast_89EA8({2'b11, mfip_id});
					else if (csr_meip_i)
						exc_cause_o = EXC_CAUSE_IRQ_EXTERNAL_M;
					else if (csr_msip_i)
						exc_cause_o = EXC_CAUSE_IRQ_SOFTWARE_M;
					else
						exc_cause_o = EXC_CAUSE_IRQ_TIMER_M;
				end
				ctrl_fsm_ns = DECODE;
			end
			DBG_TAKEN_IF: begin
				if ((debug_single_step_i || debug_req_i)) begin
					flush_id = 1'b1;
					pc_mux_o = PC_EXC;
					pc_set_o = 1'b1;
					exc_pc_mux_o = EXC_PC_DBD;
					csr_save_if_o = 1'b1;
					debug_csr_save_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if (debug_single_step_i)
						debug_cause_o = DBG_CAUSE_STEP;
					else
						debug_cause_o = DBG_CAUSE_HALTREQ;
					debug_mode_d = 1'b1;
				end
				ctrl_fsm_ns = DECODE;
			end
			DBG_TAKEN_ID: begin
				flush_id = 1'b1;
				pc_mux_o = PC_EXC;
				pc_set_o = 1'b1;
				exc_pc_mux_o = EXC_PC_DBD;
				if ((ebreak_into_debug && !debug_mode_q)) begin
					csr_save_cause_o = 1'b1;
					csr_save_id_o = 1'b1;
					debug_csr_save_o = 1'b1;
					debug_cause_o = DBG_CAUSE_EBREAK;
				end
				debug_mode_d = 1'b1;
				ctrl_fsm_ns = DECODE;
			end
			FLUSH: begin
				halt_if = 1'b1;
				flush_id = 1'b1;
				ctrl_fsm_ns = DECODE;
				if (((exc_req_q || store_err_q) || load_err_q)) begin
					pc_set_o = 1'b1;
					pc_mux_o = PC_EXC;
					exc_pc_mux_o = (debug_mode_q ? EXC_PC_DBG_EXC : EXC_PC_EXC);
					csr_save_id_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if (instr_fetch_err) begin
						exc_cause_o = EXC_CAUSE_INSTR_ACCESS_FAULT;
						csr_mtval_o = pc_id_i;
					end
					else if (illegal_insn_q) begin
						exc_cause_o = EXC_CAUSE_ILLEGAL_INSN;
						csr_mtval_o = (instr_is_compressed_i ? {16'b0, instr_compressed_i} : instr_i);
					end
					else if (ecall_insn)
						exc_cause_o = ((priv_mode_i == PRIV_LVL_M) ? EXC_CAUSE_ECALL_MMODE : EXC_CAUSE_ECALL_UMODE);
					else if (ebrk_insn) begin
						if ((debug_mode_q | ebreak_into_debug)) begin
							pc_set_o = 1'b0;
							csr_save_id_o = 1'b0;
							csr_save_cause_o = 1'b0;
							ctrl_fsm_ns = DBG_TAKEN_ID;
							flush_id = 1'b0;
						end
						else
							exc_cause_o = EXC_CAUSE_BREAKPOINT;
					end
					else if (store_err_q) begin
						exc_cause_o = EXC_CAUSE_STORE_ACCESS_FAULT;
						csr_mtval_o = lsu_addr_last_i;
					end
					else begin
						exc_cause_o = EXC_CAUSE_LOAD_ACCESS_FAULT;
						csr_mtval_o = lsu_addr_last_i;
					end
				end
				else if (mret_insn) begin
					pc_mux_o = PC_ERET;
					pc_set_o = 1'b1;
					csr_restore_mret_id_o = 1'b1;
					if (nmi_mode_q)
						nmi_mode_d = 1'b0;
				end
				else if (dret_insn) begin
					pc_mux_o = PC_DRET;
					pc_set_o = 1'b1;
					debug_mode_d = 1'b0;
					csr_restore_dret_id_o = 1'b1;
				end
				else if (wfi_insn)
					ctrl_fsm_ns = WAIT_SLEEP;
				else if ((csr_pipe_flush && handle_irq))
					ctrl_fsm_ns = IRQ_TAKEN;
				if (enter_debug_mode)
					ctrl_fsm_ns = DBG_TAKEN_IF;
			end
			default: begin
			instr_req_o = 1'b0;
			ctrl_fsm_ns = 1'bX;
		end
		endcase
	end
	assign debug_mode_o = debug_mode_q;
	assign stall = (((stall_lsu_i | stall_multdiv_i) | stall_jump_i) | stall_branch_i);
	assign id_in_ready_o = (~stall & ~halt_if);
	assign instr_valid_clear_o = (~(stall | halt_if) | flush_id);
	always @(posedge clk_i) begin : update_regs
		if (!rst_ni) begin
			ctrl_fsm_cs <= RESET;
			nmi_mode_q <= 1'b0;
			debug_mode_q <= 1'b0;
			load_err_q <= 1'b0;
			store_err_q <= 1'b0;
			exc_req_q <= 1'b0;
			illegal_insn_q <= 1'b0;
		end
		else begin
			ctrl_fsm_cs <= ctrl_fsm_ns;
			nmi_mode_q <= nmi_mode_d;
			debug_mode_q <= debug_mode_d;
			load_err_q <= load_err_d;
			store_err_q <= store_err_d;
			exc_req_q <= exc_req_d;
			illegal_insn_q <= illegal_insn_d;
		end
	end
	function [(6 - 1):0] sv2v_cast_89EA8;
		input [(6 - 1):0] inp;
		sv2v_cast_89EA8 = inp;
	endfunction
endmodule
