module DUT(
  input          clock,
  input          reset,
  input          io_meta_reset,
  input  [164:0] io_inputs,
  output         io_coverage_0,
  output         io_coverage_1,
  output         io_coverage_2,
  output         io_coverage_3,
  output         io_coverage_4,
  output         io_coverage_5,
  output         io_coverage_6,
  output         io_coverage_7,
  output         io_coverage_8,
  output         io_coverage_9,
  output         io_coverage_10,
  output         io_coverage_11,
  output         io_coverage_12,
  output         io_coverage_13,
  output         io_coverage_14,
  output         io_coverage_15,
  output         io_coverage_16,
  output         io_coverage_17,
  output         io_coverage_18,
  output         io_coverage_19,
  output         io_coverage_20,
  output         io_coverage_21,
  output         io_coverage_22,
  output         io_coverage_23,
  output         io_coverage_24,
  output         io_coverage_25,
  output         io_coverage_26,
  output         io_coverage_27,
  output         io_coverage_28,
  output         io_coverage_29,
  output         io_coverage_30,
  output         io_coverage_31,
  output         io_coverage_32,
  output         io_coverage_33,
  output         io_coverage_34,
  output         io_coverage_35,
  output         io_coverage_36,
  output         io_coverage_37,
  output         io_coverage_38,
  output         io_coverage_39,
  output         io_coverage_40,
  output         io_coverage_41,
  output         io_coverage_42,
  output         io_coverage_43,
  output         io_coverage_44,
  output         io_coverage_45,
  output         io_coverage_46,
  output         io_coverage_47,
  output         io_coverage_48,
  output         io_coverage_49,
  output         io_coverage_50,
  output         io_coverage_51,
  output         io_coverage_52,
  output         io_coverage_53,
  output         io_coverage_54,
  output         io_coverage_55,
  output         io_coverage_56,
  output         io_coverage_57,
  output         io_coverage_58,
  output         io_coverage_59,
  output         io_coverage_60,
  output         io_coverage_61,
  output         io_coverage_62,
  output         io_coverage_63,
  output         io_coverage_64,
  output         io_coverage_65,
  output         io_coverage_66,
  output         io_coverage_67,
  output         io_coverage_68,
  output         io_coverage_69,
  output         io_coverage_70,
  output         io_coverage_71,
  output         io_coverage_72,
  output         io_coverage_73,
  output         io_coverage_74,
  output         io_coverage_75,
  output         io_coverage_76,
  output         io_coverage_77,
  output         io_coverage_78,
  output         io_coverage_79,
  output         io_coverage_80,
  output         io_coverage_81,
  output         io_coverage_82,
  output         io_coverage_83,
  output         io_coverage_84,
  output         io_coverage_85,
  output         io_coverage_86,
  output         io_coverage_87,
  output         io_coverage_88,
  output         io_coverage_89,
  output         io_coverage_90,
  output         io_coverage_91,
  output         io_coverage_92,
  output         io_coverage_93,
  output         io_coverage_94,
  output         io_coverage_95,
  output         io_coverage_96,
  output         io_coverage_97,
  output         io_coverage_98,
  output         io_coverage_99,
  output         io_coverage_100,
  output         io_coverage_101,
  output         io_coverage_102,
  output         io_coverage_103,
  output         io_coverage_104,
  output         io_coverage_105,
  output         io_coverage_106,
  output         io_coverage_107,
  output         io_coverage_108,
  output         io_coverage_109,
  output         io_coverage_110,
  output         io_coverage_111,
  output         io_coverage_112,
  output         io_coverage_113,
  output         io_coverage_114,
  output         io_coverage_115,
  output         io_coverage_116,
  output         io_coverage_117,
  output         io_coverage_118,
  output         io_coverage_119,
  output         io_coverage_120,
  output         io_coverage_121,
  output         io_coverage_122,
  output         io_coverage_123,
  output         io_coverage_124
);
  wire [250:0] bb_auto_cover_out; // @[DUT.scala 29:24]
  wire [51:0] bb_assert_out; // @[DUT.scala 29:24]
  wire  bb_io_port_sda_in; // @[DUT.scala 29:24]
  wire  bb_io_port_scl_in; // @[DUT.scala 29:24]
  wire  bb_auto_in_e_bits_sink; // @[DUT.scala 29:24]
  wire  bb_auto_in_e_valid; // @[DUT.scala 29:24]
  wire  bb_auto_in_d_ready; // @[DUT.scala 29:24]
  wire  bb_auto_in_c_bits_error; // @[DUT.scala 29:24]
  wire  bb_auto_in_c_valid; // @[DUT.scala 29:24]
  wire  bb_auto_in_b_ready; // @[DUT.scala 29:24]
  wire  bb_auto_in_a_valid; // @[DUT.scala 29:24]
  wire [1:0] bb_auto_in_c_bits_size; // @[DUT.scala 29:24]
  wire [1:0] bb_auto_in_a_bits_size; // @[DUT.scala 29:24]
  wire [2:0] bb_auto_in_c_bits_param; // @[DUT.scala 29:24]
  wire [2:0] bb_auto_in_c_bits_opcode; // @[DUT.scala 29:24]
  wire [2:0] bb_auto_in_a_bits_param; // @[DUT.scala 29:24]
  wire [2:0] bb_auto_in_a_bits_opcode; // @[DUT.scala 29:24]
  wire [3:0] bb_auto_in_a_bits_mask; // @[DUT.scala 29:24]
  wire [6:0] bb_auto_in_c_bits_source; // @[DUT.scala 29:24]
  wire [6:0] bb_auto_in_a_bits_source; // @[DUT.scala 29:24]
  wire [28:0] bb_auto_in_c_bits_address; // @[DUT.scala 29:24]
  wire [28:0] bb_auto_in_a_bits_address; // @[DUT.scala 29:24]
  wire [31:0] bb_auto_in_c_bits_data; // @[DUT.scala 29:24]
  wire [31:0] bb_auto_in_a_bits_data; // @[DUT.scala 29:24]
  wire  bb_metaReset; // @[DUT.scala 29:24]
  wire  bb_reset; // @[DUT.scala 29:24]
  wire  bb_clock; // @[DUT.scala 29:24]
  TLI2C bb ( // @[DUT.scala 29:24]
    .auto_cover_out(bb_auto_cover_out),
    .assert_out(bb_assert_out),
    .io_port_sda_in(bb_io_port_sda_in),
    .io_port_scl_in(bb_io_port_scl_in),
    .auto_in_e_bits_sink(bb_auto_in_e_bits_sink),
    .auto_in_e_valid(bb_auto_in_e_valid),
    .auto_in_d_ready(bb_auto_in_d_ready),
    .auto_in_c_bits_error(bb_auto_in_c_bits_error),
    .auto_in_c_valid(bb_auto_in_c_valid),
    .auto_in_b_ready(bb_auto_in_b_ready),
    .auto_in_a_valid(bb_auto_in_a_valid),
    .auto_in_c_bits_size(bb_auto_in_c_bits_size),
    .auto_in_a_bits_size(bb_auto_in_a_bits_size),
    .auto_in_c_bits_param(bb_auto_in_c_bits_param),
    .auto_in_c_bits_opcode(bb_auto_in_c_bits_opcode),
    .auto_in_a_bits_param(bb_auto_in_a_bits_param),
    .auto_in_a_bits_opcode(bb_auto_in_a_bits_opcode),
    .auto_in_a_bits_mask(bb_auto_in_a_bits_mask),
    .auto_in_c_bits_source(bb_auto_in_c_bits_source),
    .auto_in_a_bits_source(bb_auto_in_a_bits_source),
    .auto_in_c_bits_address(bb_auto_in_c_bits_address),
    .auto_in_a_bits_address(bb_auto_in_a_bits_address),
    .auto_in_c_bits_data(bb_auto_in_c_bits_data),
    .auto_in_a_bits_data(bb_auto_in_a_bits_data),
    .metaReset(bb_metaReset),
    .reset(bb_reset),
    .clock(bb_clock)
  );
  assign io_coverage_0 = bb_assert_out[51]; // @[DUT.scala 51:33]
  assign io_coverage_1 = bb_assert_out[49]; // @[DUT.scala 51:33]
  assign io_coverage_2 = bb_assert_out[48]; // @[DUT.scala 51:33]
  assign io_coverage_3 = bb_assert_out[47]; // @[DUT.scala 51:33]
  assign io_coverage_4 = bb_assert_out[46]; // @[DUT.scala 51:33]
  assign io_coverage_5 = bb_assert_out[45]; // @[DUT.scala 51:33]
  assign io_coverage_6 = bb_assert_out[43]; // @[DUT.scala 51:33]
  assign io_coverage_7 = bb_assert_out[42]; // @[DUT.scala 51:33]
  assign io_coverage_8 = bb_assert_out[41]; // @[DUT.scala 51:33]
  assign io_coverage_9 = bb_assert_out[40]; // @[DUT.scala 51:33]
  assign io_coverage_10 = bb_assert_out[39]; // @[DUT.scala 51:33]
  assign io_coverage_11 = bb_assert_out[38]; // @[DUT.scala 51:33]
  assign io_coverage_12 = bb_assert_out[37]; // @[DUT.scala 51:33]
  assign io_coverage_13 = bb_assert_out[36]; // @[DUT.scala 51:33]
  assign io_coverage_14 = bb_assert_out[35]; // @[DUT.scala 51:33]
  assign io_coverage_15 = bb_assert_out[34]; // @[DUT.scala 51:33]
  assign io_coverage_16 = bb_assert_out[33]; // @[DUT.scala 51:33]
  assign io_coverage_17 = bb_assert_out[32]; // @[DUT.scala 51:33]
  assign io_coverage_18 = bb_assert_out[31]; // @[DUT.scala 51:33]
  assign io_coverage_19 = bb_assert_out[30]; // @[DUT.scala 51:33]
  assign io_coverage_20 = bb_assert_out[29]; // @[DUT.scala 51:33]
  assign io_coverage_21 = bb_assert_out[28]; // @[DUT.scala 51:33]
  assign io_coverage_22 = bb_assert_out[27]; // @[DUT.scala 51:33]
  assign io_coverage_23 = bb_assert_out[26]; // @[DUT.scala 51:33]
  assign io_coverage_24 = bb_assert_out[25]; // @[DUT.scala 51:33]
  assign io_coverage_25 = bb_assert_out[24]; // @[DUT.scala 51:33]
  assign io_coverage_26 = bb_assert_out[23]; // @[DUT.scala 51:33]
  assign io_coverage_27 = bb_assert_out[22]; // @[DUT.scala 51:33]
  assign io_coverage_28 = bb_assert_out[21]; // @[DUT.scala 51:33]
  assign io_coverage_29 = bb_assert_out[20]; // @[DUT.scala 51:33]
  assign io_coverage_30 = bb_assert_out[19]; // @[DUT.scala 51:33]
  assign io_coverage_31 = bb_assert_out[18]; // @[DUT.scala 51:33]
  assign io_coverage_32 = bb_assert_out[17]; // @[DUT.scala 51:33]
  assign io_coverage_33 = bb_assert_out[16]; // @[DUT.scala 51:33]
  assign io_coverage_34 = bb_assert_out[15]; // @[DUT.scala 51:33]
  assign io_coverage_35 = bb_assert_out[14]; // @[DUT.scala 51:33]
  assign io_coverage_36 = bb_assert_out[13]; // @[DUT.scala 51:33]
  assign io_coverage_37 = bb_assert_out[12]; // @[DUT.scala 51:33]
  assign io_coverage_38 = bb_assert_out[11]; // @[DUT.scala 51:33]
  assign io_coverage_39 = bb_assert_out[10]; // @[DUT.scala 51:33]
  assign io_coverage_40 = bb_assert_out[9]; // @[DUT.scala 51:33]
  assign io_coverage_41 = bb_assert_out[8]; // @[DUT.scala 51:33]
  assign io_coverage_42 = bb_assert_out[7]; // @[DUT.scala 51:33]
  assign io_coverage_43 = bb_assert_out[6]; // @[DUT.scala 51:33]
  assign io_coverage_44 = bb_assert_out[5]; // @[DUT.scala 51:33]
  assign io_coverage_45 = bb_assert_out[4]; // @[DUT.scala 51:33]
  assign io_coverage_46 = bb_assert_out[3]; // @[DUT.scala 51:33]
  assign io_coverage_47 = bb_assert_out[2]; // @[DUT.scala 51:33]
  assign io_coverage_48 = bb_assert_out[1]; // @[DUT.scala 51:33]
  assign io_coverage_49 = bb_assert_out[0]; // @[DUT.scala 51:33]
  assign io_coverage_50 = bb_auto_cover_out[250]; // @[DUT.scala 51:33]
  assign io_coverage_51 = bb_auto_cover_out[249]; // @[DUT.scala 51:33]
  assign io_coverage_52 = bb_auto_cover_out[246]; // @[DUT.scala 51:33]
  assign io_coverage_53 = bb_auto_cover_out[245]; // @[DUT.scala 51:33]
  assign io_coverage_54 = bb_auto_cover_out[244]; // @[DUT.scala 51:33]
  assign io_coverage_55 = bb_auto_cover_out[243]; // @[DUT.scala 51:33]
  assign io_coverage_56 = bb_auto_cover_out[242]; // @[DUT.scala 51:33]
  assign io_coverage_57 = bb_auto_cover_out[241]; // @[DUT.scala 51:33]
  assign io_coverage_58 = bb_auto_cover_out[240]; // @[DUT.scala 51:33]
  assign io_coverage_59 = bb_auto_cover_out[239]; // @[DUT.scala 51:33]
  assign io_coverage_60 = bb_auto_cover_out[235]; // @[DUT.scala 51:33]
  assign io_coverage_61 = bb_auto_cover_out[232]; // @[DUT.scala 51:33]
  assign io_coverage_62 = bb_auto_cover_out[228]; // @[DUT.scala 51:33]
  assign io_coverage_63 = bb_auto_cover_out[223]; // @[DUT.scala 51:33]
  assign io_coverage_64 = bb_auto_cover_out[220]; // @[DUT.scala 51:33]
  assign io_coverage_65 = bb_auto_cover_out[217]; // @[DUT.scala 51:33]
  assign io_coverage_66 = bb_auto_cover_out[214]; // @[DUT.scala 51:33]
  assign io_coverage_67 = bb_auto_cover_out[210]; // @[DUT.scala 51:33]
  assign io_coverage_68 = bb_auto_cover_out[208]; // @[DUT.scala 51:33]
  assign io_coverage_69 = bb_auto_cover_out[204]; // @[DUT.scala 51:33]
  assign io_coverage_70 = bb_auto_cover_out[200]; // @[DUT.scala 51:33]
  assign io_coverage_71 = bb_auto_cover_out[195]; // @[DUT.scala 51:33]
  assign io_coverage_72 = bb_auto_cover_out[191]; // @[DUT.scala 51:33]
  assign io_coverage_73 = bb_auto_cover_out[187]; // @[DUT.scala 51:33]
  assign io_coverage_74 = bb_auto_cover_out[183]; // @[DUT.scala 51:33]
  assign io_coverage_75 = bb_auto_cover_out[180]; // @[DUT.scala 51:33]
  assign io_coverage_76 = bb_auto_cover_out[176]; // @[DUT.scala 51:33]
  assign io_coverage_77 = bb_auto_cover_out[167]; // @[DUT.scala 51:33]
  assign io_coverage_78 = bb_auto_cover_out[164]; // @[DUT.scala 51:33]
  assign io_coverage_79 = bb_auto_cover_out[163]; // @[DUT.scala 51:33]
  assign io_coverage_80 = bb_auto_cover_out[160]; // @[DUT.scala 51:33]
  assign io_coverage_81 = bb_auto_cover_out[158]; // @[DUT.scala 51:33]
  assign io_coverage_82 = bb_auto_cover_out[156]; // @[DUT.scala 51:33]
  assign io_coverage_83 = bb_auto_cover_out[154]; // @[DUT.scala 51:33]
  assign io_coverage_84 = bb_auto_cover_out[150]; // @[DUT.scala 51:33]
  assign io_coverage_85 = bb_auto_cover_out[148]; // @[DUT.scala 51:33]
  assign io_coverage_86 = bb_auto_cover_out[138]; // @[DUT.scala 51:33]
  assign io_coverage_87 = bb_auto_cover_out[130]; // @[DUT.scala 51:33]
  assign io_coverage_88 = bb_auto_cover_out[128]; // @[DUT.scala 51:33]
  assign io_coverage_89 = bb_auto_cover_out[123]; // @[DUT.scala 51:33]
  assign io_coverage_90 = bb_auto_cover_out[118]; // @[DUT.scala 51:33]
  assign io_coverage_91 = bb_auto_cover_out[112]; // @[DUT.scala 51:33]
  assign io_coverage_92 = bb_auto_cover_out[106]; // @[DUT.scala 51:33]
  assign io_coverage_93 = bb_auto_cover_out[92]; // @[DUT.scala 51:33]
  assign io_coverage_94 = bb_auto_cover_out[91]; // @[DUT.scala 51:33]
  assign io_coverage_95 = bb_auto_cover_out[90]; // @[DUT.scala 51:33]
  assign io_coverage_96 = bb_auto_cover_out[89]; // @[DUT.scala 51:33]
  assign io_coverage_97 = bb_auto_cover_out[88]; // @[DUT.scala 51:33]
  assign io_coverage_98 = bb_auto_cover_out[87]; // @[DUT.scala 51:33]
  assign io_coverage_99 = bb_auto_cover_out[83]; // @[DUT.scala 51:33]
  assign io_coverage_100 = bb_auto_cover_out[80]; // @[DUT.scala 51:33]
  assign io_coverage_101 = bb_auto_cover_out[79]; // @[DUT.scala 51:33]
  assign io_coverage_102 = bb_auto_cover_out[78]; // @[DUT.scala 51:33]
  assign io_coverage_103 = bb_auto_cover_out[77]; // @[DUT.scala 51:33]
  assign io_coverage_104 = bb_auto_cover_out[76]; // @[DUT.scala 51:33]
  assign io_coverage_105 = bb_auto_cover_out[75]; // @[DUT.scala 51:33]
  assign io_coverage_106 = bb_auto_cover_out[74]; // @[DUT.scala 51:33]
  assign io_coverage_107 = bb_auto_cover_out[72]; // @[DUT.scala 51:33]
  assign io_coverage_108 = bb_auto_cover_out[71]; // @[DUT.scala 51:33]
  assign io_coverage_109 = bb_auto_cover_out[70]; // @[DUT.scala 51:33]
  assign io_coverage_110 = bb_auto_cover_out[64]; // @[DUT.scala 51:33]
  assign io_coverage_111 = bb_auto_cover_out[63]; // @[DUT.scala 51:33]
  assign io_coverage_112 = bb_auto_cover_out[62]; // @[DUT.scala 51:33]
  assign io_coverage_113 = bb_auto_cover_out[61]; // @[DUT.scala 51:33]
  assign io_coverage_114 = bb_auto_cover_out[34]; // @[DUT.scala 51:33]
  assign io_coverage_115 = bb_auto_cover_out[22]; // @[DUT.scala 51:33]
  assign io_coverage_116 = bb_auto_cover_out[21]; // @[DUT.scala 51:33]
  assign io_coverage_117 = bb_auto_cover_out[20]; // @[DUT.scala 51:33]
  assign io_coverage_118 = bb_auto_cover_out[19]; // @[DUT.scala 51:33]
  assign io_coverage_119 = bb_auto_cover_out[18]; // @[DUT.scala 51:33]
  assign io_coverage_120 = bb_auto_cover_out[16]; // @[DUT.scala 51:33]
  assign io_coverage_121 = bb_auto_cover_out[14]; // @[DUT.scala 51:33]
  assign io_coverage_122 = bb_auto_cover_out[13]; // @[DUT.scala 51:33]
  assign io_coverage_123 = bb_auto_cover_out[11]; // @[DUT.scala 51:33]
  assign io_coverage_124 = bb_auto_cover_out[5]; // @[DUT.scala 51:33]
  assign bb_io_port_sda_in = io_inputs[0]; // @[DUT.scala 40:25]
  assign bb_io_port_scl_in = io_inputs[1]; // @[DUT.scala 40:25]
  assign bb_auto_in_e_bits_sink = io_inputs[2]; // @[DUT.scala 40:25]
  assign bb_auto_in_e_valid = io_inputs[3]; // @[DUT.scala 40:25]
  assign bb_auto_in_d_ready = io_inputs[4]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_error = io_inputs[5]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_valid = io_inputs[6]; // @[DUT.scala 40:25]
  assign bb_auto_in_b_ready = io_inputs[7]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_valid = io_inputs[8]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_size = io_inputs[10:9]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_size = io_inputs[12:11]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_param = io_inputs[15:13]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_opcode = io_inputs[18:16]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_param = io_inputs[21:19]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_opcode = io_inputs[24:22]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_mask = io_inputs[28:25]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_source = io_inputs[35:29]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_source = io_inputs[42:36]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_address = io_inputs[71:43]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_address = io_inputs[100:72]; // @[DUT.scala 40:25]
  assign bb_auto_in_c_bits_data = io_inputs[132:101]; // @[DUT.scala 40:25]
  assign bb_auto_in_a_bits_data = io_inputs[164:133]; // @[DUT.scala 40:25]
  assign bb_metaReset = io_meta_reset; // @[DUT.scala 35:27]
  assign bb_reset = reset; // @[DUT.scala 34:23]
  assign bb_clock = clock; // @[DUT.scala 33:23]
