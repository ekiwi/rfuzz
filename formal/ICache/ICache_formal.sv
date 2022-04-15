module ICacheTop(
  input          clock,
  // inputs to the ICache
  input         auto_master_out_a_ready,
  input         auto_master_out_b_valid,
  input  [2:0]  auto_master_out_b_bits_opcode,
  input  [1:0]  auto_master_out_b_bits_param,
  input  [3:0]  auto_master_out_b_bits_size,
  input         auto_master_out_b_bits_source,
  input  [31:0] auto_master_out_b_bits_address,
  input  [7:0]  auto_master_out_b_bits_mask,
  input  [63:0] auto_master_out_b_bits_data,
  input         auto_master_out_c_ready,
  input         auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [1:0]  auto_master_out_d_bits_param,
  input  [3:0]  auto_master_out_d_bits_size,
  input         auto_master_out_d_bits_source,
  input  [2:0]  auto_master_out_d_bits_sink,
  input  [63:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_error,
  input         auto_master_out_e_ready,
  input         io_hartid,
  input         io_req_valid,
  input  [38:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input  [38:0] io_s2_vaddr,
  input         io_s1_kill,
  input         io_s2_kill,
  input         io_s2_prefetch,
  input         io_invalidate
);

// reset generator
reg is_meta_reset_phase = 1; // meta reset in cycle 0
reg is_reset_phase = 0;      // reset in cycle 1

always @(posedge clock) begin
    is_meta_reset_phase <= 0;
    if (is_meta_reset_phase) is_reset_phase <= 1;
    else is_reset_phase <= 0;
end


// coverage from dut
wire [60:0] auto_cover_out; // only some wires are actually used!
wire io_coverage_1;
wire io_coverage_2;
wire io_coverage_3;
wire io_coverage_4;
wire io_coverage_5;
wire io_coverage_6;
wire io_coverage_7;
wire io_coverage_8;
wire io_coverage_9;
wire io_coverage_10;
wire io_coverage_11;
wire io_coverage_12;
wire io_coverage_13;
wire io_coverage_14;
wire io_coverage_15;
wire io_coverage_16;
wire io_coverage_17;
wire io_coverage_18;
wire io_coverage_19;
assign io_coverage_1  = auto_cover_out[60]; // @[DUT.scala 51:33]
assign io_coverage_2  = auto_cover_out[59]; // @[DUT.scala 51:33]
assign io_coverage_3  = auto_cover_out[58]; // @[DUT.scala 51:33]
assign io_coverage_4  = auto_cover_out[57]; // @[DUT.scala 51:33]
assign io_coverage_5  = auto_cover_out[56]; // @[DUT.scala 51:33]
assign io_coverage_6  = auto_cover_out[55]; // @[DUT.scala 51:33]
assign io_coverage_7  = auto_cover_out[54]; // @[DUT.scala 51:33]
assign io_coverage_8  = auto_cover_out[53]; // @[DUT.scala 51:33]
assign io_coverage_9  = auto_cover_out[49]; // @[DUT.scala 51:33]
assign io_coverage_10 = auto_cover_out[48]; // @[DUT.scala 51:33]
assign io_coverage_11 = auto_cover_out[47]; // @[DUT.scala 51:33]
assign io_coverage_12 = auto_cover_out[46]; // @[DUT.scala 51:33]
assign io_coverage_13 = auto_cover_out[45]; // @[DUT.scala 51:33]
assign io_coverage_14 = auto_cover_out[44]; // @[DUT.scala 51:33]
assign io_coverage_15 = auto_cover_out[38]; // @[DUT.scala 51:33]
assign io_coverage_16 = auto_cover_out[26]; // @[DUT.scala 51:33]
assign io_coverage_17 = auto_cover_out[13]; // @[DUT.scala 51:33]
assign io_coverage_18 = auto_cover_out[11]; // @[DUT.scala 51:33]
assign io_coverage_19 = auto_cover_out[8]; // @[DUT.scala 51:33]

always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        cover( io_coverage_1);
        cover(!io_coverage_1);
        cover( io_coverage_2);
        cover(!io_coverage_2);
        cover( io_coverage_3);
        cover(!io_coverage_3);
        cover( io_coverage_4);
        cover(!io_coverage_4);
        cover( io_coverage_5);
        cover(!io_coverage_5);
        cover( io_coverage_6);
        cover(!io_coverage_6);
        cover( io_coverage_7);
        cover(!io_coverage_7);
        cover( io_coverage_8);
        cover(!io_coverage_8);
        cover( io_coverage_9);
        cover(!io_coverage_9);
        cover( io_coverage_10);
        cover(!io_coverage_10);
        cover( io_coverage_11);
        cover(!io_coverage_11);
        cover( io_coverage_12);
        cover(!io_coverage_12);
        cover( io_coverage_13);
        cover(!io_coverage_13);
        cover( io_coverage_14);
        cover(!io_coverage_14);
        cover( io_coverage_15);
        cover(!io_coverage_15);
        cover( io_coverage_16);
        cover(!io_coverage_16);
        cover( io_coverage_17);
        cover(!io_coverage_17);
        cover( io_coverage_18);
        cover(!io_coverage_18);
        cover( io_coverage_19);
        cover(!io_coverage_19);
    end
end

// assume that no assertion is violated
wire assert_out;
always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        assume(!assert_out);
    end
end

// dut instance
ICache dut (
    .auto_cover_out(auto_cover_out),
    .assert_out(assert_out),
    .io_invalidate(io_invalidate),
    .io_s2_prefetch(io_s2_prefetch),
    .io_s2_kill(io_s2_kill),
    .io_s1_kill(io_s1_kill),
    .io_req_valid(io_req_valid),
    .io_hartid(io_hartid),
    .auto_master_out_e_ready(auto_master_out_e_ready),
    .auto_master_out_d_bits_error(auto_master_out_d_bits_error),
    .auto_master_out_d_bits_source(auto_master_out_d_bits_source),
    .auto_master_out_d_valid(auto_master_out_d_valid),
    .auto_master_out_c_ready(auto_master_out_c_ready),
    .auto_master_out_b_bits_source(auto_master_out_b_bits_source),
    .auto_master_out_b_valid(auto_master_out_b_valid),
    .auto_master_out_a_ready(auto_master_out_a_ready),
    .auto_master_out_d_bits_param(auto_master_out_d_bits_param),
    .auto_master_out_b_bits_param(auto_master_out_b_bits_param),
    .auto_master_out_d_bits_sink(auto_master_out_d_bits_sink),
    .auto_master_out_d_bits_opcode(auto_master_out_d_bits_opcode),
    .auto_master_out_b_bits_opcode(auto_master_out_b_bits_opcode),
    .auto_master_out_d_bits_size(auto_master_out_d_bits_size),
    .auto_master_out_b_bits_size(auto_master_out_b_bits_size),
    .auto_master_out_b_bits_mask(auto_master_out_b_bits_mask),
    .io_s1_paddr(io_s1_paddr),
    .auto_master_out_b_bits_address(auto_master_out_b_bits_address),
    .io_s2_vaddr(io_s2_vaddr),
    .io_req_bits_addr(io_req_bits_addr),
    .auto_master_out_d_bits_data(auto_master_out_d_bits_data),
    .auto_master_out_b_bits_data(auto_master_out_b_bits_data),
    .metaReset(is_meta_reset_phase),
    .reset(is_reset_phase | is_meta_reset_phase),
    .clock(clock)
  );

endmodule