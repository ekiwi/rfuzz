module ibex_register_file (
	clk_i,
	rst_ni,
	test_en_i,
	raddr_a_i,
	rdata_a_o,
	raddr_b_i,
	rdata_b_o,
	waddr_a_i,
	wdata_a_i,
	we_a_i
);
	parameter RV32E = 0;
	parameter [31:0] DataWidth = 32;
	input wire clk_i;
	input wire rst_ni;
	input wire test_en_i;
	input wire [4:0] raddr_a_i;
	/*output wire [(DataWidth - 1):0] rdata_a_o;*/
	output wire [31:0] rdata_a_o;
	input wire [4:0] raddr_b_i;
	/*output wire [(DataWidth - 1):0] rdata_b_o;*/
	output wire [31:0] rdata_b_o;
	input wire [4:0] waddr_a_i;
	/*input wire [(DataWidth - 1):0] wdata_a_i;*/
	input wire [31:0] wdata_a_i;
	input wire we_a_i;
	localparam [31:0] ADDR_WIDTH = (RV32E ? 4 : 5);
	localparam [31:0] NUM_WORDS = (2 ** ADDR_WIDTH);
    
    /*
	wire [(((NUM_WORDS - 1) >= 0) ? (((DataWidth - 1) >= 0) ? (((((NUM_WORDS - 1) >= 0) ? NUM_WORDS : (2 - NUM_WORDS)) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) + -1) : (((((NUM_WORDS - 1) >= 0) ? NUM_WORDS : (2 - NUM_WORDS)) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)) + ((DataWidth - 1) - 1))) : (((DataWidth - 1) >= 0) ? ((((0 >= (NUM_WORDS - 1)) ? (2 - NUM_WORDS) : NUM_WORDS) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) + (((NUM_WORDS - 1) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) - 1)) : ((((0 >= (NUM_WORDS - 1)) ? (2 - NUM_WORDS) : NUM_WORDS) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)) + (((DataWidth - 1) + ((NUM_WORDS - 1) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth))) - 1)))):(((NUM_WORDS - 1) >= 0) ? (((DataWidth - 1) >= 0) ? 0 : (DataWidth - 1)) : (((DataWidth - 1) >= 0) ? ((NUM_WORDS - 1) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) : ((DataWidth - 1) + ((NUM_WORDS - 1) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)))))] rf_reg;

	reg [(((NUM_WORDS - 1) >= 1) ? (((DataWidth - 1) >= 0) ? (((((NUM_WORDS - 1) >= 1) ? (NUM_WORDS - 1) : (3 - NUM_WORDS)) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) + ((((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth)) - 1)) : (((((NUM_WORDS - 1) >= 1) ? (NUM_WORDS - 1) : (3 - NUM_WORDS)) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)) + (((DataWidth - 1) + ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)) - 1))) : (((DataWidth - 1) >= 0) ? ((((1 >= (NUM_WORDS - 1)) ? (3 - NUM_WORDS) : (NUM_WORDS - 1)) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) + (((NUM_WORDS - 1) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) - 1)) : ((((1 >= (NUM_WORDS - 1)) ? (3 - NUM_WORDS) : (NUM_WORDS - 1)) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)) + (((DataWidth - 1) + ((NUM_WORDS - 1) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth))) - 1)))):(((NUM_WORDS - 1) >= 1) ? (((DataWidth - 1) >= 0) ? (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth)) : ((DataWidth - 1) + ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth))) : (((DataWidth - 1) >= 0) ? ((NUM_WORDS - 1) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))) : ((DataWidth - 1) + ((NUM_WORDS - 1) * ((0 >= (DataWidth - 1)) ? (2 - DataWidth) : DataWidth)))))] rf_reg_tmp;
    */

    wire [1023:0] rf_reg;
    reg [1023:32] rf_reg_tmp;
	reg [31:1] we_a_dec;

   	always @(*) begin : we_a_decoder
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1; (i < NUM_WORDS); i = (i + 1))
				we_a_dec[i] = ((waddr_a_i == sv2v_cast_5(i)) ? we_a_i : 1'b0);
		end
	end
	always @(posedge clk_i)
		if (!rst_ni)
			rf_reg_tmp <= {(((NUM_WORDS - 1) >= 1) ? (NUM_WORDS - 1) : (3 - NUM_WORDS)) {1'sb0}};
		else begin : sv2v_autoblock_3
			reg signed [31:0] r;
			for (r = 1; (r < NUM_WORDS); r = (r + 1))
				if (we_a_dec[r])
					rf_reg_tmp[((((DataWidth - 1) >= 0) ? 0 : (DataWidth - 1)) + ((((NUM_WORDS - 1) >= 1) ? r : (1 - (r - (NUM_WORDS - 1)))) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))))+:(((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))] <= wdata_a_i;
		end
	assign rf_reg[((((DataWidth - 1) >= 0) ? 0 : (DataWidth - 1)) + ((((NUM_WORDS - 1) >= 0) ? 0 : (NUM_WORDS - 1)) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))))+:(((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))] = 1'sb0;
	assign rf_reg[(((((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth)) + ((((NUM_WORDS - 1) >= 1) ? (NUM_WORDS - 1) : (3 - NUM_WORDS)) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth)))) - 1):(((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))] = rf_reg_tmp[(((((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth)) + ((((NUM_WORDS - 1) >= 1) ? (NUM_WORDS - 1) : (3 - NUM_WORDS)) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth)))) - 1):(((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))];
	assign rdata_a_o = rf_reg[((((DataWidth - 1) >= 0) ? 0 : (DataWidth - 1)) + ((((NUM_WORDS - 1) >= 0) ? raddr_a_i : (0 - (raddr_a_i - (NUM_WORDS - 1)))) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))))+:(((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))];
	assign rdata_b_o = rf_reg[((((DataWidth - 1) >= 0) ? 0 : (DataWidth - 1)) + ((((NUM_WORDS - 1) >= 0) ? raddr_b_i : (0 - (raddr_b_i - (NUM_WORDS - 1)))) * (((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))))+:(((DataWidth - 1) >= 0) ? DataWidth : (2 - DataWidth))];
	function [4:0] sv2v_cast_5;
		input [4:0] inp;
		sv2v_cast_5 = inp;
	endfunction
endmodule