endmodule
module SaturatingCounter(
  input   clock,
  input   reset,
  input   io_enable,
  output  io_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  count; // @[coverage.scala 11:28]
  wire  _T = ~io_enable; // @[coverage.scala 14:22]
  wire  _T_2 = _T | count; // @[coverage.scala 14:33]
  wire  _T_4 = count + 1'h1; // @[coverage.scala 14:64]
  assign io_value = count; // @[coverage.scala 12:18]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      count <= 1'h0;
    end else if (!(_T_2)) begin
      count <= _T_4;
    end
  end
endmodule
module VerilatorHarness(
  input        clock,
  input        reset,
  input  [7:0] io_input_bytes_0,
  input  [7:0] io_input_bytes_1,
  input  [7:0] io_input_bytes_2,
  input  [7:0] io_input_bytes_3,
  input  [7:0] io_input_bytes_4,
  input  [7:0] io_input_bytes_5,
  input  [7:0] io_input_bytes_6,
  input  [7:0] io_input_bytes_7,
  input  [7:0] io_input_bytes_8,
  input  [7:0] io_input_bytes_9,
  input  [7:0] io_input_bytes_10,
  input  [7:0] io_input_bytes_11,
  input  [7:0] io_input_bytes_12,
  input  [7:0] io_input_bytes_13,
  input  [7:0] io_input_bytes_14,
  input  [7:0] io_input_bytes_15,
  input  [7:0] io_input_bytes_16,
  input  [7:0] io_input_bytes_17,
  input  [7:0] io_input_bytes_18,
  input  [7:0] io_input_bytes_19,
  input  [7:0] io_input_bytes_20,
  input  [7:0] io_input_bytes_21,
  input  [7:0] io_input_bytes_22,
  input  [7:0] io_input_bytes_23,
  output [7:0] io_coverage_bytes_0,
  output [7:0] io_coverage_bytes_1,
  output [7:0] io_coverage_bytes_2,
  output [7:0] io_coverage_bytes_3,
  output [7:0] io_coverage_bytes_4,
  output [7:0] io_coverage_bytes_5,
  output [7:0] io_coverage_bytes_6,
  output [7:0] io_coverage_bytes_7,
  output [7:0] io_coverage_bytes_8,
  output [7:0] io_coverage_bytes_9,
  output [7:0] io_coverage_bytes_10,
  output [7:0] io_coverage_bytes_11,
  output [7:0] io_coverage_bytes_12,
  output [7:0] io_coverage_bytes_13,
  output [7:0] io_coverage_bytes_14,
  output [7:0] io_coverage_bytes_15,
  output [7:0] io_coverage_bytes_16,
  output [7:0] io_coverage_bytes_17,
  output [7:0] io_coverage_bytes_18,
  output [7:0] io_coverage_bytes_19,
  output [7:0] io_coverage_bytes_20,
  output [7:0] io_coverage_bytes_21,
  output [7:0] io_coverage_bytes_22,
  output [7:0] io_coverage_bytes_23,
  output [7:0] io_coverage_bytes_24,
  output [7:0] io_coverage_bytes_25,
  output [7:0] io_coverage_bytes_26,
  output [7:0] io_coverage_bytes_27,
  output [7:0] io_coverage_bytes_28,
  output [7:0] io_coverage_bytes_29,
  output [7:0] io_coverage_bytes_30,
  output [7:0] io_coverage_bytes_31,
  output [7:0] io_coverage_bytes_32,
  output [7:0] io_coverage_bytes_33,
  output [7:0] io_coverage_bytes_34,
  output [7:0] io_coverage_bytes_35,
  output [7:0] io_coverage_bytes_36,
  output [7:0] io_coverage_bytes_37,
  output [7:0] io_coverage_bytes_38,
  output [7:0] io_coverage_bytes_39,
  output [7:0] io_coverage_bytes_40,
  output [7:0] io_coverage_bytes_41,
  output [7:0] io_coverage_bytes_42,
  output [7:0] io_coverage_bytes_43,
  output [7:0] io_coverage_bytes_44,
  output [7:0] io_coverage_bytes_45,
  output [7:0] io_coverage_bytes_46,
  output [7:0] io_coverage_bytes_47,
  output [7:0] io_coverage_bytes_48,
  output [7:0] io_coverage_bytes_49,
  output [7:0] io_coverage_bytes_50,
  output [7:0] io_coverage_bytes_51,
  output [7:0] io_coverage_bytes_52,
  output [7:0] io_coverage_bytes_53,
  output [7:0] io_coverage_bytes_54,
  output [7:0] io_coverage_bytes_55,
  output [7:0] io_coverage_bytes_56,
  output [7:0] io_coverage_bytes_57,
  output [7:0] io_coverage_bytes_58,
  output [7:0] io_coverage_bytes_59,
  output [7:0] io_coverage_bytes_60,
  output [7:0] io_coverage_bytes_61,
  output [7:0] io_coverage_bytes_62,
  output [7:0] io_coverage_bytes_63,
  output [7:0] io_coverage_bytes_64,
  output [7:0] io_coverage_bytes_65,
  output [7:0] io_coverage_bytes_66,
  output [7:0] io_coverage_bytes_67,
  output [7:0] io_coverage_bytes_68,
  output [7:0] io_coverage_bytes_69,
  output [7:0] io_coverage_bytes_70,
  output [7:0] io_coverage_bytes_71,
  output [7:0] io_coverage_bytes_72,
  output [7:0] io_coverage_bytes_73,
  output [7:0] io_coverage_bytes_74,
  output [7:0] io_coverage_bytes_75,
  output [7:0] io_coverage_bytes_76,
  output [7:0] io_coverage_bytes_77,
  output [7:0] io_coverage_bytes_78,
  output [7:0] io_coverage_bytes_79,
  output [7:0] io_coverage_bytes_80,
  output [7:0] io_coverage_bytes_81,
  output [7:0] io_coverage_bytes_82,
  output [7:0] io_coverage_bytes_83,
  output [7:0] io_coverage_bytes_84,
  output [7:0] io_coverage_bytes_85,
  output [7:0] io_coverage_bytes_86,
  output [7:0] io_coverage_bytes_87,
  output [7:0] io_coverage_bytes_88,
  output [7:0] io_coverage_bytes_89,
  output [7:0] io_coverage_bytes_90,
  output [7:0] io_coverage_bytes_91,
  output [7:0] io_coverage_bytes_92,
  output [7:0] io_coverage_bytes_93,
  output [7:0] io_coverage_bytes_94,
  output [7:0] io_coverage_bytes_95,
  output [7:0] io_coverage_bytes_96,
  output [7:0] io_coverage_bytes_97,
  output [7:0] io_coverage_bytes_98,
  output [7:0] io_coverage_bytes_99,
  output [7:0] io_coverage_bytes_100,
  output [7:0] io_coverage_bytes_101,
  output [7:0] io_coverage_bytes_102,
  output [7:0] io_coverage_bytes_103,
  output [7:0] io_coverage_bytes_104,
  output [7:0] io_coverage_bytes_105,
  output [7:0] io_coverage_bytes_106,
  output [7:0] io_coverage_bytes_107,
  output [7:0] io_coverage_bytes_108,
  output [7:0] io_coverage_bytes_109,
  output [7:0] io_coverage_bytes_110,
  output [7:0] io_coverage_bytes_111,
  output [7:0] io_coverage_bytes_112,
  output [7:0] io_coverage_bytes_113,
  output [7:0] io_coverage_bytes_114,
  output [7:0] io_coverage_bytes_115,
  output [7:0] io_coverage_bytes_116,
  output [7:0] io_coverage_bytes_117,
  output [7:0] io_coverage_bytes_118,
  output [7:0] io_coverage_bytes_119,
  output [7:0] io_coverage_bytes_120,
  output [7:0] io_coverage_bytes_121,
  output [7:0] io_coverage_bytes_122,
  output [7:0] io_coverage_bytes_123,
  output [7:0] io_coverage_bytes_124,
  output [7:0] io_coverage_bytes_125,
  input        io_meta_reset
);
  wire  dut_clock; // @[VerilatorHarness.scala 42:25]
  wire  dut_reset; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_meta_reset; // @[VerilatorHarness.scala 42:25]
  wire [164:0] dut_io_inputs; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_0; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_1; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_2; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_3; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_4; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_5; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_6; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_7; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_8; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_9; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_10; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_11; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_12; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_13; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_14; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_15; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_16; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_17; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_18; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_19; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_20; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_21; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_22; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_23; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_24; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_25; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_26; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_27; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_28; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_29; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_30; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_31; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_32; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_33; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_34; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_35; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_36; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_37; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_38; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_39; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_40; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_41; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_42; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_43; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_44; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_45; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_46; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_47; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_48; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_49; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_50; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_51; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_52; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_53; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_54; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_55; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_56; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_57; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_58; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_59; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_60; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_61; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_62; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_63; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_64; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_65; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_66; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_67; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_68; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_69; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_70; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_71; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_72; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_73; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_74; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_75; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_76; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_77; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_78; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_79; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_80; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_81; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_82; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_83; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_84; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_85; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_86; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_87; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_88; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_89; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_90; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_91; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_92; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_93; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_94; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_95; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_96; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_97; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_98; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_99; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_100; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_101; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_102; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_103; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_104; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_105; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_106; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_107; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_108; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_109; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_110; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_111; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_112; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_113; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_114; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_115; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_116; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_117; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_118; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_119; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_120; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_121; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_122; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_123; // @[VerilatorHarness.scala 42:25]
  wire  dut_io_coverage_124; // @[VerilatorHarness.scala 42:25]
  wire  SaturatingCounter_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_1_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_1_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_1_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_1_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_2_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_2_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_2_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_2_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_3_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_3_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_3_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_3_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_4_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_4_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_4_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_4_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_5_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_5_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_5_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_5_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_6_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_6_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_6_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_6_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_7_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_7_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_7_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_7_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_8_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_8_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_8_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_8_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_9_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_9_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_9_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_9_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_10_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_10_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_10_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_10_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_11_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_11_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_11_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_11_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_12_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_12_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_12_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_12_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_13_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_13_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_13_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_13_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_14_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_14_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_14_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_14_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_15_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_15_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_15_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_15_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_16_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_16_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_16_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_16_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_17_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_17_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_17_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_17_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_18_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_18_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_18_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_18_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_19_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_19_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_19_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_19_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_20_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_20_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_20_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_20_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_21_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_21_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_21_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_21_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_22_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_22_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_22_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_22_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_23_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_23_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_23_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_23_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_24_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_24_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_24_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_24_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_25_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_25_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_25_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_25_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_26_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_26_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_26_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_26_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_27_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_27_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_27_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_27_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_28_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_28_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_28_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_28_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_29_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_29_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_29_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_29_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_30_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_30_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_30_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_30_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_31_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_31_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_31_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_31_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_32_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_32_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_32_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_32_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_33_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_33_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_33_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_33_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_34_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_34_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_34_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_34_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_35_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_35_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_35_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_35_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_36_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_36_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_36_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_36_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_37_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_37_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_37_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_37_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_38_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_38_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_38_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_38_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_39_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_39_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_39_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_39_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_40_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_40_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_40_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_40_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_41_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_41_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_41_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_41_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_42_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_42_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_42_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_42_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_43_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_43_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_43_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_43_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_44_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_44_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_44_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_44_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_45_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_45_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_45_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_45_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_46_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_46_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_46_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_46_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_47_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_47_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_47_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_47_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_48_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_48_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_48_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_48_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_49_clock; // @[coverage.scala 121:35]
  wire  SaturatingCounter_49_reset; // @[coverage.scala 121:35]
  wire  SaturatingCounter_49_io_enable; // @[coverage.scala 121:35]
  wire  SaturatingCounter_49_io_value; // @[coverage.scala 121:35]
  wire  SaturatingCounter_50_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_50_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_50_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_50_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_51_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_51_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_51_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_51_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_52_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_52_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_52_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_52_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_53_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_53_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_53_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_53_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_54_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_54_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_54_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_54_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_55_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_55_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_55_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_55_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_56_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_56_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_56_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_56_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_57_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_57_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_57_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_57_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_58_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_58_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_58_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_58_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_59_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_59_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_59_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_59_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_60_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_60_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_60_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_60_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_61_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_61_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_61_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_61_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_62_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_62_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_62_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_62_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_63_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_63_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_63_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_63_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_64_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_64_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_64_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_64_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_65_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_65_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_65_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_65_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_66_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_66_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_66_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_66_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_67_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_67_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_67_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_67_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_68_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_68_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_68_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_68_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_69_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_69_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_69_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_69_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_70_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_70_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_70_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_70_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_71_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_71_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_71_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_71_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_72_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_72_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_72_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_72_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_73_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_73_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_73_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_73_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_74_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_74_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_74_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_74_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_75_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_75_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_75_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_75_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_76_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_76_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_76_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_76_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_77_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_77_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_77_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_77_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_78_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_78_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_78_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_78_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_79_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_79_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_79_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_79_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_80_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_80_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_80_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_80_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_81_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_81_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_81_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_81_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_82_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_82_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_82_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_82_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_83_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_83_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_83_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_83_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_84_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_84_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_84_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_84_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_85_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_85_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_85_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_85_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_86_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_86_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_86_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_86_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_87_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_87_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_87_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_87_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_88_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_88_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_88_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_88_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_89_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_89_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_89_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_89_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_90_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_90_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_90_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_90_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_91_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_91_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_91_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_91_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_92_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_92_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_92_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_92_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_93_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_93_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_93_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_93_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_94_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_94_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_94_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_94_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_95_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_95_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_95_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_95_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_96_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_96_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_96_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_96_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_97_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_97_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_97_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_97_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_98_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_98_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_98_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_98_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_99_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_99_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_99_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_99_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_100_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_100_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_100_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_100_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_101_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_101_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_101_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_101_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_102_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_102_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_102_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_102_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_103_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_103_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_103_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_103_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_104_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_104_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_104_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_104_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_105_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_105_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_105_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_105_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_106_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_106_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_106_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_106_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_107_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_107_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_107_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_107_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_108_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_108_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_108_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_108_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_109_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_109_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_109_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_109_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_110_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_110_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_110_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_110_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_111_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_111_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_111_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_111_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_112_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_112_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_112_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_112_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_113_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_113_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_113_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_113_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_114_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_114_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_114_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_114_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_115_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_115_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_115_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_115_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_116_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_116_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_116_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_116_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_117_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_117_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_117_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_117_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_118_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_118_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_118_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_118_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_119_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_119_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_119_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_119_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_120_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_120_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_120_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_120_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_121_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_121_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_121_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_121_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_122_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_122_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_122_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_122_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_123_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_123_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_123_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_123_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_124_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_124_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_124_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_124_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_125_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_125_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_125_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_125_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_126_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_126_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_126_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_126_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_127_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_127_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_127_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_127_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_128_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_128_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_128_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_128_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_129_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_129_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_129_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_129_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_130_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_130_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_130_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_130_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_131_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_131_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_131_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_131_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_132_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_132_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_132_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_132_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_133_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_133_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_133_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_133_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_134_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_134_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_134_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_134_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_135_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_135_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_135_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_135_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_136_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_136_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_136_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_136_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_137_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_137_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_137_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_137_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_138_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_138_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_138_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_138_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_139_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_139_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_139_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_139_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_140_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_140_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_140_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_140_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_141_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_141_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_141_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_141_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_142_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_142_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_142_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_142_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_143_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_143_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_143_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_143_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_144_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_144_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_144_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_144_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_145_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_145_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_145_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_145_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_146_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_146_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_146_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_146_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_147_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_147_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_147_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_147_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_148_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_148_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_148_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_148_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_149_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_149_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_149_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_149_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_150_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_150_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_150_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_150_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_151_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_151_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_151_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_151_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_152_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_152_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_152_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_152_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_153_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_153_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_153_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_153_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_154_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_154_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_154_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_154_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_155_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_155_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_155_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_155_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_156_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_156_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_156_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_156_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_157_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_157_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_157_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_157_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_158_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_158_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_158_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_158_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_159_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_159_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_159_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_159_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_160_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_160_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_160_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_160_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_161_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_161_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_161_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_161_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_162_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_162_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_162_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_162_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_163_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_163_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_163_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_163_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_164_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_164_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_164_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_164_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_165_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_165_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_165_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_165_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_166_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_166_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_166_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_166_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_167_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_167_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_167_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_167_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_168_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_168_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_168_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_168_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_169_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_169_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_169_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_169_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_170_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_170_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_170_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_170_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_171_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_171_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_171_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_171_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_172_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_172_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_172_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_172_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_173_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_173_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_173_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_173_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_174_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_174_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_174_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_174_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_175_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_175_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_175_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_175_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_176_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_176_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_176_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_176_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_177_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_177_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_177_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_177_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_178_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_178_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_178_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_178_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_179_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_179_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_179_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_179_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_180_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_180_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_180_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_180_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_181_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_181_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_181_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_181_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_182_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_182_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_182_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_182_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_183_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_183_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_183_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_183_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_184_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_184_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_184_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_184_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_185_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_185_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_185_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_185_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_186_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_186_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_186_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_186_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_187_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_187_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_187_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_187_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_188_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_188_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_188_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_188_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_189_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_189_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_189_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_189_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_190_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_190_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_190_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_190_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_191_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_191_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_191_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_191_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_192_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_192_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_192_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_192_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_193_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_193_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_193_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_193_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_194_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_194_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_194_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_194_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_195_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_195_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_195_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_195_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_196_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_196_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_196_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_196_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_197_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_197_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_197_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_197_io_value; // @[coverage.scala 107:33]
  wire  SaturatingCounter_198_clock; // @[coverage.scala 105:33]
  wire  SaturatingCounter_198_reset; // @[coverage.scala 105:33]
  wire  SaturatingCounter_198_io_enable; // @[coverage.scala 105:33]
  wire  SaturatingCounter_198_io_value; // @[coverage.scala 105:33]
  wire  SaturatingCounter_199_clock; // @[coverage.scala 107:33]
  wire  SaturatingCounter_199_reset; // @[coverage.scala 107:33]
  wire  SaturatingCounter_199_io_enable; // @[coverage.scala 107:33]
  wire  SaturatingCounter_199_io_value; // @[coverage.scala 107:33]
  wire [47:0] _T_4 = {io_input_bytes_18,io_input_bytes_19,io_input_bytes_20,io_input_bytes_21,io_input_bytes_22,io_input_bytes_23}; // @[Cat.scala 29:58]
  wire [95:0] _T_10 = {io_input_bytes_12,io_input_bytes_13,io_input_bytes_14,io_input_bytes_15,io_input_bytes_16,io_input_bytes_17,_T_4}; // @[Cat.scala 29:58]
  wire [47:0] _T_15 = {io_input_bytes_6,io_input_bytes_7,io_input_bytes_8,io_input_bytes_9,io_input_bytes_10,io_input_bytes_11}; // @[Cat.scala 29:58]
  wire [191:0] input_bytes = {io_input_bytes_0,io_input_bytes_1,io_input_bytes_2,io_input_bytes_3,io_input_bytes_4,io_input_bytes_5,_T_15,_T_10}; // @[Cat.scala 29:58]
  wire [6:0] _T_126 = {6'h0,SaturatingCounter_50_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_130 = {6'h0,SaturatingCounter_52_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_134 = {6'h0,SaturatingCounter_54_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_138 = {6'h0,SaturatingCounter_56_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_142 = {6'h0,SaturatingCounter_58_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_146 = {6'h0,SaturatingCounter_60_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_150 = {6'h0,SaturatingCounter_62_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_154 = {6'h0,SaturatingCounter_64_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_158 = {6'h0,SaturatingCounter_66_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_162 = {6'h0,SaturatingCounter_68_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_166 = {6'h0,SaturatingCounter_70_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_170 = {6'h0,SaturatingCounter_72_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_174 = {6'h0,SaturatingCounter_74_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_178 = {6'h0,SaturatingCounter_76_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_182 = {6'h0,SaturatingCounter_78_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_186 = {6'h0,SaturatingCounter_80_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_190 = {6'h0,SaturatingCounter_82_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_194 = {6'h0,SaturatingCounter_84_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_198 = {6'h0,SaturatingCounter_86_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_202 = {6'h0,SaturatingCounter_88_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_206 = {6'h0,SaturatingCounter_90_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_210 = {6'h0,SaturatingCounter_92_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_214 = {6'h0,SaturatingCounter_94_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_218 = {6'h0,SaturatingCounter_96_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_222 = {6'h0,SaturatingCounter_98_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_226 = {6'h0,SaturatingCounter_100_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_230 = {6'h0,SaturatingCounter_102_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_234 = {6'h0,SaturatingCounter_104_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_238 = {6'h0,SaturatingCounter_106_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_242 = {6'h0,SaturatingCounter_108_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_246 = {6'h0,SaturatingCounter_110_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_250 = {6'h0,SaturatingCounter_112_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_254 = {6'h0,SaturatingCounter_114_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_258 = {6'h0,SaturatingCounter_116_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_262 = {6'h0,SaturatingCounter_118_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_266 = {6'h0,SaturatingCounter_120_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_270 = {6'h0,SaturatingCounter_122_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_274 = {6'h0,SaturatingCounter_124_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_278 = {6'h0,SaturatingCounter_126_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_282 = {6'h0,SaturatingCounter_128_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_286 = {6'h0,SaturatingCounter_130_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_290 = {6'h0,SaturatingCounter_132_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_294 = {6'h0,SaturatingCounter_134_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_298 = {6'h0,SaturatingCounter_136_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_302 = {6'h0,SaturatingCounter_138_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_306 = {6'h0,SaturatingCounter_140_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_310 = {6'h0,SaturatingCounter_142_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_314 = {6'h0,SaturatingCounter_144_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_318 = {6'h0,SaturatingCounter_146_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_322 = {6'h0,SaturatingCounter_148_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_326 = {6'h0,SaturatingCounter_150_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_330 = {6'h0,SaturatingCounter_152_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_334 = {6'h0,SaturatingCounter_154_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_338 = {6'h0,SaturatingCounter_156_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_342 = {6'h0,SaturatingCounter_158_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_346 = {6'h0,SaturatingCounter_160_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_350 = {6'h0,SaturatingCounter_162_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_354 = {6'h0,SaturatingCounter_164_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_358 = {6'h0,SaturatingCounter_166_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_362 = {6'h0,SaturatingCounter_168_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_366 = {6'h0,SaturatingCounter_170_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_370 = {6'h0,SaturatingCounter_172_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_374 = {6'h0,SaturatingCounter_174_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_378 = {6'h0,SaturatingCounter_176_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_382 = {6'h0,SaturatingCounter_178_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_386 = {6'h0,SaturatingCounter_180_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_390 = {6'h0,SaturatingCounter_182_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_394 = {6'h0,SaturatingCounter_184_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_398 = {6'h0,SaturatingCounter_186_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_402 = {6'h0,SaturatingCounter_188_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_406 = {6'h0,SaturatingCounter_190_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_410 = {6'h0,SaturatingCounter_192_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_414 = {6'h0,SaturatingCounter_194_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_418 = {6'h0,SaturatingCounter_196_io_value}; // @[Cat.scala 29:58]
  wire [6:0] _T_422 = {6'h0,SaturatingCounter_198_io_value}; // @[Cat.scala 29:58]
  DUT dut ( // @[VerilatorHarness.scala 42:25]
    .clock(dut_clock),
    .reset(dut_reset),
    .io_meta_reset(dut_io_meta_reset),
    .io_inputs(dut_io_inputs),
    .io_coverage_0(dut_io_coverage_0),
    .io_coverage_1(dut_io_coverage_1),
    .io_coverage_2(dut_io_coverage_2),
    .io_coverage_3(dut_io_coverage_3),
    .io_coverage_4(dut_io_coverage_4),
    .io_coverage_5(dut_io_coverage_5),
    .io_coverage_6(dut_io_coverage_6),
    .io_coverage_7(dut_io_coverage_7),
    .io_coverage_8(dut_io_coverage_8),
    .io_coverage_9(dut_io_coverage_9),
    .io_coverage_10(dut_io_coverage_10),
    .io_coverage_11(dut_io_coverage_11),
    .io_coverage_12(dut_io_coverage_12),
    .io_coverage_13(dut_io_coverage_13),
    .io_coverage_14(dut_io_coverage_14),
    .io_coverage_15(dut_io_coverage_15),
    .io_coverage_16(dut_io_coverage_16),
    .io_coverage_17(dut_io_coverage_17),
    .io_coverage_18(dut_io_coverage_18),
    .io_coverage_19(dut_io_coverage_19),
    .io_coverage_20(dut_io_coverage_20),
    .io_coverage_21(dut_io_coverage_21),
    .io_coverage_22(dut_io_coverage_22),
    .io_coverage_23(dut_io_coverage_23),
    .io_coverage_24(dut_io_coverage_24),
    .io_coverage_25(dut_io_coverage_25),
    .io_coverage_26(dut_io_coverage_26),
    .io_coverage_27(dut_io_coverage_27),
    .io_coverage_28(dut_io_coverage_28),
    .io_coverage_29(dut_io_coverage_29),
    .io_coverage_30(dut_io_coverage_30),
    .io_coverage_31(dut_io_coverage_31),
    .io_coverage_32(dut_io_coverage_32),
    .io_coverage_33(dut_io_coverage_33),
    .io_coverage_34(dut_io_coverage_34),
    .io_coverage_35(dut_io_coverage_35),
    .io_coverage_36(dut_io_coverage_36),
    .io_coverage_37(dut_io_coverage_37),
    .io_coverage_38(dut_io_coverage_38),
    .io_coverage_39(dut_io_coverage_39),
    .io_coverage_40(dut_io_coverage_40),
    .io_coverage_41(dut_io_coverage_41),
    .io_coverage_42(dut_io_coverage_42),
    .io_coverage_43(dut_io_coverage_43),
    .io_coverage_44(dut_io_coverage_44),
    .io_coverage_45(dut_io_coverage_45),
    .io_coverage_46(dut_io_coverage_46),
    .io_coverage_47(dut_io_coverage_47),
    .io_coverage_48(dut_io_coverage_48),
    .io_coverage_49(dut_io_coverage_49),
    .io_coverage_50(dut_io_coverage_50),
    .io_coverage_51(dut_io_coverage_51),
    .io_coverage_52(dut_io_coverage_52),
    .io_coverage_53(dut_io_coverage_53),
    .io_coverage_54(dut_io_coverage_54),
    .io_coverage_55(dut_io_coverage_55),
    .io_coverage_56(dut_io_coverage_56),
    .io_coverage_57(dut_io_coverage_57),
    .io_coverage_58(dut_io_coverage_58),
    .io_coverage_59(dut_io_coverage_59),
    .io_coverage_60(dut_io_coverage_60),
    .io_coverage_61(dut_io_coverage_61),
    .io_coverage_62(dut_io_coverage_62),
    .io_coverage_63(dut_io_coverage_63),
    .io_coverage_64(dut_io_coverage_64),
    .io_coverage_65(dut_io_coverage_65),
    .io_coverage_66(dut_io_coverage_66),
    .io_coverage_67(dut_io_coverage_67),
    .io_coverage_68(dut_io_coverage_68),
    .io_coverage_69(dut_io_coverage_69),
    .io_coverage_70(dut_io_coverage_70),
    .io_coverage_71(dut_io_coverage_71),
    .io_coverage_72(dut_io_coverage_72),
    .io_coverage_73(dut_io_coverage_73),
    .io_coverage_74(dut_io_coverage_74),
    .io_coverage_75(dut_io_coverage_75),
    .io_coverage_76(dut_io_coverage_76),
    .io_coverage_77(dut_io_coverage_77),
    .io_coverage_78(dut_io_coverage_78),
    .io_coverage_79(dut_io_coverage_79),
    .io_coverage_80(dut_io_coverage_80),
    .io_coverage_81(dut_io_coverage_81),
    .io_coverage_82(dut_io_coverage_82),
    .io_coverage_83(dut_io_coverage_83),
    .io_coverage_84(dut_io_coverage_84),
    .io_coverage_85(dut_io_coverage_85),
    .io_coverage_86(dut_io_coverage_86),
    .io_coverage_87(dut_io_coverage_87),
    .io_coverage_88(dut_io_coverage_88),
    .io_coverage_89(dut_io_coverage_89),
    .io_coverage_90(dut_io_coverage_90),
    .io_coverage_91(dut_io_coverage_91),
    .io_coverage_92(dut_io_coverage_92),
    .io_coverage_93(dut_io_coverage_93),
    .io_coverage_94(dut_io_coverage_94),
    .io_coverage_95(dut_io_coverage_95),
    .io_coverage_96(dut_io_coverage_96),
    .io_coverage_97(dut_io_coverage_97),
    .io_coverage_98(dut_io_coverage_98),
    .io_coverage_99(dut_io_coverage_99),
    .io_coverage_100(dut_io_coverage_100),
    .io_coverage_101(dut_io_coverage_101),
    .io_coverage_102(dut_io_coverage_102),
    .io_coverage_103(dut_io_coverage_103),
    .io_coverage_104(dut_io_coverage_104),
    .io_coverage_105(dut_io_coverage_105),
    .io_coverage_106(dut_io_coverage_106),
    .io_coverage_107(dut_io_coverage_107),
    .io_coverage_108(dut_io_coverage_108),
    .io_coverage_109(dut_io_coverage_109),
    .io_coverage_110(dut_io_coverage_110),
    .io_coverage_111(dut_io_coverage_111),
    .io_coverage_112(dut_io_coverage_112),
    .io_coverage_113(dut_io_coverage_113),
    .io_coverage_114(dut_io_coverage_114),
    .io_coverage_115(dut_io_coverage_115),
    .io_coverage_116(dut_io_coverage_116),
    .io_coverage_117(dut_io_coverage_117),
    .io_coverage_118(dut_io_coverage_118),
    .io_coverage_119(dut_io_coverage_119),
    .io_coverage_120(dut_io_coverage_120),
    .io_coverage_121(dut_io_coverage_121),
    .io_coverage_122(dut_io_coverage_122),
    .io_coverage_123(dut_io_coverage_123),
    .io_coverage_124(dut_io_coverage_124)
  );
  SaturatingCounter SaturatingCounter ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_clock),
    .reset(SaturatingCounter_reset),
    .io_enable(SaturatingCounter_io_enable),
    .io_value(SaturatingCounter_io_value)
  );
  SaturatingCounter SaturatingCounter_1 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_1_clock),
    .reset(SaturatingCounter_1_reset),
    .io_enable(SaturatingCounter_1_io_enable),
    .io_value(SaturatingCounter_1_io_value)
  );
  SaturatingCounter SaturatingCounter_2 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_2_clock),
    .reset(SaturatingCounter_2_reset),
    .io_enable(SaturatingCounter_2_io_enable),
    .io_value(SaturatingCounter_2_io_value)
  );
  SaturatingCounter SaturatingCounter_3 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_3_clock),
    .reset(SaturatingCounter_3_reset),
    .io_enable(SaturatingCounter_3_io_enable),
    .io_value(SaturatingCounter_3_io_value)
  );
  SaturatingCounter SaturatingCounter_4 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_4_clock),
    .reset(SaturatingCounter_4_reset),
    .io_enable(SaturatingCounter_4_io_enable),
    .io_value(SaturatingCounter_4_io_value)
  );
  SaturatingCounter SaturatingCounter_5 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_5_clock),
    .reset(SaturatingCounter_5_reset),
    .io_enable(SaturatingCounter_5_io_enable),
    .io_value(SaturatingCounter_5_io_value)
  );
  SaturatingCounter SaturatingCounter_6 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_6_clock),
    .reset(SaturatingCounter_6_reset),
    .io_enable(SaturatingCounter_6_io_enable),
    .io_value(SaturatingCounter_6_io_value)
  );
  SaturatingCounter SaturatingCounter_7 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_7_clock),
    .reset(SaturatingCounter_7_reset),
    .io_enable(SaturatingCounter_7_io_enable),
    .io_value(SaturatingCounter_7_io_value)
  );
  SaturatingCounter SaturatingCounter_8 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_8_clock),
    .reset(SaturatingCounter_8_reset),
    .io_enable(SaturatingCounter_8_io_enable),
    .io_value(SaturatingCounter_8_io_value)
  );
  SaturatingCounter SaturatingCounter_9 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_9_clock),
    .reset(SaturatingCounter_9_reset),
    .io_enable(SaturatingCounter_9_io_enable),
    .io_value(SaturatingCounter_9_io_value)
  );
  SaturatingCounter SaturatingCounter_10 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_10_clock),
    .reset(SaturatingCounter_10_reset),
    .io_enable(SaturatingCounter_10_io_enable),
    .io_value(SaturatingCounter_10_io_value)
  );
  SaturatingCounter SaturatingCounter_11 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_11_clock),
    .reset(SaturatingCounter_11_reset),
    .io_enable(SaturatingCounter_11_io_enable),
    .io_value(SaturatingCounter_11_io_value)
  );
  SaturatingCounter SaturatingCounter_12 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_12_clock),
    .reset(SaturatingCounter_12_reset),
    .io_enable(SaturatingCounter_12_io_enable),
    .io_value(SaturatingCounter_12_io_value)
  );
  SaturatingCounter SaturatingCounter_13 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_13_clock),
    .reset(SaturatingCounter_13_reset),
    .io_enable(SaturatingCounter_13_io_enable),
    .io_value(SaturatingCounter_13_io_value)
  );
  SaturatingCounter SaturatingCounter_14 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_14_clock),
    .reset(SaturatingCounter_14_reset),
    .io_enable(SaturatingCounter_14_io_enable),
    .io_value(SaturatingCounter_14_io_value)
  );
  SaturatingCounter SaturatingCounter_15 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_15_clock),
    .reset(SaturatingCounter_15_reset),
    .io_enable(SaturatingCounter_15_io_enable),
    .io_value(SaturatingCounter_15_io_value)
  );
  SaturatingCounter SaturatingCounter_16 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_16_clock),
    .reset(SaturatingCounter_16_reset),
    .io_enable(SaturatingCounter_16_io_enable),
    .io_value(SaturatingCounter_16_io_value)
  );
  SaturatingCounter SaturatingCounter_17 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_17_clock),
    .reset(SaturatingCounter_17_reset),
    .io_enable(SaturatingCounter_17_io_enable),
    .io_value(SaturatingCounter_17_io_value)
  );
  SaturatingCounter SaturatingCounter_18 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_18_clock),
    .reset(SaturatingCounter_18_reset),
    .io_enable(SaturatingCounter_18_io_enable),
    .io_value(SaturatingCounter_18_io_value)
  );
  SaturatingCounter SaturatingCounter_19 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_19_clock),
    .reset(SaturatingCounter_19_reset),
    .io_enable(SaturatingCounter_19_io_enable),
    .io_value(SaturatingCounter_19_io_value)
  );
  SaturatingCounter SaturatingCounter_20 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_20_clock),
    .reset(SaturatingCounter_20_reset),
    .io_enable(SaturatingCounter_20_io_enable),
    .io_value(SaturatingCounter_20_io_value)
  );
  SaturatingCounter SaturatingCounter_21 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_21_clock),
    .reset(SaturatingCounter_21_reset),
    .io_enable(SaturatingCounter_21_io_enable),
    .io_value(SaturatingCounter_21_io_value)
  );
  SaturatingCounter SaturatingCounter_22 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_22_clock),
    .reset(SaturatingCounter_22_reset),
    .io_enable(SaturatingCounter_22_io_enable),
    .io_value(SaturatingCounter_22_io_value)
  );
  SaturatingCounter SaturatingCounter_23 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_23_clock),
    .reset(SaturatingCounter_23_reset),
    .io_enable(SaturatingCounter_23_io_enable),
    .io_value(SaturatingCounter_23_io_value)
  );
  SaturatingCounter SaturatingCounter_24 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_24_clock),
    .reset(SaturatingCounter_24_reset),
    .io_enable(SaturatingCounter_24_io_enable),
    .io_value(SaturatingCounter_24_io_value)
  );
  SaturatingCounter SaturatingCounter_25 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_25_clock),
    .reset(SaturatingCounter_25_reset),
    .io_enable(SaturatingCounter_25_io_enable),
    .io_value(SaturatingCounter_25_io_value)
  );
  SaturatingCounter SaturatingCounter_26 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_26_clock),
    .reset(SaturatingCounter_26_reset),
    .io_enable(SaturatingCounter_26_io_enable),
    .io_value(SaturatingCounter_26_io_value)
  );
  SaturatingCounter SaturatingCounter_27 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_27_clock),
    .reset(SaturatingCounter_27_reset),
    .io_enable(SaturatingCounter_27_io_enable),
    .io_value(SaturatingCounter_27_io_value)
  );
  SaturatingCounter SaturatingCounter_28 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_28_clock),
    .reset(SaturatingCounter_28_reset),
    .io_enable(SaturatingCounter_28_io_enable),
    .io_value(SaturatingCounter_28_io_value)
  );
  SaturatingCounter SaturatingCounter_29 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_29_clock),
    .reset(SaturatingCounter_29_reset),
    .io_enable(SaturatingCounter_29_io_enable),
    .io_value(SaturatingCounter_29_io_value)
  );
  SaturatingCounter SaturatingCounter_30 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_30_clock),
    .reset(SaturatingCounter_30_reset),
    .io_enable(SaturatingCounter_30_io_enable),
    .io_value(SaturatingCounter_30_io_value)
  );
  SaturatingCounter SaturatingCounter_31 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_31_clock),
    .reset(SaturatingCounter_31_reset),
    .io_enable(SaturatingCounter_31_io_enable),
    .io_value(SaturatingCounter_31_io_value)
  );
  SaturatingCounter SaturatingCounter_32 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_32_clock),
    .reset(SaturatingCounter_32_reset),
    .io_enable(SaturatingCounter_32_io_enable),
    .io_value(SaturatingCounter_32_io_value)
  );
  SaturatingCounter SaturatingCounter_33 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_33_clock),
    .reset(SaturatingCounter_33_reset),
    .io_enable(SaturatingCounter_33_io_enable),
    .io_value(SaturatingCounter_33_io_value)
  );
  SaturatingCounter SaturatingCounter_34 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_34_clock),
    .reset(SaturatingCounter_34_reset),
    .io_enable(SaturatingCounter_34_io_enable),
    .io_value(SaturatingCounter_34_io_value)
  );
  SaturatingCounter SaturatingCounter_35 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_35_clock),
    .reset(SaturatingCounter_35_reset),
    .io_enable(SaturatingCounter_35_io_enable),
    .io_value(SaturatingCounter_35_io_value)
  );
  SaturatingCounter SaturatingCounter_36 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_36_clock),
    .reset(SaturatingCounter_36_reset),
    .io_enable(SaturatingCounter_36_io_enable),
    .io_value(SaturatingCounter_36_io_value)
  );
  SaturatingCounter SaturatingCounter_37 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_37_clock),
    .reset(SaturatingCounter_37_reset),
    .io_enable(SaturatingCounter_37_io_enable),
    .io_value(SaturatingCounter_37_io_value)
  );
  SaturatingCounter SaturatingCounter_38 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_38_clock),
    .reset(SaturatingCounter_38_reset),
    .io_enable(SaturatingCounter_38_io_enable),
    .io_value(SaturatingCounter_38_io_value)
  );
  SaturatingCounter SaturatingCounter_39 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_39_clock),
    .reset(SaturatingCounter_39_reset),
    .io_enable(SaturatingCounter_39_io_enable),
    .io_value(SaturatingCounter_39_io_value)
  );
  SaturatingCounter SaturatingCounter_40 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_40_clock),
    .reset(SaturatingCounter_40_reset),
    .io_enable(SaturatingCounter_40_io_enable),
    .io_value(SaturatingCounter_40_io_value)
  );
  SaturatingCounter SaturatingCounter_41 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_41_clock),
    .reset(SaturatingCounter_41_reset),
    .io_enable(SaturatingCounter_41_io_enable),
    .io_value(SaturatingCounter_41_io_value)
  );
  SaturatingCounter SaturatingCounter_42 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_42_clock),
    .reset(SaturatingCounter_42_reset),
    .io_enable(SaturatingCounter_42_io_enable),
    .io_value(SaturatingCounter_42_io_value)
  );
  SaturatingCounter SaturatingCounter_43 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_43_clock),
    .reset(SaturatingCounter_43_reset),
    .io_enable(SaturatingCounter_43_io_enable),
    .io_value(SaturatingCounter_43_io_value)
  );
  SaturatingCounter SaturatingCounter_44 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_44_clock),
    .reset(SaturatingCounter_44_reset),
    .io_enable(SaturatingCounter_44_io_enable),
    .io_value(SaturatingCounter_44_io_value)
  );
  SaturatingCounter SaturatingCounter_45 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_45_clock),
    .reset(SaturatingCounter_45_reset),
    .io_enable(SaturatingCounter_45_io_enable),
    .io_value(SaturatingCounter_45_io_value)
  );
  SaturatingCounter SaturatingCounter_46 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_46_clock),
    .reset(SaturatingCounter_46_reset),
    .io_enable(SaturatingCounter_46_io_enable),
    .io_value(SaturatingCounter_46_io_value)
  );
  SaturatingCounter SaturatingCounter_47 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_47_clock),
    .reset(SaturatingCounter_47_reset),
    .io_enable(SaturatingCounter_47_io_enable),
    .io_value(SaturatingCounter_47_io_value)
  );
  SaturatingCounter SaturatingCounter_48 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_48_clock),
    .reset(SaturatingCounter_48_reset),
    .io_enable(SaturatingCounter_48_io_enable),
    .io_value(SaturatingCounter_48_io_value)
  );
  SaturatingCounter SaturatingCounter_49 ( // @[coverage.scala 121:35]
    .clock(SaturatingCounter_49_clock),
    .reset(SaturatingCounter_49_reset),
    .io_enable(SaturatingCounter_49_io_enable),
    .io_value(SaturatingCounter_49_io_value)
  );
  SaturatingCounter SaturatingCounter_50 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_50_clock),
    .reset(SaturatingCounter_50_reset),
    .io_enable(SaturatingCounter_50_io_enable),
    .io_value(SaturatingCounter_50_io_value)
  );
  SaturatingCounter SaturatingCounter_51 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_51_clock),
    .reset(SaturatingCounter_51_reset),
    .io_enable(SaturatingCounter_51_io_enable),
    .io_value(SaturatingCounter_51_io_value)
  );
  SaturatingCounter SaturatingCounter_52 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_52_clock),
    .reset(SaturatingCounter_52_reset),
    .io_enable(SaturatingCounter_52_io_enable),
    .io_value(SaturatingCounter_52_io_value)
  );
  SaturatingCounter SaturatingCounter_53 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_53_clock),
    .reset(SaturatingCounter_53_reset),
    .io_enable(SaturatingCounter_53_io_enable),
    .io_value(SaturatingCounter_53_io_value)
  );
  SaturatingCounter SaturatingCounter_54 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_54_clock),
    .reset(SaturatingCounter_54_reset),
    .io_enable(SaturatingCounter_54_io_enable),
    .io_value(SaturatingCounter_54_io_value)
  );
  SaturatingCounter SaturatingCounter_55 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_55_clock),
    .reset(SaturatingCounter_55_reset),
    .io_enable(SaturatingCounter_55_io_enable),
    .io_value(SaturatingCounter_55_io_value)
  );
  SaturatingCounter SaturatingCounter_56 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_56_clock),
    .reset(SaturatingCounter_56_reset),
    .io_enable(SaturatingCounter_56_io_enable),
    .io_value(SaturatingCounter_56_io_value)
  );
  SaturatingCounter SaturatingCounter_57 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_57_clock),
    .reset(SaturatingCounter_57_reset),
    .io_enable(SaturatingCounter_57_io_enable),
    .io_value(SaturatingCounter_57_io_value)
  );
  SaturatingCounter SaturatingCounter_58 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_58_clock),
    .reset(SaturatingCounter_58_reset),
    .io_enable(SaturatingCounter_58_io_enable),
    .io_value(SaturatingCounter_58_io_value)
  );
  SaturatingCounter SaturatingCounter_59 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_59_clock),
    .reset(SaturatingCounter_59_reset),
    .io_enable(SaturatingCounter_59_io_enable),
    .io_value(SaturatingCounter_59_io_value)
  );
  SaturatingCounter SaturatingCounter_60 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_60_clock),
    .reset(SaturatingCounter_60_reset),
    .io_enable(SaturatingCounter_60_io_enable),
    .io_value(SaturatingCounter_60_io_value)
  );
  SaturatingCounter SaturatingCounter_61 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_61_clock),
    .reset(SaturatingCounter_61_reset),
    .io_enable(SaturatingCounter_61_io_enable),
    .io_value(SaturatingCounter_61_io_value)
  );
  SaturatingCounter SaturatingCounter_62 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_62_clock),
    .reset(SaturatingCounter_62_reset),
    .io_enable(SaturatingCounter_62_io_enable),
    .io_value(SaturatingCounter_62_io_value)
  );
  SaturatingCounter SaturatingCounter_63 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_63_clock),
    .reset(SaturatingCounter_63_reset),
    .io_enable(SaturatingCounter_63_io_enable),
    .io_value(SaturatingCounter_63_io_value)
  );
  SaturatingCounter SaturatingCounter_64 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_64_clock),
    .reset(SaturatingCounter_64_reset),
    .io_enable(SaturatingCounter_64_io_enable),
    .io_value(SaturatingCounter_64_io_value)
  );
  SaturatingCounter SaturatingCounter_65 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_65_clock),
    .reset(SaturatingCounter_65_reset),
    .io_enable(SaturatingCounter_65_io_enable),
    .io_value(SaturatingCounter_65_io_value)
  );
  SaturatingCounter SaturatingCounter_66 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_66_clock),
    .reset(SaturatingCounter_66_reset),
    .io_enable(SaturatingCounter_66_io_enable),
    .io_value(SaturatingCounter_66_io_value)
  );
  SaturatingCounter SaturatingCounter_67 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_67_clock),
    .reset(SaturatingCounter_67_reset),
    .io_enable(SaturatingCounter_67_io_enable),
    .io_value(SaturatingCounter_67_io_value)
  );
  SaturatingCounter SaturatingCounter_68 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_68_clock),
    .reset(SaturatingCounter_68_reset),
    .io_enable(SaturatingCounter_68_io_enable),
    .io_value(SaturatingCounter_68_io_value)
  );
  SaturatingCounter SaturatingCounter_69 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_69_clock),
    .reset(SaturatingCounter_69_reset),
    .io_enable(SaturatingCounter_69_io_enable),
    .io_value(SaturatingCounter_69_io_value)
  );
  SaturatingCounter SaturatingCounter_70 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_70_clock),
    .reset(SaturatingCounter_70_reset),
    .io_enable(SaturatingCounter_70_io_enable),
    .io_value(SaturatingCounter_70_io_value)
  );
  SaturatingCounter SaturatingCounter_71 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_71_clock),
    .reset(SaturatingCounter_71_reset),
    .io_enable(SaturatingCounter_71_io_enable),
    .io_value(SaturatingCounter_71_io_value)
  );
  SaturatingCounter SaturatingCounter_72 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_72_clock),
    .reset(SaturatingCounter_72_reset),
    .io_enable(SaturatingCounter_72_io_enable),
    .io_value(SaturatingCounter_72_io_value)
  );
  SaturatingCounter SaturatingCounter_73 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_73_clock),
    .reset(SaturatingCounter_73_reset),
    .io_enable(SaturatingCounter_73_io_enable),
    .io_value(SaturatingCounter_73_io_value)
  );
  SaturatingCounter SaturatingCounter_74 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_74_clock),
    .reset(SaturatingCounter_74_reset),
    .io_enable(SaturatingCounter_74_io_enable),
    .io_value(SaturatingCounter_74_io_value)
  );
  SaturatingCounter SaturatingCounter_75 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_75_clock),
    .reset(SaturatingCounter_75_reset),
    .io_enable(SaturatingCounter_75_io_enable),
    .io_value(SaturatingCounter_75_io_value)
  );
  SaturatingCounter SaturatingCounter_76 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_76_clock),
    .reset(SaturatingCounter_76_reset),
    .io_enable(SaturatingCounter_76_io_enable),
    .io_value(SaturatingCounter_76_io_value)
  );
  SaturatingCounter SaturatingCounter_77 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_77_clock),
    .reset(SaturatingCounter_77_reset),
    .io_enable(SaturatingCounter_77_io_enable),
    .io_value(SaturatingCounter_77_io_value)
  );
  SaturatingCounter SaturatingCounter_78 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_78_clock),
    .reset(SaturatingCounter_78_reset),
    .io_enable(SaturatingCounter_78_io_enable),
    .io_value(SaturatingCounter_78_io_value)
  );
  SaturatingCounter SaturatingCounter_79 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_79_clock),
    .reset(SaturatingCounter_79_reset),
    .io_enable(SaturatingCounter_79_io_enable),
    .io_value(SaturatingCounter_79_io_value)
  );
  SaturatingCounter SaturatingCounter_80 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_80_clock),
    .reset(SaturatingCounter_80_reset),
    .io_enable(SaturatingCounter_80_io_enable),
    .io_value(SaturatingCounter_80_io_value)
  );
  SaturatingCounter SaturatingCounter_81 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_81_clock),
    .reset(SaturatingCounter_81_reset),
    .io_enable(SaturatingCounter_81_io_enable),
    .io_value(SaturatingCounter_81_io_value)
  );
  SaturatingCounter SaturatingCounter_82 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_82_clock),
    .reset(SaturatingCounter_82_reset),
    .io_enable(SaturatingCounter_82_io_enable),
    .io_value(SaturatingCounter_82_io_value)
  );
  SaturatingCounter SaturatingCounter_83 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_83_clock),
    .reset(SaturatingCounter_83_reset),
    .io_enable(SaturatingCounter_83_io_enable),
    .io_value(SaturatingCounter_83_io_value)
  );
  SaturatingCounter SaturatingCounter_84 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_84_clock),
    .reset(SaturatingCounter_84_reset),
    .io_enable(SaturatingCounter_84_io_enable),
    .io_value(SaturatingCounter_84_io_value)
  );
  SaturatingCounter SaturatingCounter_85 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_85_clock),
    .reset(SaturatingCounter_85_reset),
    .io_enable(SaturatingCounter_85_io_enable),
    .io_value(SaturatingCounter_85_io_value)
  );
  SaturatingCounter SaturatingCounter_86 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_86_clock),
    .reset(SaturatingCounter_86_reset),
    .io_enable(SaturatingCounter_86_io_enable),
    .io_value(SaturatingCounter_86_io_value)
  );
  SaturatingCounter SaturatingCounter_87 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_87_clock),
    .reset(SaturatingCounter_87_reset),
    .io_enable(SaturatingCounter_87_io_enable),
    .io_value(SaturatingCounter_87_io_value)
  );
  SaturatingCounter SaturatingCounter_88 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_88_clock),
    .reset(SaturatingCounter_88_reset),
    .io_enable(SaturatingCounter_88_io_enable),
    .io_value(SaturatingCounter_88_io_value)
  );
  SaturatingCounter SaturatingCounter_89 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_89_clock),
    .reset(SaturatingCounter_89_reset),
    .io_enable(SaturatingCounter_89_io_enable),
    .io_value(SaturatingCounter_89_io_value)
  );
  SaturatingCounter SaturatingCounter_90 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_90_clock),
    .reset(SaturatingCounter_90_reset),
    .io_enable(SaturatingCounter_90_io_enable),
    .io_value(SaturatingCounter_90_io_value)
  );
  SaturatingCounter SaturatingCounter_91 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_91_clock),
    .reset(SaturatingCounter_91_reset),
    .io_enable(SaturatingCounter_91_io_enable),
    .io_value(SaturatingCounter_91_io_value)
  );
  SaturatingCounter SaturatingCounter_92 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_92_clock),
    .reset(SaturatingCounter_92_reset),
    .io_enable(SaturatingCounter_92_io_enable),
    .io_value(SaturatingCounter_92_io_value)
  );
  SaturatingCounter SaturatingCounter_93 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_93_clock),
    .reset(SaturatingCounter_93_reset),
    .io_enable(SaturatingCounter_93_io_enable),
    .io_value(SaturatingCounter_93_io_value)
  );
  SaturatingCounter SaturatingCounter_94 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_94_clock),
    .reset(SaturatingCounter_94_reset),
    .io_enable(SaturatingCounter_94_io_enable),
    .io_value(SaturatingCounter_94_io_value)
  );
  SaturatingCounter SaturatingCounter_95 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_95_clock),
    .reset(SaturatingCounter_95_reset),
    .io_enable(SaturatingCounter_95_io_enable),
    .io_value(SaturatingCounter_95_io_value)
  );
  SaturatingCounter SaturatingCounter_96 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_96_clock),
    .reset(SaturatingCounter_96_reset),
    .io_enable(SaturatingCounter_96_io_enable),
    .io_value(SaturatingCounter_96_io_value)
  );
  SaturatingCounter SaturatingCounter_97 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_97_clock),
    .reset(SaturatingCounter_97_reset),
    .io_enable(SaturatingCounter_97_io_enable),
    .io_value(SaturatingCounter_97_io_value)
  );
  SaturatingCounter SaturatingCounter_98 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_98_clock),
    .reset(SaturatingCounter_98_reset),
    .io_enable(SaturatingCounter_98_io_enable),
    .io_value(SaturatingCounter_98_io_value)
  );
  SaturatingCounter SaturatingCounter_99 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_99_clock),
    .reset(SaturatingCounter_99_reset),
    .io_enable(SaturatingCounter_99_io_enable),
    .io_value(SaturatingCounter_99_io_value)
  );
  SaturatingCounter SaturatingCounter_100 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_100_clock),
    .reset(SaturatingCounter_100_reset),
    .io_enable(SaturatingCounter_100_io_enable),
    .io_value(SaturatingCounter_100_io_value)
  );
  SaturatingCounter SaturatingCounter_101 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_101_clock),
    .reset(SaturatingCounter_101_reset),
    .io_enable(SaturatingCounter_101_io_enable),
    .io_value(SaturatingCounter_101_io_value)
  );
  SaturatingCounter SaturatingCounter_102 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_102_clock),
    .reset(SaturatingCounter_102_reset),
    .io_enable(SaturatingCounter_102_io_enable),
    .io_value(SaturatingCounter_102_io_value)
  );
  SaturatingCounter SaturatingCounter_103 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_103_clock),
    .reset(SaturatingCounter_103_reset),
    .io_enable(SaturatingCounter_103_io_enable),
    .io_value(SaturatingCounter_103_io_value)
  );
  SaturatingCounter SaturatingCounter_104 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_104_clock),
    .reset(SaturatingCounter_104_reset),
    .io_enable(SaturatingCounter_104_io_enable),
    .io_value(SaturatingCounter_104_io_value)
  );
  SaturatingCounter SaturatingCounter_105 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_105_clock),
    .reset(SaturatingCounter_105_reset),
    .io_enable(SaturatingCounter_105_io_enable),
    .io_value(SaturatingCounter_105_io_value)
  );
  SaturatingCounter SaturatingCounter_106 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_106_clock),
    .reset(SaturatingCounter_106_reset),
    .io_enable(SaturatingCounter_106_io_enable),
    .io_value(SaturatingCounter_106_io_value)
  );
  SaturatingCounter SaturatingCounter_107 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_107_clock),
    .reset(SaturatingCounter_107_reset),
    .io_enable(SaturatingCounter_107_io_enable),
    .io_value(SaturatingCounter_107_io_value)
  );
  SaturatingCounter SaturatingCounter_108 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_108_clock),
    .reset(SaturatingCounter_108_reset),
    .io_enable(SaturatingCounter_108_io_enable),
    .io_value(SaturatingCounter_108_io_value)
  );
  SaturatingCounter SaturatingCounter_109 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_109_clock),
    .reset(SaturatingCounter_109_reset),
    .io_enable(SaturatingCounter_109_io_enable),
    .io_value(SaturatingCounter_109_io_value)
  );
  SaturatingCounter SaturatingCounter_110 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_110_clock),
    .reset(SaturatingCounter_110_reset),
    .io_enable(SaturatingCounter_110_io_enable),
    .io_value(SaturatingCounter_110_io_value)
  );
  SaturatingCounter SaturatingCounter_111 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_111_clock),
    .reset(SaturatingCounter_111_reset),
    .io_enable(SaturatingCounter_111_io_enable),
    .io_value(SaturatingCounter_111_io_value)
  );
  SaturatingCounter SaturatingCounter_112 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_112_clock),
    .reset(SaturatingCounter_112_reset),
    .io_enable(SaturatingCounter_112_io_enable),
    .io_value(SaturatingCounter_112_io_value)
  );
  SaturatingCounter SaturatingCounter_113 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_113_clock),
    .reset(SaturatingCounter_113_reset),
    .io_enable(SaturatingCounter_113_io_enable),
    .io_value(SaturatingCounter_113_io_value)
  );
  SaturatingCounter SaturatingCounter_114 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_114_clock),
    .reset(SaturatingCounter_114_reset),
    .io_enable(SaturatingCounter_114_io_enable),
    .io_value(SaturatingCounter_114_io_value)
  );
  SaturatingCounter SaturatingCounter_115 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_115_clock),
    .reset(SaturatingCounter_115_reset),
    .io_enable(SaturatingCounter_115_io_enable),
    .io_value(SaturatingCounter_115_io_value)
  );
  SaturatingCounter SaturatingCounter_116 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_116_clock),
    .reset(SaturatingCounter_116_reset),
    .io_enable(SaturatingCounter_116_io_enable),
    .io_value(SaturatingCounter_116_io_value)
  );
  SaturatingCounter SaturatingCounter_117 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_117_clock),
    .reset(SaturatingCounter_117_reset),
    .io_enable(SaturatingCounter_117_io_enable),
    .io_value(SaturatingCounter_117_io_value)
  );
  SaturatingCounter SaturatingCounter_118 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_118_clock),
    .reset(SaturatingCounter_118_reset),
    .io_enable(SaturatingCounter_118_io_enable),
    .io_value(SaturatingCounter_118_io_value)
  );
  SaturatingCounter SaturatingCounter_119 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_119_clock),
    .reset(SaturatingCounter_119_reset),
    .io_enable(SaturatingCounter_119_io_enable),
    .io_value(SaturatingCounter_119_io_value)
  );
  SaturatingCounter SaturatingCounter_120 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_120_clock),
    .reset(SaturatingCounter_120_reset),
    .io_enable(SaturatingCounter_120_io_enable),
    .io_value(SaturatingCounter_120_io_value)
  );
  SaturatingCounter SaturatingCounter_121 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_121_clock),
    .reset(SaturatingCounter_121_reset),
    .io_enable(SaturatingCounter_121_io_enable),
    .io_value(SaturatingCounter_121_io_value)
  );
  SaturatingCounter SaturatingCounter_122 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_122_clock),
    .reset(SaturatingCounter_122_reset),
    .io_enable(SaturatingCounter_122_io_enable),
    .io_value(SaturatingCounter_122_io_value)
  );
  SaturatingCounter SaturatingCounter_123 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_123_clock),
    .reset(SaturatingCounter_123_reset),
    .io_enable(SaturatingCounter_123_io_enable),
    .io_value(SaturatingCounter_123_io_value)
  );
  SaturatingCounter SaturatingCounter_124 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_124_clock),
    .reset(SaturatingCounter_124_reset),
    .io_enable(SaturatingCounter_124_io_enable),
    .io_value(SaturatingCounter_124_io_value)
  );
  SaturatingCounter SaturatingCounter_125 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_125_clock),
    .reset(SaturatingCounter_125_reset),
    .io_enable(SaturatingCounter_125_io_enable),
    .io_value(SaturatingCounter_125_io_value)
  );
  SaturatingCounter SaturatingCounter_126 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_126_clock),
    .reset(SaturatingCounter_126_reset),
    .io_enable(SaturatingCounter_126_io_enable),
    .io_value(SaturatingCounter_126_io_value)
  );
  SaturatingCounter SaturatingCounter_127 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_127_clock),
    .reset(SaturatingCounter_127_reset),
    .io_enable(SaturatingCounter_127_io_enable),
    .io_value(SaturatingCounter_127_io_value)
  );
  SaturatingCounter SaturatingCounter_128 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_128_clock),
    .reset(SaturatingCounter_128_reset),
    .io_enable(SaturatingCounter_128_io_enable),
    .io_value(SaturatingCounter_128_io_value)
  );
  SaturatingCounter SaturatingCounter_129 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_129_clock),
    .reset(SaturatingCounter_129_reset),
    .io_enable(SaturatingCounter_129_io_enable),
    .io_value(SaturatingCounter_129_io_value)
  );
  SaturatingCounter SaturatingCounter_130 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_130_clock),
    .reset(SaturatingCounter_130_reset),
    .io_enable(SaturatingCounter_130_io_enable),
    .io_value(SaturatingCounter_130_io_value)
  );
  SaturatingCounter SaturatingCounter_131 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_131_clock),
    .reset(SaturatingCounter_131_reset),
    .io_enable(SaturatingCounter_131_io_enable),
    .io_value(SaturatingCounter_131_io_value)
  );
  SaturatingCounter SaturatingCounter_132 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_132_clock),
    .reset(SaturatingCounter_132_reset),
    .io_enable(SaturatingCounter_132_io_enable),
    .io_value(SaturatingCounter_132_io_value)
  );
  SaturatingCounter SaturatingCounter_133 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_133_clock),
    .reset(SaturatingCounter_133_reset),
    .io_enable(SaturatingCounter_133_io_enable),
    .io_value(SaturatingCounter_133_io_value)
  );
  SaturatingCounter SaturatingCounter_134 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_134_clock),
    .reset(SaturatingCounter_134_reset),
    .io_enable(SaturatingCounter_134_io_enable),
    .io_value(SaturatingCounter_134_io_value)
  );
  SaturatingCounter SaturatingCounter_135 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_135_clock),
    .reset(SaturatingCounter_135_reset),
    .io_enable(SaturatingCounter_135_io_enable),
    .io_value(SaturatingCounter_135_io_value)
  );
  SaturatingCounter SaturatingCounter_136 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_136_clock),
    .reset(SaturatingCounter_136_reset),
    .io_enable(SaturatingCounter_136_io_enable),
    .io_value(SaturatingCounter_136_io_value)
  );
  SaturatingCounter SaturatingCounter_137 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_137_clock),
    .reset(SaturatingCounter_137_reset),
    .io_enable(SaturatingCounter_137_io_enable),
    .io_value(SaturatingCounter_137_io_value)
  );
  SaturatingCounter SaturatingCounter_138 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_138_clock),
    .reset(SaturatingCounter_138_reset),
    .io_enable(SaturatingCounter_138_io_enable),
    .io_value(SaturatingCounter_138_io_value)
  );
  SaturatingCounter SaturatingCounter_139 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_139_clock),
    .reset(SaturatingCounter_139_reset),
    .io_enable(SaturatingCounter_139_io_enable),
    .io_value(SaturatingCounter_139_io_value)
  );
  SaturatingCounter SaturatingCounter_140 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_140_clock),
    .reset(SaturatingCounter_140_reset),
    .io_enable(SaturatingCounter_140_io_enable),
    .io_value(SaturatingCounter_140_io_value)
  );
  SaturatingCounter SaturatingCounter_141 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_141_clock),
    .reset(SaturatingCounter_141_reset),
    .io_enable(SaturatingCounter_141_io_enable),
    .io_value(SaturatingCounter_141_io_value)
  );
  SaturatingCounter SaturatingCounter_142 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_142_clock),
    .reset(SaturatingCounter_142_reset),
    .io_enable(SaturatingCounter_142_io_enable),
    .io_value(SaturatingCounter_142_io_value)
  );
  SaturatingCounter SaturatingCounter_143 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_143_clock),
    .reset(SaturatingCounter_143_reset),
    .io_enable(SaturatingCounter_143_io_enable),
    .io_value(SaturatingCounter_143_io_value)
  );
  SaturatingCounter SaturatingCounter_144 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_144_clock),
    .reset(SaturatingCounter_144_reset),
    .io_enable(SaturatingCounter_144_io_enable),
    .io_value(SaturatingCounter_144_io_value)
  );
  SaturatingCounter SaturatingCounter_145 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_145_clock),
    .reset(SaturatingCounter_145_reset),
    .io_enable(SaturatingCounter_145_io_enable),
    .io_value(SaturatingCounter_145_io_value)
  );
  SaturatingCounter SaturatingCounter_146 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_146_clock),
    .reset(SaturatingCounter_146_reset),
    .io_enable(SaturatingCounter_146_io_enable),
    .io_value(SaturatingCounter_146_io_value)
  );
  SaturatingCounter SaturatingCounter_147 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_147_clock),
    .reset(SaturatingCounter_147_reset),
    .io_enable(SaturatingCounter_147_io_enable),
    .io_value(SaturatingCounter_147_io_value)
  );
  SaturatingCounter SaturatingCounter_148 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_148_clock),
    .reset(SaturatingCounter_148_reset),
    .io_enable(SaturatingCounter_148_io_enable),
    .io_value(SaturatingCounter_148_io_value)
  );
  SaturatingCounter SaturatingCounter_149 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_149_clock),
    .reset(SaturatingCounter_149_reset),
    .io_enable(SaturatingCounter_149_io_enable),
    .io_value(SaturatingCounter_149_io_value)
  );
  SaturatingCounter SaturatingCounter_150 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_150_clock),
    .reset(SaturatingCounter_150_reset),
    .io_enable(SaturatingCounter_150_io_enable),
    .io_value(SaturatingCounter_150_io_value)
  );
  SaturatingCounter SaturatingCounter_151 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_151_clock),
    .reset(SaturatingCounter_151_reset),
    .io_enable(SaturatingCounter_151_io_enable),
    .io_value(SaturatingCounter_151_io_value)
  );
  SaturatingCounter SaturatingCounter_152 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_152_clock),
    .reset(SaturatingCounter_152_reset),
    .io_enable(SaturatingCounter_152_io_enable),
    .io_value(SaturatingCounter_152_io_value)
  );
  SaturatingCounter SaturatingCounter_153 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_153_clock),
    .reset(SaturatingCounter_153_reset),
    .io_enable(SaturatingCounter_153_io_enable),
    .io_value(SaturatingCounter_153_io_value)
  );
  SaturatingCounter SaturatingCounter_154 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_154_clock),
    .reset(SaturatingCounter_154_reset),
    .io_enable(SaturatingCounter_154_io_enable),
    .io_value(SaturatingCounter_154_io_value)
  );
  SaturatingCounter SaturatingCounter_155 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_155_clock),
    .reset(SaturatingCounter_155_reset),
    .io_enable(SaturatingCounter_155_io_enable),
    .io_value(SaturatingCounter_155_io_value)
  );
  SaturatingCounter SaturatingCounter_156 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_156_clock),
    .reset(SaturatingCounter_156_reset),
    .io_enable(SaturatingCounter_156_io_enable),
    .io_value(SaturatingCounter_156_io_value)
  );
  SaturatingCounter SaturatingCounter_157 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_157_clock),
    .reset(SaturatingCounter_157_reset),
    .io_enable(SaturatingCounter_157_io_enable),
    .io_value(SaturatingCounter_157_io_value)
  );
  SaturatingCounter SaturatingCounter_158 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_158_clock),
    .reset(SaturatingCounter_158_reset),
    .io_enable(SaturatingCounter_158_io_enable),
    .io_value(SaturatingCounter_158_io_value)
  );
  SaturatingCounter SaturatingCounter_159 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_159_clock),
    .reset(SaturatingCounter_159_reset),
    .io_enable(SaturatingCounter_159_io_enable),
    .io_value(SaturatingCounter_159_io_value)
  );
  SaturatingCounter SaturatingCounter_160 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_160_clock),
    .reset(SaturatingCounter_160_reset),
    .io_enable(SaturatingCounter_160_io_enable),
    .io_value(SaturatingCounter_160_io_value)
  );
  SaturatingCounter SaturatingCounter_161 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_161_clock),
    .reset(SaturatingCounter_161_reset),
    .io_enable(SaturatingCounter_161_io_enable),
    .io_value(SaturatingCounter_161_io_value)
  );
  SaturatingCounter SaturatingCounter_162 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_162_clock),
    .reset(SaturatingCounter_162_reset),
    .io_enable(SaturatingCounter_162_io_enable),
    .io_value(SaturatingCounter_162_io_value)
  );
  SaturatingCounter SaturatingCounter_163 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_163_clock),
    .reset(SaturatingCounter_163_reset),
    .io_enable(SaturatingCounter_163_io_enable),
    .io_value(SaturatingCounter_163_io_value)
  );
  SaturatingCounter SaturatingCounter_164 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_164_clock),
    .reset(SaturatingCounter_164_reset),
    .io_enable(SaturatingCounter_164_io_enable),
    .io_value(SaturatingCounter_164_io_value)
  );
  SaturatingCounter SaturatingCounter_165 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_165_clock),
    .reset(SaturatingCounter_165_reset),
    .io_enable(SaturatingCounter_165_io_enable),
    .io_value(SaturatingCounter_165_io_value)
  );
  SaturatingCounter SaturatingCounter_166 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_166_clock),
    .reset(SaturatingCounter_166_reset),
    .io_enable(SaturatingCounter_166_io_enable),
    .io_value(SaturatingCounter_166_io_value)
  );
  SaturatingCounter SaturatingCounter_167 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_167_clock),
    .reset(SaturatingCounter_167_reset),
    .io_enable(SaturatingCounter_167_io_enable),
    .io_value(SaturatingCounter_167_io_value)
  );
  SaturatingCounter SaturatingCounter_168 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_168_clock),
    .reset(SaturatingCounter_168_reset),
    .io_enable(SaturatingCounter_168_io_enable),
    .io_value(SaturatingCounter_168_io_value)
  );
  SaturatingCounter SaturatingCounter_169 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_169_clock),
    .reset(SaturatingCounter_169_reset),
    .io_enable(SaturatingCounter_169_io_enable),
    .io_value(SaturatingCounter_169_io_value)
  );
  SaturatingCounter SaturatingCounter_170 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_170_clock),
    .reset(SaturatingCounter_170_reset),
    .io_enable(SaturatingCounter_170_io_enable),
    .io_value(SaturatingCounter_170_io_value)
  );
  SaturatingCounter SaturatingCounter_171 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_171_clock),
    .reset(SaturatingCounter_171_reset),
    .io_enable(SaturatingCounter_171_io_enable),
    .io_value(SaturatingCounter_171_io_value)
  );
  SaturatingCounter SaturatingCounter_172 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_172_clock),
    .reset(SaturatingCounter_172_reset),
    .io_enable(SaturatingCounter_172_io_enable),
    .io_value(SaturatingCounter_172_io_value)
  );
  SaturatingCounter SaturatingCounter_173 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_173_clock),
    .reset(SaturatingCounter_173_reset),
    .io_enable(SaturatingCounter_173_io_enable),
    .io_value(SaturatingCounter_173_io_value)
  );
  SaturatingCounter SaturatingCounter_174 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_174_clock),
    .reset(SaturatingCounter_174_reset),
    .io_enable(SaturatingCounter_174_io_enable),
    .io_value(SaturatingCounter_174_io_value)
  );
  SaturatingCounter SaturatingCounter_175 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_175_clock),
    .reset(SaturatingCounter_175_reset),
    .io_enable(SaturatingCounter_175_io_enable),
    .io_value(SaturatingCounter_175_io_value)
  );
  SaturatingCounter SaturatingCounter_176 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_176_clock),
    .reset(SaturatingCounter_176_reset),
    .io_enable(SaturatingCounter_176_io_enable),
    .io_value(SaturatingCounter_176_io_value)
  );
  SaturatingCounter SaturatingCounter_177 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_177_clock),
    .reset(SaturatingCounter_177_reset),
    .io_enable(SaturatingCounter_177_io_enable),
    .io_value(SaturatingCounter_177_io_value)
  );
  SaturatingCounter SaturatingCounter_178 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_178_clock),
    .reset(SaturatingCounter_178_reset),
    .io_enable(SaturatingCounter_178_io_enable),
    .io_value(SaturatingCounter_178_io_value)
  );
  SaturatingCounter SaturatingCounter_179 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_179_clock),
    .reset(SaturatingCounter_179_reset),
    .io_enable(SaturatingCounter_179_io_enable),
    .io_value(SaturatingCounter_179_io_value)
  );
  SaturatingCounter SaturatingCounter_180 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_180_clock),
    .reset(SaturatingCounter_180_reset),
    .io_enable(SaturatingCounter_180_io_enable),
    .io_value(SaturatingCounter_180_io_value)
  );
  SaturatingCounter SaturatingCounter_181 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_181_clock),
    .reset(SaturatingCounter_181_reset),
    .io_enable(SaturatingCounter_181_io_enable),
    .io_value(SaturatingCounter_181_io_value)
  );
  SaturatingCounter SaturatingCounter_182 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_182_clock),
    .reset(SaturatingCounter_182_reset),
    .io_enable(SaturatingCounter_182_io_enable),
    .io_value(SaturatingCounter_182_io_value)
  );
  SaturatingCounter SaturatingCounter_183 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_183_clock),
    .reset(SaturatingCounter_183_reset),
    .io_enable(SaturatingCounter_183_io_enable),
    .io_value(SaturatingCounter_183_io_value)
  );
  SaturatingCounter SaturatingCounter_184 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_184_clock),
    .reset(SaturatingCounter_184_reset),
    .io_enable(SaturatingCounter_184_io_enable),
    .io_value(SaturatingCounter_184_io_value)
  );
  SaturatingCounter SaturatingCounter_185 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_185_clock),
    .reset(SaturatingCounter_185_reset),
    .io_enable(SaturatingCounter_185_io_enable),
    .io_value(SaturatingCounter_185_io_value)
  );
  SaturatingCounter SaturatingCounter_186 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_186_clock),
    .reset(SaturatingCounter_186_reset),
    .io_enable(SaturatingCounter_186_io_enable),
    .io_value(SaturatingCounter_186_io_value)
  );
  SaturatingCounter SaturatingCounter_187 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_187_clock),
    .reset(SaturatingCounter_187_reset),
    .io_enable(SaturatingCounter_187_io_enable),
    .io_value(SaturatingCounter_187_io_value)
  );
  SaturatingCounter SaturatingCounter_188 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_188_clock),
    .reset(SaturatingCounter_188_reset),
    .io_enable(SaturatingCounter_188_io_enable),
    .io_value(SaturatingCounter_188_io_value)
  );
  SaturatingCounter SaturatingCounter_189 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_189_clock),
    .reset(SaturatingCounter_189_reset),
    .io_enable(SaturatingCounter_189_io_enable),
    .io_value(SaturatingCounter_189_io_value)
  );
  SaturatingCounter SaturatingCounter_190 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_190_clock),
    .reset(SaturatingCounter_190_reset),
    .io_enable(SaturatingCounter_190_io_enable),
    .io_value(SaturatingCounter_190_io_value)
  );
  SaturatingCounter SaturatingCounter_191 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_191_clock),
    .reset(SaturatingCounter_191_reset),
    .io_enable(SaturatingCounter_191_io_enable),
    .io_value(SaturatingCounter_191_io_value)
  );
  SaturatingCounter SaturatingCounter_192 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_192_clock),
    .reset(SaturatingCounter_192_reset),
    .io_enable(SaturatingCounter_192_io_enable),
    .io_value(SaturatingCounter_192_io_value)
  );
  SaturatingCounter SaturatingCounter_193 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_193_clock),
    .reset(SaturatingCounter_193_reset),
    .io_enable(SaturatingCounter_193_io_enable),
    .io_value(SaturatingCounter_193_io_value)
  );
  SaturatingCounter SaturatingCounter_194 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_194_clock),
    .reset(SaturatingCounter_194_reset),
    .io_enable(SaturatingCounter_194_io_enable),
    .io_value(SaturatingCounter_194_io_value)
  );
  SaturatingCounter SaturatingCounter_195 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_195_clock),
    .reset(SaturatingCounter_195_reset),
    .io_enable(SaturatingCounter_195_io_enable),
    .io_value(SaturatingCounter_195_io_value)
  );
  SaturatingCounter SaturatingCounter_196 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_196_clock),
    .reset(SaturatingCounter_196_reset),
    .io_enable(SaturatingCounter_196_io_enable),
    .io_value(SaturatingCounter_196_io_value)
  );
  SaturatingCounter SaturatingCounter_197 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_197_clock),
    .reset(SaturatingCounter_197_reset),
    .io_enable(SaturatingCounter_197_io_enable),
    .io_value(SaturatingCounter_197_io_value)
  );
  SaturatingCounter SaturatingCounter_198 ( // @[coverage.scala 105:33]
    .clock(SaturatingCounter_198_clock),
    .reset(SaturatingCounter_198_reset),
    .io_enable(SaturatingCounter_198_io_enable),
    .io_value(SaturatingCounter_198_io_value)
  );
  SaturatingCounter SaturatingCounter_199 ( // @[coverage.scala 107:33]
    .clock(SaturatingCounter_199_clock),
    .reset(SaturatingCounter_199_reset),
    .io_enable(SaturatingCounter_199_io_enable),
    .io_value(SaturatingCounter_199_io_value)
  );
  assign io_coverage_bytes_0 = {7'h0,SaturatingCounter_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_1 = {7'h0,SaturatingCounter_1_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_2 = {7'h0,SaturatingCounter_2_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_3 = {7'h0,SaturatingCounter_3_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_4 = {7'h0,SaturatingCounter_4_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_5 = {7'h0,SaturatingCounter_5_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_6 = {7'h0,SaturatingCounter_6_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_7 = {7'h0,SaturatingCounter_7_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_8 = {7'h0,SaturatingCounter_8_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_9 = {7'h0,SaturatingCounter_9_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_10 = {7'h0,SaturatingCounter_10_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_11 = {7'h0,SaturatingCounter_11_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_12 = {7'h0,SaturatingCounter_12_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_13 = {7'h0,SaturatingCounter_13_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_14 = {7'h0,SaturatingCounter_14_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_15 = {7'h0,SaturatingCounter_15_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_16 = {7'h0,SaturatingCounter_16_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_17 = {7'h0,SaturatingCounter_17_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_18 = {7'h0,SaturatingCounter_18_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_19 = {7'h0,SaturatingCounter_19_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_20 = {7'h0,SaturatingCounter_20_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_21 = {7'h0,SaturatingCounter_21_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_22 = {7'h0,SaturatingCounter_22_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_23 = {7'h0,SaturatingCounter_23_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_24 = {7'h0,SaturatingCounter_24_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_25 = {7'h0,SaturatingCounter_25_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_26 = {7'h0,SaturatingCounter_26_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_27 = {7'h0,SaturatingCounter_27_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_28 = {7'h0,SaturatingCounter_28_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_29 = {7'h0,SaturatingCounter_29_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_30 = {7'h0,SaturatingCounter_30_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_31 = {7'h0,SaturatingCounter_31_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_32 = {7'h0,SaturatingCounter_32_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_33 = {7'h0,SaturatingCounter_33_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_34 = {7'h0,SaturatingCounter_34_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_35 = {7'h0,SaturatingCounter_35_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_36 = {7'h0,SaturatingCounter_36_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_37 = {7'h0,SaturatingCounter_37_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_38 = {7'h0,SaturatingCounter_38_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_39 = {7'h0,SaturatingCounter_39_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_40 = {7'h0,SaturatingCounter_40_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_41 = {7'h0,SaturatingCounter_41_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_42 = {7'h0,SaturatingCounter_42_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_43 = {7'h0,SaturatingCounter_43_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_44 = {7'h0,SaturatingCounter_44_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_45 = {7'h0,SaturatingCounter_45_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_46 = {7'h0,SaturatingCounter_46_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_47 = {7'h0,SaturatingCounter_47_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_48 = {7'h0,SaturatingCounter_48_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_49 = {7'h0,SaturatingCounter_49_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_50 = {_T_126,SaturatingCounter_51_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_51 = {_T_130,SaturatingCounter_53_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_52 = {_T_134,SaturatingCounter_55_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_53 = {_T_138,SaturatingCounter_57_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_54 = {_T_142,SaturatingCounter_59_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_55 = {_T_146,SaturatingCounter_61_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_56 = {_T_150,SaturatingCounter_63_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_57 = {_T_154,SaturatingCounter_65_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_58 = {_T_158,SaturatingCounter_67_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_59 = {_T_162,SaturatingCounter_69_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_60 = {_T_166,SaturatingCounter_71_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_61 = {_T_170,SaturatingCounter_73_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_62 = {_T_174,SaturatingCounter_75_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_63 = {_T_178,SaturatingCounter_77_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_64 = {_T_182,SaturatingCounter_79_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_65 = {_T_186,SaturatingCounter_81_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_66 = {_T_190,SaturatingCounter_83_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_67 = {_T_194,SaturatingCounter_85_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_68 = {_T_198,SaturatingCounter_87_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_69 = {_T_202,SaturatingCounter_89_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_70 = {_T_206,SaturatingCounter_91_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_71 = {_T_210,SaturatingCounter_93_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_72 = {_T_214,SaturatingCounter_95_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_73 = {_T_218,SaturatingCounter_97_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_74 = {_T_222,SaturatingCounter_99_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_75 = {_T_226,SaturatingCounter_101_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_76 = {_T_230,SaturatingCounter_103_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_77 = {_T_234,SaturatingCounter_105_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_78 = {_T_238,SaturatingCounter_107_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_79 = {_T_242,SaturatingCounter_109_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_80 = {_T_246,SaturatingCounter_111_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_81 = {_T_250,SaturatingCounter_113_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_82 = {_T_254,SaturatingCounter_115_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_83 = {_T_258,SaturatingCounter_117_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_84 = {_T_262,SaturatingCounter_119_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_85 = {_T_266,SaturatingCounter_121_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_86 = {_T_270,SaturatingCounter_123_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_87 = {_T_274,SaturatingCounter_125_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_88 = {_T_278,SaturatingCounter_127_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_89 = {_T_282,SaturatingCounter_129_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_90 = {_T_286,SaturatingCounter_131_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_91 = {_T_290,SaturatingCounter_133_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_92 = {_T_294,SaturatingCounter_135_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_93 = {_T_298,SaturatingCounter_137_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_94 = {_T_302,SaturatingCounter_139_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_95 = {_T_306,SaturatingCounter_141_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_96 = {_T_310,SaturatingCounter_143_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_97 = {_T_314,SaturatingCounter_145_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_98 = {_T_318,SaturatingCounter_147_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_99 = {_T_322,SaturatingCounter_149_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_100 = {_T_326,SaturatingCounter_151_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_101 = {_T_330,SaturatingCounter_153_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_102 = {_T_334,SaturatingCounter_155_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_103 = {_T_338,SaturatingCounter_157_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_104 = {_T_342,SaturatingCounter_159_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_105 = {_T_346,SaturatingCounter_161_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_106 = {_T_350,SaturatingCounter_163_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_107 = {_T_354,SaturatingCounter_165_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_108 = {_T_358,SaturatingCounter_167_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_109 = {_T_362,SaturatingCounter_169_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_110 = {_T_366,SaturatingCounter_171_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_111 = {_T_370,SaturatingCounter_173_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_112 = {_T_374,SaturatingCounter_175_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_113 = {_T_378,SaturatingCounter_177_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_114 = {_T_382,SaturatingCounter_179_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_115 = {_T_386,SaturatingCounter_181_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_116 = {_T_390,SaturatingCounter_183_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_117 = {_T_394,SaturatingCounter_185_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_118 = {_T_398,SaturatingCounter_187_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_119 = {_T_402,SaturatingCounter_189_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_120 = {_T_406,SaturatingCounter_191_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_121 = {_T_410,SaturatingCounter_193_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_122 = {_T_414,SaturatingCounter_195_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_123 = {_T_418,SaturatingCounter_197_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_124 = {_T_422,SaturatingCounter_199_io_value}; // @[VerilatorHarness.scala 66:27]
  assign io_coverage_bytes_125 = 8'h0; // @[VerilatorHarness.scala 66:27]
  assign dut_clock = clock;
  assign dut_reset = reset;
  assign dut_io_meta_reset = io_meta_reset; // @[VerilatorHarness.scala 43:27]
  assign dut_io_inputs = input_bytes[191:27]; // @[VerilatorHarness.scala 48:23]
  assign SaturatingCounter_clock = clock;
  assign SaturatingCounter_reset = reset;
  assign SaturatingCounter_io_enable = dut_io_coverage_0; // @[coverage.scala 122:33]
  assign SaturatingCounter_1_clock = clock;
  assign SaturatingCounter_1_reset = reset;
  assign SaturatingCounter_1_io_enable = dut_io_coverage_1; // @[coverage.scala 122:33]
  assign SaturatingCounter_2_clock = clock;
  assign SaturatingCounter_2_reset = reset;
  assign SaturatingCounter_2_io_enable = dut_io_coverage_2; // @[coverage.scala 122:33]
  assign SaturatingCounter_3_clock = clock;
  assign SaturatingCounter_3_reset = reset;
  assign SaturatingCounter_3_io_enable = dut_io_coverage_3; // @[coverage.scala 122:33]
  assign SaturatingCounter_4_clock = clock;
  assign SaturatingCounter_4_reset = reset;
  assign SaturatingCounter_4_io_enable = dut_io_coverage_4; // @[coverage.scala 122:33]
  assign SaturatingCounter_5_clock = clock;
  assign SaturatingCounter_5_reset = reset;
  assign SaturatingCounter_5_io_enable = dut_io_coverage_5; // @[coverage.scala 122:33]
  assign SaturatingCounter_6_clock = clock;
  assign SaturatingCounter_6_reset = reset;
  assign SaturatingCounter_6_io_enable = dut_io_coverage_6; // @[coverage.scala 122:33]
  assign SaturatingCounter_7_clock = clock;
  assign SaturatingCounter_7_reset = reset;
  assign SaturatingCounter_7_io_enable = dut_io_coverage_7; // @[coverage.scala 122:33]
  assign SaturatingCounter_8_clock = clock;
  assign SaturatingCounter_8_reset = reset;
  assign SaturatingCounter_8_io_enable = dut_io_coverage_8; // @[coverage.scala 122:33]
  assign SaturatingCounter_9_clock = clock;
  assign SaturatingCounter_9_reset = reset;
  assign SaturatingCounter_9_io_enable = dut_io_coverage_9; // @[coverage.scala 122:33]
  assign SaturatingCounter_10_clock = clock;
  assign SaturatingCounter_10_reset = reset;
  assign SaturatingCounter_10_io_enable = dut_io_coverage_10; // @[coverage.scala 122:33]
  assign SaturatingCounter_11_clock = clock;
  assign SaturatingCounter_11_reset = reset;
  assign SaturatingCounter_11_io_enable = dut_io_coverage_11; // @[coverage.scala 122:33]
  assign SaturatingCounter_12_clock = clock;
  assign SaturatingCounter_12_reset = reset;
  assign SaturatingCounter_12_io_enable = dut_io_coverage_12; // @[coverage.scala 122:33]
  assign SaturatingCounter_13_clock = clock;
  assign SaturatingCounter_13_reset = reset;
  assign SaturatingCounter_13_io_enable = dut_io_coverage_13; // @[coverage.scala 122:33]
  assign SaturatingCounter_14_clock = clock;
  assign SaturatingCounter_14_reset = reset;
  assign SaturatingCounter_14_io_enable = dut_io_coverage_14; // @[coverage.scala 122:33]
  assign SaturatingCounter_15_clock = clock;
  assign SaturatingCounter_15_reset = reset;
  assign SaturatingCounter_15_io_enable = dut_io_coverage_15; // @[coverage.scala 122:33]
  assign SaturatingCounter_16_clock = clock;
  assign SaturatingCounter_16_reset = reset;
  assign SaturatingCounter_16_io_enable = dut_io_coverage_16; // @[coverage.scala 122:33]
  assign SaturatingCounter_17_clock = clock;
  assign SaturatingCounter_17_reset = reset;
  assign SaturatingCounter_17_io_enable = dut_io_coverage_17; // @[coverage.scala 122:33]
  assign SaturatingCounter_18_clock = clock;
  assign SaturatingCounter_18_reset = reset;
  assign SaturatingCounter_18_io_enable = dut_io_coverage_18; // @[coverage.scala 122:33]
  assign SaturatingCounter_19_clock = clock;
  assign SaturatingCounter_19_reset = reset;
  assign SaturatingCounter_19_io_enable = dut_io_coverage_19; // @[coverage.scala 122:33]
  assign SaturatingCounter_20_clock = clock;
  assign SaturatingCounter_20_reset = reset;
  assign SaturatingCounter_20_io_enable = dut_io_coverage_20; // @[coverage.scala 122:33]
  assign SaturatingCounter_21_clock = clock;
  assign SaturatingCounter_21_reset = reset;
  assign SaturatingCounter_21_io_enable = dut_io_coverage_21; // @[coverage.scala 122:33]
  assign SaturatingCounter_22_clock = clock;
  assign SaturatingCounter_22_reset = reset;
  assign SaturatingCounter_22_io_enable = dut_io_coverage_22; // @[coverage.scala 122:33]
  assign SaturatingCounter_23_clock = clock;
  assign SaturatingCounter_23_reset = reset;
  assign SaturatingCounter_23_io_enable = dut_io_coverage_23; // @[coverage.scala 122:33]
  assign SaturatingCounter_24_clock = clock;
  assign SaturatingCounter_24_reset = reset;
  assign SaturatingCounter_24_io_enable = dut_io_coverage_24; // @[coverage.scala 122:33]
  assign SaturatingCounter_25_clock = clock;
  assign SaturatingCounter_25_reset = reset;
  assign SaturatingCounter_25_io_enable = dut_io_coverage_25; // @[coverage.scala 122:33]
  assign SaturatingCounter_26_clock = clock;
  assign SaturatingCounter_26_reset = reset;
  assign SaturatingCounter_26_io_enable = dut_io_coverage_26; // @[coverage.scala 122:33]
  assign SaturatingCounter_27_clock = clock;
  assign SaturatingCounter_27_reset = reset;
  assign SaturatingCounter_27_io_enable = dut_io_coverage_27; // @[coverage.scala 122:33]
  assign SaturatingCounter_28_clock = clock;
  assign SaturatingCounter_28_reset = reset;
  assign SaturatingCounter_28_io_enable = dut_io_coverage_28; // @[coverage.scala 122:33]
  assign SaturatingCounter_29_clock = clock;
  assign SaturatingCounter_29_reset = reset;
  assign SaturatingCounter_29_io_enable = dut_io_coverage_29; // @[coverage.scala 122:33]
  assign SaturatingCounter_30_clock = clock;
  assign SaturatingCounter_30_reset = reset;
  assign SaturatingCounter_30_io_enable = dut_io_coverage_30; // @[coverage.scala 122:33]
  assign SaturatingCounter_31_clock = clock;
  assign SaturatingCounter_31_reset = reset;
  assign SaturatingCounter_31_io_enable = dut_io_coverage_31; // @[coverage.scala 122:33]
  assign SaturatingCounter_32_clock = clock;
  assign SaturatingCounter_32_reset = reset;
  assign SaturatingCounter_32_io_enable = dut_io_coverage_32; // @[coverage.scala 122:33]
  assign SaturatingCounter_33_clock = clock;
  assign SaturatingCounter_33_reset = reset;
  assign SaturatingCounter_33_io_enable = dut_io_coverage_33; // @[coverage.scala 122:33]
  assign SaturatingCounter_34_clock = clock;
  assign SaturatingCounter_34_reset = reset;
  assign SaturatingCounter_34_io_enable = dut_io_coverage_34; // @[coverage.scala 122:33]
  assign SaturatingCounter_35_clock = clock;
  assign SaturatingCounter_35_reset = reset;
  assign SaturatingCounter_35_io_enable = dut_io_coverage_35; // @[coverage.scala 122:33]
  assign SaturatingCounter_36_clock = clock;
  assign SaturatingCounter_36_reset = reset;
  assign SaturatingCounter_36_io_enable = dut_io_coverage_36; // @[coverage.scala 122:33]
  assign SaturatingCounter_37_clock = clock;
  assign SaturatingCounter_37_reset = reset;
  assign SaturatingCounter_37_io_enable = dut_io_coverage_37; // @[coverage.scala 122:33]
  assign SaturatingCounter_38_clock = clock;
  assign SaturatingCounter_38_reset = reset;
  assign SaturatingCounter_38_io_enable = dut_io_coverage_38; // @[coverage.scala 122:33]
  assign SaturatingCounter_39_clock = clock;
  assign SaturatingCounter_39_reset = reset;
  assign SaturatingCounter_39_io_enable = dut_io_coverage_39; // @[coverage.scala 122:33]
  assign SaturatingCounter_40_clock = clock;
  assign SaturatingCounter_40_reset = reset;
  assign SaturatingCounter_40_io_enable = dut_io_coverage_40; // @[coverage.scala 122:33]
  assign SaturatingCounter_41_clock = clock;
  assign SaturatingCounter_41_reset = reset;
  assign SaturatingCounter_41_io_enable = dut_io_coverage_41; // @[coverage.scala 122:33]
  assign SaturatingCounter_42_clock = clock;
  assign SaturatingCounter_42_reset = reset;
  assign SaturatingCounter_42_io_enable = dut_io_coverage_42; // @[coverage.scala 122:33]
  assign SaturatingCounter_43_clock = clock;
  assign SaturatingCounter_43_reset = reset;
  assign SaturatingCounter_43_io_enable = dut_io_coverage_43; // @[coverage.scala 122:33]
  assign SaturatingCounter_44_clock = clock;
  assign SaturatingCounter_44_reset = reset;
  assign SaturatingCounter_44_io_enable = dut_io_coverage_44; // @[coverage.scala 122:33]
  assign SaturatingCounter_45_clock = clock;
  assign SaturatingCounter_45_reset = reset;
  assign SaturatingCounter_45_io_enable = dut_io_coverage_45; // @[coverage.scala 122:33]
  assign SaturatingCounter_46_clock = clock;
  assign SaturatingCounter_46_reset = reset;
  assign SaturatingCounter_46_io_enable = dut_io_coverage_46; // @[coverage.scala 122:33]
  assign SaturatingCounter_47_clock = clock;
  assign SaturatingCounter_47_reset = reset;
  assign SaturatingCounter_47_io_enable = dut_io_coverage_47; // @[coverage.scala 122:33]
  assign SaturatingCounter_48_clock = clock;
  assign SaturatingCounter_48_reset = reset;
  assign SaturatingCounter_48_io_enable = dut_io_coverage_48; // @[coverage.scala 122:33]
  assign SaturatingCounter_49_clock = clock;
  assign SaturatingCounter_49_reset = reset;
  assign SaturatingCounter_49_io_enable = dut_io_coverage_49; // @[coverage.scala 122:33]
  assign SaturatingCounter_50_clock = clock;
  assign SaturatingCounter_50_reset = reset;
  assign SaturatingCounter_50_io_enable = dut_io_coverage_50; // @[coverage.scala 106:31]
  assign SaturatingCounter_51_clock = clock;
  assign SaturatingCounter_51_reset = reset;
  assign SaturatingCounter_51_io_enable = ~dut_io_coverage_50; // @[coverage.scala 108:31]
  assign SaturatingCounter_52_clock = clock;
  assign SaturatingCounter_52_reset = reset;
  assign SaturatingCounter_52_io_enable = dut_io_coverage_51; // @[coverage.scala 106:31]
  assign SaturatingCounter_53_clock = clock;
  assign SaturatingCounter_53_reset = reset;
  assign SaturatingCounter_53_io_enable = ~dut_io_coverage_51; // @[coverage.scala 108:31]
  assign SaturatingCounter_54_clock = clock;
  assign SaturatingCounter_54_reset = reset;
  assign SaturatingCounter_54_io_enable = dut_io_coverage_52; // @[coverage.scala 106:31]
  assign SaturatingCounter_55_clock = clock;
  assign SaturatingCounter_55_reset = reset;
  assign SaturatingCounter_55_io_enable = ~dut_io_coverage_52; // @[coverage.scala 108:31]
  assign SaturatingCounter_56_clock = clock;
  assign SaturatingCounter_56_reset = reset;
  assign SaturatingCounter_56_io_enable = dut_io_coverage_53; // @[coverage.scala 106:31]
  assign SaturatingCounter_57_clock = clock;
  assign SaturatingCounter_57_reset = reset;
  assign SaturatingCounter_57_io_enable = ~dut_io_coverage_53; // @[coverage.scala 108:31]
  assign SaturatingCounter_58_clock = clock;
  assign SaturatingCounter_58_reset = reset;
  assign SaturatingCounter_58_io_enable = dut_io_coverage_54; // @[coverage.scala 106:31]
  assign SaturatingCounter_59_clock = clock;
  assign SaturatingCounter_59_reset = reset;
  assign SaturatingCounter_59_io_enable = ~dut_io_coverage_54; // @[coverage.scala 108:31]
  assign SaturatingCounter_60_clock = clock;
  assign SaturatingCounter_60_reset = reset;
  assign SaturatingCounter_60_io_enable = dut_io_coverage_55; // @[coverage.scala 106:31]
  assign SaturatingCounter_61_clock = clock;
  assign SaturatingCounter_61_reset = reset;
  assign SaturatingCounter_61_io_enable = ~dut_io_coverage_55; // @[coverage.scala 108:31]
  assign SaturatingCounter_62_clock = clock;
  assign SaturatingCounter_62_reset = reset;
  assign SaturatingCounter_62_io_enable = dut_io_coverage_56; // @[coverage.scala 106:31]
  assign SaturatingCounter_63_clock = clock;
  assign SaturatingCounter_63_reset = reset;
  assign SaturatingCounter_63_io_enable = ~dut_io_coverage_56; // @[coverage.scala 108:31]
  assign SaturatingCounter_64_clock = clock;
  assign SaturatingCounter_64_reset = reset;
  assign SaturatingCounter_64_io_enable = dut_io_coverage_57; // @[coverage.scala 106:31]
  assign SaturatingCounter_65_clock = clock;
  assign SaturatingCounter_65_reset = reset;
  assign SaturatingCounter_65_io_enable = ~dut_io_coverage_57; // @[coverage.scala 108:31]
  assign SaturatingCounter_66_clock = clock;
  assign SaturatingCounter_66_reset = reset;
  assign SaturatingCounter_66_io_enable = dut_io_coverage_58; // @[coverage.scala 106:31]
  assign SaturatingCounter_67_clock = clock;
  assign SaturatingCounter_67_reset = reset;
  assign SaturatingCounter_67_io_enable = ~dut_io_coverage_58; // @[coverage.scala 108:31]
  assign SaturatingCounter_68_clock = clock;
  assign SaturatingCounter_68_reset = reset;
  assign SaturatingCounter_68_io_enable = dut_io_coverage_59; // @[coverage.scala 106:31]
  assign SaturatingCounter_69_clock = clock;
  assign SaturatingCounter_69_reset = reset;
  assign SaturatingCounter_69_io_enable = ~dut_io_coverage_59; // @[coverage.scala 108:31]
  assign SaturatingCounter_70_clock = clock;
  assign SaturatingCounter_70_reset = reset;
  assign SaturatingCounter_70_io_enable = dut_io_coverage_60; // @[coverage.scala 106:31]
  assign SaturatingCounter_71_clock = clock;
  assign SaturatingCounter_71_reset = reset;
  assign SaturatingCounter_71_io_enable = ~dut_io_coverage_60; // @[coverage.scala 108:31]
  assign SaturatingCounter_72_clock = clock;
  assign SaturatingCounter_72_reset = reset;
  assign SaturatingCounter_72_io_enable = dut_io_coverage_61; // @[coverage.scala 106:31]
  assign SaturatingCounter_73_clock = clock;
  assign SaturatingCounter_73_reset = reset;
  assign SaturatingCounter_73_io_enable = ~dut_io_coverage_61; // @[coverage.scala 108:31]
  assign SaturatingCounter_74_clock = clock;
  assign SaturatingCounter_74_reset = reset;
  assign SaturatingCounter_74_io_enable = dut_io_coverage_62; // @[coverage.scala 106:31]
  assign SaturatingCounter_75_clock = clock;
  assign SaturatingCounter_75_reset = reset;
  assign SaturatingCounter_75_io_enable = ~dut_io_coverage_62; // @[coverage.scala 108:31]
  assign SaturatingCounter_76_clock = clock;
  assign SaturatingCounter_76_reset = reset;
  assign SaturatingCounter_76_io_enable = dut_io_coverage_63; // @[coverage.scala 106:31]
  assign SaturatingCounter_77_clock = clock;
  assign SaturatingCounter_77_reset = reset;
  assign SaturatingCounter_77_io_enable = ~dut_io_coverage_63; // @[coverage.scala 108:31]
  assign SaturatingCounter_78_clock = clock;
  assign SaturatingCounter_78_reset = reset;
  assign SaturatingCounter_78_io_enable = dut_io_coverage_64; // @[coverage.scala 106:31]
  assign SaturatingCounter_79_clock = clock;
  assign SaturatingCounter_79_reset = reset;
  assign SaturatingCounter_79_io_enable = ~dut_io_coverage_64; // @[coverage.scala 108:31]
  assign SaturatingCounter_80_clock = clock;
  assign SaturatingCounter_80_reset = reset;
  assign SaturatingCounter_80_io_enable = dut_io_coverage_65; // @[coverage.scala 106:31]
  assign SaturatingCounter_81_clock = clock;
  assign SaturatingCounter_81_reset = reset;
  assign SaturatingCounter_81_io_enable = ~dut_io_coverage_65; // @[coverage.scala 108:31]
  assign SaturatingCounter_82_clock = clock;
  assign SaturatingCounter_82_reset = reset;
  assign SaturatingCounter_82_io_enable = dut_io_coverage_66; // @[coverage.scala 106:31]
  assign SaturatingCounter_83_clock = clock;
  assign SaturatingCounter_83_reset = reset;
  assign SaturatingCounter_83_io_enable = ~dut_io_coverage_66; // @[coverage.scala 108:31]
  assign SaturatingCounter_84_clock = clock;
  assign SaturatingCounter_84_reset = reset;
  assign SaturatingCounter_84_io_enable = dut_io_coverage_67; // @[coverage.scala 106:31]
  assign SaturatingCounter_85_clock = clock;
  assign SaturatingCounter_85_reset = reset;
  assign SaturatingCounter_85_io_enable = ~dut_io_coverage_67; // @[coverage.scala 108:31]
  assign SaturatingCounter_86_clock = clock;
  assign SaturatingCounter_86_reset = reset;
  assign SaturatingCounter_86_io_enable = dut_io_coverage_68; // @[coverage.scala 106:31]
  assign SaturatingCounter_87_clock = clock;
  assign SaturatingCounter_87_reset = reset;
  assign SaturatingCounter_87_io_enable = ~dut_io_coverage_68; // @[coverage.scala 108:31]
  assign SaturatingCounter_88_clock = clock;
  assign SaturatingCounter_88_reset = reset;
  assign SaturatingCounter_88_io_enable = dut_io_coverage_69; // @[coverage.scala 106:31]
  assign SaturatingCounter_89_clock = clock;
  assign SaturatingCounter_89_reset = reset;
  assign SaturatingCounter_89_io_enable = ~dut_io_coverage_69; // @[coverage.scala 108:31]
  assign SaturatingCounter_90_clock = clock;
  assign SaturatingCounter_90_reset = reset;
  assign SaturatingCounter_90_io_enable = dut_io_coverage_70; // @[coverage.scala 106:31]
  assign SaturatingCounter_91_clock = clock;
  assign SaturatingCounter_91_reset = reset;
  assign SaturatingCounter_91_io_enable = ~dut_io_coverage_70; // @[coverage.scala 108:31]
  assign SaturatingCounter_92_clock = clock;
  assign SaturatingCounter_92_reset = reset;
  assign SaturatingCounter_92_io_enable = dut_io_coverage_71; // @[coverage.scala 106:31]
  assign SaturatingCounter_93_clock = clock;
  assign SaturatingCounter_93_reset = reset;
  assign SaturatingCounter_93_io_enable = ~dut_io_coverage_71; // @[coverage.scala 108:31]
  assign SaturatingCounter_94_clock = clock;
  assign SaturatingCounter_94_reset = reset;
  assign SaturatingCounter_94_io_enable = dut_io_coverage_72; // @[coverage.scala 106:31]
  assign SaturatingCounter_95_clock = clock;
  assign SaturatingCounter_95_reset = reset;
  assign SaturatingCounter_95_io_enable = ~dut_io_coverage_72; // @[coverage.scala 108:31]
  assign SaturatingCounter_96_clock = clock;
  assign SaturatingCounter_96_reset = reset;
  assign SaturatingCounter_96_io_enable = dut_io_coverage_73; // @[coverage.scala 106:31]
  assign SaturatingCounter_97_clock = clock;
  assign SaturatingCounter_97_reset = reset;
  assign SaturatingCounter_97_io_enable = ~dut_io_coverage_73; // @[coverage.scala 108:31]
  assign SaturatingCounter_98_clock = clock;
  assign SaturatingCounter_98_reset = reset;
  assign SaturatingCounter_98_io_enable = dut_io_coverage_74; // @[coverage.scala 106:31]
  assign SaturatingCounter_99_clock = clock;
  assign SaturatingCounter_99_reset = reset;
  assign SaturatingCounter_99_io_enable = ~dut_io_coverage_74; // @[coverage.scala 108:31]
  assign SaturatingCounter_100_clock = clock;
  assign SaturatingCounter_100_reset = reset;
  assign SaturatingCounter_100_io_enable = dut_io_coverage_75; // @[coverage.scala 106:31]
  assign SaturatingCounter_101_clock = clock;
  assign SaturatingCounter_101_reset = reset;
  assign SaturatingCounter_101_io_enable = ~dut_io_coverage_75; // @[coverage.scala 108:31]
  assign SaturatingCounter_102_clock = clock;
  assign SaturatingCounter_102_reset = reset;
  assign SaturatingCounter_102_io_enable = dut_io_coverage_76; // @[coverage.scala 106:31]
  assign SaturatingCounter_103_clock = clock;
  assign SaturatingCounter_103_reset = reset;
  assign SaturatingCounter_103_io_enable = ~dut_io_coverage_76; // @[coverage.scala 108:31]
  assign SaturatingCounter_104_clock = clock;
  assign SaturatingCounter_104_reset = reset;
  assign SaturatingCounter_104_io_enable = dut_io_coverage_77; // @[coverage.scala 106:31]
  assign SaturatingCounter_105_clock = clock;
  assign SaturatingCounter_105_reset = reset;
  assign SaturatingCounter_105_io_enable = ~dut_io_coverage_77; // @[coverage.scala 108:31]
  assign SaturatingCounter_106_clock = clock;
  assign SaturatingCounter_106_reset = reset;
  assign SaturatingCounter_106_io_enable = dut_io_coverage_78; // @[coverage.scala 106:31]
  assign SaturatingCounter_107_clock = clock;
  assign SaturatingCounter_107_reset = reset;
  assign SaturatingCounter_107_io_enable = ~dut_io_coverage_78; // @[coverage.scala 108:31]
  assign SaturatingCounter_108_clock = clock;
  assign SaturatingCounter_108_reset = reset;
  assign SaturatingCounter_108_io_enable = dut_io_coverage_79; // @[coverage.scala 106:31]
  assign SaturatingCounter_109_clock = clock;
  assign SaturatingCounter_109_reset = reset;
  assign SaturatingCounter_109_io_enable = ~dut_io_coverage_79; // @[coverage.scala 108:31]
  assign SaturatingCounter_110_clock = clock;
  assign SaturatingCounter_110_reset = reset;
  assign SaturatingCounter_110_io_enable = dut_io_coverage_80; // @[coverage.scala 106:31]
  assign SaturatingCounter_111_clock = clock;
  assign SaturatingCounter_111_reset = reset;
  assign SaturatingCounter_111_io_enable = ~dut_io_coverage_80; // @[coverage.scala 108:31]
  assign SaturatingCounter_112_clock = clock;
  assign SaturatingCounter_112_reset = reset;
  assign SaturatingCounter_112_io_enable = dut_io_coverage_81; // @[coverage.scala 106:31]
  assign SaturatingCounter_113_clock = clock;
  assign SaturatingCounter_113_reset = reset;
  assign SaturatingCounter_113_io_enable = ~dut_io_coverage_81; // @[coverage.scala 108:31]
  assign SaturatingCounter_114_clock = clock;
  assign SaturatingCounter_114_reset = reset;
  assign SaturatingCounter_114_io_enable = dut_io_coverage_82; // @[coverage.scala 106:31]
  assign SaturatingCounter_115_clock = clock;
  assign SaturatingCounter_115_reset = reset;
  assign SaturatingCounter_115_io_enable = ~dut_io_coverage_82; // @[coverage.scala 108:31]
  assign SaturatingCounter_116_clock = clock;
  assign SaturatingCounter_116_reset = reset;
  assign SaturatingCounter_116_io_enable = dut_io_coverage_83; // @[coverage.scala 106:31]
  assign SaturatingCounter_117_clock = clock;
  assign SaturatingCounter_117_reset = reset;
  assign SaturatingCounter_117_io_enable = ~dut_io_coverage_83; // @[coverage.scala 108:31]
  assign SaturatingCounter_118_clock = clock;
  assign SaturatingCounter_118_reset = reset;
  assign SaturatingCounter_118_io_enable = dut_io_coverage_84; // @[coverage.scala 106:31]
  assign SaturatingCounter_119_clock = clock;
  assign SaturatingCounter_119_reset = reset;
  assign SaturatingCounter_119_io_enable = ~dut_io_coverage_84; // @[coverage.scala 108:31]
  assign SaturatingCounter_120_clock = clock;
  assign SaturatingCounter_120_reset = reset;
  assign SaturatingCounter_120_io_enable = dut_io_coverage_85; // @[coverage.scala 106:31]
  assign SaturatingCounter_121_clock = clock;
  assign SaturatingCounter_121_reset = reset;
  assign SaturatingCounter_121_io_enable = ~dut_io_coverage_85; // @[coverage.scala 108:31]
  assign SaturatingCounter_122_clock = clock;
  assign SaturatingCounter_122_reset = reset;
  assign SaturatingCounter_122_io_enable = dut_io_coverage_86; // @[coverage.scala 106:31]
  assign SaturatingCounter_123_clock = clock;
  assign SaturatingCounter_123_reset = reset;
  assign SaturatingCounter_123_io_enable = ~dut_io_coverage_86; // @[coverage.scala 108:31]
  assign SaturatingCounter_124_clock = clock;
  assign SaturatingCounter_124_reset = reset;
  assign SaturatingCounter_124_io_enable = dut_io_coverage_87; // @[coverage.scala 106:31]
  assign SaturatingCounter_125_clock = clock;
  assign SaturatingCounter_125_reset = reset;
  assign SaturatingCounter_125_io_enable = ~dut_io_coverage_87; // @[coverage.scala 108:31]
  assign SaturatingCounter_126_clock = clock;
  assign SaturatingCounter_126_reset = reset;
  assign SaturatingCounter_126_io_enable = dut_io_coverage_88; // @[coverage.scala 106:31]
  assign SaturatingCounter_127_clock = clock;
  assign SaturatingCounter_127_reset = reset;
  assign SaturatingCounter_127_io_enable = ~dut_io_coverage_88; // @[coverage.scala 108:31]
  assign SaturatingCounter_128_clock = clock;
  assign SaturatingCounter_128_reset = reset;
  assign SaturatingCounter_128_io_enable = dut_io_coverage_89; // @[coverage.scala 106:31]
  assign SaturatingCounter_129_clock = clock;
  assign SaturatingCounter_129_reset = reset;
  assign SaturatingCounter_129_io_enable = ~dut_io_coverage_89; // @[coverage.scala 108:31]
  assign SaturatingCounter_130_clock = clock;
  assign SaturatingCounter_130_reset = reset;
  assign SaturatingCounter_130_io_enable = dut_io_coverage_90; // @[coverage.scala 106:31]
  assign SaturatingCounter_131_clock = clock;
  assign SaturatingCounter_131_reset = reset;
  assign SaturatingCounter_131_io_enable = ~dut_io_coverage_90; // @[coverage.scala 108:31]
  assign SaturatingCounter_132_clock = clock;
  assign SaturatingCounter_132_reset = reset;
  assign SaturatingCounter_132_io_enable = dut_io_coverage_91; // @[coverage.scala 106:31]
  assign SaturatingCounter_133_clock = clock;
  assign SaturatingCounter_133_reset = reset;
  assign SaturatingCounter_133_io_enable = ~dut_io_coverage_91; // @[coverage.scala 108:31]
  assign SaturatingCounter_134_clock = clock;
  assign SaturatingCounter_134_reset = reset;
  assign SaturatingCounter_134_io_enable = dut_io_coverage_92; // @[coverage.scala 106:31]
  assign SaturatingCounter_135_clock = clock;
  assign SaturatingCounter_135_reset = reset;
  assign SaturatingCounter_135_io_enable = ~dut_io_coverage_92; // @[coverage.scala 108:31]
  assign SaturatingCounter_136_clock = clock;
  assign SaturatingCounter_136_reset = reset;
  assign SaturatingCounter_136_io_enable = dut_io_coverage_93; // @[coverage.scala 106:31]
  assign SaturatingCounter_137_clock = clock;
  assign SaturatingCounter_137_reset = reset;
  assign SaturatingCounter_137_io_enable = ~dut_io_coverage_93; // @[coverage.scala 108:31]
  assign SaturatingCounter_138_clock = clock;
  assign SaturatingCounter_138_reset = reset;
  assign SaturatingCounter_138_io_enable = dut_io_coverage_94; // @[coverage.scala 106:31]
  assign SaturatingCounter_139_clock = clock;
  assign SaturatingCounter_139_reset = reset;
  assign SaturatingCounter_139_io_enable = ~dut_io_coverage_94; // @[coverage.scala 108:31]
  assign SaturatingCounter_140_clock = clock;
  assign SaturatingCounter_140_reset = reset;
  assign SaturatingCounter_140_io_enable = dut_io_coverage_95; // @[coverage.scala 106:31]
  assign SaturatingCounter_141_clock = clock;
  assign SaturatingCounter_141_reset = reset;
  assign SaturatingCounter_141_io_enable = ~dut_io_coverage_95; // @[coverage.scala 108:31]
  assign SaturatingCounter_142_clock = clock;
  assign SaturatingCounter_142_reset = reset;
  assign SaturatingCounter_142_io_enable = dut_io_coverage_96; // @[coverage.scala 106:31]
  assign SaturatingCounter_143_clock = clock;
  assign SaturatingCounter_143_reset = reset;
  assign SaturatingCounter_143_io_enable = ~dut_io_coverage_96; // @[coverage.scala 108:31]
  assign SaturatingCounter_144_clock = clock;
  assign SaturatingCounter_144_reset = reset;
  assign SaturatingCounter_144_io_enable = dut_io_coverage_97; // @[coverage.scala 106:31]
  assign SaturatingCounter_145_clock = clock;
  assign SaturatingCounter_145_reset = reset;
  assign SaturatingCounter_145_io_enable = ~dut_io_coverage_97; // @[coverage.scala 108:31]
  assign SaturatingCounter_146_clock = clock;
  assign SaturatingCounter_146_reset = reset;
  assign SaturatingCounter_146_io_enable = dut_io_coverage_98; // @[coverage.scala 106:31]
  assign SaturatingCounter_147_clock = clock;
  assign SaturatingCounter_147_reset = reset;
  assign SaturatingCounter_147_io_enable = ~dut_io_coverage_98; // @[coverage.scala 108:31]
  assign SaturatingCounter_148_clock = clock;
  assign SaturatingCounter_148_reset = reset;
  assign SaturatingCounter_148_io_enable = dut_io_coverage_99; // @[coverage.scala 106:31]
  assign SaturatingCounter_149_clock = clock;
  assign SaturatingCounter_149_reset = reset;
  assign SaturatingCounter_149_io_enable = ~dut_io_coverage_99; // @[coverage.scala 108:31]
  assign SaturatingCounter_150_clock = clock;
  assign SaturatingCounter_150_reset = reset;
  assign SaturatingCounter_150_io_enable = dut_io_coverage_100; // @[coverage.scala 106:31]
  assign SaturatingCounter_151_clock = clock;
  assign SaturatingCounter_151_reset = reset;
  assign SaturatingCounter_151_io_enable = ~dut_io_coverage_100; // @[coverage.scala 108:31]
  assign SaturatingCounter_152_clock = clock;
  assign SaturatingCounter_152_reset = reset;
  assign SaturatingCounter_152_io_enable = dut_io_coverage_101; // @[coverage.scala 106:31]
  assign SaturatingCounter_153_clock = clock;
  assign SaturatingCounter_153_reset = reset;
  assign SaturatingCounter_153_io_enable = ~dut_io_coverage_101; // @[coverage.scala 108:31]
  assign SaturatingCounter_154_clock = clock;
  assign SaturatingCounter_154_reset = reset;
  assign SaturatingCounter_154_io_enable = dut_io_coverage_102; // @[coverage.scala 106:31]
  assign SaturatingCounter_155_clock = clock;
  assign SaturatingCounter_155_reset = reset;
  assign SaturatingCounter_155_io_enable = ~dut_io_coverage_102; // @[coverage.scala 108:31]
  assign SaturatingCounter_156_clock = clock;
  assign SaturatingCounter_156_reset = reset;
  assign SaturatingCounter_156_io_enable = dut_io_coverage_103; // @[coverage.scala 106:31]
  assign SaturatingCounter_157_clock = clock;
  assign SaturatingCounter_157_reset = reset;
  assign SaturatingCounter_157_io_enable = ~dut_io_coverage_103; // @[coverage.scala 108:31]
  assign SaturatingCounter_158_clock = clock;
  assign SaturatingCounter_158_reset = reset;
  assign SaturatingCounter_158_io_enable = dut_io_coverage_104; // @[coverage.scala 106:31]
  assign SaturatingCounter_159_clock = clock;
  assign SaturatingCounter_159_reset = reset;
  assign SaturatingCounter_159_io_enable = ~dut_io_coverage_104; // @[coverage.scala 108:31]
  assign SaturatingCounter_160_clock = clock;
  assign SaturatingCounter_160_reset = reset;
  assign SaturatingCounter_160_io_enable = dut_io_coverage_105; // @[coverage.scala 106:31]
  assign SaturatingCounter_161_clock = clock;
  assign SaturatingCounter_161_reset = reset;
  assign SaturatingCounter_161_io_enable = ~dut_io_coverage_105; // @[coverage.scala 108:31]
  assign SaturatingCounter_162_clock = clock;
  assign SaturatingCounter_162_reset = reset;
  assign SaturatingCounter_162_io_enable = dut_io_coverage_106; // @[coverage.scala 106:31]
  assign SaturatingCounter_163_clock = clock;
  assign SaturatingCounter_163_reset = reset;
  assign SaturatingCounter_163_io_enable = ~dut_io_coverage_106; // @[coverage.scala 108:31]
  assign SaturatingCounter_164_clock = clock;
  assign SaturatingCounter_164_reset = reset;
  assign SaturatingCounter_164_io_enable = dut_io_coverage_107; // @[coverage.scala 106:31]
  assign SaturatingCounter_165_clock = clock;
  assign SaturatingCounter_165_reset = reset;
  assign SaturatingCounter_165_io_enable = ~dut_io_coverage_107; // @[coverage.scala 108:31]
  assign SaturatingCounter_166_clock = clock;
  assign SaturatingCounter_166_reset = reset;
  assign SaturatingCounter_166_io_enable = dut_io_coverage_108; // @[coverage.scala 106:31]
  assign SaturatingCounter_167_clock = clock;
  assign SaturatingCounter_167_reset = reset;
  assign SaturatingCounter_167_io_enable = ~dut_io_coverage_108; // @[coverage.scala 108:31]
  assign SaturatingCounter_168_clock = clock;
  assign SaturatingCounter_168_reset = reset;
  assign SaturatingCounter_168_io_enable = dut_io_coverage_109; // @[coverage.scala 106:31]
  assign SaturatingCounter_169_clock = clock;
  assign SaturatingCounter_169_reset = reset;
  assign SaturatingCounter_169_io_enable = ~dut_io_coverage_109; // @[coverage.scala 108:31]
  assign SaturatingCounter_170_clock = clock;
  assign SaturatingCounter_170_reset = reset;
  assign SaturatingCounter_170_io_enable = dut_io_coverage_110; // @[coverage.scala 106:31]
  assign SaturatingCounter_171_clock = clock;
  assign SaturatingCounter_171_reset = reset;
  assign SaturatingCounter_171_io_enable = ~dut_io_coverage_110; // @[coverage.scala 108:31]
  assign SaturatingCounter_172_clock = clock;
  assign SaturatingCounter_172_reset = reset;
  assign SaturatingCounter_172_io_enable = dut_io_coverage_111; // @[coverage.scala 106:31]
  assign SaturatingCounter_173_clock = clock;
  assign SaturatingCounter_173_reset = reset;
  assign SaturatingCounter_173_io_enable = ~dut_io_coverage_111; // @[coverage.scala 108:31]
  assign SaturatingCounter_174_clock = clock;
  assign SaturatingCounter_174_reset = reset;
  assign SaturatingCounter_174_io_enable = dut_io_coverage_112; // @[coverage.scala 106:31]
  assign SaturatingCounter_175_clock = clock;
  assign SaturatingCounter_175_reset = reset;
  assign SaturatingCounter_175_io_enable = ~dut_io_coverage_112; // @[coverage.scala 108:31]
  assign SaturatingCounter_176_clock = clock;
  assign SaturatingCounter_176_reset = reset;
  assign SaturatingCounter_176_io_enable = dut_io_coverage_113; // @[coverage.scala 106:31]
  assign SaturatingCounter_177_clock = clock;
  assign SaturatingCounter_177_reset = reset;
  assign SaturatingCounter_177_io_enable = ~dut_io_coverage_113; // @[coverage.scala 108:31]
  assign SaturatingCounter_178_clock = clock;
  assign SaturatingCounter_178_reset = reset;
  assign SaturatingCounter_178_io_enable = dut_io_coverage_114; // @[coverage.scala 106:31]
  assign SaturatingCounter_179_clock = clock;
  assign SaturatingCounter_179_reset = reset;
  assign SaturatingCounter_179_io_enable = ~dut_io_coverage_114; // @[coverage.scala 108:31]
  assign SaturatingCounter_180_clock = clock;
  assign SaturatingCounter_180_reset = reset;
  assign SaturatingCounter_180_io_enable = dut_io_coverage_115; // @[coverage.scala 106:31]
  assign SaturatingCounter_181_clock = clock;
  assign SaturatingCounter_181_reset = reset;
  assign SaturatingCounter_181_io_enable = ~dut_io_coverage_115; // @[coverage.scala 108:31]
  assign SaturatingCounter_182_clock = clock;
  assign SaturatingCounter_182_reset = reset;
  assign SaturatingCounter_182_io_enable = dut_io_coverage_116; // @[coverage.scala 106:31]
  assign SaturatingCounter_183_clock = clock;
  assign SaturatingCounter_183_reset = reset;
  assign SaturatingCounter_183_io_enable = ~dut_io_coverage_116; // @[coverage.scala 108:31]
  assign SaturatingCounter_184_clock = clock;
  assign SaturatingCounter_184_reset = reset;
  assign SaturatingCounter_184_io_enable = dut_io_coverage_117; // @[coverage.scala 106:31]
  assign SaturatingCounter_185_clock = clock;
  assign SaturatingCounter_185_reset = reset;
  assign SaturatingCounter_185_io_enable = ~dut_io_coverage_117; // @[coverage.scala 108:31]
  assign SaturatingCounter_186_clock = clock;
  assign SaturatingCounter_186_reset = reset;
  assign SaturatingCounter_186_io_enable = dut_io_coverage_118; // @[coverage.scala 106:31]
  assign SaturatingCounter_187_clock = clock;
  assign SaturatingCounter_187_reset = reset;
  assign SaturatingCounter_187_io_enable = ~dut_io_coverage_118; // @[coverage.scala 108:31]
  assign SaturatingCounter_188_clock = clock;
  assign SaturatingCounter_188_reset = reset;
  assign SaturatingCounter_188_io_enable = dut_io_coverage_119; // @[coverage.scala 106:31]
  assign SaturatingCounter_189_clock = clock;
  assign SaturatingCounter_189_reset = reset;
  assign SaturatingCounter_189_io_enable = ~dut_io_coverage_119; // @[coverage.scala 108:31]
  assign SaturatingCounter_190_clock = clock;
  assign SaturatingCounter_190_reset = reset;
  assign SaturatingCounter_190_io_enable = dut_io_coverage_120; // @[coverage.scala 106:31]
  assign SaturatingCounter_191_clock = clock;
  assign SaturatingCounter_191_reset = reset;
  assign SaturatingCounter_191_io_enable = ~dut_io_coverage_120; // @[coverage.scala 108:31]
  assign SaturatingCounter_192_clock = clock;
  assign SaturatingCounter_192_reset = reset;
  assign SaturatingCounter_192_io_enable = dut_io_coverage_121; // @[coverage.scala 106:31]
  assign SaturatingCounter_193_clock = clock;
  assign SaturatingCounter_193_reset = reset;
  assign SaturatingCounter_193_io_enable = ~dut_io_coverage_121; // @[coverage.scala 108:31]
  assign SaturatingCounter_194_clock = clock;
  assign SaturatingCounter_194_reset = reset;
  assign SaturatingCounter_194_io_enable = dut_io_coverage_122; // @[coverage.scala 106:31]
  assign SaturatingCounter_195_clock = clock;
  assign SaturatingCounter_195_reset = reset;
  assign SaturatingCounter_195_io_enable = ~dut_io_coverage_122; // @[coverage.scala 108:31]
  assign SaturatingCounter_196_clock = clock;
  assign SaturatingCounter_196_reset = reset;
  assign SaturatingCounter_196_io_enable = dut_io_coverage_123; // @[coverage.scala 106:31]
  assign SaturatingCounter_197_clock = clock;
  assign SaturatingCounter_197_reset = reset;
  assign SaturatingCounter_197_io_enable = ~dut_io_coverage_123; // @[coverage.scala 108:31]
  assign SaturatingCounter_198_clock = clock;
  assign SaturatingCounter_198_reset = reset;
  assign SaturatingCounter_198_io_enable = dut_io_coverage_124; // @[coverage.scala 106:31]
  assign SaturatingCounter_199_clock = clock;
  assign SaturatingCounter_199_reset = reset;
  assign SaturatingCounter_199_io_enable = ~dut_io_coverage_124; // @[coverage.scala 108:31]
endmodule
