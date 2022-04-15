module TLI2CTop(
  input          clock,
  // inputs to the TLI2C
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [1:0]   auto_in_a_bits_size,
  input  [6:0]   auto_in_a_bits_source,
  input  [28:0]  auto_in_a_bits_address,
  input  [3:0]   auto_in_a_bits_mask,
  input  [31:0]  auto_in_a_bits_data,
  input          auto_in_b_ready,
  input          auto_in_c_valid,
  input  [2:0]   auto_in_c_bits_opcode,
  input  [2:0]   auto_in_c_bits_param,
  input  [1:0]   auto_in_c_bits_size,
  input  [6:0]   auto_in_c_bits_source,
  input  [28:0]  auto_in_c_bits_address,
  input  [31:0]  auto_in_c_bits_data,
  input          auto_in_c_bits_error,
  input          auto_in_d_ready,
  input          auto_in_e_valid,
  input          auto_in_e_bits_sink,
  input          io_port_scl_in,
  input          io_port_sda_in
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
wire [250:0] auto_cover_out; // only some wires are actually used!
wire io_coverage_49;
wire io_coverage_50;
wire io_coverage_51;
wire io_coverage_52;
wire io_coverage_53;
wire io_coverage_54;
wire io_coverage_55;
wire io_coverage_56;
wire io_coverage_57;
wire io_coverage_58;
wire io_coverage_59;
wire io_coverage_60;
wire io_coverage_61;
wire io_coverage_62;
wire io_coverage_63;
wire io_coverage_64;
wire io_coverage_65;
wire io_coverage_66;
wire io_coverage_67;
wire io_coverage_68;
wire io_coverage_69;
wire io_coverage_70;
wire io_coverage_71;
wire io_coverage_72;
wire io_coverage_73;
wire io_coverage_74;
wire io_coverage_75;
wire io_coverage_76;
wire io_coverage_77;
wire io_coverage_78;
wire io_coverage_79;
wire io_coverage_80;
wire io_coverage_81;
wire io_coverage_82;
wire io_coverage_83;
wire io_coverage_84;
wire io_coverage_85;
wire io_coverage_86;
wire io_coverage_87;
wire io_coverage_88;
wire io_coverage_89;
wire io_coverage_90;
wire io_coverage_91;
wire io_coverage_92;
wire io_coverage_93;
wire io_coverage_94;
wire io_coverage_95;
wire io_coverage_96;
wire io_coverage_97;
wire io_coverage_98;
wire io_coverage_99;
wire io_coverage_100;
wire io_coverage_101;
wire io_coverage_102;
wire io_coverage_103;
wire io_coverage_104;
wire io_coverage_105;
wire io_coverage_106;
wire io_coverage_107;
wire io_coverage_108;
wire io_coverage_109;
wire io_coverage_110;
wire io_coverage_111;
wire io_coverage_112;
wire io_coverage_113;
wire io_coverage_114;
wire io_coverage_115;
wire io_coverage_116;
wire io_coverage_117;
wire io_coverage_118;
wire io_coverage_119;
wire io_coverage_120;
wire io_coverage_121;
wire io_coverage_122;
wire io_coverage_123;
wire io_coverage_124;

assign io_coverage_49 = assert_out[0]; // @[DUT.scala 51:33]
assign io_coverage_50 = auto_cover_out[250]; // @[DUT.scala 51:33]
assign io_coverage_51 = auto_cover_out[249]; // @[DUT.scala 51:33]
assign io_coverage_52 = auto_cover_out[246]; // @[DUT.scala 51:33]
assign io_coverage_53 = auto_cover_out[245]; // @[DUT.scala 51:33]
assign io_coverage_54 = auto_cover_out[244]; // @[DUT.scala 51:33]
assign io_coverage_55 = auto_cover_out[243]; // @[DUT.scala 51:33]
assign io_coverage_56 = auto_cover_out[242]; // @[DUT.scala 51:33]
assign io_coverage_57 = auto_cover_out[241]; // @[DUT.scala 51:33]
assign io_coverage_58 = auto_cover_out[240]; // @[DUT.scala 51:33]
assign io_coverage_59 = auto_cover_out[239]; // @[DUT.scala 51:33]
assign io_coverage_60 = auto_cover_out[235]; // @[DUT.scala 51:33]
assign io_coverage_61 = auto_cover_out[232]; // @[DUT.scala 51:33]
assign io_coverage_62 = auto_cover_out[228]; // @[DUT.scala 51:33]
assign io_coverage_63 = auto_cover_out[223]; // @[DUT.scala 51:33]
assign io_coverage_64 = auto_cover_out[220]; // @[DUT.scala 51:33]
assign io_coverage_65 = auto_cover_out[217]; // @[DUT.scala 51:33]
assign io_coverage_66 = auto_cover_out[214]; // @[DUT.scala 51:33]
assign io_coverage_67 = auto_cover_out[210]; // @[DUT.scala 51:33]
assign io_coverage_68 = auto_cover_out[208]; // @[DUT.scala 51:33]
assign io_coverage_69 = auto_cover_out[204]; // @[DUT.scala 51:33]
assign io_coverage_70 = auto_cover_out[200]; // @[DUT.scala 51:33]
assign io_coverage_71 = auto_cover_out[195]; // @[DUT.scala 51:33]
assign io_coverage_72 = auto_cover_out[191]; // @[DUT.scala 51:33]
assign io_coverage_73 = auto_cover_out[187]; // @[DUT.scala 51:33]
assign io_coverage_74 = auto_cover_out[183]; // @[DUT.scala 51:33]
assign io_coverage_75 = auto_cover_out[180]; // @[DUT.scala 51:33]
assign io_coverage_76 = auto_cover_out[176]; // @[DUT.scala 51:33]
assign io_coverage_77 = auto_cover_out[167]; // @[DUT.scala 51:33]
assign io_coverage_78 = auto_cover_out[164]; // @[DUT.scala 51:33]
assign io_coverage_79 = auto_cover_out[163]; // @[DUT.scala 51:33]
assign io_coverage_80 = auto_cover_out[160]; // @[DUT.scala 51:33]
assign io_coverage_81 = auto_cover_out[158]; // @[DUT.scala 51:33]
assign io_coverage_82 = auto_cover_out[156]; // @[DUT.scala 51:33]
assign io_coverage_83 = auto_cover_out[154]; // @[DUT.scala 51:33]
assign io_coverage_84 = auto_cover_out[150]; // @[DUT.scala 51:33]
assign io_coverage_85 = auto_cover_out[148]; // @[DUT.scala 51:33]
assign io_coverage_86 = auto_cover_out[138]; // @[DUT.scala 51:33]
assign io_coverage_87 = auto_cover_out[130]; // @[DUT.scala 51:33]
assign io_coverage_88 = auto_cover_out[128]; // @[DUT.scala 51:33]
assign io_coverage_89 = auto_cover_out[123]; // @[DUT.scala 51:33]
assign io_coverage_90 = auto_cover_out[118]; // @[DUT.scala 51:33]
assign io_coverage_91 = auto_cover_out[112]; // @[DUT.scala 51:33]
assign io_coverage_92 = auto_cover_out[106]; // @[DUT.scala 51:33]
assign io_coverage_93 = auto_cover_out[92]; // @[DUT.scala 51:33]
assign io_coverage_94 = auto_cover_out[91]; // @[DUT.scala 51:33]
assign io_coverage_95 = auto_cover_out[90]; // @[DUT.scala 51:33]
assign io_coverage_96 = auto_cover_out[89]; // @[DUT.scala 51:33]
assign io_coverage_97 = auto_cover_out[88]; // @[DUT.scala 51:33]
assign io_coverage_98 = auto_cover_out[87]; // @[DUT.scala 51:33]
assign io_coverage_99 = auto_cover_out[83]; // @[DUT.scala 51:33]
assign io_coverage_100 = auto_cover_out[80]; // @[DUT.scala 51:33]
assign io_coverage_101 = auto_cover_out[79]; // @[DUT.scala 51:33]
assign io_coverage_102 = auto_cover_out[78]; // @[DUT.scala 51:33]
assign io_coverage_103 = auto_cover_out[77]; // @[DUT.scala 51:33]
assign io_coverage_104 = auto_cover_out[76]; // @[DUT.scala 51:33]
assign io_coverage_105 = auto_cover_out[75]; // @[DUT.scala 51:33]
assign io_coverage_106 = auto_cover_out[74]; // @[DUT.scala 51:33]
assign io_coverage_107 = auto_cover_out[72]; // @[DUT.scala 51:33]
assign io_coverage_108 = auto_cover_out[71]; // @[DUT.scala 51:33]
assign io_coverage_109 = auto_cover_out[70]; // @[DUT.scala 51:33]
assign io_coverage_110 = auto_cover_out[64]; // @[DUT.scala 51:33]
assign io_coverage_111 = auto_cover_out[63]; // @[DUT.scala 51:33]
assign io_coverage_112 = auto_cover_out[62]; // @[DUT.scala 51:33]
assign io_coverage_113 = auto_cover_out[61]; // @[DUT.scala 51:33]
assign io_coverage_114 = auto_cover_out[34]; // @[DUT.scala 51:33]
assign io_coverage_115 = auto_cover_out[22]; // @[DUT.scala 51:33]
assign io_coverage_116 = auto_cover_out[21]; // @[DUT.scala 51:33]
assign io_coverage_117 = auto_cover_out[20]; // @[DUT.scala 51:33]
assign io_coverage_118 = auto_cover_out[19]; // @[DUT.scala 51:33]
assign io_coverage_119 = auto_cover_out[18]; // @[DUT.scala 51:33]
assign io_coverage_120 = auto_cover_out[16]; // @[DUT.scala 51:33]
assign io_coverage_121 = auto_cover_out[14]; // @[DUT.scala 51:33]
assign io_coverage_122 = auto_cover_out[13]; // @[DUT.scala 51:33]
assign io_coverage_123 = auto_cover_out[11]; // @[DUT.scala 51:33]
assign io_coverage_124 = auto_cover_out[5]; // @[DUT.scala 51:33]




always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        cover( io_coverage_49 );
        cover(!io_coverage_49 );
        cover( io_coverage_50 );
        cover(!io_coverage_50 );
        cover( io_coverage_51 );
        cover(!io_coverage_51 );
        cover( io_coverage_52 );
        cover(!io_coverage_52 );
        cover( io_coverage_53 );
        cover(!io_coverage_53 );
        cover( io_coverage_54 );
        cover(!io_coverage_54 );
        cover( io_coverage_55 );
        cover(!io_coverage_55 );
        cover( io_coverage_56 );
        cover(!io_coverage_56 );
        cover( io_coverage_57 );
        cover(!io_coverage_57 );
        cover( io_coverage_58 );
        cover(!io_coverage_58 );
        cover( io_coverage_59 );
        cover(!io_coverage_59 );
        cover( io_coverage_60 );
        cover(!io_coverage_60 );
        cover( io_coverage_61 );
        cover(!io_coverage_61 );
        cover( io_coverage_62 );
        cover(!io_coverage_62 );
        cover( io_coverage_63 );
        cover(!io_coverage_63 );
        cover( io_coverage_64 );
        cover(!io_coverage_64 );
        cover( io_coverage_65 );
        cover(!io_coverage_65 );
        cover( io_coverage_66 );
        cover(!io_coverage_66 );
        cover( io_coverage_67 );
        cover(!io_coverage_67 );
        cover( io_coverage_68 );
        cover(!io_coverage_68 );
        cover( io_coverage_69 );
        cover(!io_coverage_69 );
        cover( io_coverage_70 );
        cover(!io_coverage_70 );
        cover( io_coverage_71 );
        cover(!io_coverage_71 );
        cover( io_coverage_72 );
        cover(!io_coverage_72 );
        cover( io_coverage_73 );
        cover(!io_coverage_73 );
        cover( io_coverage_74 );
        cover(!io_coverage_74 );
        cover( io_coverage_75 );
        cover(!io_coverage_75 );
        cover( io_coverage_76 );
        cover(!io_coverage_76 );
        cover( io_coverage_77 );
        cover(!io_coverage_77 );
        cover( io_coverage_78 );
        cover(!io_coverage_78 );
        cover( io_coverage_79 );
        cover(!io_coverage_79 );
        cover( io_coverage_80 );
        cover(!io_coverage_80 );
        cover( io_coverage_81 );
        cover(!io_coverage_81 );
        cover( io_coverage_82 );
        cover(!io_coverage_82 );
        cover( io_coverage_83 );
        cover(!io_coverage_83 );
        cover( io_coverage_84 );
        cover(!io_coverage_84 );
        cover( io_coverage_85 );
        cover(!io_coverage_85 );
        cover( io_coverage_86 );
        cover(!io_coverage_86 );
        cover( io_coverage_87 );
        cover(!io_coverage_87 );
        cover( io_coverage_88 );
        cover(!io_coverage_88 );
        cover( io_coverage_89 );
        cover(!io_coverage_89 );
        cover( io_coverage_90 );
        cover(!io_coverage_90 );
        cover( io_coverage_91 );
        cover(!io_coverage_91 );
        cover( io_coverage_92 );
        cover(!io_coverage_92 );
        cover( io_coverage_93 );
        cover(!io_coverage_93 );
        cover( io_coverage_94 );
        cover(!io_coverage_94 );
        cover( io_coverage_95 );
        cover(!io_coverage_95 );
        cover( io_coverage_96 );
        cover(!io_coverage_96 );
        cover( io_coverage_97 );
        cover(!io_coverage_97 );
        cover( io_coverage_98 );
        cover(!io_coverage_98 );
        cover( io_coverage_99 );
        cover(!io_coverage_99 );
        cover( io_coverage_100);
        cover(!io_coverage_100);
        cover( io_coverage_101);
        cover(!io_coverage_101);
        cover( io_coverage_102);
        cover(!io_coverage_102);
        cover( io_coverage_103);
        cover(!io_coverage_103);
        cover( io_coverage_104);
        cover(!io_coverage_104);
        cover( io_coverage_105);
        cover(!io_coverage_105);
        cover( io_coverage_106);
        cover(!io_coverage_106);
        cover( io_coverage_107);
        cover(!io_coverage_107);
        cover( io_coverage_108);
        cover(!io_coverage_108);
        cover( io_coverage_109);
        cover(!io_coverage_109);
        cover( io_coverage_110);
        cover(!io_coverage_110);
        cover( io_coverage_111);
        cover(!io_coverage_111);
        cover( io_coverage_112);
        cover(!io_coverage_112);
        cover( io_coverage_113);
        cover(!io_coverage_113);
        cover( io_coverage_114);
        cover(!io_coverage_114);
        cover( io_coverage_115);
        cover(!io_coverage_115);
        cover( io_coverage_116);
        cover(!io_coverage_116);
        cover( io_coverage_117);
        cover(!io_coverage_117);
        cover( io_coverage_118);
        cover(!io_coverage_118);
        cover( io_coverage_119);
        cover(!io_coverage_119);
        cover( io_coverage_120);
        cover(!io_coverage_120);
        cover( io_coverage_121);
        cover(!io_coverage_121);
        cover( io_coverage_122);
        cover(!io_coverage_122);
        cover( io_coverage_123);
        cover(!io_coverage_123);
        cover( io_coverage_124);
        cover(!io_coverage_124);
    end
end
  
// assume that no assertion is violated
wire [51:0]  assert_out;
always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        assume(assert_out == 52'd0);
    end
end

// dut instance
TLI2C bb ( // @[DUT.scala 29:24]
    .auto_cover_out(auto_cover_out),
    .assert_out(assert_out),
    .io_port_sda_in(io_port_sda_in),
    .io_port_scl_in(io_port_scl_in),
    .auto_in_e_bits_sink(auto_in_e_bits_sink),
    .auto_in_e_valid(auto_in_e_valid),
    .auto_in_d_ready(auto_in_d_ready),
    .auto_in_c_bits_error(auto_in_c_bits_error),
    .auto_in_c_valid(auto_in_c_valid),
    .auto_in_b_ready(auto_in_b_ready),
    .auto_in_a_valid(auto_in_a_valid),
    .auto_in_c_bits_size(auto_in_c_bits_size),
    .auto_in_a_bits_size(auto_in_a_bits_size),
    .auto_in_c_bits_param(auto_in_c_bits_param),
    .auto_in_c_bits_opcode(auto_in_c_bits_opcode),
    .auto_in_a_bits_param(auto_in_a_bits_param),
    .auto_in_a_bits_opcode(auto_in_a_bits_opcode),
    .auto_in_a_bits_mask(auto_in_a_bits_mask),
    .auto_in_c_bits_source(auto_in_c_bits_source),
    .auto_in_a_bits_source(auto_in_a_bits_source),
    .auto_in_c_bits_address(auto_in_c_bits_address),
    .auto_in_a_bits_address(auto_in_a_bits_address),
    .auto_in_c_bits_data(auto_in_c_bits_data),
    .auto_in_a_bits_data(auto_in_a_bits_data),
    .metaReset(is_meta_reset_phase),
    .reset(is_reset_phase | is_meta_reset_phase),
    .clock(clock)
  );


endmodule