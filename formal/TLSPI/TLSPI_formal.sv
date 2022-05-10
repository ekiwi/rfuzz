module TLSPITop(
  input          clock,
  input  [166:0] io_inputs
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
wire [283:0] bb_auto_cover_out; // only some wires are actually used!
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
wire io_coverage_125;
wire io_coverage_126;
wire io_coverage_127;
wire io_coverage_128;
wire io_coverage_129;
wire io_coverage_130;
wire io_coverage_131;
wire io_coverage_132;
wire io_coverage_133;
wire io_coverage_134;
wire io_coverage_135;
wire io_coverage_136;
wire io_coverage_137;
wire io_coverage_138;
wire io_coverage_139;
wire io_coverage_140;
wire io_coverage_141;
wire io_coverage_142;
wire io_coverage_143;
wire io_coverage_144;
wire io_coverage_145;
wire io_coverage_146;
wire io_coverage_147;
wire io_coverage_148;
wire io_coverage_149;
wire io_coverage_150;
wire io_coverage_151;
wire io_coverage_152;
wire io_coverage_153;
wire io_coverage_154;
wire io_coverage_155;


assign io_coverage_50 = bb_auto_cover_out[283]; // @[DUT.scala 51:33]
  assign io_coverage_51 = bb_auto_cover_out[282]; // @[DUT.scala 51:33]
  assign io_coverage_52 = bb_auto_cover_out[281]; // @[DUT.scala 51:33]
  assign io_coverage_53 = bb_auto_cover_out[280]; // @[DUT.scala 51:33]
  assign io_coverage_54 = bb_auto_cover_out[279]; // @[DUT.scala 51:33]
  assign io_coverage_55 = bb_auto_cover_out[278]; // @[DUT.scala 51:33]
  assign io_coverage_56 = bb_auto_cover_out[277]; // @[DUT.scala 51:33]
  assign io_coverage_57 = bb_auto_cover_out[276]; // @[DUT.scala 51:33]
  assign io_coverage_58 = bb_auto_cover_out[275]; // @[DUT.scala 51:33]
  assign io_coverage_59 = bb_auto_cover_out[274]; // @[DUT.scala 51:33]
  assign io_coverage_60 = bb_auto_cover_out[273]; // @[DUT.scala 51:33]
  assign io_coverage_61 = bb_auto_cover_out[272]; // @[DUT.scala 51:33]
  assign io_coverage_62 = bb_auto_cover_out[271]; // @[DUT.scala 51:33]
  assign io_coverage_63 = bb_auto_cover_out[270]; // @[DUT.scala 51:33]
  assign io_coverage_64 = bb_auto_cover_out[269]; // @[DUT.scala 51:33]
  assign io_coverage_65 = bb_auto_cover_out[268]; // @[DUT.scala 51:33]
  assign io_coverage_66 = bb_auto_cover_out[267]; // @[DUT.scala 51:33]
  assign io_coverage_67 = bb_auto_cover_out[266]; // @[DUT.scala 51:33]
  assign io_coverage_68 = bb_auto_cover_out[265]; // @[DUT.scala 51:33]
  assign io_coverage_69 = bb_auto_cover_out[264]; // @[DUT.scala 51:33]
  assign io_coverage_70 = bb_auto_cover_out[263]; // @[DUT.scala 51:33]
  assign io_coverage_71 = bb_auto_cover_out[262]; // @[DUT.scala 51:33]
  assign io_coverage_72 = bb_auto_cover_out[261]; // @[DUT.scala 51:33]
  assign io_coverage_73 = bb_auto_cover_out[260]; // @[DUT.scala 51:33]
  assign io_coverage_74 = bb_auto_cover_out[259]; // @[DUT.scala 51:33]
  assign io_coverage_75 = bb_auto_cover_out[258]; // @[DUT.scala 51:33]
  assign io_coverage_76 = bb_auto_cover_out[257]; // @[DUT.scala 51:33]
  assign io_coverage_77 = bb_auto_cover_out[256]; // @[DUT.scala 51:33]
  assign io_coverage_78 = bb_auto_cover_out[255]; // @[DUT.scala 51:33]
  assign io_coverage_79 = bb_auto_cover_out[254]; // @[DUT.scala 51:33]
  assign io_coverage_80 = bb_auto_cover_out[253]; // @[DUT.scala 51:33]
  assign io_coverage_81 = bb_auto_cover_out[252]; // @[DUT.scala 51:33]
  assign io_coverage_82 = bb_auto_cover_out[251]; // @[DUT.scala 51:33]
  assign io_coverage_83 = bb_auto_cover_out[250]; // @[DUT.scala 51:33]
  assign io_coverage_84 = bb_auto_cover_out[249]; // @[DUT.scala 51:33]
  assign io_coverage_85 = bb_auto_cover_out[248]; // @[DUT.scala 51:33]
  assign io_coverage_86 = bb_auto_cover_out[247]; // @[DUT.scala 51:33]
  assign io_coverage_87 = bb_auto_cover_out[246]; // @[DUT.scala 51:33]
  assign io_coverage_88 = bb_auto_cover_out[244]; // @[DUT.scala 51:33]
  assign io_coverage_89 = bb_auto_cover_out[243]; // @[DUT.scala 51:33]
  assign io_coverage_90 = bb_auto_cover_out[239]; // @[DUT.scala 51:33]
  assign io_coverage_91 = bb_auto_cover_out[238]; // @[DUT.scala 51:33]
  assign io_coverage_92 = bb_auto_cover_out[237]; // @[DUT.scala 51:33]
  assign io_coverage_93 = bb_auto_cover_out[234]; // @[DUT.scala 51:33]
  assign io_coverage_94 = bb_auto_cover_out[233]; // @[DUT.scala 51:33]
  assign io_coverage_95 = bb_auto_cover_out[232]; // @[DUT.scala 51:33]
  assign io_coverage_96 = bb_auto_cover_out[231]; // @[DUT.scala 51:33]
  assign io_coverage_97 = bb_auto_cover_out[229]; // @[DUT.scala 51:33]
  assign io_coverage_98 = bb_auto_cover_out[224]; // @[DUT.scala 51:33]
  assign io_coverage_99 = bb_auto_cover_out[223]; // @[DUT.scala 51:33]
  assign io_coverage_100 = bb_auto_cover_out[222]; // @[DUT.scala 51:33]
  assign io_coverage_101 = bb_auto_cover_out[221]; // @[DUT.scala 51:33]
  assign io_coverage_102 = bb_auto_cover_out[220]; // @[DUT.scala 51:33]
  assign io_coverage_103 = bb_auto_cover_out[219]; // @[DUT.scala 51:33]
  assign io_coverage_104 = bb_auto_cover_out[216]; // @[DUT.scala 51:33]
  assign io_coverage_105 = bb_auto_cover_out[215]; // @[DUT.scala 51:33]
  assign io_coverage_106 = bb_auto_cover_out[214]; // @[DUT.scala 51:33]
  assign io_coverage_107 = bb_auto_cover_out[196]; // @[DUT.scala 51:33]
  assign io_coverage_108 = bb_auto_cover_out[195]; // @[DUT.scala 51:33]
  assign io_coverage_109 = bb_auto_cover_out[194]; // @[DUT.scala 51:33]
  assign io_coverage_110 = bb_auto_cover_out[193]; // @[DUT.scala 51:33]
  assign io_coverage_111 = bb_auto_cover_out[192]; // @[DUT.scala 51:33]
  assign io_coverage_112 = bb_auto_cover_out[190]; // @[DUT.scala 51:33]
  assign io_coverage_113 = bb_auto_cover_out[187]; // @[DUT.scala 51:33]
  assign io_coverage_114 = bb_auto_cover_out[185]; // @[DUT.scala 51:33]
  assign io_coverage_115 = bb_auto_cover_out[179]; // @[DUT.scala 51:33]
  assign io_coverage_116 = bb_auto_cover_out[173]; // @[DUT.scala 51:33]
  assign io_coverage_117 = bb_auto_cover_out[172]; // @[DUT.scala 51:33]
  assign io_coverage_118 = bb_auto_cover_out[171]; // @[DUT.scala 51:33]
  assign io_coverage_119 = bb_auto_cover_out[170]; // @[DUT.scala 51:33]
  assign io_coverage_120 = bb_auto_cover_out[169]; // @[DUT.scala 51:33]
  assign io_coverage_121 = bb_auto_cover_out[166]; // @[DUT.scala 51:33]
  assign io_coverage_122 = bb_auto_cover_out[165]; // @[DUT.scala 51:33]
  assign io_coverage_123 = bb_auto_cover_out[164]; // @[DUT.scala 51:33]
  assign io_coverage_124 = bb_auto_cover_out[155]; // @[DUT.scala 51:33]
  assign io_coverage_125 = bb_auto_cover_out[146]; // @[DUT.scala 51:33]
  assign io_coverage_126 = bb_auto_cover_out[134]; // @[DUT.scala 51:33]
  assign io_coverage_127 = bb_auto_cover_out[128]; // @[DUT.scala 51:33]
  assign io_coverage_128 = bb_auto_cover_out[120]; // @[DUT.scala 51:33]
  assign io_coverage_129 = bb_auto_cover_out[110]; // @[DUT.scala 51:33]
  assign io_coverage_130 = bb_auto_cover_out[94]; // @[DUT.scala 51:33]
  assign io_coverage_131 = bb_auto_cover_out[93]; // @[DUT.scala 51:33]
  assign io_coverage_132 = bb_auto_cover_out[92]; // @[DUT.scala 51:33]
  assign io_coverage_133 = bb_auto_cover_out[82]; // @[DUT.scala 51:33]
  assign io_coverage_134 = bb_auto_cover_out[81]; // @[DUT.scala 51:33]
  assign io_coverage_135 = bb_auto_cover_out[80]; // @[DUT.scala 51:33]
  assign io_coverage_136 = bb_auto_cover_out[79]; // @[DUT.scala 51:33]
  assign io_coverage_137 = bb_auto_cover_out[74]; // @[DUT.scala 51:33]
  assign io_coverage_138 = bb_auto_cover_out[73]; // @[DUT.scala 51:33]
  assign io_coverage_139 = bb_auto_cover_out[72]; // @[DUT.scala 51:33]
  assign io_coverage_140 = bb_auto_cover_out[71]; // @[DUT.scala 51:33]
  assign io_coverage_141 = bb_auto_cover_out[70]; // @[DUT.scala 51:33]
  assign io_coverage_142 = bb_auto_cover_out[68]; // @[DUT.scala 51:33]
  assign io_coverage_143 = bb_auto_cover_out[67]; // @[DUT.scala 51:33]
  assign io_coverage_144 = bb_auto_cover_out[66]; // @[DUT.scala 51:33]
  assign io_coverage_145 = bb_auto_cover_out[65]; // @[DUT.scala 51:33]
  assign io_coverage_146 = bb_auto_cover_out[63]; // @[DUT.scala 51:33]
  assign io_coverage_147 = bb_auto_cover_out[62]; // @[DUT.scala 51:33]
  assign io_coverage_148 = bb_auto_cover_out[61]; // @[DUT.scala 51:33]
  assign io_coverage_149 = bb_auto_cover_out[60]; // @[DUT.scala 51:33]
  assign io_coverage_150 = bb_auto_cover_out[59]; // @[DUT.scala 51:33]
  assign io_coverage_151 = bb_auto_cover_out[49]; // @[DUT.scala 51:33]
  assign io_coverage_152 = bb_auto_cover_out[42]; // @[DUT.scala 51:33]
  assign io_coverage_153 = bb_auto_cover_out[38]; // @[DUT.scala 51:33]
  assign io_coverage_154 = bb_auto_cover_out[19]; // @[DUT.scala 51:33]
  assign io_coverage_155 = bb_auto_cover_out[4]; // @[DUT.scala 51:33]


always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
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
        cover( io_coverage_125 );
        cover(!io_coverage_125 );
        cover( io_coverage_126 );
        cover(!io_coverage_126 );
        cover( io_coverage_127 );
        cover(!io_coverage_127 );
        cover( io_coverage_128 );
        cover(!io_coverage_128 );
        cover( io_coverage_129 );
        cover(!io_coverage_129 );
        cover( io_coverage_130 );
        cover(!io_coverage_130 );
        cover( io_coverage_131 );
        cover(!io_coverage_131 );
        cover( io_coverage_132 );
        cover(!io_coverage_132 );
        cover( io_coverage_133 );
        cover(!io_coverage_133 );
        cover( io_coverage_134 );
        cover(!io_coverage_134 );
        cover( io_coverage_135 );
        cover(!io_coverage_135 );
        cover( io_coverage_136 );
        cover(!io_coverage_136 );
        cover( io_coverage_137 );
        cover(!io_coverage_137 );
        cover( io_coverage_138 );
        cover(!io_coverage_138 );
        cover( io_coverage_139 );
        cover(!io_coverage_139 );
        cover( io_coverage_140 );
        cover(!io_coverage_140 );
        cover( io_coverage_141 );
        cover(!io_coverage_141 );
        cover( io_coverage_142 );
        cover(!io_coverage_142 );
        cover( io_coverage_143 );
        cover(!io_coverage_143 );
        cover( io_coverage_144 );
        cover(!io_coverage_144 );
        cover( io_coverage_145 );
        cover(!io_coverage_145 );
        cover( io_coverage_146 );
        cover(!io_coverage_146 );
        cover( io_coverage_147 );
        cover(!io_coverage_147 );
        cover( io_coverage_148 );
        cover(!io_coverage_148 );
        cover( io_coverage_149 );
        cover(!io_coverage_149 );
        cover( io_coverage_150 );
        cover(!io_coverage_150 );
        cover( io_coverage_151 );
        cover(!io_coverage_151 );
        cover( io_coverage_152 );
        cover(!io_coverage_152 );
        cover( io_coverage_153 );
        cover(!io_coverage_153 );
        cover( io_coverage_154 );
        cover(!io_coverage_154 );
        cover( io_coverage_155 );
        cover(!io_coverage_155 );
    end
end
  
// assume that no assertion is violated
wire [51:0]  bb_assert_out;
always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        assume(bb_assert_out == 52'd0);
    end
end


// wire up the inputs
// bunching them together makes it easier to conver coverage traces
// into the same output format that the fuzzer uses
wire  bb_io_port_dq_3_i; // @[DUT.scala 29:24]
wire  bb_io_port_dq_2_i; // @[DUT.scala 29:24]
wire  bb_io_port_dq_1_i; // @[DUT.scala 29:24]
wire  bb_io_port_dq_0_i; // @[DUT.scala 29:24]
wire  bb_auto_r_in_e_bits_sink; // @[DUT.scala 29:24]
wire  bb_auto_r_in_e_valid; // @[DUT.scala 29:24]
wire  bb_auto_r_in_d_ready; // @[DUT.scala 29:24]
wire  bb_auto_r_in_c_bits_error; // @[DUT.scala 29:24]
wire  bb_auto_r_in_c_valid; // @[DUT.scala 29:24]
wire  bb_auto_r_in_b_ready; // @[DUT.scala 29:24]
wire  bb_auto_r_in_a_valid; // @[DUT.scala 29:24]
wire [1:0] bb_auto_r_in_c_bits_size; // @[DUT.scala 29:24]
wire [1:0] bb_auto_r_in_a_bits_size; // @[DUT.scala 29:24]
wire [2:0] bb_auto_r_in_c_bits_param; // @[DUT.scala 29:24]
wire [2:0] bb_auto_r_in_c_bits_opcode; // @[DUT.scala 29:24]
wire [2:0] bb_auto_r_in_a_bits_param; // @[DUT.scala 29:24]
wire [2:0] bb_auto_r_in_a_bits_opcode; // @[DUT.scala 29:24]
wire [3:0] bb_auto_r_in_a_bits_mask; // @[DUT.scala 29:24]
wire [6:0] bb_auto_r_in_c_bits_source; // @[DUT.scala 29:24]
wire [6:0] bb_auto_r_in_a_bits_source; // @[DUT.scala 29:24]
wire [28:0] bb_auto_r_in_c_bits_address; // @[DUT.scala 29:24]
wire [28:0] bb_auto_r_in_a_bits_address; // @[DUT.scala 29:24]
wire [31:0] bb_auto_r_in_c_bits_data; // @[DUT.scala 29:24]
wire [31:0] bb_auto_r_in_a_bits_data; // @[DUT.scala 29:24]
assign bb_io_port_dq_3_i = io_inputs[0]; // @[DUT.scala 40:25]
assign bb_io_port_dq_2_i = io_inputs[1]; // @[DUT.scala 40:25]
assign bb_io_port_dq_1_i = io_inputs[2]; // @[DUT.scala 40:25]
assign bb_io_port_dq_0_i = io_inputs[3]; // @[DUT.scala 40:25]
assign bb_auto_r_in_e_bits_sink = io_inputs[4]; // @[DUT.scala 40:25]
assign bb_auto_r_in_e_valid = io_inputs[5]; // @[DUT.scala 40:25]
assign bb_auto_r_in_d_ready = io_inputs[6]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_error = io_inputs[7]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_valid = io_inputs[8]; // @[DUT.scala 40:25]
assign bb_auto_r_in_b_ready = io_inputs[9]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_valid = io_inputs[10]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_size = io_inputs[12:11]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_size = io_inputs[14:13]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_param = io_inputs[17:15]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_opcode = io_inputs[20:18]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_param = io_inputs[23:21]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_opcode = io_inputs[26:24]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_mask = io_inputs[30:27]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_source = io_inputs[37:31]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_source = io_inputs[44:38]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_address = io_inputs[73:45]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_address = io_inputs[102:74]; // @[DUT.scala 40:25]
assign bb_auto_r_in_c_bits_data = io_inputs[134:103]; // @[DUT.scala 40:25]
assign bb_auto_r_in_a_bits_data = io_inputs[166:135]; // @[DUT.scala 40:25]


// dut instance
TLSPI bb ( // @[DUT.scala 29:24]
.auto_cover_out(bb_auto_cover_out),
.assert_out(bb_assert_out),
.io_port_dq_3_i(bb_io_port_dq_3_i),
.io_port_dq_2_i(bb_io_port_dq_2_i),
.io_port_dq_1_i(bb_io_port_dq_1_i),
.io_port_dq_0_i(bb_io_port_dq_0_i),
.auto_r_in_e_bits_sink(bb_auto_r_in_e_bits_sink),
.auto_r_in_e_valid(bb_auto_r_in_e_valid),
.auto_r_in_d_ready(bb_auto_r_in_d_ready),
.auto_r_in_c_bits_error(bb_auto_r_in_c_bits_error),
.auto_r_in_c_valid(bb_auto_r_in_c_valid),
.auto_r_in_b_ready(bb_auto_r_in_b_ready),
.auto_r_in_a_valid(bb_auto_r_in_a_valid),
.auto_r_in_c_bits_size(bb_auto_r_in_c_bits_size),
.auto_r_in_a_bits_size(bb_auto_r_in_a_bits_size),
.auto_r_in_c_bits_param(bb_auto_r_in_c_bits_param),
.auto_r_in_c_bits_opcode(bb_auto_r_in_c_bits_opcode),
.auto_r_in_a_bits_param(bb_auto_r_in_a_bits_param),
.auto_r_in_a_bits_opcode(bb_auto_r_in_a_bits_opcode),
.auto_r_in_a_bits_mask(bb_auto_r_in_a_bits_mask),
.auto_r_in_c_bits_source(bb_auto_r_in_c_bits_source),
.auto_r_in_a_bits_source(bb_auto_r_in_a_bits_source),
.auto_r_in_c_bits_address(bb_auto_r_in_c_bits_address),
.auto_r_in_a_bits_address(bb_auto_r_in_a_bits_address),
.auto_r_in_c_bits_data(bb_auto_r_in_c_bits_data),
.auto_r_in_a_bits_data(bb_auto_r_in_a_bits_data),
    .metaReset(is_meta_reset_phase),
    .reset(is_reset_phase | is_meta_reset_phase),
    .clock(clock)
  );


endmodule