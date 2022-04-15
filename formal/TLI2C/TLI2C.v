module TLI2C(
  input          metaReset,
  input          clock,
  input          reset,
  output         auto_int_out_0,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [1:0]   auto_in_a_bits_size,
  input  [6:0]   auto_in_a_bits_source,
  input  [28:0]  auto_in_a_bits_address,
  input  [3:0]   auto_in_a_bits_mask,
  input  [31:0]  auto_in_a_bits_data,
  input          auto_in_b_ready,
  output         auto_in_b_valid,
  output [2:0]   auto_in_b_bits_opcode,
  output [1:0]   auto_in_b_bits_param,
  output [1:0]   auto_in_b_bits_size,
  output [6:0]   auto_in_b_bits_source,
  output [28:0]  auto_in_b_bits_address,
  output [3:0]   auto_in_b_bits_mask,
  output [31:0]  auto_in_b_bits_data,
  output         auto_in_c_ready,
  input          auto_in_c_valid,
  input  [2:0]   auto_in_c_bits_opcode,
  input  [2:0]   auto_in_c_bits_param,
  input  [1:0]   auto_in_c_bits_size,
  input  [6:0]   auto_in_c_bits_source,
  input  [28:0]  auto_in_c_bits_address,
  input  [31:0]  auto_in_c_bits_data,
  input          auto_in_c_bits_error,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [1:0]   auto_in_d_bits_size,
  output [6:0]   auto_in_d_bits_source,
  output         auto_in_d_bits_sink,
  output [31:0]  auto_in_d_bits_data,
  output         auto_in_d_bits_error,
  output         auto_in_e_ready,
  input          auto_in_e_valid,
  input          auto_in_e_bits_sink,
  input          io_port_scl_in,
  output         io_port_scl_out,
  output         io_port_scl_oe,
  input          io_port_sda_in,
  output         io_port_sda_out,
  output         io_port_sda_oe,
  output [51:0]  assert_out,
  output [250:0] auto_cover_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
`endif // RANDOMIZE_REG_INIT
  wire  TLMonitor_metaReset; // @[Nodes.scala 25:25]
  wire  TLMonitor_clock; // @[Nodes.scala 25:25]
  wire  TLMonitor_reset; // @[Nodes.scala 25:25]
  wire  TLMonitor_io_in_a_ready; // @[Nodes.scala 25:25]
  wire  TLMonitor_io_in_a_valid; // @[Nodes.scala 25:25]
  wire [2:0] TLMonitor_io_in_a_bits_opcode; // @[Nodes.scala 25:25]
  wire [2:0] TLMonitor_io_in_a_bits_param; // @[Nodes.scala 25:25]
  wire [1:0] TLMonitor_io_in_a_bits_size; // @[Nodes.scala 25:25]
  wire [6:0] TLMonitor_io_in_a_bits_source; // @[Nodes.scala 25:25]
  wire [28:0] TLMonitor_io_in_a_bits_address; // @[Nodes.scala 25:25]
  wire [3:0] TLMonitor_io_in_a_bits_mask; // @[Nodes.scala 25:25]
  wire  TLMonitor_io_in_c_valid; // @[Nodes.scala 25:25]
  wire  TLMonitor_io_in_d_ready; // @[Nodes.scala 25:25]
  wire  TLMonitor_io_in_d_valid; // @[Nodes.scala 25:25]
  wire [2:0] TLMonitor_io_in_d_bits_opcode; // @[Nodes.scala 25:25]
  wire [1:0] TLMonitor_io_in_d_bits_size; // @[Nodes.scala 25:25]
  wire [6:0] TLMonitor_io_in_d_bits_source; // @[Nodes.scala 25:25]
  wire  TLMonitor_io_in_e_valid; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_39_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_23_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_11_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_4_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_79_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_72_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_20_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_58_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_65_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_75_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_82_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_51_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_68_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_22_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_86_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_44_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_38_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_62_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_41_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_32_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_25_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_55_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_17_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_48_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_7_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_35_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_28_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_10_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_3_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_84_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_54_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_64_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_89_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_71_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_78_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_74_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_57_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_50_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_81_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_34_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_9_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_43_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_30_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_67_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_21_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_37_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_60_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_47_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_12_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_40_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_24_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_5_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_27_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_66_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_83_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_2_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_87_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_70_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_63_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_88_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_76_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_46_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_49_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_73_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_26_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_80_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_33_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_56_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_59_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_8_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_29_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_36_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_1_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_42_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_52_0; // @[Nodes.scala 25:25]
  wire  profilePin_250 = TLMonitor__GEN_32_0;
  wire  profilePin_251 = TLMonitor__GEN_33_0;
  wire  profilePin_252 = TLMonitor__GEN_34_0;
  wire  profilePin_253 = TLMonitor__GEN_35_0;
  wire  profilePin_254 = TLMonitor__GEN_36_0;
  wire  profilePin_255 = TLMonitor__GEN_37_0;
  wire  profilePin_256 = TLMonitor__GEN_38_0;
  wire  profilePin_257 = TLMonitor__GEN_39_0;
  wire  profilePin_258 = TLMonitor__GEN_40_0;
  wire  profilePin_259 = TLMonitor__GEN_41_0;
  wire [9:0] _GEN_519 = {profilePin_250,profilePin_251,profilePin_252,profilePin_253,profilePin_254,profilePin_255,profilePin_256,profilePin_257,profilePin_258,profilePin_259};
  wire  profilePin_260 = TLMonitor__GEN_42_0;
  wire  profilePin_261 = TLMonitor__GEN_43_0;
  wire  profilePin_262 = TLMonitor__GEN_44_0;
  wire  profilePin_263 = TLMonitor__GEN_46_0;
  wire  profilePin_264 = TLMonitor__GEN_47_0;
  wire  profilePin_265 = TLMonitor__GEN_48_0;
  wire  profilePin_266 = TLMonitor__GEN_49_0;
  wire  profilePin_267 = TLMonitor__GEN_50_0;
  wire  profilePin_268 = TLMonitor__GEN_51_0;
  wire [18:0] _GEN_528 = {_GEN_519,profilePin_260,profilePin_261,profilePin_262,profilePin_263,profilePin_264,profilePin_265,profilePin_266,profilePin_267,profilePin_268};
  wire  profilePin_269 = TLMonitor__GEN_52_0;
  wire  profilePin_270 = TLMonitor__GEN_54_0;
  wire  profilePin_271 = TLMonitor__GEN_55_0;
  wire  profilePin_272 = TLMonitor__GEN_56_0;
  wire  profilePin_273 = TLMonitor__GEN_57_0;
  wire  profilePin_274 = TLMonitor__GEN_58_0;
  wire  profilePin_275 = TLMonitor__GEN_59_0;
  wire  profilePin_276 = TLMonitor__GEN_60_0;
  wire  profilePin_277 = TLMonitor__GEN_62_0;
  wire [27:0] _GEN_537 = {_GEN_528,profilePin_269,profilePin_270,profilePin_271,profilePin_272,profilePin_273,profilePin_274,profilePin_275,profilePin_276,profilePin_277};
  wire  profilePin_278 = TLMonitor__GEN_63_0;
  wire  profilePin_279 = TLMonitor__GEN_64_0;
  wire  profilePin_280 = TLMonitor__GEN_65_0;
  wire  profilePin_281 = TLMonitor__GEN_66_0;
  wire  profilePin_282 = TLMonitor__GEN_67_0;
  wire  profilePin_283 = TLMonitor__GEN_68_0;
  wire  profilePin_284 = TLMonitor__GEN_70_0;
  wire  profilePin_285 = TLMonitor__GEN_71_0;
  wire  profilePin_286 = TLMonitor__GEN_72_0;
  wire [36:0] _GEN_546 = {_GEN_537,profilePin_278,profilePin_279,profilePin_280,profilePin_281,profilePin_282,profilePin_283,profilePin_284,profilePin_285,profilePin_286};
  wire  profilePin_287 = TLMonitor__GEN_73_0;
  wire  profilePin_288 = TLMonitor__GEN_74_0;
  wire  profilePin_289 = TLMonitor__GEN_75_0;
  wire  profilePin_290 = TLMonitor__GEN_76_0;
  wire  profilePin_291 = TLMonitor__GEN_78_0;
  wire  profilePin_292 = TLMonitor__GEN_79_0;
  wire  profilePin_293 = TLMonitor__GEN_80_0;
  wire  profilePin_294 = TLMonitor__GEN_81_0;
  wire  profilePin_295 = TLMonitor__GEN_82_0;
  wire [45:0] _GEN_555 = {_GEN_546,profilePin_287,profilePin_288,profilePin_289,profilePin_290,profilePin_291,profilePin_292,profilePin_293,profilePin_294,profilePin_295};
  wire  profilePin_296 = TLMonitor__GEN_83_0;
  wire  profilePin_297 = TLMonitor__GEN_84_0;
  wire  profilePin_298 = TLMonitor__GEN_86_0;
  wire  profilePin_299 = TLMonitor__GEN_87_0;
  wire  profilePin_300 = TLMonitor__GEN_88_0;
  wire [50:0] _GEN_560 = {_GEN_555,profilePin_296,profilePin_297,profilePin_298,profilePin_299,profilePin_300};
  wire  profilePin_301 = TLMonitor__GEN_89_0;
  reg [13:0] filterCnt; // @[I2C.scala 123:22]
  wire  _T_237 = filterCnt != 14'h0; // @[I2C.scala 126:28]
  wire  profilePin = ~_T_237; // @[I2C.scala 126:16]
  reg  control_coreEn; // @[I2C.scala 110:25]
  wire  profilePin_0 = ~control_coreEn; // @[I2C.scala 124:10]
  reg  slaveWait; // @[I2C.scala 158:22]
  reg [15:0] cnt; // @[I2C.scala 162:22]
  wire  _T_313 = cnt != 16'h0; // @[I2C.scala 165:15]
  wire  _T_315 = ~_T_313; // @[I2C.scala 165:9]
  wire  _T_318 = _T_315 | profilePin_0; // @[I2C.scala 165:20]
  reg  dSCL; // @[I2C.scala 142:22]
  reg  sSCL; // @[I2C.scala 139:22]
  wire  _T_294 = ~sSCL; // @[I2C.scala 154:27]
  wire  _T_295 = dSCL & _T_294; // @[I2C.scala 154:24]
  wire  sclSync = _T_295 & io_port_scl_oe; // @[I2C.scala 154:33]
  wire  profilePin_4 = _T_318 | sclSync; // @[I2C.scala 165:39]
  reg  clkEn; // @[I2C.scala 161:22]
  reg [3:0] bitCmd; // @[I2C.scala 191:24]
  wire  profilePin_6 = 4'h8 == bitCmd; // @[Conditional.scala 37:30]
  wire  profilePin_7 = 4'h4 == bitCmd; // @[Conditional.scala 37:30]
  wire  profilePin_8 = 4'h2 == bitCmd; // @[Conditional.scala 37:30]
  wire [9:0] _GEN_822 = {profilePin,profilePin_0,profilePin,profilePin,slaveWait,profilePin_4,clkEn,profilePin_6,profilePin_7,profilePin_8};
  wire  profilePin_9 = 4'h1 == bitCmd; // @[Conditional.scala 37:30]
  reg [4:0] bitState; // @[I2C.scala 203:24]
  wire  profilePin_10 = 5'h11 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_14 = 5'h10 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_17 = 5'hf == bitState; // @[Conditional.scala 37:30]
  wire [18:0] _GEN_831 = {_GEN_822,profilePin_9,profilePin_10,profilePin_10,profilePin_10,profilePin_10,profilePin_14,profilePin_14,profilePin_14,profilePin_17};
  wire  profilePin_21 = 5'he == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_26 = 5'hd == bitState; // @[Conditional.scala 37:30]
  wire [27:0] _GEN_840 = {_GEN_831,profilePin_17,profilePin_17,profilePin_17,profilePin_21,profilePin_21,profilePin_21,profilePin_21,profilePin_21,profilePin_26};
  wire  profilePin_29 = 5'hc == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_32 = 5'hb == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_35 = 5'ha == bitState; // @[Conditional.scala 37:30]
  wire [36:0] _GEN_849 = {_GEN_840,profilePin_26,profilePin_26,profilePin_29,profilePin_29,profilePin_29,profilePin_32,profilePin_32,profilePin_32,profilePin_35};
  wire  profilePin_39 = 5'h9 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_41 = 5'h8 == bitState; // @[Conditional.scala 37:30]
  wire [45:0] _GEN_858 = {_GEN_849,profilePin_35,profilePin_35,profilePin_35,profilePin_39,profilePin_39,profilePin_41,profilePin_41,profilePin_41,profilePin_41};
  wire  profilePin_45 = 5'h7 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_49 = 5'h6 == bitState; // @[Conditional.scala 37:30]
  wire [54:0] _GEN_867 = {_GEN_858,profilePin_45,profilePin_45,profilePin_45,profilePin_45,profilePin_49,profilePin_49,profilePin_49,profilePin_49,profilePin_49};
  wire  profilePin_54 = 5'h5 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_58 = 5'h4 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_62 = 5'h3 == bitState; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_876 = {_GEN_867,profilePin_54,profilePin_54,profilePin_54,profilePin_54,profilePin_58,profilePin_58,profilePin_58,profilePin_58,profilePin_62};
  wire  profilePin_66 = 5'h2 == bitState; // @[Conditional.scala 37:30]
  wire  profilePin_69 = 5'h1 == bitState; // @[Conditional.scala 37:30]
  wire [72:0] _GEN_885 = {_GEN_876,profilePin_62,profilePin_62,profilePin_62,profilePin_66,profilePin_66,profilePin_66,profilePin_69,profilePin_69,profilePin_69};
  wire  profilePin_73 = 5'h0 == bitState; // @[Conditional.scala 37:30]
  wire [81:0] _GEN_894 = {_GEN_885,profilePin_69,profilePin_73,profilePin_73,profilePin_73,profilePin_73,profilePin_73,clkEn,clkEn,clkEn};
  reg  arbLost; // @[I2C.scala 205:24]
  reg  shift; // @[I2C.scala 346:24]
  reg  load; // @[I2C.scala 345:24]
  reg  cmd_write; // @[I2C.scala 113:25]
  wire [90:0] _GEN_903 = {_GEN_894,clkEn,arbLost,arbLost,arbLost,shift,load,shift,load,cmd_write};
  reg  cmd_read; // @[I2C.scala 113:25]
  reg  cmd_start; // @[I2C.scala 113:25]
  wire  _T_451 = cmd_read | cmd_write; // @[I2C.scala 349:31]
  reg  cmd_stop; // @[I2C.scala 113:25]
  wire  _T_452 = _T_451 | cmd_stop; // @[I2C.scala 349:43]
  reg  cmdAck; // @[I2C.scala 347:24]
  wire  _T_454 = ~cmdAck; // @[I2C.scala 349:57]
  wire  go = _T_452 & _T_454; // @[I2C.scala 349:55]
  wire [99:0] _GEN_912 = {_GEN_903,cmd_write,cmd_read,cmd_read,cmd_start,cmd_start,go,go,cmd_read,cmd_read};
  reg  bitCmdAck; // @[I2C.scala 196:24]
  reg [2:0] bitCnt; // @[I2C.scala 351:24]
  wire  _T_463 = bitCnt != 3'h0; // @[I2C.scala 358:30]
  wire  bitCntDone = ~_T_463; // @[I2C.scala 358:21]
  wire [108:0] _GEN_921 = {_GEN_912,bitCmdAck,bitCmdAck,bitCntDone,bitCntDone,bitCntDone,bitCmdAck,bitCmdAck,bitCntDone,bitCntDone};
  wire [117:0] _GEN_930 = {_GEN_921,bitCmdAck,bitCmdAck,bitCmdAck,cmd_stop,cmd_stop,cmd_stop,bitCmdAck,bitCmdAck,bitCmdAck};
  reg [2:0] byteState; // @[I2C.scala 369:24]
  wire  profilePin_119 = 3'h5 == byteState; // @[Conditional.scala 37:30]
  wire  profilePin_121 = 3'h4 == byteState; // @[Conditional.scala 37:30]
  wire [126:0] _GEN_939 = {_GEN_930,bitCmdAck,bitCmdAck,profilePin_119,profilePin_119,profilePin_121,profilePin_121,profilePin_121,profilePin_121,profilePin_121};
  wire  profilePin_126 = 3'h2 == byteState; // @[Conditional.scala 37:30]
  wire  profilePin_131 = 3'h3 == byteState; // @[Conditional.scala 37:30]
  wire [135:0] _GEN_948 = {_GEN_939,profilePin_126,profilePin_126,profilePin_126,profilePin_126,profilePin_126,profilePin_131,profilePin_131,profilePin_131,profilePin_131};
  wire  profilePin_137 = 3'h1 == byteState; // @[Conditional.scala 37:30]
  wire  profilePin_143 = 3'h0 == byteState; // @[Conditional.scala 37:30]
  wire [144:0] _GEN_957 = {_GEN_948,profilePin_131,profilePin_131,profilePin_137,profilePin_137,profilePin_137,profilePin_137,profilePin_137,profilePin_137,profilePin_143};
  wire [153:0] _GEN_966 = {_GEN_957,profilePin_143,profilePin_143,profilePin_143,profilePin_143,profilePin_143,profilePin_143,arbLost,arbLost,arbLost};
  wire  profilePin_157 = auto_in_a_bits_mask[3]; // @[Bitwise.scala 27:51]
  wire  profilePin_158 = auto_in_a_bits_mask[2]; // @[Bitwise.scala 27:51]
  wire  profilePin_159 = auto_in_a_bits_mask[1]; // @[Bitwise.scala 27:51]
  wire  profilePin_160 = auto_in_a_bits_mask[0]; // @[Bitwise.scala 27:51]
  wire  _T_1323 = auto_in_a_valid & auto_in_d_ready; // @[RegisterRouter.scala 62:24]
  wire  profilePin_170 = auto_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 55:36]
  wire  _T_1325 = ~profilePin_170; // @[RegisterRouter.scala 62:24]
  wire  _T_1326 = _T_1323 & _T_1325; // @[RegisterRouter.scala 62:24]
  wire [2:0] _T_1051 = {auto_in_a_bits_address[4],auto_in_a_bits_address[3],auto_in_a_bits_address[2]}; // @[Cat.scala 30:58]
  wire [7:0] _T_1075 = 8'h1 << _T_1051; // @[OneHot.scala 45:35]
  wire  _T_1361 = _T_1326 & _T_1075[4]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_613 = auto_in_a_bits_address[11:2] ^ 10'h4; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_614 = _T_613 & 10'h3f8; // @[RegisterRouter.scala 62:24]
  wire  _T_616 = _T_614 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_1362 = _T_1361 & _T_616; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_723 = profilePin_157 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_719 = profilePin_158 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_715 = profilePin_159 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_711 = profilePin_160 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_726 = {_T_723,_T_719,_T_715,_T_711}; // @[Cat.scala 30:58]
  wire [7:0] _T_1002 = ~_T_726[7:0]; // @[RegisterRouter.scala 62:24]
  wire  _T_1004 = _T_1002 == 8'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_161 = _T_1362 & _T_1004; // @[RegisterRouter.scala 62:24]
  wire [162:0] _GEN_975 = {_GEN_966,arbLost,arbLost,arbLost,arbLost,profilePin_157,profilePin_158,profilePin_159,profilePin_160,profilePin_161};
  wire  profilePin_162 = cmdAck | arbLost; // @[I2C.scala 495:16]
  reg  stopCond; // @[I2C.scala 150:22]
  wire  profilePin_169 = 3'h4 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire [171:0] _GEN_984 = {_GEN_975,profilePin_162,profilePin_162,profilePin_162,profilePin_162,stopCond,cmd_start,profilePin_162,profilePin_169,profilePin_170};
  wire  _T_1329 = _T_1326 & _T_1075[0]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_578 = auto_in_a_bits_address[11:2] & 10'h3f8; // @[RegisterRouter.scala 62:24]
  wire  _T_580 = _T_578 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_1330 = _T_1329 & _T_580; // @[RegisterRouter.scala 62:24]
  wire  profilePin_171 = _T_1330 & _T_1004; // @[RegisterRouter.scala 62:24]
  wire  _T_1337 = _T_1326 & _T_1075[1]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_586 = auto_in_a_bits_address[11:2] ^ 10'h1; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_587 = _T_586 & 10'h3f8; // @[RegisterRouter.scala 62:24]
  wire  _T_589 = _T_587 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_1338 = _T_1337 & _T_589; // @[RegisterRouter.scala 62:24]
  wire  profilePin_172 = _T_1338 & _T_1004; // @[RegisterRouter.scala 62:24]
  wire  _T_1345 = _T_1326 & _T_1075[2]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_595 = auto_in_a_bits_address[11:2] ^ 10'h2; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_596 = _T_595 & 10'h3f8; // @[RegisterRouter.scala 62:24]
  wire  _T_598 = _T_596 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_1346 = _T_1345 & _T_598; // @[RegisterRouter.scala 62:24]
  wire  _T_863 = ~_T_726[6]; // @[RegisterRouter.scala 62:24]
  wire  _T_865 = ~_T_863; // @[RegisterRouter.scala 62:24]
  wire  profilePin_173 = _T_1346 & _T_865; // @[RegisterRouter.scala 62:24]
  wire  _T_907 = ~_T_726[7]; // @[RegisterRouter.scala 62:24]
  wire  _T_909 = ~_T_907; // @[RegisterRouter.scala 62:24]
  wire  profilePin_174 = _T_1346 & _T_909; // @[RegisterRouter.scala 62:24]
  wire  _T_1353 = _T_1326 & _T_1075[3]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_604 = auto_in_a_bits_address[11:2] ^ 10'h3; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_605 = _T_604 & 10'h3f8; // @[RegisterRouter.scala 62:24]
  wire  _T_607 = _T_605 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_1354 = _T_1353 & _T_607; // @[RegisterRouter.scala 62:24]
  wire  profilePin_175 = _T_1354 & _T_1004; // @[RegisterRouter.scala 62:24]
  wire  profilePin_177 = 3'h1 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire  profilePin_178 = 3'h2 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire  profilePin_179 = 3'h3 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire [180:0] _GEN_993 = {_GEN_984,profilePin_171,profilePin_172,profilePin_173,profilePin_174,profilePin_175,profilePin_161,profilePin_177,profilePin_178,profilePin_179};
  wire  profilePin_185 = 3'h5 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire  profilePin_186 = 3'h6 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire  profilePin_187 = 3'h7 == _T_1051; // @[RegisterRouter.scala 62:24]
  wire  _GEN_245 = profilePin_177 ? _T_589 : _T_580; // @[RegisterRouter.scala 62:24]
  wire  _GEN_246 = profilePin_178 ? _T_598 : _GEN_245; // @[RegisterRouter.scala 62:24]
  wire  _GEN_247 = profilePin_179 ? _T_607 : _GEN_246; // @[RegisterRouter.scala 62:24]
  wire  _GEN_248 = profilePin_169 ? _T_616 : _GEN_247; // @[RegisterRouter.scala 62:24]
  wire  _GEN_249 = profilePin_185 | _GEN_248; // @[RegisterRouter.scala 62:24]
  wire  _GEN_250 = profilePin_186 | _GEN_249; // @[RegisterRouter.scala 62:24]
  wire  profilePin_188 = profilePin_187 | _GEN_250; // @[RegisterRouter.scala 62:24]
  wire [189:0] _GEN_1002 = {_GEN_993,profilePin_169,profilePin_177,profilePin_178,profilePin_179,profilePin_169,profilePin_185,profilePin_186,profilePin_187,profilePin_188};
  wire [198:0] _GEN_1011 = {_GEN_1002,reset,reset,reset,reset,reset,reset,reset,reset,reset};
  wire [207:0] _GEN_1020 = {_GEN_1011,reset,reset,reset,reset,reset,reset,reset,reset,reset};
  wire  _T_342 = ~dSCL; // @[I2C.scala 187:17]
  wire  profilePin_215 = sSCL & _T_342; // @[I2C.scala 187:14]
  wire [216:0] _GEN_1029 = {_GEN_1020,reset,reset,reset,reset,reset,reset,reset,reset,profilePin_215};
  wire [225:0] _GEN_1038 = {_GEN_1029,reset,reset,reset,reset,reset,reset,reset,reset,reset};
  wire  profilePin_227 = TLMonitor__GEN_1_0;
  wire  profilePin_228 = TLMonitor__GEN_2_0;
  wire  profilePin_229 = TLMonitor__GEN_3_0;
  wire  profilePin_230 = TLMonitor__GEN_4_1;
  wire  profilePin_231 = TLMonitor__GEN_5_0;
  wire  profilePin_232 = TLMonitor__GEN_7_0;
  wire  profilePin_233 = TLMonitor__GEN_8_1;
  wire [234:0] _GEN_1047 = {_GEN_1038,reset,reset,profilePin_227,profilePin_228,profilePin_229,profilePin_230,profilePin_231,profilePin_232,profilePin_233};
  wire  profilePin_234 = TLMonitor__GEN_9_0;
  wire  profilePin_235 = TLMonitor__GEN_10_0;
  wire  profilePin_236 = TLMonitor__GEN_11_0;
  wire  profilePin_237 = TLMonitor__GEN_12_0;
  wire  profilePin_238 = TLMonitor__GEN_17_0;
  wire  profilePin_239 = TLMonitor__GEN_20_0;
  wire  profilePin_240 = TLMonitor__GEN_21_0;
  wire  profilePin_241 = TLMonitor__GEN_22_0;
  wire  profilePin_242 = TLMonitor__GEN_23_0;
  wire [243:0] _GEN_1056 = {_GEN_1047,profilePin_234,profilePin_235,profilePin_236,profilePin_237,profilePin_238,profilePin_239,profilePin_240,profilePin_241,profilePin_242};
  wire  profilePin_243 = TLMonitor__GEN_24_0;
  wire  profilePin_244 = TLMonitor__GEN_25_0;
  wire  profilePin_245 = TLMonitor__GEN_26_0;
  wire  profilePin_246 = TLMonitor__GEN_27_0;
  wire  profilePin_247 = TLMonitor__GEN_28_0;
  wire  profilePin_248 = TLMonitor__GEN_29_0;
  wire [249:0] _GEN_1062 = {_GEN_1056,profilePin_243,profilePin_244,profilePin_245,profilePin_246,profilePin_247,profilePin_248};
  wire  profilePin_249 = TLMonitor__GEN_30_0;
  reg [7:0] prescaler_hi; // @[I2C.scala 109:25]
  reg [7:0] prescaler_lo; // @[I2C.scala 109:25]
  reg  control_intEn; // @[I2C.scala 110:25]
  reg [7:0] transmitData; // @[I2C.scala 111:25]
  reg [7:0] receivedData; // @[I2C.scala 112:25]
  reg  cmd_ack; // @[I2C.scala 113:25]
  reg  cmd_irqAck; // @[I2C.scala 113:25]
  reg  status_receivedAck; // @[I2C.scala 114:25]
  reg  status_busy; // @[I2C.scala 114:25]
  reg  status_arbLost; // @[I2C.scala 114:25]
  reg  status_transferInProgress; // @[I2C.scala 114:25]
  reg  status_irqFlag; // @[I2C.scala 114:25]
  wire [15:0] _T_240 = {prescaler_hi,prescaler_lo}; // @[Cat.scala 30:58]
  wire [13:0] _T_245 = filterCnt - 14'h1; // @[I2C.scala 129:28]
  reg [2:0] fSCL; // @[I2C.scala 132:22]
  reg [2:0] fSDA; // @[I2C.scala 133:22]
  wire [3:0] _T_254 = {fSCL,io_port_scl_in}; // @[Cat.scala 30:58]
  wire [3:0] _T_255 = {fSDA,io_port_sda_in}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_2 = profilePin ? _T_254 : {{1'd0}, fSCL}; // @[I2C.scala 134:27]
  wire [3:0] _GEN_3 = profilePin ? _T_255 : {{1'd0}, fSDA}; // @[I2C.scala 134:27]
  wire  _T_260 = fSCL[0] & fSCL[1]; // @[Misc.scala 202:48]
  wire  _T_261 = fSCL[0] & fSCL[2]; // @[Misc.scala 202:48]
  wire  _T_262 = _T_260 | _T_261; // @[Misc.scala 203:22]
  wire  _T_263 = fSCL[1] & fSCL[2]; // @[Misc.scala 202:48]
  wire  _T_264 = _T_262 | _T_263; // @[Misc.scala 203:22]
  wire  _T_270 = fSDA[0] & fSDA[1]; // @[Misc.scala 202:48]
  wire  _T_271 = fSDA[0] & fSDA[2]; // @[Misc.scala 202:48]
  wire  _T_272 = _T_270 | _T_271; // @[Misc.scala 203:22]
  wire  _T_273 = fSDA[1] & fSDA[2]; // @[Misc.scala 202:48]
  wire  _T_274 = _T_272 | _T_273; // @[Misc.scala 203:22]
  reg  sSDA; // @[I2C.scala 140:22]
  reg  dSDA; // @[I2C.scala 143:22]
  reg  dSCLOen; // @[I2C.scala 145:22]
  wire  _T_283 = ~sSDA; // @[I2C.scala 149:46]
  wire  _T_284 = _T_283 & dSDA; // @[I2C.scala 149:52]
  wire  _T_285 = _T_284 & sSCL; // @[I2C.scala 149:61]
  reg  startCond; // @[I2C.scala 149:22]
  wire  _T_289 = ~dSDA; // @[I2C.scala 150:55]
  wire  _T_290 = sSDA & _T_289; // @[I2C.scala 150:52]
  wire  _T_291 = _T_290 & sSCL; // @[I2C.scala 150:61]
  wire  _T_299 = ~dSCLOen; // @[I2C.scala 159:35]
  wire  _T_300 = io_port_scl_oe & _T_299; // @[I2C.scala 159:32]
  wire  _T_303 = _T_300 & _T_294; // @[I2C.scala 159:44]
  wire  _T_306 = slaveWait & _T_294; // @[I2C.scala 159:68]
  wire  _T_307 = _T_303 | _T_306; // @[I2C.scala 159:54]
  wire [15:0] _T_326 = cnt - 16'h1; // @[I2C.scala 173:18]
  reg  sclOen; // @[I2C.scala 177:23]
  reg  sdaOen; // @[I2C.scala 180:23]
  reg  sdaChk; // @[I2C.scala 183:23]
  reg  transmitBit; // @[I2C.scala 185:24]
  reg  receivedBit; // @[I2C.scala 186:24]
  reg  bitCmdStop; // @[I2C.scala 192:24]
  wire  _T_348 = bitCmd == 4'h2; // @[I2C.scala 194:26]
  wire  _T_356 = sdaChk & _T_283; // @[I2C.scala 205:56]
  wire  _T_357 = _T_356 & sdaOen; // @[I2C.scala 205:65]
  wire  _T_358 = bitState != 5'h0; // @[I2C.scala 205:89]
  wire  _T_359 = _T_358 & stopCond; // @[I2C.scala 205:105]
  wire  _T_361 = ~bitCmdStop; // @[I2C.scala 205:120]
  wire  _T_362 = _T_359 & _T_361; // @[I2C.scala 205:117]
  wire  _T_363 = _T_357 | _T_362; // @[I2C.scala 205:76]
  wire  _GEN_16 = profilePin_10 ? 1'h0 : sclOen; // @[Conditional.scala 39:67]
  wire  _GEN_17 = profilePin_10 ? transmitBit : sdaOen; // @[Conditional.scala 39:67]
  wire  _GEN_18 = profilePin_10 ? 1'h0 : sdaChk; // @[Conditional.scala 39:67]
  wire  _GEN_20 = profilePin_14 | _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_21 = profilePin_14 ? transmitBit : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_22 = profilePin_14 | _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_23 = profilePin_14 ? 1'h0 : profilePin_10; // @[Conditional.scala 39:67]
  wire  _GEN_25 = profilePin_17 | _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_26 = profilePin_17 ? transmitBit : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_28 = profilePin_17 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_30 = profilePin_21 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_31 = profilePin_21 ? transmitBit : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_33 = profilePin_21 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_35 = profilePin_26 | _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_36 = profilePin_26 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_37 = profilePin_26 | _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_40 = profilePin_29 | _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_41 = profilePin_29 | _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_43 = profilePin_29 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_45 = profilePin_32 | _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_46 = profilePin_32 | _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_48 = profilePin_32 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_50 = profilePin_35 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_51 = profilePin_35 | _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_53 = profilePin_35 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_55 = profilePin_39 | _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_56 = profilePin_39 | _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_57 = profilePin_39 | _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_60 = profilePin_41 | _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_61 = profilePin_41 ? 1'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_63 = profilePin_41 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_65 = profilePin_45 | _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_66 = profilePin_45 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_68 = profilePin_45 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_70 = profilePin_49 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_71 = profilePin_49 ? 1'h0 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_73 = profilePin_49 ? 1'h0 : _GEN_68; // @[Conditional.scala 39:67]
  wire  _GEN_75 = profilePin_54 | _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_76 = profilePin_54 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_77 = profilePin_54 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_80 = profilePin_58 | _GEN_76; // @[Conditional.scala 39:67]
  wire  _GEN_81 = profilePin_58 ? 1'h0 : _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_83 = profilePin_58 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67]
  wire  _GEN_85 = profilePin_62 | _GEN_80; // @[Conditional.scala 39:67]
  wire  _GEN_86 = profilePin_62 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_88 = profilePin_62 ? 1'h0 : _GEN_83; // @[Conditional.scala 39:67]
  wire  _GEN_90 = profilePin_66 | _GEN_85; // @[Conditional.scala 39:67]
  wire  _GEN_91 = profilePin_66 | _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_93 = profilePin_66 ? 1'h0 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_95 = profilePin_69 ? sclOen : _GEN_90; // @[Conditional.scala 39:67]
  wire  _GEN_96 = profilePin_69 | _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_98 = profilePin_69 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_101 = profilePin_73 ? sclOen : _GEN_95; // @[Conditional.scala 40:58]
  wire  _GEN_102 = profilePin_73 ? sdaOen : _GEN_96; // @[Conditional.scala 40:58]
  wire  _GEN_103 = profilePin_73 ? 1'h0 : _GEN_98; // @[Conditional.scala 40:58]
  wire  _GEN_106 = clkEn ? _GEN_101 : sclOen; // @[I2C.scala 218:18]
  wire  _GEN_107 = clkEn ? _GEN_102 : sdaOen; // @[I2C.scala 218:18]
  wire  _GEN_108 = clkEn & _GEN_103; // @[I2C.scala 218:18]
  wire  _GEN_111 = arbLost | _GEN_106; // @[I2C.scala 208:18]
  wire  _GEN_112 = arbLost | _GEN_107; // @[I2C.scala 208:18]
  reg  receivedAck; // @[I2C.scala 348:24]
  wire [2:0] _T_461 = bitCnt - 3'h1; // @[I2C.scala 356:22]
  wire [8:0] _T_465 = {receivedData,receivedBit}; // @[Cat.scala 30:58]
  wire [8:0] _GEN_116 = shift ? _T_465 : {{1'd0}, receivedData}; // @[I2C.scala 364:21]
  wire [8:0] _GEN_117 = load ? {{1'd0}, transmitData} : _GEN_116; // @[I2C.scala 361:15]
  wire [2:0] _GEN_119 = cmd_write ? 3'h4 : 3'h2; // @[I2C.scala 397:33]
  wire  _GEN_134 = bitCntDone ? 1'h0 : 1'h1; // @[I2C.scala 425:29]
  wire  _GEN_137 = bitCmdAck & _GEN_134; // @[I2C.scala 424:26]
  wire [1:0] _GEN_144 = cmd_stop ? 2'h2 : 2'h0; // @[I2C.scala 453:27]
  wire  _GEN_145 = cmd_stop ? 1'h0 : 1'h1; // @[I2C.scala 453:27]
  wire  _GEN_148 = bitCmdAck & _GEN_145; // @[I2C.scala 452:26]
  wire  _GEN_150 = bitCmdAck | cmd_ack; // @[I2C.scala 452:26]
  wire  _GEN_155 = profilePin_119 & bitCmdAck; // @[Conditional.scala 39:67]
  wire  _GEN_163 = profilePin_126 & bitCmdAck; // @[Conditional.scala 39:67]
  wire  _GEN_175 = profilePin_137 & bitCmdAck; // @[Conditional.scala 39:67]
  wire  _T_1124 = ~_T_616; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_508 = {cmd_start,cmd_stop,cmd_read,cmd_write,cmd_ack,2'h0,cmd_irqAck}; // @[I2C.scala 492:18]
  wire [7:0] _T_510 = _T_508 & 8'hfe; // @[I2C.scala 492:25]
  wire [7:0] nextCmd = profilePin_161 ? auto_in_a_bits_data[7:0] : _T_510; // @[I2C.scala 538:77]
  wire  _GEN_198 = startCond | status_busy; // @[I2C.scala 506:25]
  wire  _GEN_200 = cmd_start ? 1'h0 : status_arbLost; // @[I2C.scala 513:25]
  wire  _GEN_201 = arbLost | _GEN_200; // @[I2C.scala 510:18]
  wire  _T_522 = profilePin_162 | status_irqFlag; // @[I2C.scala 517:51]
  wire  _T_524 = ~cmd_irqAck; // @[I2C.scala 517:73]
  wire  _T_525 = _T_522 & _T_524; // @[I2C.scala 517:70]
  reg  statusReadReady; // @[I2C.scala 520:28]
  wire  _T_531 = ~statusReadReady; // @[I2C.scala 524:14]
  wire  _GEN_202 = _T_531 | statusReadReady; // @[I2C.scala 524:32]
  wire  _GEN_203 = profilePin_162 ? 1'h0 : _GEN_202; // @[I2C.scala 521:28]
  wire [8:0] _T_543 = {auto_in_a_bits_source,auto_in_a_bits_size}; // @[Cat.scala 30:58]
  wire  _T_729 = _T_726[7:0] != 8'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_1030 = ~_T_729; // @[RegisterRouter.scala 62:24]
  wire  _T_1031 = statusReadReady | _T_1030; // @[RegisterRouter.scala 62:24]
  wire  _T_1285 = _T_1031 | _T_1124; // @[RegisterRouter.scala 62:24]
  wire  _GEN_232 = profilePin_169 ? _T_1285 : 1'h1; // @[RegisterRouter.scala 62:24]
  wire  _GEN_233 = profilePin_185 | _GEN_232; // @[RegisterRouter.scala 62:24]
  wire  _GEN_234 = profilePin_186 | _GEN_233; // @[RegisterRouter.scala 62:24]
  wire  _GEN_235 = profilePin_187 | _GEN_234; // @[RegisterRouter.scala 62:24]
  wire  _T_1409 = profilePin_170 ? _GEN_235 : 1'h1; // @[RegisterRouter.scala 62:24]
  wire [6:0] _T_898 = {control_intEn, 6'h0}; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_942 = {control_coreEn, 7'h0}; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_302 = {{1'd0}, _T_898}; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_946 = _GEN_302 | _T_942; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_1013 = {status_receivedAck,status_busy,status_arbLost,3'h0,status_transferInProgress,status_irqFlag}; // @[I2C.scala 535:89]
  wire  _GEN_210 = profilePin_161 ? 1'h0 : _GEN_203; // @[I2C.scala 538:77]
  wire [7:0] _GEN_253 = profilePin_177 ? prescaler_hi : prescaler_lo; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_254 = profilePin_178 ? _T_946 : _GEN_253; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_255 = profilePin_179 ? receivedData : _GEN_254; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_256 = profilePin_169 ? _T_1013 : _GEN_255; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_257 = profilePin_185 ? 8'h0 : _GEN_256; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_258 = profilePin_186 ? 8'h0 : _GEN_257; // @[RegisterRouter.scala 62:24]
  wire [7:0] _GEN_259 = profilePin_187 ? 8'h0 : _GEN_258; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_1443 = profilePin_188 ? _GEN_259 : 8'h0; // @[RegisterRouter.scala 62:24]
  TLMonitor_72 TLMonitor ( // @[Nodes.scala 25:25]
    .metaReset(TLMonitor_metaReset),
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_c_valid(TLMonitor_io_in_c_valid),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_e_valid(TLMonitor_io_in_e_valid),
    ._GEN_39_0(TLMonitor__GEN_39_0),
    ._GEN_23_0(TLMonitor__GEN_23_0),
    ._GEN_11_0(TLMonitor__GEN_11_0),
    ._GEN_4_1(TLMonitor__GEN_4_1),
    ._GEN_79_0(TLMonitor__GEN_79_0),
    ._GEN_72_0(TLMonitor__GEN_72_0),
    ._GEN_20_0(TLMonitor__GEN_20_0),
    ._GEN_58_0(TLMonitor__GEN_58_0),
    ._GEN_65_0(TLMonitor__GEN_65_0),
    ._GEN_75_0(TLMonitor__GEN_75_0),
    ._GEN_82_0(TLMonitor__GEN_82_0),
    ._GEN_51_0(TLMonitor__GEN_51_0),
    ._GEN_68_0(TLMonitor__GEN_68_0),
    ._GEN_22_0(TLMonitor__GEN_22_0),
    ._GEN_86_0(TLMonitor__GEN_86_0),
    ._GEN_44_0(TLMonitor__GEN_44_0),
    ._GEN_38_0(TLMonitor__GEN_38_0),
    ._GEN_62_0(TLMonitor__GEN_62_0),
    ._GEN_41_0(TLMonitor__GEN_41_0),
    ._GEN_32_0(TLMonitor__GEN_32_0),
    ._GEN_25_0(TLMonitor__GEN_25_0),
    ._GEN_55_0(TLMonitor__GEN_55_0),
    ._GEN_17_0(TLMonitor__GEN_17_0),
    ._GEN_48_0(TLMonitor__GEN_48_0),
    ._GEN_7_0(TLMonitor__GEN_7_0),
    ._GEN_35_0(TLMonitor__GEN_35_0),
    ._GEN_28_0(TLMonitor__GEN_28_0),
    ._GEN_10_0(TLMonitor__GEN_10_0),
    ._GEN_3_0(TLMonitor__GEN_3_0),
    ._GEN_84_0(TLMonitor__GEN_84_0),
    ._GEN_54_0(TLMonitor__GEN_54_0),
    ._GEN_64_0(TLMonitor__GEN_64_0),
    ._GEN_89_0(TLMonitor__GEN_89_0),
    ._GEN_71_0(TLMonitor__GEN_71_0),
    ._GEN_78_0(TLMonitor__GEN_78_0),
    ._GEN_74_0(TLMonitor__GEN_74_0),
    ._GEN_57_0(TLMonitor__GEN_57_0),
    ._GEN_50_0(TLMonitor__GEN_50_0),
    ._GEN_81_0(TLMonitor__GEN_81_0),
    ._GEN_34_0(TLMonitor__GEN_34_0),
    ._GEN_9_0(TLMonitor__GEN_9_0),
    ._GEN_43_0(TLMonitor__GEN_43_0),
    ._GEN_30_0(TLMonitor__GEN_30_0),
    ._GEN_67_0(TLMonitor__GEN_67_0),
    ._GEN_21_0(TLMonitor__GEN_21_0),
    ._GEN_37_0(TLMonitor__GEN_37_0),
    ._GEN_60_0(TLMonitor__GEN_60_0),
    ._GEN_47_0(TLMonitor__GEN_47_0),
    ._GEN_12_0(TLMonitor__GEN_12_0),
    ._GEN_40_0(TLMonitor__GEN_40_0),
    ._GEN_24_0(TLMonitor__GEN_24_0),
    ._GEN_5_0(TLMonitor__GEN_5_0),
    ._GEN_27_0(TLMonitor__GEN_27_0),
    ._GEN_66_0(TLMonitor__GEN_66_0),
    ._GEN_83_0(TLMonitor__GEN_83_0),
    ._GEN_2_0(TLMonitor__GEN_2_0),
    ._GEN_87_0(TLMonitor__GEN_87_0),
    ._GEN_70_0(TLMonitor__GEN_70_0),
    ._GEN_63_0(TLMonitor__GEN_63_0),
    ._GEN_88_0(TLMonitor__GEN_88_0),
    ._GEN_76_0(TLMonitor__GEN_76_0),
    ._GEN_46_0(TLMonitor__GEN_46_0),
    ._GEN_49_0(TLMonitor__GEN_49_0),
    ._GEN_73_0(TLMonitor__GEN_73_0),
    ._GEN_26_0(TLMonitor__GEN_26_0),
    ._GEN_80_0(TLMonitor__GEN_80_0),
    ._GEN_33_0(TLMonitor__GEN_33_0),
    ._GEN_56_0(TLMonitor__GEN_56_0),
    ._GEN_59_0(TLMonitor__GEN_59_0),
    ._GEN_8_1(TLMonitor__GEN_8_1),
    ._GEN_29_0(TLMonitor__GEN_29_0),
    ._GEN_36_0(TLMonitor__GEN_36_0),
    ._GEN_1_0(TLMonitor__GEN_1_0),
    ._GEN_42_0(TLMonitor__GEN_42_0),
    ._GEN_52_0(TLMonitor__GEN_52_0)
  );
  assign TLMonitor_metaReset = metaReset;
  assign auto_int_out_0 = status_irqFlag & control_intEn; // @[LazyModule.scala 171:49]
  assign auto_in_a_ready = auto_in_d_ready & _T_1409; // @[LazyModule.scala 171:31]
  assign auto_in_b_valid = 1'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_opcode = 3'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_param = 2'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_size = 2'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_source = 7'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_address = 29'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_mask = 4'h0; // @[LazyModule.scala 171:31]
  assign auto_in_b_bits_data = 32'h0; // @[LazyModule.scala 171:31]
  assign auto_in_c_ready = 1'h1; // @[LazyModule.scala 171:31]
  assign auto_in_d_valid = auto_in_a_valid & _T_1409; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_opcode = {{2'd0}, profilePin_170}; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_param = 2'h0; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_size = _T_543[1:0]; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_source = _T_543[8:2]; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_sink = 1'h0; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_data = {{24'd0}, _T_1443}; // @[LazyModule.scala 171:31]
  assign auto_in_d_bits_error = 1'h0; // @[LazyModule.scala 171:31]
  assign auto_in_e_ready = 1'h1; // @[LazyModule.scala 171:31]
  assign io_port_scl_out = 1'h0; // @[I2C.scala 119:19]
  assign io_port_scl_oe = ~sclOen; // @[I2C.scala 178:18]
  assign io_port_sda_out = 1'h0; // @[I2C.scala 120:19]
  assign io_port_sda_oe = ~sdaOen; // @[I2C.scala 181:18]
  assign assert_out = {_GEN_560,profilePin_301};
  assign auto_cover_out = {_GEN_1062,profilePin_249};
  assign TLMonitor_clock = clock;
  assign TLMonitor_reset = reset;
  assign TLMonitor_io_in_a_ready = auto_in_d_ready & _T_1409; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_c_valid = auto_in_c_valid; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_valid = auto_in_a_valid & _T_1409; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, profilePin_170}; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_bits_size = _T_543[1:0]; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_bits_source = _T_543[8:2]; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_e_valid = auto_in_e_valid; // @[Nodes.scala 26:19]
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
  filterCnt = _RAND_0[13:0];
  _RAND_1 = {1{`RANDOM}};
  control_coreEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  slaveWait = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cnt = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  dSCL = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sSCL = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  clkEn = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  bitCmd = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  bitState = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  arbLost = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  shift = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  load = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cmd_write = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  cmd_read = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cmd_start = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  cmd_stop = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  cmdAck = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  bitCmdAck = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  bitCnt = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  byteState = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  stopCond = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  prescaler_hi = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  prescaler_lo = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  control_intEn = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  transmitData = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  receivedData = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  cmd_ack = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  cmd_irqAck = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  status_receivedAck = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  status_busy = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  status_arbLost = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  status_transferInProgress = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  status_irqFlag = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  fSCL = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  fSDA = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  sSDA = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  dSDA = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  dSCLOen = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  startCond = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  sclOen = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  sdaOen = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  sdaChk = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  transmitBit = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  receivedBit = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  bitCmdStop = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  receivedAck = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  statusReadReady = _RAND_46[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      filterCnt <= 14'h0;
    end else if (reset) begin
      filterCnt <= 14'h0;
    end else if (profilePin_0) begin
      filterCnt <= 14'h0;
    end else if (profilePin) begin
      filterCnt <= _T_240[15:2];
    end else begin
      filterCnt <= _T_245;
    end
    if (metaReset) begin
      control_coreEn <= 1'h0;
    end else if (reset) begin
      control_coreEn <= 1'h0;
    end else if (profilePin_174) begin
      control_coreEn <= auto_in_a_bits_data[7];
    end
    if (metaReset) begin
      slaveWait <= 1'h0;
    end else if (reset) begin
      slaveWait <= 1'h0;
    end else begin
      slaveWait <= _T_307;
    end
    if (metaReset) begin
      cnt <= 16'h0;
    end else if (reset) begin
      cnt <= 16'h0;
    end else if (profilePin_4) begin
      cnt <= _T_240;
    end else if (!(slaveWait)) begin
      cnt <= _T_326;
    end
    if (metaReset) begin
      dSCL <= 1'h0;
    end else begin
      dSCL <= reset | sSCL;
    end
    if (metaReset) begin
      sSCL <= 1'h0;
    end else begin
      sSCL <= reset | _T_264;
    end
    if (metaReset) begin
      clkEn <= 1'h0;
    end else begin
      clkEn <= reset | profilePin_4;
    end
    if (metaReset) begin
      bitCmd <= 4'h0;
    end else if (reset) begin
      bitCmd <= 4'h0;
    end else if (arbLost) begin
      bitCmd <= 4'h0;
    end else if (profilePin_143) begin
      if (go) begin
        if (cmd_start) begin
          bitCmd <= 4'h1;
        end else if (cmd_read) begin
          bitCmd <= 4'h8;
        end else begin
          bitCmd <= {{1'd0}, _GEN_119};
        end
      end
    end else if (profilePin_137) begin
      if (bitCmdAck) begin
        if (cmd_read) begin
          bitCmd <= 4'h8;
        end else begin
          bitCmd <= 4'h4;
        end
      end
    end else if (profilePin_131) begin
      if (bitCmdAck) begin
        if (bitCntDone) begin
          bitCmd <= 4'h8;
        end else begin
          bitCmd <= 4'h4;
        end
      end
    end else if (profilePin_126) begin
      if (bitCmdAck) begin
        if (bitCntDone) begin
          bitCmd <= 4'h4;
        end else begin
          bitCmd <= 4'h8;
        end
      end
    end else if (profilePin_121) begin
      if (bitCmdAck) begin
        bitCmd <= {{2'd0}, _GEN_144};
      end
    end else if (profilePin_119) begin
      if (bitCmdAck) begin
        bitCmd <= 4'h0;
      end
    end
    if (metaReset) begin
      bitState <= 5'h0;
    end else if (reset) begin
      bitState <= 5'h0;
    end else if (arbLost) begin
      bitState <= 5'h0;
    end else if (clkEn) begin
      if (profilePin_73) begin
        if (profilePin_9) begin
          bitState <= 5'h1;
        end else if (profilePin_8) begin
          bitState <= 5'h6;
        end else if (profilePin_7) begin
          bitState <= 5'he;
        end else if (profilePin_6) begin
          bitState <= 5'ha;
        end
      end else if (profilePin_69) begin
        bitState <= 5'h2;
      end else if (profilePin_66) begin
        bitState <= 5'h3;
      end else if (profilePin_62) begin
        bitState <= 5'h4;
      end else if (profilePin_58) begin
        bitState <= 5'h5;
      end else if (profilePin_54) begin
        bitState <= 5'h0;
      end else if (profilePin_49) begin
        bitState <= 5'h7;
      end else if (profilePin_45) begin
        bitState <= 5'h8;
      end else if (profilePin_41) begin
        bitState <= 5'h9;
      end else if (profilePin_39) begin
        bitState <= 5'h0;
      end else if (profilePin_35) begin
        bitState <= 5'hb;
      end else if (profilePin_32) begin
        bitState <= 5'hc;
      end else if (profilePin_29) begin
        bitState <= 5'hd;
      end else if (profilePin_26) begin
        bitState <= 5'h0;
      end else if (profilePin_21) begin
        bitState <= 5'hf;
      end else if (profilePin_17) begin
        bitState <= 5'h10;
      end else if (profilePin_14) begin
        bitState <= 5'h11;
      end else if (profilePin_10) begin
        bitState <= 5'h0;
      end
    end
    if (metaReset) begin
      arbLost <= 1'h0;
    end else if (reset) begin
      arbLost <= 1'h0;
    end else begin
      arbLost <= _T_363;
    end
    if (metaReset) begin
      shift <= 1'h0;
    end else if (reset) begin
      shift <= 1'h0;
    end else if (arbLost) begin
      shift <= 1'h0;
    end else if (profilePin_143) begin
      shift <= 1'h0;
    end else if (profilePin_137) begin
      shift <= 1'h0;
    end else if (profilePin_131) begin
      shift <= _GEN_137;
    end else begin
      shift <= _GEN_163;
    end
    if (metaReset) begin
      load <= 1'h0;
    end else if (reset) begin
      load <= 1'h0;
    end else if (arbLost) begin
      load <= 1'h0;
    end else if (profilePin_143) begin
      load <= go;
    end else begin
      load <= _GEN_175;
    end
    if (metaReset) begin
      cmd_write <= 1'h0;
    end else if (reset) begin
      cmd_write <= 1'h0;
    end else if (profilePin_162) begin
      cmd_write <= 1'h0;
    end else begin
      cmd_write <= nextCmd[4];
    end
    if (metaReset) begin
      cmd_read <= 1'h0;
    end else if (reset) begin
      cmd_read <= 1'h0;
    end else if (profilePin_162) begin
      cmd_read <= 1'h0;
    end else begin
      cmd_read <= nextCmd[5];
    end
    if (metaReset) begin
      cmd_start <= 1'h0;
    end else if (reset) begin
      cmd_start <= 1'h0;
    end else if (profilePin_162) begin
      cmd_start <= 1'h0;
    end else begin
      cmd_start <= nextCmd[7];
    end
    if (metaReset) begin
      cmd_stop <= 1'h0;
    end else if (reset) begin
      cmd_stop <= 1'h0;
    end else if (profilePin_162) begin
      cmd_stop <= 1'h0;
    end else begin
      cmd_stop <= nextCmd[6];
    end
    if (metaReset) begin
      cmdAck <= 1'h0;
    end else if (reset) begin
      cmdAck <= 1'h0;
    end else if (arbLost) begin
      cmdAck <= 1'h0;
    end else if (profilePin_143) begin
      cmdAck <= 1'h0;
    end else if (profilePin_137) begin
      cmdAck <= 1'h0;
    end else if (profilePin_131) begin
      cmdAck <= 1'h0;
    end else if (profilePin_126) begin
      cmdAck <= 1'h0;
    end else if (profilePin_121) begin
      cmdAck <= _GEN_148;
    end else begin
      cmdAck <= _GEN_155;
    end
    if (metaReset) begin
      bitCmdAck <= 1'h0;
    end else if (reset) begin
      bitCmdAck <= 1'h0;
    end else if (arbLost) begin
      bitCmdAck <= 1'h0;
    end else begin
      bitCmdAck <= _GEN_108;
    end
    if (metaReset) begin
      bitCnt <= 3'h0;
    end else if (reset) begin
      bitCnt <= 3'h0;
    end else if (load) begin
      bitCnt <= 3'h7;
    end else if (shift) begin
      bitCnt <= _T_461;
    end
    if (metaReset) begin
      byteState <= 3'h0;
    end else if (reset) begin
      byteState <= 3'h0;
    end else if (arbLost) begin
      byteState <= 3'h0;
    end else if (profilePin_143) begin
      if (go) begin
        if (cmd_start) begin
          byteState <= 3'h1;
        end else if (cmd_read) begin
          byteState <= 3'h2;
        end else if (cmd_write) begin
          byteState <= 3'h3;
        end else begin
          byteState <= 3'h5;
        end
      end
    end else if (profilePin_137) begin
      if (bitCmdAck) begin
        if (cmd_read) begin
          byteState <= 3'h2;
        end else begin
          byteState <= 3'h3;
        end
      end
    end else if (profilePin_131) begin
      if (bitCmdAck) begin
        if (bitCntDone) begin
          byteState <= 3'h4;
        end else begin
          byteState <= 3'h3;
        end
      end
    end else if (profilePin_126) begin
      if (bitCmdAck) begin
        if (bitCntDone) begin
          byteState <= 3'h4;
        end else begin
          byteState <= 3'h2;
        end
      end
    end else if (profilePin_121) begin
      if (bitCmdAck) begin
        if (cmd_stop) begin
          byteState <= 3'h5;
        end else begin
          byteState <= 3'h0;
        end
      end
    end else if (profilePin_119) begin
      if (bitCmdAck) begin
        byteState <= 3'h0;
      end
    end
    if (metaReset) begin
      stopCond <= 1'h0;
    end else if (reset) begin
      stopCond <= 1'h0;
    end else begin
      stopCond <= _T_291;
    end
    if (metaReset) begin
      prescaler_hi <= 8'h0;
    end else if (reset) begin
      prescaler_hi <= 8'hff;
    end else if (profilePin_172) begin
      prescaler_hi <= auto_in_a_bits_data[7:0];
    end
    if (metaReset) begin
      prescaler_lo <= 8'h0;
    end else if (reset) begin
      prescaler_lo <= 8'hff;
    end else if (profilePin_171) begin
      prescaler_lo <= auto_in_a_bits_data[7:0];
    end
    if (metaReset) begin
      control_intEn <= 1'h0;
    end else if (reset) begin
      control_intEn <= 1'h0;
    end else if (profilePin_173) begin
      control_intEn <= auto_in_a_bits_data[6];
    end
    if (metaReset) begin
      transmitData <= 8'h0;
    end else if (reset) begin
      transmitData <= 8'h0;
    end else if (profilePin_175) begin
      transmitData <= auto_in_a_bits_data[7:0];
    end
    if (metaReset) begin
      receivedData <= 8'h0;
    end else if (reset) begin
      receivedData <= 8'h0;
    end else begin
      receivedData <= _GEN_117[7:0];
    end
    if (metaReset) begin
      cmd_ack <= 1'h0;
    end else if (reset) begin
      cmd_ack <= 1'h0;
    end else begin
      cmd_ack <= nextCmd[3];
    end
    if (metaReset) begin
      cmd_irqAck <= 1'h0;
    end else if (reset) begin
      cmd_irqAck <= 1'h0;
    end else begin
      cmd_irqAck <= nextCmd[0];
    end
    if (metaReset) begin
      status_receivedAck <= 1'h0;
    end else if (reset) begin
      status_receivedAck <= 1'h0;
    end else begin
      status_receivedAck <= receivedAck;
    end
    if (metaReset) begin
      status_busy <= 1'h0;
    end else if (reset) begin
      status_busy <= 1'h0;
    end else if (stopCond) begin
      status_busy <= 1'h0;
    end else begin
      status_busy <= _GEN_198;
    end
    if (metaReset) begin
      status_arbLost <= 1'h0;
    end else if (reset) begin
      status_arbLost <= 1'h0;
    end else begin
      status_arbLost <= _GEN_201;
    end
    if (metaReset) begin
      status_transferInProgress <= 1'h0;
    end else if (reset) begin
      status_transferInProgress <= 1'h0;
    end else begin
      status_transferInProgress <= _T_451;
    end
    if (metaReset) begin
      status_irqFlag <= 1'h0;
    end else if (reset) begin
      status_irqFlag <= 1'h0;
    end else begin
      status_irqFlag <= _T_525;
    end
    if (metaReset) begin
      fSCL <= 3'h0;
    end else if (reset) begin
      fSCL <= 3'h7;
    end else begin
      fSCL <= _GEN_2[2:0];
    end
    if (metaReset) begin
      fSDA <= 3'h0;
    end else if (reset) begin
      fSDA <= 3'h7;
    end else begin
      fSDA <= _GEN_3[2:0];
    end
    if (metaReset) begin
      sSDA <= 1'h0;
    end else begin
      sSDA <= reset | _T_274;
    end
    if (metaReset) begin
      dSDA <= 1'h0;
    end else begin
      dSDA <= reset | sSDA;
    end
    if (metaReset) begin
      dSCLOen <= 1'h0;
    end else begin
      dSCLOen <= io_port_scl_oe;
    end
    if (metaReset) begin
      startCond <= 1'h0;
    end else if (reset) begin
      startCond <= 1'h0;
    end else begin
      startCond <= _T_285;
    end
    if (metaReset) begin
      sclOen <= 1'h0;
    end else begin
      sclOen <= reset | _GEN_111;
    end
    if (metaReset) begin
      sdaOen <= 1'h0;
    end else begin
      sdaOen <= reset | _GEN_112;
    end
    if (metaReset) begin
      sdaChk <= 1'h0;
    end else if (reset) begin
      sdaChk <= 1'h0;
    end else if (arbLost) begin
      sdaChk <= 1'h0;
    end else if (clkEn) begin
      if (profilePin_73) begin
        sdaChk <= 1'h0;
      end else if (profilePin_69) begin
        sdaChk <= 1'h0;
      end else if (profilePin_66) begin
        sdaChk <= 1'h0;
      end else if (profilePin_62) begin
        sdaChk <= 1'h0;
      end else if (profilePin_58) begin
        sdaChk <= 1'h0;
      end else if (profilePin_54) begin
        sdaChk <= 1'h0;
      end else if (profilePin_49) begin
        sdaChk <= 1'h0;
      end else if (profilePin_45) begin
        sdaChk <= 1'h0;
      end else if (profilePin_41) begin
        sdaChk <= 1'h0;
      end else if (profilePin_39) begin
        sdaChk <= 1'h0;
      end else if (profilePin_35) begin
        sdaChk <= 1'h0;
      end else if (profilePin_32) begin
        sdaChk <= 1'h0;
      end else if (profilePin_29) begin
        sdaChk <= 1'h0;
      end else if (profilePin_26) begin
        sdaChk <= 1'h0;
      end else if (profilePin_21) begin
        sdaChk <= 1'h0;
      end else if (profilePin_17) begin
        sdaChk <= 1'h0;
      end else begin
        sdaChk <= _GEN_22;
      end
    end
    if (metaReset) begin
      transmitBit <= 1'h0;
    end else if (reset) begin
      transmitBit <= 1'h0;
    end else if (arbLost) begin
      transmitBit <= 1'h0;
    end else if (profilePin_143) begin
      transmitBit <= receivedData[7];
    end else if (profilePin_137) begin
      transmitBit <= receivedData[7];
    end else if (profilePin_131) begin
      transmitBit <= receivedData[7];
    end else if (profilePin_126) begin
      if (bitCmdAck) begin
        transmitBit <= cmd_ack;
      end else begin
        transmitBit <= receivedData[7];
      end
    end else if (profilePin_121) begin
      transmitBit <= _GEN_150;
    end else begin
      transmitBit <= receivedData[7];
    end
    if (metaReset) begin
      receivedBit <= 1'h0;
    end else if (profilePin_215) begin
      receivedBit <= sSDA;
    end
    if (metaReset) begin
      bitCmdStop <= 1'h0;
    end else if (reset) begin
      bitCmdStop <= 1'h0;
    end else if (clkEn) begin
      bitCmdStop <= _T_348;
    end
    if (metaReset) begin
      receivedAck <= 1'h0;
    end else if (reset) begin
      receivedAck <= 1'h0;
    end else if (arbLost) begin
      receivedAck <= 1'h0;
    end else if (!(profilePin_143)) begin
      if (!(profilePin_137)) begin
        if (!(profilePin_131)) begin
          if (!(profilePin_126)) begin
            if (profilePin_121) begin
              if (bitCmdAck) begin
                receivedAck <= receivedBit;
              end
            end
          end
        end
      end
    end
    if (metaReset) begin
      statusReadReady <= 1'h0;
    end else begin
      statusReadReady <= reset | _GEN_210;
    end
  end
endmodule
module TLMonitor_72(
  input         metaReset,
  input         clock,
  input         reset,
  input         io_in_a_ready,
  input         io_in_a_valid,
  input  [2:0]  io_in_a_bits_opcode,
  input  [2:0]  io_in_a_bits_param,
  input  [1:0]  io_in_a_bits_size,
  input  [6:0]  io_in_a_bits_source,
  input  [28:0] io_in_a_bits_address,
  input  [3:0]  io_in_a_bits_mask,
  input         io_in_c_valid,
  input         io_in_d_ready,
  input         io_in_d_valid,
  input  [2:0]  io_in_d_bits_opcode,
  input  [1:0]  io_in_d_bits_size,
  input  [6:0]  io_in_d_bits_source,
  input         io_in_e_valid,
  output        _GEN_39_0,
  output        _GEN_23_0,
  output        _GEN_11_0,
  output        _GEN_4_1,
  output        _GEN_79_0,
  output        _GEN_72_0,
  output        _GEN_20_0,
  output        _GEN_58_0,
  output        _GEN_65_0,
  output        _GEN_75_0,
  output        _GEN_82_0,
  output        _GEN_51_0,
  output        _GEN_68_0,
  output        _GEN_22_0,
  output        _GEN_86_0,
  output        _GEN_44_0,
  output        _GEN_38_0,
  output        _GEN_62_0,
  output        _GEN_41_0,
  output        _GEN_32_0,
  output        _GEN_25_0,
  output        _GEN_55_0,
  output        _GEN_17_0,
  output        _GEN_48_0,
  output        _GEN_7_0,
  output        _GEN_35_0,
  output        _GEN_28_0,
  output        _GEN_10_0,
  output        _GEN_3_0,
  output        _GEN_84_0,
  output        _GEN_54_0,
  output        _GEN_64_0,
  output        _GEN_89_0,
  output        _GEN_71_0,
  output        _GEN_78_0,
  output        _GEN_74_0,
  output        _GEN_57_0,
  output        _GEN_50_0,
  output        _GEN_81_0,
  output        _GEN_34_0,
  output        _GEN_9_0,
  output        _GEN_43_0,
  output        _GEN_30_0,
  output        _GEN_67_0,
  output        _GEN_21_0,
  output        _GEN_37_0,
  output        _GEN_60_0,
  output        _GEN_47_0,
  output        _GEN_12_0,
  output        _GEN_40_0,
  output        _GEN_24_0,
  output        _GEN_5_0,
  output        _GEN_27_0,
  output        _GEN_66_0,
  output        _GEN_83_0,
  output        _GEN_2_0,
  output        _GEN_87_0,
  output        _GEN_70_0,
  output        _GEN_63_0,
  output        _GEN_88_0,
  output        _GEN_76_0,
  output        _GEN_46_0,
  output        _GEN_49_0,
  output        _GEN_73_0,
  output        _GEN_26_0,
  output        _GEN_80_0,
  output        _GEN_33_0,
  output        _GEN_56_0,
  output        _GEN_59_0,
  output        _GEN_8_1,
  output        _GEN_29_0,
  output        _GEN_36_0,
  output        _GEN_1_0,
  output        _GEN_42_0,
  output        _GEN_52_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [127:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] _T_42 = 5'h3 << io_in_a_bits_size; // @[package.scala 104:77]
  wire [1:0] _T_44 = ~_T_42[1:0]; // @[package.scala 104:46]
  wire [28:0] _GEN_18 = {{27'd0}, _T_44}; // @[Edges.scala 21:16]
  wire [28:0] _T_45 = io_in_a_bits_address & _GEN_18; // @[Edges.scala 21:16]
  wire  _T_47 = _T_45 == 29'h0; // @[Edges.scala 21:24]
  wire [1:0] _T_50 = 2'h1 << io_in_a_bits_size[0]; // @[OneHot.scala 50:12]
  wire [1:0] _T_53 = _T_50 | 2'h1; // @[Misc.scala 237:54]
  wire  _T_55 = io_in_a_bits_size >= 2'h2; // @[Misc.scala 241:21]
  wire  _T_60 = ~io_in_a_bits_address[1]; // @[Misc.scala 246:20]
  wire  _T_62 = _T_53[1] & _T_60; // @[Misc.scala 250:38]
  wire  _T_63 = _T_55 | _T_62; // @[Misc.scala 250:29]
  wire  _T_65 = _T_53[1] & io_in_a_bits_address[1]; // @[Misc.scala 250:38]
  wire  _T_66 = _T_55 | _T_65; // @[Misc.scala 250:29]
  wire  _T_70 = ~io_in_a_bits_address[0]; // @[Misc.scala 246:20]
  wire  _T_71 = _T_60 & _T_70; // @[Misc.scala 249:27]
  wire  _T_72 = _T_53[0] & _T_71; // @[Misc.scala 250:38]
  wire  _T_73 = _T_63 | _T_72; // @[Misc.scala 250:29]
  wire  _T_74 = _T_60 & io_in_a_bits_address[0]; // @[Misc.scala 249:27]
  wire  _T_75 = _T_53[0] & _T_74; // @[Misc.scala 250:38]
  wire  _T_76 = _T_63 | _T_75; // @[Misc.scala 250:29]
  wire  _T_77 = io_in_a_bits_address[1] & _T_70; // @[Misc.scala 249:27]
  wire  _T_78 = _T_53[0] & _T_77; // @[Misc.scala 250:38]
  wire  _T_79 = _T_66 | _T_78; // @[Misc.scala 250:29]
  wire  _T_80 = io_in_a_bits_address[1] & io_in_a_bits_address[0]; // @[Misc.scala 249:27]
  wire  _T_81 = _T_53[0] & _T_80; // @[Misc.scala 250:38]
  wire  _T_82 = _T_66 | _T_81; // @[Misc.scala 250:29]
  wire [3:0] _T_85 = {_T_82,_T_79,_T_76,_T_73}; // @[Cat.scala 30:58]
  wire  _T_87 = io_in_a_bits_opcode == 3'h6; // @[Monitor.scala 40:25]
  wire [28:0] _T_92 = io_in_a_bits_address ^ 29'h10016000; // @[Parameters.scala 119:31]
  wire [29:0] _T_93 = {1'b0,$signed(_T_92)}; // @[Parameters.scala 119:49]
  wire [29:0] _T_96 = $signed(_T_93) & -30'sh1000; // @[Parameters.scala 119:52]
  wire  _T_98 = $signed(_T_96) == 30'sh0; // @[Parameters.scala 119:67]
  wire  _T_105 = ~reset; // @[Monitor.scala 41:14]
  wire  _T_118 = _T_55 | reset; // @[Monitor.scala 44:14]
  wire  _T_120 = ~_T_118; // @[Monitor.scala 44:14]
  wire  _T_122 = _T_47 | reset; // @[Monitor.scala 45:14]
  wire  _T_124 = ~_T_122; // @[Monitor.scala 45:14]
  wire  _T_126 = io_in_a_bits_param <= 3'h2; // @[Bundles.scala 71:27]
  wire  _T_128 = _T_126 | reset; // @[Monitor.scala 46:14]
  wire  _T_130 = ~_T_128; // @[Monitor.scala 46:14]
  wire [3:0] _T_131 = ~io_in_a_bits_mask; // @[Monitor.scala 47:15]
  wire  _T_133 = _T_131 == 4'h0; // @[Monitor.scala 47:28]
  wire  _T_135 = _T_133 | reset; // @[Monitor.scala 47:14]
  wire  _T_137 = ~_T_135; // @[Monitor.scala 47:14]
  wire  _T_139 = io_in_a_bits_opcode == 3'h7; // @[Monitor.scala 50:25]
  wire  _T_184 = io_in_a_bits_param != 3'h0; // @[Monitor.scala 57:28]
  wire  _T_186 = _T_184 | reset; // @[Monitor.scala 57:14]
  wire  _T_188 = ~_T_186; // @[Monitor.scala 57:14]
  wire  _T_197 = io_in_a_bits_opcode == 3'h4; // @[Monitor.scala 61:25]
  wire  _T_202 = io_in_a_bits_size <= 2'h2; // @[Parameters.scala 88:42]
  wire  _T_213 = _T_202 & _T_98; // @[Parameters.scala 157:56]
  wire  _T_217 = _T_213 | reset; // @[Monitor.scala 62:14]
  wire  _T_219 = ~_T_217; // @[Monitor.scala 62:14]
  wire  _T_229 = io_in_a_bits_param == 3'h0; // @[Monitor.scala 65:28]
  wire  _T_231 = _T_229 | reset; // @[Monitor.scala 65:14]
  wire  _T_233 = ~_T_231; // @[Monitor.scala 65:14]
  wire  _T_234 = io_in_a_bits_mask == _T_85; // @[Monitor.scala 66:27]
  wire  _T_236 = _T_234 | reset; // @[Monitor.scala 66:14]
  wire  _T_238 = ~_T_236; // @[Monitor.scala 66:14]
  wire  _T_240 = io_in_a_bits_opcode == 3'h0; // @[Monitor.scala 69:25]
  wire  _T_283 = io_in_a_bits_opcode == 3'h1; // @[Monitor.scala 77:25]
  wire [3:0] _T_320 = ~_T_85; // @[Monitor.scala 82:30]
  wire [3:0] _T_321 = io_in_a_bits_mask & _T_320; // @[Monitor.scala 82:28]
  wire  _T_323 = _T_321 == 4'h0; // @[Monitor.scala 82:37]
  wire  _T_325 = _T_323 | reset; // @[Monitor.scala 82:14]
  wire  _T_327 = ~_T_325; // @[Monitor.scala 82:14]
  wire  _T_329 = io_in_a_bits_opcode == 3'h2; // @[Monitor.scala 85:25]
  wire  _T_357 = io_in_a_bits_param <= 3'h4; // @[Bundles.scala 96:33]
  wire  _T_359 = _T_357 | reset; // @[Monitor.scala 89:14]
  wire  _T_361 = ~_T_359; // @[Monitor.scala 89:14]
  wire  _T_368 = io_in_a_bits_opcode == 3'h3; // @[Monitor.scala 93:25]
  wire  _T_396 = io_in_a_bits_param <= 3'h3; // @[Bundles.scala 103:30]
  wire  _T_398 = _T_396 | reset; // @[Monitor.scala 97:14]
  wire  _T_400 = ~_T_398; // @[Monitor.scala 97:14]
  wire  _T_407 = io_in_a_bits_opcode == 3'h5; // @[Monitor.scala 101:25]
  wire  _T_440 = io_in_d_bits_opcode <= 3'h6; // @[Bundles.scala 43:24]
  wire  _T_442 = _T_440 | reset; // @[Monitor.scala 247:12]
  wire  _T_444 = ~_T_442; // @[Monitor.scala 247:12]
  wire  _T_468 = io_in_d_bits_opcode == 3'h6; // @[Monitor.scala 252:25]
  wire  _T_478 = io_in_d_bits_size >= 2'h2; // @[Monitor.scala 255:27]
  wire  _T_480 = _T_478 | reset; // @[Monitor.scala 255:14]
  wire  _T_482 = ~_T_480; // @[Monitor.scala 255:14]
  wire  _T_490 = io_in_d_bits_opcode == 3'h4; // @[Monitor.scala 259:25]
  wire  _T_512 = io_in_d_bits_opcode == 3'h5; // @[Monitor.scala 266:25]
  wire  _T_588 = ~io_in_c_valid; // @[Monitor.scala 309:15]
  wire  _T_590 = _T_588 | reset; // @[Monitor.scala 309:14]
  wire  _T_594 = ~io_in_e_valid; // @[Monitor.scala 310:15]
  wire  _T_596 = _T_594 | reset; // @[Monitor.scala 310:14]
  wire  _T_599 = io_in_a_ready & io_in_a_valid; // @[Bundles.scala 207:36]
  reg  _T_613; // @[Edges.scala 220:27]
  wire  _T_617 = _T_613 - 1'h1; // @[Edges.scala 221:28]
  wire  _T_619 = ~_T_613; // @[Edges.scala 222:25]
  reg [2:0] _T_630; // @[Monitor.scala 316:22]
  reg [2:0] _T_632; // @[Monitor.scala 317:22]
  reg [1:0] _T_634; // @[Monitor.scala 318:22]
  reg [6:0] _T_636; // @[Monitor.scala 319:22]
  reg [28:0] _T_638; // @[Monitor.scala 320:22]
  wire  _T_640 = ~_T_619; // @[Monitor.scala 321:22]
  wire  _T_641 = io_in_a_valid & _T_640; // @[Monitor.scala 321:19]
  wire  _T_642 = io_in_a_bits_opcode == _T_630; // @[Monitor.scala 322:29]
  wire  _T_644 = _T_642 | reset; // @[Monitor.scala 322:14]
  wire  _T_646 = ~_T_644; // @[Monitor.scala 322:14]
  wire  _T_647 = io_in_a_bits_param == _T_632; // @[Monitor.scala 323:29]
  wire  _T_649 = _T_647 | reset; // @[Monitor.scala 323:14]
  wire  _T_651 = ~_T_649; // @[Monitor.scala 323:14]
  wire  _T_652 = io_in_a_bits_size == _T_634; // @[Monitor.scala 324:29]
  wire  _T_654 = _T_652 | reset; // @[Monitor.scala 324:14]
  wire  _T_656 = ~_T_654; // @[Monitor.scala 324:14]
  wire  _T_657 = io_in_a_bits_source == _T_636; // @[Monitor.scala 325:29]
  wire  _T_659 = _T_657 | reset; // @[Monitor.scala 325:14]
  wire  _T_661 = ~_T_659; // @[Monitor.scala 325:14]
  wire  _T_662 = io_in_a_bits_address == _T_638; // @[Monitor.scala 326:29]
  wire  _T_664 = _T_662 | reset; // @[Monitor.scala 326:14]
  wire  _T_666 = ~_T_664; // @[Monitor.scala 326:14]
  wire  _T_668 = _T_599 & _T_619; // @[Monitor.scala 328:20]
  wire  _T_669 = io_in_d_ready & io_in_d_valid; // @[Bundles.scala 207:36]
  reg  _T_681; // @[Edges.scala 220:27]
  wire  _T_685 = _T_681 - 1'h1; // @[Edges.scala 221:28]
  wire  _T_687 = ~_T_681; // @[Edges.scala 222:25]
  reg [2:0] _T_698; // @[Monitor.scala 387:22]
  reg [1:0] _T_702; // @[Monitor.scala 389:22]
  reg [6:0] _T_704; // @[Monitor.scala 390:22]
  wire  _T_711 = ~_T_687; // @[Monitor.scala 393:22]
  wire  _T_712 = io_in_d_valid & _T_711; // @[Monitor.scala 393:19]
  wire  _T_713 = io_in_d_bits_opcode == _T_698; // @[Monitor.scala 394:29]
  wire  _T_715 = _T_713 | reset; // @[Monitor.scala 394:14]
  wire  _T_717 = ~_T_715; // @[Monitor.scala 394:14]
  wire  _T_723 = io_in_d_bits_size == _T_702; // @[Monitor.scala 396:29]
  wire  _T_725 = _T_723 | reset; // @[Monitor.scala 396:14]
  wire  _T_727 = ~_T_725; // @[Monitor.scala 396:14]
  wire  _T_728 = io_in_d_bits_source == _T_704; // @[Monitor.scala 397:29]
  wire  _T_730 = _T_728 | reset; // @[Monitor.scala 397:14]
  wire  _T_732 = ~_T_730; // @[Monitor.scala 397:14]
  wire  _T_746 = _T_669 & _T_687; // @[Monitor.scala 401:20]
  reg [127:0] _T_749; // @[Monitor.scala 420:27]
  reg  _T_764; // @[Edges.scala 220:27]
  wire  _T_768 = _T_764 - 1'h1; // @[Edges.scala 221:28]
  wire  _T_770 = ~_T_764; // @[Edges.scala 222:25]
  reg  _T_792; // @[Edges.scala 220:27]
  wire  _T_796 = _T_792 - 1'h1; // @[Edges.scala 221:28]
  wire  _T_798 = ~_T_792; // @[Edges.scala 222:25]
  wire  _T_812 = _T_599 & _T_770; // @[Monitor.scala 426:27]
  wire [127:0] _T_816 = 128'h1 << io_in_a_bits_source; // @[OneHot.scala 45:35]
  wire [127:0] _T_817 = _T_749 >> io_in_a_bits_source; // @[Monitor.scala 428:23]
  wire  _T_820 = ~_T_817[0]; // @[Monitor.scala 428:14]
  wire  _T_822 = _T_820 | reset; // @[Monitor.scala 428:13]
  wire  _T_824 = ~_T_822; // @[Monitor.scala 428:13]
  wire [127:0] _GEN_15 = _T_812 ? _T_816 : 128'h0; // @[Monitor.scala 426:72]
  wire  _T_831 = _T_669 & _T_798; // @[Monitor.scala 433:27]
  wire  _T_835 = ~_T_468; // @[Monitor.scala 433:75]
  wire  _T_836 = _T_831 & _T_835; // @[Monitor.scala 433:72]
  wire [127:0] _T_838 = 128'h1 << io_in_d_bits_source; // @[OneHot.scala 45:35]
  wire [127:0] _T_839 = _GEN_15 | _T_749; // @[Monitor.scala 435:21]
  wire [127:0] _T_840 = _T_839 >> io_in_d_bits_source; // @[Monitor.scala 435:32]
  wire  _T_843 = _T_840[0] | reset; // @[Monitor.scala 435:13]
  wire  _T_845 = ~_T_843; // @[Monitor.scala 435:13]
  wire [127:0] _GEN_16 = _T_836 ? _T_838 : 128'h0; // @[Monitor.scala 433:91]
  wire [127:0] _T_846 = _T_749 | _GEN_15; // @[Monitor.scala 442:27]
  wire [127:0] _T_847 = ~_GEN_16; // @[Monitor.scala 442:38]
  wire [127:0] _T_848 = _T_846 & _T_847; // @[Monitor.scala 442:36]
  wire  _GEN_19 = io_in_a_valid & _T_87; // @[Monitor.scala 41:14]
  wire  _GEN_31 = io_in_a_valid & _T_139; // @[Monitor.scala 51:14]
  wire  _GEN_45 = io_in_a_valid & _T_197; // @[Monitor.scala 62:14]
  wire  _GEN_53 = io_in_a_valid & _T_240; // @[Monitor.scala 70:14]
  wire  _GEN_61 = io_in_a_valid & _T_283; // @[Monitor.scala 78:14]
  wire  _GEN_69 = io_in_a_valid & _T_329; // @[Monitor.scala 86:14]
  wire  _GEN_77 = io_in_a_valid & _T_368; // @[Monitor.scala 94:14]
  wire  _GEN_85 = io_in_a_valid & _T_407; // @[Monitor.scala 102:14]
  wire  _GEN_91 = io_in_d_valid & _T_468; // @[Monitor.scala 255:14]
  wire  _GEN_93 = io_in_d_valid & _T_490; // @[Monitor.scala 262:14]
  wire  _GEN_95 = io_in_d_valid & _T_512; // @[Monitor.scala 269:14]
  assign _GEN_39_0 = _GEN_31 & _T_105;
  assign _GEN_23_0 = _T_599 & _T_619;
  assign _GEN_11_0 = _T_831 & _T_835;
  assign _GEN_4_1 = io_in_d_ready & io_in_d_valid;
  assign _GEN_79_0 = _T_641 & _T_646;
  assign _GEN_72_0 = io_in_d_valid & _T_444;
  assign _GEN_20_0 = _T_599 & _T_619;
  assign _GEN_58_0 = _GEN_61 & _T_327;
  assign _GEN_65_0 = _GEN_77 & _T_124;
  assign _GEN_75_0 = _GEN_95 & _T_482;
  assign _GEN_82_0 = _T_641 & _T_661;
  assign _GEN_51_0 = _GEN_53 & _T_124;
  assign _GEN_68_0 = _GEN_85 & _T_105;
  assign _GEN_22_0 = _T_599 & _T_619;
  assign _GEN_86_0 = _T_712 & _T_727;
  assign _GEN_44_0 = _GEN_31 & _T_137;
  assign _GEN_38_0 = _GEN_31 & _T_105;
  assign _GEN_62_0 = _GEN_69 & _T_361;
  assign _GEN_41_0 = _GEN_31 & _T_124;
  assign _GEN_32_0 = _GEN_19 & _T_105;
  assign _GEN_25_0 = _T_669 & _T_687;
  assign _GEN_55_0 = _GEN_61 & _T_219;
  assign _GEN_17_0 = _T_599 & _T_619;
  assign _GEN_48_0 = _GEN_45 & _T_233;
  assign _GEN_7_0 = io_in_a_ready & io_in_a_valid;
  assign _GEN_35_0 = _GEN_19 & _T_124;
  assign _GEN_28_0 = reset;
  assign _GEN_10_0 = _T_599 & _T_770;
  assign _GEN_3_0 = ~_T_681;
  assign _GEN_84_0 = _T_712 & _T_717;
  assign _GEN_54_0 = _GEN_53 & _T_238;
  assign _GEN_64_0 = _GEN_77 & _T_105;
  assign _GEN_89_0 = _T_836 & _T_845;
  assign _GEN_71_0 = _GEN_85 & _T_238;
  assign _GEN_78_0 = ~_T_596;
  assign _GEN_74_0 = _GEN_93 & _T_482;
  assign _GEN_57_0 = _GEN_61 & _T_233;
  assign _GEN_50_0 = _GEN_53 & _T_219;
  assign _GEN_81_0 = _T_641 & _T_656;
  assign _GEN_34_0 = _GEN_19 & _T_120;
  assign _GEN_9_0 = io_in_d_ready & io_in_d_valid;
  assign _GEN_43_0 = _GEN_31 & _T_188;
  assign _GEN_30_0 = reset;
  assign _GEN_67_0 = _GEN_77 & _T_238;
  assign _GEN_21_0 = _T_599 & _T_619;
  assign _GEN_37_0 = _GEN_19 & _T_137;
  assign _GEN_60_0 = _GEN_69 & _T_124;
  assign _GEN_47_0 = _GEN_45 & _T_124;
  assign _GEN_12_0 = reset;
  assign _GEN_40_0 = _GEN_31 & _T_120;
  assign _GEN_24_0 = reset;
  assign _GEN_5_0 = ~_T_764;
  assign _GEN_27_0 = _T_669 & _T_687;
  assign _GEN_66_0 = _GEN_77 & _T_400;
  assign _GEN_83_0 = _T_641 & _T_666;
  assign _GEN_2_0 = io_in_a_ready & io_in_a_valid;
  assign _GEN_87_0 = _T_712 & _T_732;
  assign _GEN_70_0 = _GEN_85 & _T_124;
  assign _GEN_63_0 = _GEN_69 & _T_238;
  assign _GEN_88_0 = _T_812 & _T_824;
  assign _GEN_76_0 = ~_T_590;
  assign _GEN_46_0 = _GEN_45 & _T_219;
  assign _GEN_49_0 = _GEN_45 & _T_238;
  assign _GEN_73_0 = _GEN_91 & _T_482;
  assign _GEN_26_0 = _T_669 & _T_687;
  assign _GEN_80_0 = _T_641 & _T_651;
  assign _GEN_33_0 = _GEN_19 & _T_105;
  assign _GEN_56_0 = _GEN_61 & _T_124;
  assign _GEN_59_0 = _GEN_69 & _T_105;
  assign _GEN_8_1 = ~_T_792;
  assign _GEN_29_0 = reset;
  assign _GEN_36_0 = _GEN_19 & _T_130;
  assign _GEN_1_0 = ~_T_613;
  assign _GEN_42_0 = _GEN_31 & _T_130;
  assign _GEN_52_0 = _GEN_53 & _T_233;
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
  _T_613 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_630 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  _T_632 = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  _T_634 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  _T_636 = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  _T_638 = _RAND_5[28:0];
  _RAND_6 = {1{`RANDOM}};
  _T_681 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_698 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  _T_702 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  _T_704 = _RAND_9[6:0];
  _RAND_10 = {4{`RANDOM}};
  _T_749 = _RAND_10[127:0];
  _RAND_11 = {1{`RANDOM}};
  _T_764 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_792 = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      _T_613 <= 1'h0;
    end else if (reset) begin
      _T_613 <= 1'h0;
    end else if (_T_599) begin
      if (_T_619) begin
        _T_613 <= 1'h0;
      end else begin
        _T_613 <= _T_617;
      end
    end
    if (metaReset) begin
      _T_630 <= 3'h0;
    end else if (_T_668) begin
      _T_630 <= io_in_a_bits_opcode;
    end
    if (metaReset) begin
      _T_632 <= 3'h0;
    end else if (_T_668) begin
      _T_632 <= io_in_a_bits_param;
    end
    if (metaReset) begin
      _T_634 <= 2'h0;
    end else if (_T_668) begin
      _T_634 <= io_in_a_bits_size;
    end
    if (metaReset) begin
      _T_636 <= 7'h0;
    end else if (_T_668) begin
      _T_636 <= io_in_a_bits_source;
    end
    if (metaReset) begin
      _T_638 <= 29'h0;
    end else if (_T_668) begin
      _T_638 <= io_in_a_bits_address;
    end
    if (metaReset) begin
      _T_681 <= 1'h0;
    end else if (reset) begin
      _T_681 <= 1'h0;
    end else if (_T_669) begin
      if (_T_687) begin
        _T_681 <= 1'h0;
      end else begin
        _T_681 <= _T_685;
      end
    end
    if (metaReset) begin
      _T_698 <= 3'h0;
    end else if (_T_746) begin
      _T_698 <= io_in_d_bits_opcode;
    end
    if (metaReset) begin
      _T_702 <= 2'h0;
    end else if (_T_746) begin
      _T_702 <= io_in_d_bits_size;
    end
    if (metaReset) begin
      _T_704 <= 7'h0;
    end else if (_T_746) begin
      _T_704 <= io_in_d_bits_source;
    end
    if (metaReset) begin
      _T_749 <= 128'h0;
    end else if (reset) begin
      _T_749 <= 128'h0;
    end else begin
      _T_749 <= _T_848;
    end
    if (metaReset) begin
      _T_764 <= 1'h0;
    end else if (reset) begin
      _T_764 <= 1'h0;
    end else if (_T_599) begin
      if (_T_770) begin
        _T_764 <= 1'h0;
      end else begin
        _T_764 <= _T_768;
      end
    end
    if (metaReset) begin
      _T_792 <= 1'h0;
    end else if (reset) begin
      _T_792 <= 1'h0;
    end else if (_T_669) begin
      if (_T_798) begin
        _T_792 <= 1'h0;
      end else begin
        _T_792 <= _T_796;
      end
    end
  end
endmodule
