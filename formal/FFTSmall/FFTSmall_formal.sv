module FFTSmallTop(
  input          clock,
  input  [258:0] io_inputs
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
wire [191:0] bb_auto_cover_out; // only some wires are actually used!
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


assign io_coverage_0 = bb_auto_cover_out[191]; // @[DUT.scala 51:33]
  assign io_coverage_1 = bb_auto_cover_out[190]; // @[DUT.scala 51:33]
  assign io_coverage_2 = bb_auto_cover_out[173]; // @[DUT.scala 51:33]
  assign io_coverage_3 = bb_auto_cover_out[172]; // @[DUT.scala 51:33]
  assign io_coverage_4 = bb_auto_cover_out[171]; // @[DUT.scala 51:33]
  assign io_coverage_5 = bb_auto_cover_out[170]; // @[DUT.scala 51:33]
  assign io_coverage_6 = bb_auto_cover_out[169]; // @[DUT.scala 51:33]
  assign io_coverage_7 = bb_auto_cover_out[168]; // @[DUT.scala 51:33]
  assign io_coverage_8 = bb_auto_cover_out[167]; // @[DUT.scala 51:33]
  assign io_coverage_9 = bb_auto_cover_out[166]; // @[DUT.scala 51:33]
  assign io_coverage_10 = bb_auto_cover_out[165]; // @[DUT.scala 51:33]
  assign io_coverage_11 = bb_auto_cover_out[164]; // @[DUT.scala 51:33]
  assign io_coverage_12 = bb_auto_cover_out[163]; // @[DUT.scala 51:33]
  assign io_coverage_13 = bb_auto_cover_out[162]; // @[DUT.scala 51:33]
  assign io_coverage_14 = bb_auto_cover_out[161]; // @[DUT.scala 51:33]
  assign io_coverage_15 = bb_auto_cover_out[160]; // @[DUT.scala 51:33]
  assign io_coverage_16 = bb_auto_cover_out[158]; // @[DUT.scala 51:33]
  assign io_coverage_17 = bb_auto_cover_out[156]; // @[DUT.scala 51:33]
  assign io_coverage_18 = bb_auto_cover_out[154]; // @[DUT.scala 51:33]
  assign io_coverage_19 = bb_auto_cover_out[152]; // @[DUT.scala 51:33]
  assign io_coverage_20 = bb_auto_cover_out[151]; // @[DUT.scala 51:33]
  assign io_coverage_21 = bb_auto_cover_out[150]; // @[DUT.scala 51:33]
  assign io_coverage_22 = bb_auto_cover_out[149]; // @[DUT.scala 51:33]
  assign io_coverage_23 = bb_auto_cover_out[148]; // @[DUT.scala 51:33]
  assign io_coverage_24 = bb_auto_cover_out[147]; // @[DUT.scala 51:33]
  assign io_coverage_25 = bb_auto_cover_out[146]; // @[DUT.scala 51:33]
  assign io_coverage_26 = bb_auto_cover_out[145]; // @[DUT.scala 51:33]
  assign io_coverage_27 = bb_auto_cover_out[144]; // @[DUT.scala 51:33]
  assign io_coverage_28 = bb_auto_cover_out[143]; // @[DUT.scala 51:33]
  assign io_coverage_29 = bb_auto_cover_out[142]; // @[DUT.scala 51:33]
  assign io_coverage_30 = bb_auto_cover_out[141]; // @[DUT.scala 51:33]
  assign io_coverage_31 = bb_auto_cover_out[139]; // @[DUT.scala 51:33]
  assign io_coverage_32 = bb_auto_cover_out[137]; // @[DUT.scala 51:33]
  assign io_coverage_33 = bb_auto_cover_out[135]; // @[DUT.scala 51:33]
  assign io_coverage_34 = bb_auto_cover_out[133]; // @[DUT.scala 51:33]
  assign io_coverage_35 = bb_auto_cover_out[132]; // @[DUT.scala 51:33]
  assign io_coverage_36 = bb_auto_cover_out[131]; // @[DUT.scala 51:33]
  assign io_coverage_37 = bb_auto_cover_out[130]; // @[DUT.scala 51:33]
  assign io_coverage_38 = bb_auto_cover_out[129]; // @[DUT.scala 51:33]
  assign io_coverage_39 = bb_auto_cover_out[128]; // @[DUT.scala 51:33]
  assign io_coverage_40 = bb_auto_cover_out[127]; // @[DUT.scala 51:33]
  assign io_coverage_41 = bb_auto_cover_out[126]; // @[DUT.scala 51:33]
  assign io_coverage_42 = bb_auto_cover_out[125]; // @[DUT.scala 51:33]
  assign io_coverage_43 = bb_auto_cover_out[124]; // @[DUT.scala 51:33]
  assign io_coverage_44 = bb_auto_cover_out[123]; // @[DUT.scala 51:33]
  assign io_coverage_45 = bb_auto_cover_out[122]; // @[DUT.scala 51:33]
  assign io_coverage_46 = bb_auto_cover_out[120]; // @[DUT.scala 51:33]
  assign io_coverage_47 = bb_auto_cover_out[118]; // @[DUT.scala 51:33]
  assign io_coverage_48 = bb_auto_cover_out[116]; // @[DUT.scala 51:33]
  assign io_coverage_49 = bb_auto_cover_out[114]; // @[DUT.scala 51:33]
  assign io_coverage_50 = bb_auto_cover_out[113]; // @[DUT.scala 51:33]
  assign io_coverage_51 = bb_auto_cover_out[112]; // @[DUT.scala 51:33]
  assign io_coverage_52 = bb_auto_cover_out[111]; // @[DUT.scala 51:33]
  assign io_coverage_53 = bb_auto_cover_out[110]; // @[DUT.scala 51:33]
  assign io_coverage_54 = bb_auto_cover_out[109]; // @[DUT.scala 51:33]
  assign io_coverage_55 = bb_auto_cover_out[108]; // @[DUT.scala 51:33]
  assign io_coverage_56 = bb_auto_cover_out[107]; // @[DUT.scala 51:33]
  assign io_coverage_57 = bb_auto_cover_out[106]; // @[DUT.scala 51:33]
  assign io_coverage_58 = bb_auto_cover_out[105]; // @[DUT.scala 51:33]
  assign io_coverage_59 = bb_auto_cover_out[104]; // @[DUT.scala 51:33]
  assign io_coverage_60 = bb_auto_cover_out[103]; // @[DUT.scala 51:33]
  assign io_coverage_61 = bb_auto_cover_out[101]; // @[DUT.scala 51:33]
  assign io_coverage_62 = bb_auto_cover_out[99]; // @[DUT.scala 51:33]
  assign io_coverage_63 = bb_auto_cover_out[97]; // @[DUT.scala 51:33]
  assign io_coverage_64 = bb_auto_cover_out[95]; // @[DUT.scala 51:33]
  assign io_coverage_65 = bb_auto_cover_out[94]; // @[DUT.scala 51:33]
  assign io_coverage_66 = bb_auto_cover_out[93]; // @[DUT.scala 51:33]
  assign io_coverage_67 = bb_auto_cover_out[92]; // @[DUT.scala 51:33]
  assign io_coverage_68 = bb_auto_cover_out[91]; // @[DUT.scala 51:33]
  assign io_coverage_69 = bb_auto_cover_out[90]; // @[DUT.scala 51:33]
  assign io_coverage_70 = bb_auto_cover_out[89]; // @[DUT.scala 51:33]
  assign io_coverage_71 = bb_auto_cover_out[88]; // @[DUT.scala 51:33]
  assign io_coverage_72 = bb_auto_cover_out[87]; // @[DUT.scala 51:33]
  assign io_coverage_73 = bb_auto_cover_out[86]; // @[DUT.scala 51:33]
  assign io_coverage_74 = bb_auto_cover_out[85]; // @[DUT.scala 51:33]
  assign io_coverage_75 = bb_auto_cover_out[84]; // @[DUT.scala 51:33]
  assign io_coverage_76 = bb_auto_cover_out[82]; // @[DUT.scala 51:33]
  assign io_coverage_77 = bb_auto_cover_out[80]; // @[DUT.scala 51:33]
  assign io_coverage_78 = bb_auto_cover_out[78]; // @[DUT.scala 51:33]
  assign io_coverage_79 = bb_auto_cover_out[76]; // @[DUT.scala 51:33]
  assign io_coverage_80 = bb_auto_cover_out[75]; // @[DUT.scala 51:33]
  assign io_coverage_81 = bb_auto_cover_out[74]; // @[DUT.scala 51:33]
  assign io_coverage_82 = bb_auto_cover_out[73]; // @[DUT.scala 51:33]
  assign io_coverage_83 = bb_auto_cover_out[72]; // @[DUT.scala 51:33]
  assign io_coverage_84 = bb_auto_cover_out[71]; // @[DUT.scala 51:33]
  assign io_coverage_85 = bb_auto_cover_out[70]; // @[DUT.scala 51:33]
  assign io_coverage_86 = bb_auto_cover_out[69]; // @[DUT.scala 51:33]
  assign io_coverage_87 = bb_auto_cover_out[68]; // @[DUT.scala 51:33]
  assign io_coverage_88 = bb_auto_cover_out[67]; // @[DUT.scala 51:33]
  assign io_coverage_89 = bb_auto_cover_out[66]; // @[DUT.scala 51:33]
  assign io_coverage_90 = bb_auto_cover_out[65]; // @[DUT.scala 51:33]
  assign io_coverage_91 = bb_auto_cover_out[63]; // @[DUT.scala 51:33]
  assign io_coverage_92 = bb_auto_cover_out[61]; // @[DUT.scala 51:33]
  assign io_coverage_93 = bb_auto_cover_out[59]; // @[DUT.scala 51:33]
  assign io_coverage_94 = bb_auto_cover_out[57]; // @[DUT.scala 51:33]
  assign io_coverage_95 = bb_auto_cover_out[56]; // @[DUT.scala 51:33]
  assign io_coverage_96 = bb_auto_cover_out[55]; // @[DUT.scala 51:33]
  assign io_coverage_97 = bb_auto_cover_out[54]; // @[DUT.scala 51:33]
  assign io_coverage_98 = bb_auto_cover_out[53]; // @[DUT.scala 51:33]
  assign io_coverage_99 = bb_auto_cover_out[52]; // @[DUT.scala 51:33]
  assign io_coverage_100 = bb_auto_cover_out[51]; // @[DUT.scala 51:33]
  assign io_coverage_101 = bb_auto_cover_out[50]; // @[DUT.scala 51:33]
  assign io_coverage_102 = bb_auto_cover_out[49]; // @[DUT.scala 51:33]
  assign io_coverage_103 = bb_auto_cover_out[48]; // @[DUT.scala 51:33]
  assign io_coverage_104 = bb_auto_cover_out[47]; // @[DUT.scala 51:33]
  assign io_coverage_105 = bb_auto_cover_out[46]; // @[DUT.scala 51:33]
  assign io_coverage_106 = bb_auto_cover_out[44]; // @[DUT.scala 51:33]
  assign io_coverage_107 = bb_auto_cover_out[42]; // @[DUT.scala 51:33]
  assign io_coverage_108 = bb_auto_cover_out[40]; // @[DUT.scala 51:33]
  assign io_coverage_109 = bb_auto_cover_out[36]; // @[DUT.scala 51:33]
  assign io_coverage_110 = bb_auto_cover_out[35]; // @[DUT.scala 51:33]
  assign io_coverage_111 = bb_auto_cover_out[27]; // @[DUT.scala 51:33]
  assign io_coverage_112 = bb_auto_cover_out[15]; // @[DUT.scala 51:33]
  assign io_coverage_113 = bb_auto_cover_out[7]; // @[DUT.scala 51:33]




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
    end
end
  

// wire up the inputs
// bunching them together makes it easier to conver coverage traces
// into the same output format that the fuzzer uses
wire  bb_io_data_set_end_clear; // @[DUT.scala 29:24]
wire  bb_io_in_sync; // @[DUT.scala 29:24]
wire  bb_io_in_valid; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_7_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_7_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_6_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_6_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_5_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_5_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_4_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_4_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_3_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_3_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_2_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_2_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_1_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_1_real; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_0_imag; // @[DUT.scala 29:24]
wire [15:0] bb_io_in_bits_0_real; // @[DUT.scala 29:24]

assign bb_io_data_set_end_clear = io_inputs[0]; // @[DUT.scala 40:25]
assign bb_io_in_sync = io_inputs[1]; // @[DUT.scala 40:25]
assign bb_io_in_valid = io_inputs[2]; // @[DUT.scala 40:25]
assign bb_io_in_bits_7_imag = io_inputs[18:3]; // @[DUT.scala 40:25]
assign bb_io_in_bits_7_real = io_inputs[34:19]; // @[DUT.scala 40:25]
assign bb_io_in_bits_6_imag = io_inputs[50:35]; // @[DUT.scala 40:25]
assign bb_io_in_bits_6_real = io_inputs[66:51]; // @[DUT.scala 40:25]
assign bb_io_in_bits_5_imag = io_inputs[82:67]; // @[DUT.scala 40:25]
assign bb_io_in_bits_5_real = io_inputs[98:83]; // @[DUT.scala 40:25]
assign bb_io_in_bits_4_imag = io_inputs[114:99]; // @[DUT.scala 40:25]
assign bb_io_in_bits_4_real = io_inputs[130:115]; // @[DUT.scala 40:25]
assign bb_io_in_bits_3_imag = io_inputs[146:131]; // @[DUT.scala 40:25]
assign bb_io_in_bits_3_real = io_inputs[162:147]; // @[DUT.scala 40:25]
assign bb_io_in_bits_2_imag = io_inputs[178:163]; // @[DUT.scala 40:25]
assign bb_io_in_bits_2_real = io_inputs[194:179]; // @[DUT.scala 40:25]
assign bb_io_in_bits_1_imag = io_inputs[210:195]; // @[DUT.scala 40:25]
assign bb_io_in_bits_1_real = io_inputs[226:211]; // @[DUT.scala 40:25]
assign bb_io_in_bits_0_imag = io_inputs[242:227]; // @[DUT.scala 40:25]
assign bb_io_in_bits_0_real = io_inputs[258:243]; // @[DUT.scala 40:25]

// dut instance
FFTSmall bb ( // @[DUT.scala 29:24]
    .auto_cover_out(bb_auto_cover_out),
    .io_data_set_end_clear(bb_io_data_set_end_clear),
    .io_in_sync(bb_io_in_sync),
    .io_in_valid(bb_io_in_valid),
    .io_in_bits_7_imag(bb_io_in_bits_7_imag),
    .io_in_bits_7_real(bb_io_in_bits_7_real),
    .io_in_bits_6_imag(bb_io_in_bits_6_imag),
    .io_in_bits_6_real(bb_io_in_bits_6_real),
    .io_in_bits_5_imag(bb_io_in_bits_5_imag),
    .io_in_bits_5_real(bb_io_in_bits_5_real),
    .io_in_bits_4_imag(bb_io_in_bits_4_imag),
    .io_in_bits_4_real(bb_io_in_bits_4_real),
    .io_in_bits_3_imag(bb_io_in_bits_3_imag),
    .io_in_bits_3_real(bb_io_in_bits_3_real),
    .io_in_bits_2_imag(bb_io_in_bits_2_imag),
    .io_in_bits_2_real(bb_io_in_bits_2_real),
    .io_in_bits_1_imag(bb_io_in_bits_1_imag),
    .io_in_bits_1_real(bb_io_in_bits_1_real),
    .io_in_bits_0_imag(bb_io_in_bits_0_imag),
    .io_in_bits_0_real(bb_io_in_bits_0_real),
    .metaReset(is_meta_reset_phase),
    .reset(is_reset_phase | is_meta_reset_phase),
    .clock(clock)
  );


endmodule