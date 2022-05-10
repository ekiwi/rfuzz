module Sodor1StageTop(
  input          clock,
  input  [34:0] io_inputs
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
wire [609:0] bb_auto_cover_out; // only some wires are actually used!
wire io_coverage_0;
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
wire io_coverage_20;
wire io_coverage_21;
wire io_coverage_22;
wire io_coverage_23;
wire io_coverage_24;
wire io_coverage_25;
wire io_coverage_26;
wire io_coverage_27;
wire io_coverage_28;
wire io_coverage_29;
wire io_coverage_30;
wire io_coverage_31;
wire io_coverage_32;
wire io_coverage_33;
wire io_coverage_34;
wire io_coverage_35;
wire io_coverage_36;
wire io_coverage_37;
wire io_coverage_38;
wire io_coverage_39;
wire io_coverage_40;
wire io_coverage_41;
wire io_coverage_42;
wire io_coverage_43;
wire io_coverage_44;
wire io_coverage_45;
wire io_coverage_46;
wire io_coverage_47;
wire io_coverage_48;
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
wire io_coverage_156;
wire io_coverage_157;
wire io_coverage_158;
wire io_coverage_159;
wire io_coverage_160;
wire io_coverage_161;
wire io_coverage_162;
wire io_coverage_163;
wire io_coverage_164;
wire io_coverage_165;
wire io_coverage_166;
wire io_coverage_167;
wire io_coverage_168;
wire io_coverage_169;
wire io_coverage_170;
wire io_coverage_171;
wire io_coverage_172;
wire io_coverage_173;
wire io_coverage_174;
wire io_coverage_175;
wire io_coverage_176;
wire io_coverage_177;
wire io_coverage_178;
wire io_coverage_179;
wire io_coverage_180;
wire io_coverage_181;
wire io_coverage_182;
wire io_coverage_183;
wire io_coverage_184;
wire io_coverage_185;
wire io_coverage_186;
wire io_coverage_187;
wire io_coverage_188;
wire io_coverage_189;
wire io_coverage_190;
wire io_coverage_191;
wire io_coverage_192;
wire io_coverage_193;
wire io_coverage_194;
wire io_coverage_195;
wire io_coverage_196;
wire io_coverage_197;
wire io_coverage_198;
wire io_coverage_199;
wire io_coverage_200;

assign io_coverage_0 = bb_assert_out; // @[DUT.scala 51:33]
assign io_coverage_1 = bb_auto_cover_out[609]; // @[DUT.scala 51:33]
assign io_coverage_2 = bb_auto_cover_out[608]; // @[DUT.scala 51:33]
assign io_coverage_3 = bb_auto_cover_out[607]; // @[DUT.scala 51:33]
assign io_coverage_4 = bb_auto_cover_out[606]; // @[DUT.scala 51:33]
assign io_coverage_5 = bb_auto_cover_out[605]; // @[DUT.scala 51:33]
assign io_coverage_6 = bb_auto_cover_out[604]; // @[DUT.scala 51:33]
assign io_coverage_7 = bb_auto_cover_out[603]; // @[DUT.scala 51:33]
assign io_coverage_8 = bb_auto_cover_out[602]; // @[DUT.scala 51:33]
assign io_coverage_9 = bb_auto_cover_out[601]; // @[DUT.scala 51:33]
assign io_coverage_10 = bb_auto_cover_out[600]; // @[DUT.scala 51:33]
assign io_coverage_11 = bb_auto_cover_out[599]; // @[DUT.scala 51:33]
assign io_coverage_12 = bb_auto_cover_out[598]; // @[DUT.scala 51:33]
assign io_coverage_13 = bb_auto_cover_out[597]; // @[DUT.scala 51:33]
assign io_coverage_14 = bb_auto_cover_out[596]; // @[DUT.scala 51:33]
assign io_coverage_15 = bb_auto_cover_out[595]; // @[DUT.scala 51:33]
assign io_coverage_16 = bb_auto_cover_out[594]; // @[DUT.scala 51:33]
assign io_coverage_17 = bb_auto_cover_out[593]; // @[DUT.scala 51:33]
assign io_coverage_18 = bb_auto_cover_out[592]; // @[DUT.scala 51:33]
assign io_coverage_19 = bb_auto_cover_out[591]; // @[DUT.scala 51:33]
assign io_coverage_20 = bb_auto_cover_out[590]; // @[DUT.scala 51:33]
assign io_coverage_21 = bb_auto_cover_out[589]; // @[DUT.scala 51:33]
assign io_coverage_22 = bb_auto_cover_out[588]; // @[DUT.scala 51:33]
assign io_coverage_23 = bb_auto_cover_out[587]; // @[DUT.scala 51:33]
assign io_coverage_24 = bb_auto_cover_out[586]; // @[DUT.scala 51:33]
assign io_coverage_25 = bb_auto_cover_out[585]; // @[DUT.scala 51:33]
assign io_coverage_26 = bb_auto_cover_out[584]; // @[DUT.scala 51:33]
assign io_coverage_27 = bb_auto_cover_out[583]; // @[DUT.scala 51:33]
assign io_coverage_28 = bb_auto_cover_out[582]; // @[DUT.scala 51:33]
assign io_coverage_29 = bb_auto_cover_out[581]; // @[DUT.scala 51:33]
assign io_coverage_30 = bb_auto_cover_out[580]; // @[DUT.scala 51:33]
assign io_coverage_31 = bb_auto_cover_out[579]; // @[DUT.scala 51:33]
assign io_coverage_32 = bb_auto_cover_out[578]; // @[DUT.scala 51:33]
assign io_coverage_33 = bb_auto_cover_out[577]; // @[DUT.scala 51:33]
assign io_coverage_34 = bb_auto_cover_out[576]; // @[DUT.scala 51:33]
assign io_coverage_35 = bb_auto_cover_out[575]; // @[DUT.scala 51:33]
assign io_coverage_36 = bb_auto_cover_out[574]; // @[DUT.scala 51:33]
assign io_coverage_37 = bb_auto_cover_out[573]; // @[DUT.scala 51:33]
assign io_coverage_38 = bb_auto_cover_out[572]; // @[DUT.scala 51:33]
assign io_coverage_39 = bb_auto_cover_out[571]; // @[DUT.scala 51:33]
assign io_coverage_40 = bb_auto_cover_out[570]; // @[DUT.scala 51:33]
assign io_coverage_41 = bb_auto_cover_out[503]; // @[DUT.scala 51:33]
assign io_coverage_42 = bb_auto_cover_out[502]; // @[DUT.scala 51:33]
assign io_coverage_43 = bb_auto_cover_out[501]; // @[DUT.scala 51:33]
assign io_coverage_44 = bb_auto_cover_out[410]; // @[DUT.scala 51:33]
assign io_coverage_45 = bb_auto_cover_out[409]; // @[DUT.scala 51:33]
assign io_coverage_46 = bb_auto_cover_out[408]; // @[DUT.scala 51:33]
assign io_coverage_47 = bb_auto_cover_out[407]; // @[DUT.scala 51:33]
assign io_coverage_48 = bb_auto_cover_out[406]; // @[DUT.scala 51:33]
assign io_coverage_49 = bb_auto_cover_out[405]; // @[DUT.scala 51:33]
assign io_coverage_50 = bb_auto_cover_out[311]; // @[DUT.scala 51:33]
assign io_coverage_51 = bb_auto_cover_out[310]; // @[DUT.scala 51:33]
assign io_coverage_52 = bb_auto_cover_out[309]; // @[DUT.scala 51:33]
assign io_coverage_53 = bb_auto_cover_out[308]; // @[DUT.scala 51:33]
assign io_coverage_54 = bb_auto_cover_out[307]; // @[DUT.scala 51:33]
assign io_coverage_55 = bb_auto_cover_out[306]; // @[DUT.scala 51:33]
assign io_coverage_56 = bb_auto_cover_out[305]; // @[DUT.scala 51:33]
assign io_coverage_57 = bb_auto_cover_out[304]; // @[DUT.scala 51:33]
assign io_coverage_58 = bb_auto_cover_out[303]; // @[DUT.scala 51:33]
assign io_coverage_59 = bb_auto_cover_out[302]; // @[DUT.scala 51:33]
assign io_coverage_60 = bb_auto_cover_out[301]; // @[DUT.scala 51:33]
assign io_coverage_61 = bb_auto_cover_out[300]; // @[DUT.scala 51:33]
assign io_coverage_62 = bb_auto_cover_out[299]; // @[DUT.scala 51:33]
assign io_coverage_63 = bb_auto_cover_out[298]; // @[DUT.scala 51:33]
assign io_coverage_64 = bb_auto_cover_out[297]; // @[DUT.scala 51:33]
assign io_coverage_65 = bb_auto_cover_out[296]; // @[DUT.scala 51:33]
assign io_coverage_66 = bb_auto_cover_out[293]; // @[DUT.scala 51:33]
assign io_coverage_67 = bb_auto_cover_out[288]; // @[DUT.scala 51:33]
assign io_coverage_68 = bb_auto_cover_out[287]; // @[DUT.scala 51:33]
assign io_coverage_69 = bb_auto_cover_out[286]; // @[DUT.scala 51:33]
assign io_coverage_70 = bb_auto_cover_out[285]; // @[DUT.scala 51:33]
assign io_coverage_71 = bb_auto_cover_out[284]; // @[DUT.scala 51:33]
assign io_coverage_72 = bb_auto_cover_out[283]; // @[DUT.scala 51:33]
assign io_coverage_73 = bb_auto_cover_out[282]; // @[DUT.scala 51:33]
assign io_coverage_74 = bb_auto_cover_out[280]; // @[DUT.scala 51:33]
assign io_coverage_75 = bb_auto_cover_out[279]; // @[DUT.scala 51:33]
assign io_coverage_76 = bb_auto_cover_out[277]; // @[DUT.scala 51:33]
assign io_coverage_77 = bb_auto_cover_out[275]; // @[DUT.scala 51:33]
assign io_coverage_78 = bb_auto_cover_out[274]; // @[DUT.scala 51:33]
assign io_coverage_79 = bb_auto_cover_out[273]; // @[DUT.scala 51:33]
assign io_coverage_80 = bb_auto_cover_out[272]; // @[DUT.scala 51:33]
assign io_coverage_81 = bb_auto_cover_out[271]; // @[DUT.scala 51:33]
assign io_coverage_82 = bb_auto_cover_out[270]; // @[DUT.scala 51:33]
assign io_coverage_83 = bb_auto_cover_out[269]; // @[DUT.scala 51:33]
assign io_coverage_84 = bb_auto_cover_out[268]; // @[DUT.scala 51:33]
assign io_coverage_85 = bb_auto_cover_out[267]; // @[DUT.scala 51:33]
assign io_coverage_86 = bb_auto_cover_out[266]; // @[DUT.scala 51:33]
assign io_coverage_87 = bb_auto_cover_out[265]; // @[DUT.scala 51:33]
assign io_coverage_88 = bb_auto_cover_out[264]; // @[DUT.scala 51:33]
assign io_coverage_89 = bb_auto_cover_out[263]; // @[DUT.scala 51:33]
assign io_coverage_90 = bb_auto_cover_out[262]; // @[DUT.scala 51:33]
assign io_coverage_91 = bb_auto_cover_out[261]; // @[DUT.scala 51:33]
assign io_coverage_92 = bb_auto_cover_out[260]; // @[DUT.scala 51:33]
assign io_coverage_93 = bb_auto_cover_out[259]; // @[DUT.scala 51:33]
assign io_coverage_94 = bb_auto_cover_out[258]; // @[DUT.scala 51:33]
assign io_coverage_95 = bb_auto_cover_out[257]; // @[DUT.scala 51:33]
assign io_coverage_96 = bb_auto_cover_out[256]; // @[DUT.scala 51:33]
assign io_coverage_97 = bb_auto_cover_out[255]; // @[DUT.scala 51:33]
assign io_coverage_98 = bb_auto_cover_out[254]; // @[DUT.scala 51:33]
assign io_coverage_99 = bb_auto_cover_out[253]; // @[DUT.scala 51:33]
assign io_coverage_100 = bb_auto_cover_out[252]; // @[DUT.scala 51:33]
assign io_coverage_101 = bb_auto_cover_out[251]; // @[DUT.scala 51:33]
assign io_coverage_102 = bb_auto_cover_out[250]; // @[DUT.scala 51:33]
assign io_coverage_103 = bb_auto_cover_out[249]; // @[DUT.scala 51:33]
assign io_coverage_104 = bb_auto_cover_out[248]; // @[DUT.scala 51:33]
assign io_coverage_105 = bb_auto_cover_out[247]; // @[DUT.scala 51:33]
assign io_coverage_106 = bb_auto_cover_out[246]; // @[DUT.scala 51:33]
assign io_coverage_107 = bb_auto_cover_out[245]; // @[DUT.scala 51:33]
assign io_coverage_108 = bb_auto_cover_out[244]; // @[DUT.scala 51:33]
assign io_coverage_109 = bb_auto_cover_out[243]; // @[DUT.scala 51:33]
assign io_coverage_110 = bb_auto_cover_out[242]; // @[DUT.scala 51:33]
assign io_coverage_111 = bb_auto_cover_out[241]; // @[DUT.scala 51:33]
assign io_coverage_112 = bb_auto_cover_out[240]; // @[DUT.scala 51:33]
assign io_coverage_113 = bb_auto_cover_out[239]; // @[DUT.scala 51:33]
assign io_coverage_114 = bb_auto_cover_out[238]; // @[DUT.scala 51:33]
assign io_coverage_115 = bb_auto_cover_out[237]; // @[DUT.scala 51:33]
assign io_coverage_116 = bb_auto_cover_out[236]; // @[DUT.scala 51:33]
assign io_coverage_117 = bb_auto_cover_out[235]; // @[DUT.scala 51:33]
assign io_coverage_118 = bb_auto_cover_out[234]; // @[DUT.scala 51:33]
assign io_coverage_119 = bb_auto_cover_out[233]; // @[DUT.scala 51:33]
assign io_coverage_120 = bb_auto_cover_out[232]; // @[DUT.scala 51:33]
assign io_coverage_121 = bb_auto_cover_out[231]; // @[DUT.scala 51:33]
assign io_coverage_122 = bb_auto_cover_out[230]; // @[DUT.scala 51:33]
assign io_coverage_123 = bb_auto_cover_out[229]; // @[DUT.scala 51:33]
assign io_coverage_124 = bb_auto_cover_out[228]; // @[DUT.scala 51:33]
assign io_coverage_125 = bb_auto_cover_out[227]; // @[DUT.scala 51:33]
assign io_coverage_126 = bb_auto_cover_out[226]; // @[DUT.scala 51:33]
assign io_coverage_127 = bb_auto_cover_out[225]; // @[DUT.scala 51:33]
assign io_coverage_128 = bb_auto_cover_out[224]; // @[DUT.scala 51:33]
assign io_coverage_129 = bb_auto_cover_out[223]; // @[DUT.scala 51:33]
assign io_coverage_130 = bb_auto_cover_out[222]; // @[DUT.scala 51:33]
assign io_coverage_131 = bb_auto_cover_out[221]; // @[DUT.scala 51:33]
assign io_coverage_132 = bb_auto_cover_out[220]; // @[DUT.scala 51:33]
assign io_coverage_133 = bb_auto_cover_out[219]; // @[DUT.scala 51:33]
assign io_coverage_134 = bb_auto_cover_out[218]; // @[DUT.scala 51:33]
assign io_coverage_135 = bb_auto_cover_out[217]; // @[DUT.scala 51:33]
assign io_coverage_136 = bb_auto_cover_out[216]; // @[DUT.scala 51:33]
assign io_coverage_137 = bb_auto_cover_out[215]; // @[DUT.scala 51:33]
assign io_coverage_138 = bb_auto_cover_out[214]; // @[DUT.scala 51:33]
assign io_coverage_139 = bb_auto_cover_out[213]; // @[DUT.scala 51:33]
assign io_coverage_140 = bb_auto_cover_out[212]; // @[DUT.scala 51:33]
assign io_coverage_141 = bb_auto_cover_out[211]; // @[DUT.scala 51:33]
assign io_coverage_142 = bb_auto_cover_out[210]; // @[DUT.scala 51:33]
assign io_coverage_143 = bb_auto_cover_out[209]; // @[DUT.scala 51:33]
assign io_coverage_144 = bb_auto_cover_out[208]; // @[DUT.scala 51:33]
assign io_coverage_145 = bb_auto_cover_out[207]; // @[DUT.scala 51:33]
assign io_coverage_146 = bb_auto_cover_out[206]; // @[DUT.scala 51:33]
assign io_coverage_147 = bb_auto_cover_out[205]; // @[DUT.scala 51:33]
assign io_coverage_148 = bb_auto_cover_out[204]; // @[DUT.scala 51:33]
assign io_coverage_149 = bb_auto_cover_out[203]; // @[DUT.scala 51:33]
assign io_coverage_150 = bb_auto_cover_out[202]; // @[DUT.scala 51:33]
assign io_coverage_151 = bb_auto_cover_out[201]; // @[DUT.scala 51:33]
assign io_coverage_152 = bb_auto_cover_out[200]; // @[DUT.scala 51:33]
assign io_coverage_153 = bb_auto_cover_out[199]; // @[DUT.scala 51:33]
assign io_coverage_154 = bb_auto_cover_out[198]; // @[DUT.scala 51:33]
assign io_coverage_155 = bb_auto_cover_out[197]; // @[DUT.scala 51:33]
assign io_coverage_156 = bb_auto_cover_out[196]; // @[DUT.scala 51:33]
assign io_coverage_157 = bb_auto_cover_out[195]; // @[DUT.scala 51:33]
assign io_coverage_158 = bb_auto_cover_out[123]; // @[DUT.scala 51:33]
assign io_coverage_159 = bb_auto_cover_out[119]; // @[DUT.scala 51:33]
assign io_coverage_160 = bb_auto_cover_out[108]; // @[DUT.scala 51:33]
assign io_coverage_161 = bb_auto_cover_out[45]; // @[DUT.scala 51:33]
assign io_coverage_162 = bb_auto_cover_out[44]; // @[DUT.scala 51:33]
assign io_coverage_163 = bb_auto_cover_out[43]; // @[DUT.scala 51:33]
assign io_coverage_164 = bb_auto_cover_out[42]; // @[DUT.scala 51:33]
assign io_coverage_165 = bb_auto_cover_out[41]; // @[DUT.scala 51:33]
assign io_coverage_166 = bb_auto_cover_out[40]; // @[DUT.scala 51:33]
assign io_coverage_167 = bb_auto_cover_out[39]; // @[DUT.scala 51:33]
assign io_coverage_168 = bb_auto_cover_out[38]; // @[DUT.scala 51:33]
assign io_coverage_169 = bb_auto_cover_out[37]; // @[DUT.scala 51:33]
assign io_coverage_170 = bb_auto_cover_out[36]; // @[DUT.scala 51:33]
assign io_coverage_171 = bb_auto_cover_out[35]; // @[DUT.scala 51:33]
assign io_coverage_172 = bb_auto_cover_out[34]; // @[DUT.scala 51:33]
assign io_coverage_173 = bb_auto_cover_out[33]; // @[DUT.scala 51:33]
assign io_coverage_174 = bb_auto_cover_out[32]; // @[DUT.scala 51:33]
assign io_coverage_175 = bb_auto_cover_out[31]; // @[DUT.scala 51:33]
assign io_coverage_176 = bb_auto_cover_out[30]; // @[DUT.scala 51:33]
assign io_coverage_177 = bb_auto_cover_out[29]; // @[DUT.scala 51:33]
assign io_coverage_178 = bb_auto_cover_out[28]; // @[DUT.scala 51:33]
assign io_coverage_179 = bb_auto_cover_out[27]; // @[DUT.scala 51:33]
assign io_coverage_180 = bb_auto_cover_out[26]; // @[DUT.scala 51:33]
assign io_coverage_181 = bb_auto_cover_out[25]; // @[DUT.scala 51:33]
assign io_coverage_182 = bb_auto_cover_out[24]; // @[DUT.scala 51:33]
assign io_coverage_183 = bb_auto_cover_out[23]; // @[DUT.scala 51:33]
assign io_coverage_184 = bb_auto_cover_out[22]; // @[DUT.scala 51:33]
assign io_coverage_185 = bb_auto_cover_out[21]; // @[DUT.scala 51:33]
assign io_coverage_186 = bb_auto_cover_out[20]; // @[DUT.scala 51:33]
assign io_coverage_187 = bb_auto_cover_out[19]; // @[DUT.scala 51:33]
assign io_coverage_188 = bb_auto_cover_out[18]; // @[DUT.scala 51:33]
assign io_coverage_189 = bb_auto_cover_out[17]; // @[DUT.scala 51:33]
assign io_coverage_190 = bb_auto_cover_out[16]; // @[DUT.scala 51:33]
assign io_coverage_191 = bb_auto_cover_out[15]; // @[DUT.scala 51:33]
assign io_coverage_192 = bb_auto_cover_out[14]; // @[DUT.scala 51:33]
assign io_coverage_193 = bb_auto_cover_out[13]; // @[DUT.scala 51:33]
assign io_coverage_194 = bb_auto_cover_out[12]; // @[DUT.scala 51:33]
assign io_coverage_195 = bb_auto_cover_out[5]; // @[DUT.scala 51:33]
assign io_coverage_196 = bb_auto_cover_out[4]; // @[DUT.scala 51:33]
assign io_coverage_197 = bb_auto_cover_out[3]; // @[DUT.scala 51:33]
assign io_coverage_198 = bb_auto_cover_out[2]; // @[DUT.scala 51:33]
assign io_coverage_199 = bb_auto_cover_out[1]; // @[DUT.scala 51:33]
assign io_coverage_200 = bb_auto_cover_out[0]; // @[DUT.scala 51:33]




always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        cover( io_coverage_0 );
        cover(!io_coverage_0 );
        cover( io_coverage_1 );
        cover(!io_coverage_1 );
        cover( io_coverage_2 );
        cover(!io_coverage_2 );
        cover( io_coverage_3 );
        cover(!io_coverage_3 );
        cover( io_coverage_4 );
        cover(!io_coverage_4 );
        cover( io_coverage_5 );
        cover(!io_coverage_5 );
        cover( io_coverage_6 );
        cover(!io_coverage_6 );
        cover( io_coverage_7 );
        cover(!io_coverage_7 );
        cover( io_coverage_8 );
        cover(!io_coverage_8 );
        cover( io_coverage_9 );
        cover(!io_coverage_9 );
        cover( io_coverage_10 );
        cover(!io_coverage_10 );
        cover( io_coverage_11 );
        cover(!io_coverage_11 );
        cover( io_coverage_12 );
        cover(!io_coverage_12 );
        cover( io_coverage_13 );
        cover(!io_coverage_13 );
        cover( io_coverage_14 );
        cover(!io_coverage_14 );
        cover( io_coverage_15 );
        cover(!io_coverage_15 );
        cover( io_coverage_16 );
        cover(!io_coverage_16 );
        cover( io_coverage_17 );
        cover(!io_coverage_17 );
        cover( io_coverage_18 );
        cover(!io_coverage_18 );
        cover( io_coverage_19 );
        cover(!io_coverage_19 );
        cover( io_coverage_20 );
        cover(!io_coverage_20 );
        cover( io_coverage_21 );
        cover(!io_coverage_21 );
        cover( io_coverage_22 );
        cover(!io_coverage_22 );
        cover( io_coverage_23 );
        cover(!io_coverage_23 );
        cover( io_coverage_24 );
        cover(!io_coverage_24 );
        cover( io_coverage_25 );
        cover(!io_coverage_25 );
        cover( io_coverage_26 );
        cover(!io_coverage_26 );
        cover( io_coverage_27 );
        cover(!io_coverage_27 );
        cover( io_coverage_28 );
        cover(!io_coverage_28 );
        cover( io_coverage_29 );
        cover(!io_coverage_29 );
        cover( io_coverage_30 );
        cover(!io_coverage_30 );
        cover( io_coverage_31 );
        cover(!io_coverage_31 );
        cover( io_coverage_32 );
        cover(!io_coverage_32 );
        cover( io_coverage_33 );
        cover(!io_coverage_33 );
        cover( io_coverage_34 );
        cover(!io_coverage_34 );
        cover( io_coverage_35 );
        cover(!io_coverage_35 );
        cover( io_coverage_36 );
        cover(!io_coverage_36 );
        cover( io_coverage_37 );
        cover(!io_coverage_37 );
        cover( io_coverage_38 );
        cover(!io_coverage_38 );
        cover( io_coverage_39 );
        cover(!io_coverage_39 );
        cover( io_coverage_40 );
        cover(!io_coverage_40 );
        cover( io_coverage_41 );
        cover(!io_coverage_41 );
        cover( io_coverage_42 );
        cover(!io_coverage_42 );
        cover( io_coverage_43 );
        cover(!io_coverage_43 );
        cover( io_coverage_44 );
        cover(!io_coverage_44 );
        cover( io_coverage_45 );
        cover(!io_coverage_45 );
        cover( io_coverage_46 );
        cover(!io_coverage_46 );
        cover( io_coverage_47 );
        cover(!io_coverage_47 );
        cover( io_coverage_48 );
        cover(!io_coverage_48 );
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
        cover( io_coverage_100 );
        cover(!io_coverage_100 );
        cover( io_coverage_101 );
        cover(!io_coverage_101 );
        cover( io_coverage_102 );
        cover(!io_coverage_102 );
        cover( io_coverage_103 );
        cover(!io_coverage_103 );
        cover( io_coverage_104 );
        cover(!io_coverage_104 );
        cover( io_coverage_105 );
        cover(!io_coverage_105 );
        cover( io_coverage_106 );
        cover(!io_coverage_106 );
        cover( io_coverage_107 );
        cover(!io_coverage_107 );
        cover( io_coverage_108 );
        cover(!io_coverage_108 );
        cover( io_coverage_109 );
        cover(!io_coverage_109 );
        cover( io_coverage_110 );
        cover(!io_coverage_110 );
        cover( io_coverage_111 );
        cover(!io_coverage_111 );
        cover( io_coverage_112 );
        cover(!io_coverage_112 );
        cover( io_coverage_113 );
        cover(!io_coverage_113 );
        cover( io_coverage_114 );
        cover(!io_coverage_114 );
        cover( io_coverage_115 );
        cover(!io_coverage_115 );
        cover( io_coverage_116 );
        cover(!io_coverage_116 );
        cover( io_coverage_117 );
        cover(!io_coverage_117 );
        cover( io_coverage_118 );
        cover(!io_coverage_118 );
        cover( io_coverage_119 );
        cover(!io_coverage_119 );
        cover( io_coverage_120 );
        cover(!io_coverage_120 );
        cover( io_coverage_121 );
        cover(!io_coverage_121 );
        cover( io_coverage_122 );
        cover(!io_coverage_122 );
        cover( io_coverage_123 );
        cover(!io_coverage_123 );
        cover( io_coverage_124 );
        cover(!io_coverage_124 );
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
        cover( io_coverage_156 );
        cover(!io_coverage_156 );
        cover( io_coverage_157 );
        cover(!io_coverage_157 );
        cover( io_coverage_158 );
        cover(!io_coverage_158 );
        cover( io_coverage_159 );
        cover(!io_coverage_159 );
        cover( io_coverage_160 );
        cover(!io_coverage_160 );
        cover( io_coverage_161 );
        cover(!io_coverage_161 );
        cover( io_coverage_162 );
        cover(!io_coverage_162 );
        cover( io_coverage_163 );
        cover(!io_coverage_163 );
        cover( io_coverage_164 );
        cover(!io_coverage_164 );
        cover( io_coverage_165 );
        cover(!io_coverage_165 );
        cover( io_coverage_166 );
        cover(!io_coverage_166 );
        cover( io_coverage_167 );
        cover(!io_coverage_167 );
        cover( io_coverage_168 );
        cover(!io_coverage_168 );
        cover( io_coverage_169 );
        cover(!io_coverage_169 );
        cover( io_coverage_170 );
        cover(!io_coverage_170 );
        cover( io_coverage_171 );
        cover(!io_coverage_171 );
        cover( io_coverage_172 );
        cover(!io_coverage_172 );
        cover( io_coverage_173 );
        cover(!io_coverage_173 );
        cover( io_coverage_174 );
        cover(!io_coverage_174 );
        cover( io_coverage_175 );
        cover(!io_coverage_175 );
        cover( io_coverage_176 );
        cover(!io_coverage_176 );
        cover( io_coverage_177 );
        cover(!io_coverage_177 );
        cover( io_coverage_178 );
        cover(!io_coverage_178 );
        cover( io_coverage_179 );
        cover(!io_coverage_179 );
        cover( io_coverage_180 );
        cover(!io_coverage_180 );
        cover( io_coverage_181 );
        cover(!io_coverage_181 );
        cover( io_coverage_182 );
        cover(!io_coverage_182 );
        cover( io_coverage_183 );
        cover(!io_coverage_183 );
        cover( io_coverage_184 );
        cover(!io_coverage_184 );
        cover( io_coverage_185 );
        cover(!io_coverage_185 );
        cover( io_coverage_186 );
        cover(!io_coverage_186 );
        cover( io_coverage_187 );
        cover(!io_coverage_187 );
        cover( io_coverage_188 );
        cover(!io_coverage_188 );
        cover( io_coverage_189 );
        cover(!io_coverage_189 );
        cover( io_coverage_190 );
        cover(!io_coverage_190 );
        cover( io_coverage_191 );
        cover(!io_coverage_191 );
        cover( io_coverage_192 );
        cover(!io_coverage_192 );
        cover( io_coverage_193 );
        cover(!io_coverage_193 );
        cover( io_coverage_194 );
        cover(!io_coverage_194 );
        cover( io_coverage_195 );
        cover(!io_coverage_195 );
        cover( io_coverage_196 );
        cover(!io_coverage_196 );
        cover( io_coverage_197 );
        cover(!io_coverage_197 );
        cover( io_coverage_198 );
        cover(!io_coverage_198 );
        cover( io_coverage_199 );
        cover(!io_coverage_199 );
        cover( io_coverage_200 );
        cover(!io_coverage_200 );
    end
end
  
// assume that no assertion is violated
wire  bb_assert_out; // @[DUT.scala 29:24]
always @(posedge clock) begin
    if (!is_meta_reset_phase && !is_reset_phase) begin
        assume(assert_out == 1'd0);
    end
end


// wire up the inputs
// bunching them together makes it easier to conver coverage traces
// into the same output format that the fuzzer uses
wire  bb_io_reset; // @[DUT.scala 29:24]
wire  bb_io_imem_resp_valid; // @[DUT.scala 29:24]
wire  bb_io_imem_req_ready; // @[DUT.scala 29:24]
wire [31:0] bb_io_imem_resp_bits_data; // @[DUT.scala 29:24]
wire  bb_metaReset; // @[DUT.scala 29:24]
wire  bb_reset; // @[DUT.scala 29:24]
wire  bb_clock; // @[DUT.scala 29:24]
assign bb_io_reset = io_inputs[0]; // @[DUT.scala 40:25]
assign bb_io_imem_resp_valid = io_inputs[1]; // @[DUT.scala 40:25]
assign bb_io_imem_req_ready = io_inputs[2]; // @[DUT.scala 40:25]
assign bb_io_imem_resp_bits_data = io_inputs[34:3]; // @[DUT.scala 40:25]
assign bb_metaReset = io_meta_reset; // @[DUT.scala 35:27]
assign bb_reset = reset; // @[DUT.scala 34:23]
assign bb_clock = clock; // @[DUT.scala 33:23]

// dut instance
Sodor1Stage bb ( // @[DUT.scala 29:24]
.auto_cover_out(bb_auto_cover_out),
.assert_out(bb_assert_out),
.io_reset(bb_io_reset),
.io_imem_resp_valid(bb_io_imem_resp_valid),
.io_imem_req_ready(bb_io_imem_req_ready),
.io_imem_resp_bits_data(bb_io_imem_resp_bits_data),
.metaReset(bb_metaReset),
.reset(bb_reset),
.clock(bb_clock)
);


endmodule