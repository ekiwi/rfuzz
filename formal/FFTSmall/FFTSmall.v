module FFTSmall(
  input          metaReset,
  input          clock,
  input          reset,
  input          io_in_valid,
  input  [15:0]  io_in_bits_0_real,
  input  [15:0]  io_in_bits_0_imag,
  input  [15:0]  io_in_bits_1_real,
  input  [15:0]  io_in_bits_1_imag,
  input  [15:0]  io_in_bits_2_real,
  input  [15:0]  io_in_bits_2_imag,
  input  [15:0]  io_in_bits_3_real,
  input  [15:0]  io_in_bits_3_imag,
  input  [15:0]  io_in_bits_4_real,
  input  [15:0]  io_in_bits_4_imag,
  input  [15:0]  io_in_bits_5_real,
  input  [15:0]  io_in_bits_5_imag,
  input  [15:0]  io_in_bits_6_real,
  input  [15:0]  io_in_bits_6_imag,
  input  [15:0]  io_in_bits_7_real,
  input  [15:0]  io_in_bits_7_imag,
  input          io_in_sync,
  output         io_out_valid,
  output [15:0]  io_out_bits_0_real,
  output [15:0]  io_out_bits_0_imag,
  output [15:0]  io_out_bits_1_real,
  output [15:0]  io_out_bits_1_imag,
  output [15:0]  io_out_bits_2_real,
  output [15:0]  io_out_bits_2_imag,
  output [15:0]  io_out_bits_3_real,
  output [15:0]  io_out_bits_3_imag,
  output [15:0]  io_out_bits_4_real,
  output [15:0]  io_out_bits_4_imag,
  output [15:0]  io_out_bits_5_real,
  output [15:0]  io_out_bits_5_imag,
  output [15:0]  io_out_bits_6_real,
  output [15:0]  io_out_bits_6_imag,
  output [15:0]  io_out_bits_7_real,
  output [15:0]  io_out_bits_7_imag,
  output         io_out_sync,
  output         io_data_set_end_status,
  input          io_data_set_end_clear,
  output [191:0] auto_cover_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  direct_metaReset; // @[FFT.scala 362:22]
  wire  direct_clock; // @[FFT.scala 362:22]
  wire  direct_reset; // @[FFT.scala 362:22]
  wire  direct_io_in_valid; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_0_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_0_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_1_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_1_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_2_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_2_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_3_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_3_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_4_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_4_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_5_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_5_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_6_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_6_imag; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_7_real; // @[FFT.scala 362:22]
  wire [16:0] direct_io_in_bits_7_imag; // @[FFT.scala 362:22]
  wire  direct_io_in_sync; // @[FFT.scala 362:22]
  wire  direct_io_out_valid; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_0_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_0_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_1_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_1_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_2_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_2_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_3_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_3_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_4_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_4_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_5_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_5_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_6_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_6_imag; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_7_real; // @[FFT.scala 362:22]
  wire [15:0] direct_io_out_bits_7_imag; // @[FFT.scala 362:22]
  wire  direct_io_out_sync; // @[FFT.scala 362:22]
  wire  direct__GEN_161_0; // @[FFT.scala 362:22]
  wire  direct__GEN_104_0; // @[FFT.scala 362:22]
  wire  direct__GEN_54_0; // @[FFT.scala 362:22]
  wire  direct__GEN_176_0; // @[FFT.scala 362:22]
  wire  direct__GEN_220_0; // @[FFT.scala 362:22]
  wire  direct__GEN_92_0; // @[FFT.scala 362:22]
  wire  direct__GEN_214_0; // @[FFT.scala 362:22]
  wire  direct__GEN_193_0; // @[FFT.scala 362:22]
  wire  direct__GEN_98_0; // @[FFT.scala 362:22]
  wire  direct__GEN_142_0; // @[FFT.scala 362:22]
  wire  direct__GEN_77_0; // @[FFT.scala 362:22]
  wire  direct__GEN_119_0; // @[FFT.scala 362:22]
  wire  direct__GEN_179_0; // @[FFT.scala 362:22]
  wire  direct__GEN_170_0; // @[FFT.scala 362:22]
  wire  direct__GEN_61_0; // @[FFT.scala 362:22]
  wire  direct__GEN_107_0; // @[FFT.scala 362:22]
  wire  direct__GEN_30_0; // @[FFT.scala 362:22]
  wire  direct__GEN_202_0; // @[FFT.scala 362:22]
  wire  direct__GEN_101_0; // @[FFT.scala 362:22]
  wire  direct__GEN_86_0; // @[FFT.scala 362:22]
  wire  direct__GEN_208_0; // @[FFT.scala 362:22]
  wire  direct__GEN_164_0; // @[FFT.scala 362:22]
  wire  direct__GEN_173_0; // @[FFT.scala 362:22]
  wire  direct__GEN_89_0; // @[FFT.scala 362:22]
  wire  direct__GEN_49_0; // @[FFT.scala 362:22]
  wire  direct__GEN_37_0; // @[FFT.scala 362:22]
  wire  direct__GEN_19_0; // @[FFT.scala 362:22]
  wire  direct__GEN_167_0; // @[FFT.scala 362:22]
  wire  direct__GEN_42_0; // @[FFT.scala 362:22]
  wire  direct__GEN_156_0; // @[FFT.scala 362:22]
  wire  direct__GEN_135_0; // @[FFT.scala 362:22]
  wire  direct__GEN_228_0; // @[FFT.scala 362:22]
  wire  direct__GEN_222_0; // @[FFT.scala 362:22]
  wire  direct__GEN_106_0; // @[FFT.scala 362:22]
  wire  direct__GEN_121_0; // @[FFT.scala 362:22]
  wire  direct__GEN_144_0; // @[FFT.scala 362:22]
  wire  direct__GEN_159_0; // @[FFT.scala 362:22]
  wire  direct__GEN_216_0; // @[FFT.scala 362:22]
  wire  direct__GEN_207_0; // @[FFT.scala 362:22]
  wire  direct__GEN_150_0; // @[FFT.scala 362:22]
  wire  direct__GEN_109_0; // @[FFT.scala 362:22]
  wire  direct__GEN_204_0; // @[FFT.scala 362:22]
  wire  direct__GEN_210_0; // @[FFT.scala 362:22]
  wire  direct__GEN_172_0; // @[FFT.scala 362:22]
  wire  direct__GEN_115_0; // @[FFT.scala 362:22]
  wire  direct__GEN_147_0; // @[FFT.scala 362:22]
  wire  direct__GEN_153_0; // @[FFT.scala 362:22]
  wire  direct__GEN_88_0; // @[FFT.scala 362:22]
  wire  direct__GEN_94_0; // @[FFT.scala 362:22]
  wire  direct__GEN_225_0; // @[FFT.scala 362:22]
  wire  direct__GEN_175_0; // @[FFT.scala 362:22]
  wire  direct__GEN_41_1; // @[FFT.scala 362:22]
  wire  direct__GEN_97_0; // @[FFT.scala 362:22]
  wire  direct__GEN_103_0; // @[FFT.scala 362:22]
  wire  direct__GEN_91_0; // @[FFT.scala 362:22]
  wire  direct__GEN_118_0; // @[FFT.scala 362:22]
  wire  direct__GEN_53_0; // @[FFT.scala 362:22]
  wire  direct__GEN_192_0; // @[FFT.scala 362:22]
  wire  direct__GEN_219_0; // @[FFT.scala 362:22]
  wire  direct__GEN_213_0; // @[FFT.scala 362:22]
  wire  direct__GEN_160_0; // @[FFT.scala 362:22]
  wire  direct__GEN_169_0; // @[FFT.scala 362:22]
  wire  direct__GEN_112_0; // @[FFT.scala 362:22]
  wire  direct__GEN_29_0; // @[FFT.scala 362:22]
  wire  direct__GEN_163_0; // @[FFT.scala 362:22]
  wire  direct__GEN_201_0; // @[FFT.scala 362:22]
  wire  direct__GEN_58_0; // @[FFT.scala 362:22]
  wire  direct__GEN_85_0; // @[FFT.scala 362:22]
  wire  direct__GEN_100_0; // @[FFT.scala 362:22]
  wire  direct__GEN_178_0; // @[FFT.scala 362:22]
  wire  direct__GEN_76_0; // @[FFT.scala 362:22]
  wire  direct__GEN_46_0; // @[FFT.scala 362:22]
  wire  direct__GEN_34_0; // @[FFT.scala 362:22]
  wire  direct__GEN_152_0; // @[FFT.scala 362:22]
  wire  direct__GEN_166_0; // @[FFT.scala 362:22]
  wire  direct__GEN_5_2; // @[FFT.scala 362:22]
  wire  direct__GEN_146_0; // @[FFT.scala 362:22]
  wire  direct__GEN_218_0; // @[FFT.scala 362:22]
  wire  direct__GEN_111_0; // @[FFT.scala 362:22]
  wire  direct__GEN_117_0; // @[FFT.scala 362:22]
  wire  direct__GEN_155_0; // @[FFT.scala 362:22]
  wire  direct__GEN_149_0; // @[FFT.scala 362:22]
  wire  direct__GEN_134_0; // @[FFT.scala 362:22]
  wire  direct__GEN_212_0; // @[FFT.scala 362:22]
  wire  direct__GEN_200_0; // @[FFT.scala 362:22]
  wire  direct__GEN_227_0; // @[FFT.scala 362:22]
  wire  direct__GEN_177_0; // @[FFT.scala 362:22]
  wire  direct__GEN_120_0; // @[FFT.scala 362:22]
  wire  direct__GEN_143_0; // @[FFT.scala 362:22]
  wire  direct__GEN_215_0; // @[FFT.scala 362:22]
  wire  direct__GEN_158_0; // @[FFT.scala 362:22]
  wire  direct__GEN_99_0; // @[FFT.scala 362:22]
  wire  direct__GEN_105_0; // @[FFT.scala 362:22]
  wire  direct__GEN_221_0; // @[FFT.scala 362:22]
  wire  direct__GEN_62_0; // @[FFT.scala 362:22]
  wire  direct__GEN_93_0; // @[FFT.scala 362:22]
  wire  direct__GEN_108_0; // @[FFT.scala 362:22]
  wire  direct__GEN_171_0; // @[FFT.scala 362:22]
  wire  direct__GEN_114_0; // @[FFT.scala 362:22]
  wire  direct__GEN_87_0; // @[FFT.scala 362:22]
  wire  direct__GEN_209_0; // @[FFT.scala 362:22]
  wire  direct__GEN_203_0; // @[FFT.scala 362:22]
  wire  direct__GEN_102_0; // @[FFT.scala 362:22]
  wire  direct__GEN_224_0; // @[FFT.scala 362:22]
  wire  direct__GEN_165_0; // @[FFT.scala 362:22]
  wire  direct__GEN_38_0; // @[FFT.scala 362:22]
  wire  direct__GEN_174_0; // @[FFT.scala 362:22]
  wire  direct__GEN_50_0; // @[FFT.scala 362:22]
  wire  direct__GEN_206_0; // @[FFT.scala 362:22]
  wire  direct__GEN_96_0; // @[FFT.scala 362:22]
  wire  direct__GEN_168_0; // @[FFT.scala 362:22]
  wire  direct__GEN_90_0; // @[FFT.scala 362:22]
  wire  direct__GEN_180_0; // @[FFT.scala 362:22]
  wire  direct__GEN_57_0; // @[FFT.scala 362:22]
  wire  direct__GEN_84_0; // @[FFT.scala 362:22]
  wire  direct__GEN_45_0; // @[FFT.scala 362:22]
  wire  direct__GEN_157_0; // @[FFT.scala 362:22]
  wire  direct__GEN_26_0; // @[FFT.scala 362:22]
  wire  direct__GEN_162_0; // @[FFT.scala 362:22]
  wire  direct__GEN_33_1; // @[FFT.scala 362:22]
  wire  direct__GEN_4_1; // @[FFT.scala 362:22]
  wire  direct__GEN_151_0; // @[FFT.scala 362:22]
  wire  direct__GEN_122_0; // @[FFT.scala 362:22]
  wire  direct__GEN_113_0; // @[FFT.scala 362:22]
  wire  direct__GEN_229_0; // @[FFT.scala 362:22]
  wire  direct__GEN_223_0; // @[FFT.scala 362:22]
  wire  direct__GEN_145_0; // @[FFT.scala 362:22]
  wire  direct__GEN_95_0; // @[FFT.scala 362:22]
  wire  direct__GEN_217_0; // @[FFT.scala 362:22]
  wire  direct__GEN_211_0; // @[FFT.scala 362:22]
  wire  direct__GEN_205_0; // @[FFT.scala 362:22]
  wire  direct__GEN_148_0; // @[FFT.scala 362:22]
  wire  direct__GEN_116_0; // @[FFT.scala 362:22]
  wire  direct__GEN_110_0; // @[FFT.scala 362:22]
  wire  direct__GEN_226_0; // @[FFT.scala 362:22]
  wire  direct__GEN_154_0; // @[FFT.scala 362:22]
  wire  BiplexFFT_metaReset; // @[FFT.scala 366:24]
  wire  BiplexFFT_clock; // @[FFT.scala 366:24]
  wire  BiplexFFT_reset; // @[FFT.scala 366:24]
  wire  BiplexFFT_io_in_valid; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_0_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_0_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_1_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_1_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_2_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_2_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_3_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_3_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_4_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_4_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_5_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_5_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_6_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_6_imag; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_7_real; // @[FFT.scala 366:24]
  wire [15:0] BiplexFFT_io_in_bits_7_imag; // @[FFT.scala 366:24]
  wire  BiplexFFT_io_in_sync; // @[FFT.scala 366:24]
  wire  BiplexFFT_io_out_valid; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_0_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_0_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_1_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_1_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_2_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_2_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_3_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_3_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_4_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_4_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_5_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_5_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_6_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_6_imag; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_7_real; // @[FFT.scala 366:24]
  wire [16:0] BiplexFFT_io_out_bits_7_imag; // @[FFT.scala 366:24]
  wire  BiplexFFT_io_out_sync; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_13_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_52_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_28_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_44_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_36_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_12_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_20_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_55_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_49_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_41_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_25_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_33_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_5_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_17_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_51_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_32_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_43_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_4_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_35_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_27_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_54_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_48_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_9_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_19_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_40_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_24_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_16_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_47_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_50_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_31_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_42_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_23_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_26_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_53_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_34_1; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_39_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_18_0; // @[FFT.scala 366:24]
  wire  BiplexFFT__GEN_8_1; // @[FFT.scala 366:24]
  wire  profilePin_0 = ~io_in_valid; // @[FFT.scala 343:22]
  wire [9:0] _GEN_221 = {io_data_set_end_clear,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0};
  wire  profilePin_17 = direct__GEN_4_1;
  wire [18:0] _GEN_230 = {_GEN_221,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,profilePin_0,reset,profilePin_17};
  wire  profilePin_18 = direct__GEN_5_2;
  wire  profilePin_19 = direct__GEN_19_0;
  wire  profilePin_20 = direct__GEN_26_0;
  wire  profilePin_21 = direct__GEN_29_0;
  wire  profilePin_22 = direct__GEN_30_0;
  wire  profilePin_23 = direct__GEN_33_1;
  wire  profilePin_24 = direct__GEN_34_0;
  wire  profilePin_25 = direct__GEN_37_0;
  wire  profilePin_26 = direct__GEN_38_0;
  wire [27:0] _GEN_239 = {_GEN_230,profilePin_18,profilePin_19,profilePin_20,profilePin_21,profilePin_22,profilePin_23,profilePin_24,profilePin_25,profilePin_26};
  wire  profilePin_27 = direct__GEN_41_1;
  wire  profilePin_28 = direct__GEN_42_0;
  wire  profilePin_29 = direct__GEN_45_0;
  wire  profilePin_30 = direct__GEN_46_0;
  wire  profilePin_31 = direct__GEN_49_0;
  wire  profilePin_32 = direct__GEN_50_0;
  wire  profilePin_33 = direct__GEN_53_0;
  wire  profilePin_34 = direct__GEN_54_0;
  wire  profilePin_35 = direct__GEN_57_0;
  wire [36:0] _GEN_248 = {_GEN_239,profilePin_27,profilePin_28,profilePin_29,profilePin_30,profilePin_31,profilePin_32,profilePin_33,profilePin_34,profilePin_35};
  wire  profilePin_36 = direct__GEN_58_0;
  wire  profilePin_37 = direct__GEN_61_0;
  wire  profilePin_38 = direct__GEN_62_0;
  wire  profilePin_39 = direct__GEN_76_0;
  wire  profilePin_40 = direct__GEN_77_0;
  wire  profilePin_41 = direct__GEN_84_0;
  wire  profilePin_42 = direct__GEN_85_0;
  wire  profilePin_43 = direct__GEN_86_0;
  wire  profilePin_44 = direct__GEN_87_0;
  wire [45:0] _GEN_257 = {_GEN_248,profilePin_36,profilePin_37,profilePin_38,profilePin_39,profilePin_40,profilePin_41,profilePin_42,profilePin_43,profilePin_44};
  wire  profilePin_45 = direct__GEN_88_0;
  wire  profilePin_46 = direct__GEN_89_0;
  wire  profilePin_47 = direct__GEN_90_0;
  wire  profilePin_48 = direct__GEN_91_0;
  wire  profilePin_49 = direct__GEN_92_0;
  wire  profilePin_50 = direct__GEN_93_0;
  wire  profilePin_51 = direct__GEN_94_0;
  wire  profilePin_52 = direct__GEN_95_0;
  wire  profilePin_53 = direct__GEN_96_0;
  wire [54:0] _GEN_266 = {_GEN_257,profilePin_45,profilePin_46,profilePin_47,profilePin_48,profilePin_49,profilePin_50,profilePin_51,profilePin_52,profilePin_53};
  wire  profilePin_54 = direct__GEN_97_0;
  wire  profilePin_55 = direct__GEN_98_0;
  wire  profilePin_56 = direct__GEN_99_0;
  wire  profilePin_57 = direct__GEN_100_0;
  wire  profilePin_58 = direct__GEN_101_0;
  wire  profilePin_59 = direct__GEN_102_0;
  wire  profilePin_60 = direct__GEN_103_0;
  wire  profilePin_61 = direct__GEN_104_0;
  wire  profilePin_62 = direct__GEN_105_0;
  wire [63:0] _GEN_275 = {_GEN_266,profilePin_54,profilePin_55,profilePin_56,profilePin_57,profilePin_58,profilePin_59,profilePin_60,profilePin_61,profilePin_62};
  wire  profilePin_63 = direct__GEN_106_0;
  wire  profilePin_64 = direct__GEN_107_0;
  wire  profilePin_65 = direct__GEN_108_0;
  wire  profilePin_66 = direct__GEN_109_0;
  wire  profilePin_67 = direct__GEN_110_0;
  wire  profilePin_68 = direct__GEN_111_0;
  wire  profilePin_69 = direct__GEN_112_0;
  wire  profilePin_70 = direct__GEN_113_0;
  wire  profilePin_71 = direct__GEN_114_0;
  wire [72:0] _GEN_284 = {_GEN_275,profilePin_63,profilePin_64,profilePin_65,profilePin_66,profilePin_67,profilePin_68,profilePin_69,profilePin_70,profilePin_71};
  wire  profilePin_72 = direct__GEN_115_0;
  wire  profilePin_73 = direct__GEN_116_0;
  wire  profilePin_74 = direct__GEN_117_0;
  wire  profilePin_75 = direct__GEN_118_0;
  wire  profilePin_76 = direct__GEN_119_0;
  wire  profilePin_77 = direct__GEN_120_0;
  wire  profilePin_78 = direct__GEN_121_0;
  wire  profilePin_79 = direct__GEN_122_0;
  wire  profilePin_80 = direct__GEN_134_0;
  wire [81:0] _GEN_293 = {_GEN_284,profilePin_72,profilePin_73,profilePin_74,profilePin_75,profilePin_76,profilePin_77,profilePin_78,profilePin_79,profilePin_80};
  wire  profilePin_81 = direct__GEN_135_0;
  wire  profilePin_82 = direct__GEN_142_0;
  wire  profilePin_83 = direct__GEN_143_0;
  wire  profilePin_84 = direct__GEN_144_0;
  wire  profilePin_85 = direct__GEN_145_0;
  wire  profilePin_86 = direct__GEN_146_0;
  wire  profilePin_87 = direct__GEN_147_0;
  wire  profilePin_88 = direct__GEN_148_0;
  wire  profilePin_89 = direct__GEN_149_0;
  wire [90:0] _GEN_302 = {_GEN_293,profilePin_81,profilePin_82,profilePin_83,profilePin_84,profilePin_85,profilePin_86,profilePin_87,profilePin_88,profilePin_89};
  wire  profilePin_90 = direct__GEN_150_0;
  wire  profilePin_91 = direct__GEN_151_0;
  wire  profilePin_92 = direct__GEN_152_0;
  wire  profilePin_93 = direct__GEN_153_0;
  wire  profilePin_94 = direct__GEN_154_0;
  wire  profilePin_95 = direct__GEN_155_0;
  wire  profilePin_96 = direct__GEN_156_0;
  wire  profilePin_97 = direct__GEN_157_0;
  wire  profilePin_98 = direct__GEN_158_0;
  wire [99:0] _GEN_311 = {_GEN_302,profilePin_90,profilePin_91,profilePin_92,profilePin_93,profilePin_94,profilePin_95,profilePin_96,profilePin_97,profilePin_98};
  wire  profilePin_99 = direct__GEN_159_0;
  wire  profilePin_100 = direct__GEN_160_0;
  wire  profilePin_101 = direct__GEN_161_0;
  wire  profilePin_102 = direct__GEN_162_0;
  wire  profilePin_103 = direct__GEN_163_0;
  wire  profilePin_104 = direct__GEN_164_0;
  wire  profilePin_105 = direct__GEN_165_0;
  wire  profilePin_106 = direct__GEN_166_0;
  wire  profilePin_107 = direct__GEN_167_0;
  wire [108:0] _GEN_320 = {_GEN_311,profilePin_99,profilePin_100,profilePin_101,profilePin_102,profilePin_103,profilePin_104,profilePin_105,profilePin_106,profilePin_107};
  wire  profilePin_108 = direct__GEN_168_0;
  wire  profilePin_109 = direct__GEN_169_0;
  wire  profilePin_110 = direct__GEN_170_0;
  wire  profilePin_111 = direct__GEN_171_0;
  wire  profilePin_112 = direct__GEN_172_0;
  wire  profilePin_113 = direct__GEN_173_0;
  wire  profilePin_114 = direct__GEN_174_0;
  wire  profilePin_115 = direct__GEN_175_0;
  wire  profilePin_116 = direct__GEN_176_0;
  wire [117:0] _GEN_329 = {_GEN_320,profilePin_108,profilePin_109,profilePin_110,profilePin_111,profilePin_112,profilePin_113,profilePin_114,profilePin_115,profilePin_116};
  wire  profilePin_117 = direct__GEN_177_0;
  wire  profilePin_118 = direct__GEN_178_0;
  wire  profilePin_119 = direct__GEN_179_0;
  wire  profilePin_120 = direct__GEN_180_0;
  wire  profilePin_121 = direct__GEN_192_0;
  wire  profilePin_122 = direct__GEN_193_0;
  wire  profilePin_123 = direct__GEN_200_0;
  wire  profilePin_124 = direct__GEN_201_0;
  wire  profilePin_125 = direct__GEN_202_0;
  wire [126:0] _GEN_338 = {_GEN_329,profilePin_117,profilePin_118,profilePin_119,profilePin_120,profilePin_121,profilePin_122,profilePin_123,profilePin_124,profilePin_125};
  wire  profilePin_126 = direct__GEN_203_0;
  wire  profilePin_127 = direct__GEN_204_0;
  wire  profilePin_128 = direct__GEN_205_0;
  wire  profilePin_129 = direct__GEN_206_0;
  wire  profilePin_130 = direct__GEN_207_0;
  wire  profilePin_131 = direct__GEN_208_0;
  wire  profilePin_132 = direct__GEN_209_0;
  wire  profilePin_133 = direct__GEN_210_0;
  wire  profilePin_134 = direct__GEN_211_0;
  wire [135:0] _GEN_347 = {_GEN_338,profilePin_126,profilePin_127,profilePin_128,profilePin_129,profilePin_130,profilePin_131,profilePin_132,profilePin_133,profilePin_134};
  wire  profilePin_135 = direct__GEN_212_0;
  wire  profilePin_136 = direct__GEN_213_0;
  wire  profilePin_137 = direct__GEN_214_0;
  wire  profilePin_138 = direct__GEN_215_0;
  wire  profilePin_139 = direct__GEN_216_0;
  wire  profilePin_140 = direct__GEN_217_0;
  wire  profilePin_141 = direct__GEN_218_0;
  wire  profilePin_142 = direct__GEN_219_0;
  wire  profilePin_143 = direct__GEN_220_0;
  wire [144:0] _GEN_356 = {_GEN_347,profilePin_135,profilePin_136,profilePin_137,profilePin_138,profilePin_139,profilePin_140,profilePin_141,profilePin_142,profilePin_143};
  wire  profilePin_144 = direct__GEN_221_0;
  wire  profilePin_145 = direct__GEN_222_0;
  wire  profilePin_146 = direct__GEN_223_0;
  wire  profilePin_147 = direct__GEN_224_0;
  wire  profilePin_148 = direct__GEN_225_0;
  wire  profilePin_149 = direct__GEN_226_0;
  wire  profilePin_150 = direct__GEN_227_0;
  wire  profilePin_151 = direct__GEN_228_0;
  wire  profilePin_152 = direct__GEN_229_0;
  wire [153:0] _GEN_365 = {_GEN_356,profilePin_144,profilePin_145,profilePin_146,profilePin_147,profilePin_148,profilePin_149,profilePin_150,profilePin_151,profilePin_152};
  wire  profilePin_153 = BiplexFFT__GEN_4_0;
  wire  profilePin_154 = BiplexFFT__GEN_5_0;
  wire  profilePin_155 = BiplexFFT__GEN_8_1;
  wire  profilePin_156 = BiplexFFT__GEN_9_1;
  wire  profilePin_157 = BiplexFFT__GEN_12_0;
  wire  profilePin_158 = BiplexFFT__GEN_13_0;
  wire  profilePin_159 = BiplexFFT__GEN_16_1;
  wire  profilePin_160 = BiplexFFT__GEN_17_1;
  wire  profilePin_161 = BiplexFFT__GEN_18_0;
  wire [162:0] _GEN_374 = {_GEN_365,profilePin_153,profilePin_154,profilePin_155,profilePin_156,profilePin_157,profilePin_158,profilePin_159,profilePin_160,profilePin_161};
  wire  profilePin_162 = BiplexFFT__GEN_19_1;
  wire  profilePin_163 = BiplexFFT__GEN_20_0;
  wire  profilePin_164 = BiplexFFT__GEN_23_0;
  wire  profilePin_165 = BiplexFFT__GEN_24_0;
  wire  profilePin_166 = BiplexFFT__GEN_25_0;
  wire  profilePin_167 = BiplexFFT__GEN_26_1;
  wire  profilePin_168 = BiplexFFT__GEN_27_0;
  wire  profilePin_169 = BiplexFFT__GEN_28_0;
  wire  profilePin_170 = BiplexFFT__GEN_31_0;
  wire [171:0] _GEN_383 = {_GEN_374,profilePin_162,profilePin_163,profilePin_164,profilePin_165,profilePin_166,profilePin_167,profilePin_168,profilePin_169,profilePin_170};
  wire  profilePin_171 = BiplexFFT__GEN_32_0;
  wire  profilePin_172 = BiplexFFT__GEN_33_0;
  wire  profilePin_173 = BiplexFFT__GEN_34_1;
  wire  profilePin_174 = BiplexFFT__GEN_35_0;
  wire  profilePin_175 = BiplexFFT__GEN_36_0;
  wire  profilePin_176 = BiplexFFT__GEN_39_0;
  wire  profilePin_177 = BiplexFFT__GEN_40_0;
  wire  profilePin_178 = BiplexFFT__GEN_41_0;
  wire  profilePin_179 = BiplexFFT__GEN_42_1;
  wire [180:0] _GEN_392 = {_GEN_383,profilePin_171,profilePin_172,profilePin_173,profilePin_174,profilePin_175,profilePin_176,profilePin_177,profilePin_178,profilePin_179};
  wire  profilePin_180 = BiplexFFT__GEN_43_0;
  wire  profilePin_181 = BiplexFFT__GEN_44_0;
  wire  profilePin_182 = BiplexFFT__GEN_47_0;
  wire  profilePin_183 = BiplexFFT__GEN_48_0;
  wire  profilePin_184 = BiplexFFT__GEN_49_1;
  wire  profilePin_185 = BiplexFFT__GEN_50_1;
  wire  profilePin_186 = BiplexFFT__GEN_51_0;
  wire  profilePin_187 = BiplexFFT__GEN_52_0;
  wire  profilePin_188 = BiplexFFT__GEN_53_1;
  wire [189:0] _GEN_401 = {_GEN_392,profilePin_180,profilePin_181,profilePin_182,profilePin_183,profilePin_184,profilePin_185,profilePin_186,profilePin_187,profilePin_188};
  wire  profilePin_189 = BiplexFFT__GEN_54_1;
  wire [190:0] _GEN_402 = {_GEN_401,profilePin_189};
  wire  profilePin_190 = BiplexFFT__GEN_55_0;
  reg  valid_delay; // @[FFT.scala 352:24]
  reg  dses; // @[FFT.scala 353:17]
  wire  _GEN_33 = io_data_set_end_clear ? 1'h0 : dses; // @[FFT.scala 354:32]
  wire  _T_1005 = ~io_out_valid; // @[FFT.scala 356:30]
  wire  _T_1006 = valid_delay & _T_1005; // @[FFT.scala 356:28]
  wire  _T_1008 = ~io_data_set_end_clear; // @[FFT.scala 354:32]
  wire  _T_1009 = _T_1008 & _T_1006; // @[FFT.scala 356:45]
  wire  _GEN_34 = _T_1009 | _GEN_33; // @[FFT.scala 356:45]
  DirectFFT direct ( // @[FFT.scala 362:22]
    .metaReset(direct_metaReset),
    .clock(direct_clock),
    .reset(direct_reset),
    .io_in_valid(direct_io_in_valid),
    .io_in_bits_0_real(direct_io_in_bits_0_real),
    .io_in_bits_0_imag(direct_io_in_bits_0_imag),
    .io_in_bits_1_real(direct_io_in_bits_1_real),
    .io_in_bits_1_imag(direct_io_in_bits_1_imag),
    .io_in_bits_2_real(direct_io_in_bits_2_real),
    .io_in_bits_2_imag(direct_io_in_bits_2_imag),
    .io_in_bits_3_real(direct_io_in_bits_3_real),
    .io_in_bits_3_imag(direct_io_in_bits_3_imag),
    .io_in_bits_4_real(direct_io_in_bits_4_real),
    .io_in_bits_4_imag(direct_io_in_bits_4_imag),
    .io_in_bits_5_real(direct_io_in_bits_5_real),
    .io_in_bits_5_imag(direct_io_in_bits_5_imag),
    .io_in_bits_6_real(direct_io_in_bits_6_real),
    .io_in_bits_6_imag(direct_io_in_bits_6_imag),
    .io_in_bits_7_real(direct_io_in_bits_7_real),
    .io_in_bits_7_imag(direct_io_in_bits_7_imag),
    .io_in_sync(direct_io_in_sync),
    .io_out_valid(direct_io_out_valid),
    .io_out_bits_0_real(direct_io_out_bits_0_real),
    .io_out_bits_0_imag(direct_io_out_bits_0_imag),
    .io_out_bits_1_real(direct_io_out_bits_1_real),
    .io_out_bits_1_imag(direct_io_out_bits_1_imag),
    .io_out_bits_2_real(direct_io_out_bits_2_real),
    .io_out_bits_2_imag(direct_io_out_bits_2_imag),
    .io_out_bits_3_real(direct_io_out_bits_3_real),
    .io_out_bits_3_imag(direct_io_out_bits_3_imag),
    .io_out_bits_4_real(direct_io_out_bits_4_real),
    .io_out_bits_4_imag(direct_io_out_bits_4_imag),
    .io_out_bits_5_real(direct_io_out_bits_5_real),
    .io_out_bits_5_imag(direct_io_out_bits_5_imag),
    .io_out_bits_6_real(direct_io_out_bits_6_real),
    .io_out_bits_6_imag(direct_io_out_bits_6_imag),
    .io_out_bits_7_real(direct_io_out_bits_7_real),
    .io_out_bits_7_imag(direct_io_out_bits_7_imag),
    .io_out_sync(direct_io_out_sync),
    ._GEN_161_0(direct__GEN_161_0),
    ._GEN_104_0(direct__GEN_104_0),
    ._GEN_54_0(direct__GEN_54_0),
    ._GEN_176_0(direct__GEN_176_0),
    ._GEN_220_0(direct__GEN_220_0),
    ._GEN_92_0(direct__GEN_92_0),
    ._GEN_214_0(direct__GEN_214_0),
    ._GEN_193_0(direct__GEN_193_0),
    ._GEN_98_0(direct__GEN_98_0),
    ._GEN_142_0(direct__GEN_142_0),
    ._GEN_77_0(direct__GEN_77_0),
    ._GEN_119_0(direct__GEN_119_0),
    ._GEN_179_0(direct__GEN_179_0),
    ._GEN_170_0(direct__GEN_170_0),
    ._GEN_61_0(direct__GEN_61_0),
    ._GEN_107_0(direct__GEN_107_0),
    ._GEN_30_0(direct__GEN_30_0),
    ._GEN_202_0(direct__GEN_202_0),
    ._GEN_101_0(direct__GEN_101_0),
    ._GEN_86_0(direct__GEN_86_0),
    ._GEN_208_0(direct__GEN_208_0),
    ._GEN_164_0(direct__GEN_164_0),
    ._GEN_173_0(direct__GEN_173_0),
    ._GEN_89_0(direct__GEN_89_0),
    ._GEN_49_0(direct__GEN_49_0),
    ._GEN_37_0(direct__GEN_37_0),
    ._GEN_19_0(direct__GEN_19_0),
    ._GEN_167_0(direct__GEN_167_0),
    ._GEN_42_0(direct__GEN_42_0),
    ._GEN_156_0(direct__GEN_156_0),
    ._GEN_135_0(direct__GEN_135_0),
    ._GEN_228_0(direct__GEN_228_0),
    ._GEN_222_0(direct__GEN_222_0),
    ._GEN_106_0(direct__GEN_106_0),
    ._GEN_121_0(direct__GEN_121_0),
    ._GEN_144_0(direct__GEN_144_0),
    ._GEN_159_0(direct__GEN_159_0),
    ._GEN_216_0(direct__GEN_216_0),
    ._GEN_207_0(direct__GEN_207_0),
    ._GEN_150_0(direct__GEN_150_0),
    ._GEN_109_0(direct__GEN_109_0),
    ._GEN_204_0(direct__GEN_204_0),
    ._GEN_210_0(direct__GEN_210_0),
    ._GEN_172_0(direct__GEN_172_0),
    ._GEN_115_0(direct__GEN_115_0),
    ._GEN_147_0(direct__GEN_147_0),
    ._GEN_153_0(direct__GEN_153_0),
    ._GEN_88_0(direct__GEN_88_0),
    ._GEN_94_0(direct__GEN_94_0),
    ._GEN_225_0(direct__GEN_225_0),
    ._GEN_175_0(direct__GEN_175_0),
    ._GEN_41_1(direct__GEN_41_1),
    ._GEN_97_0(direct__GEN_97_0),
    ._GEN_103_0(direct__GEN_103_0),
    ._GEN_91_0(direct__GEN_91_0),
    ._GEN_118_0(direct__GEN_118_0),
    ._GEN_53_0(direct__GEN_53_0),
    ._GEN_192_0(direct__GEN_192_0),
    ._GEN_219_0(direct__GEN_219_0),
    ._GEN_213_0(direct__GEN_213_0),
    ._GEN_160_0(direct__GEN_160_0),
    ._GEN_169_0(direct__GEN_169_0),
    ._GEN_112_0(direct__GEN_112_0),
    ._GEN_29_0(direct__GEN_29_0),
    ._GEN_163_0(direct__GEN_163_0),
    ._GEN_201_0(direct__GEN_201_0),
    ._GEN_58_0(direct__GEN_58_0),
    ._GEN_85_0(direct__GEN_85_0),
    ._GEN_100_0(direct__GEN_100_0),
    ._GEN_178_0(direct__GEN_178_0),
    ._GEN_76_0(direct__GEN_76_0),
    ._GEN_46_0(direct__GEN_46_0),
    ._GEN_34_0(direct__GEN_34_0),
    ._GEN_152_0(direct__GEN_152_0),
    ._GEN_166_0(direct__GEN_166_0),
    ._GEN_5_2(direct__GEN_5_2),
    ._GEN_146_0(direct__GEN_146_0),
    ._GEN_218_0(direct__GEN_218_0),
    ._GEN_111_0(direct__GEN_111_0),
    ._GEN_117_0(direct__GEN_117_0),
    ._GEN_155_0(direct__GEN_155_0),
    ._GEN_149_0(direct__GEN_149_0),
    ._GEN_134_0(direct__GEN_134_0),
    ._GEN_212_0(direct__GEN_212_0),
    ._GEN_200_0(direct__GEN_200_0),
    ._GEN_227_0(direct__GEN_227_0),
    ._GEN_177_0(direct__GEN_177_0),
    ._GEN_120_0(direct__GEN_120_0),
    ._GEN_143_0(direct__GEN_143_0),
    ._GEN_215_0(direct__GEN_215_0),
    ._GEN_158_0(direct__GEN_158_0),
    ._GEN_99_0(direct__GEN_99_0),
    ._GEN_105_0(direct__GEN_105_0),
    ._GEN_221_0(direct__GEN_221_0),
    ._GEN_62_0(direct__GEN_62_0),
    ._GEN_93_0(direct__GEN_93_0),
    ._GEN_108_0(direct__GEN_108_0),
    ._GEN_171_0(direct__GEN_171_0),
    ._GEN_114_0(direct__GEN_114_0),
    ._GEN_87_0(direct__GEN_87_0),
    ._GEN_209_0(direct__GEN_209_0),
    ._GEN_203_0(direct__GEN_203_0),
    ._GEN_102_0(direct__GEN_102_0),
    ._GEN_224_0(direct__GEN_224_0),
    ._GEN_165_0(direct__GEN_165_0),
    ._GEN_38_0(direct__GEN_38_0),
    ._GEN_174_0(direct__GEN_174_0),
    ._GEN_50_0(direct__GEN_50_0),
    ._GEN_206_0(direct__GEN_206_0),
    ._GEN_96_0(direct__GEN_96_0),
    ._GEN_168_0(direct__GEN_168_0),
    ._GEN_90_0(direct__GEN_90_0),
    ._GEN_180_0(direct__GEN_180_0),
    ._GEN_57_0(direct__GEN_57_0),
    ._GEN_84_0(direct__GEN_84_0),
    ._GEN_45_0(direct__GEN_45_0),
    ._GEN_157_0(direct__GEN_157_0),
    ._GEN_26_0(direct__GEN_26_0),
    ._GEN_162_0(direct__GEN_162_0),
    ._GEN_33_1(direct__GEN_33_1),
    ._GEN_4_1(direct__GEN_4_1),
    ._GEN_151_0(direct__GEN_151_0),
    ._GEN_122_0(direct__GEN_122_0),
    ._GEN_113_0(direct__GEN_113_0),
    ._GEN_229_0(direct__GEN_229_0),
    ._GEN_223_0(direct__GEN_223_0),
    ._GEN_145_0(direct__GEN_145_0),
    ._GEN_95_0(direct__GEN_95_0),
    ._GEN_217_0(direct__GEN_217_0),
    ._GEN_211_0(direct__GEN_211_0),
    ._GEN_205_0(direct__GEN_205_0),
    ._GEN_148_0(direct__GEN_148_0),
    ._GEN_116_0(direct__GEN_116_0),
    ._GEN_110_0(direct__GEN_110_0),
    ._GEN_226_0(direct__GEN_226_0),
    ._GEN_154_0(direct__GEN_154_0)
  );
  BiplexFFT BiplexFFT ( // @[FFT.scala 366:24]
    .metaReset(BiplexFFT_metaReset),
    .clock(BiplexFFT_clock),
    .reset(BiplexFFT_reset),
    .io_in_valid(BiplexFFT_io_in_valid),
    .io_in_bits_0_real(BiplexFFT_io_in_bits_0_real),
    .io_in_bits_0_imag(BiplexFFT_io_in_bits_0_imag),
    .io_in_bits_1_real(BiplexFFT_io_in_bits_1_real),
    .io_in_bits_1_imag(BiplexFFT_io_in_bits_1_imag),
    .io_in_bits_2_real(BiplexFFT_io_in_bits_2_real),
    .io_in_bits_2_imag(BiplexFFT_io_in_bits_2_imag),
    .io_in_bits_3_real(BiplexFFT_io_in_bits_3_real),
    .io_in_bits_3_imag(BiplexFFT_io_in_bits_3_imag),
    .io_in_bits_4_real(BiplexFFT_io_in_bits_4_real),
    .io_in_bits_4_imag(BiplexFFT_io_in_bits_4_imag),
    .io_in_bits_5_real(BiplexFFT_io_in_bits_5_real),
    .io_in_bits_5_imag(BiplexFFT_io_in_bits_5_imag),
    .io_in_bits_6_real(BiplexFFT_io_in_bits_6_real),
    .io_in_bits_6_imag(BiplexFFT_io_in_bits_6_imag),
    .io_in_bits_7_real(BiplexFFT_io_in_bits_7_real),
    .io_in_bits_7_imag(BiplexFFT_io_in_bits_7_imag),
    .io_in_sync(BiplexFFT_io_in_sync),
    .io_out_valid(BiplexFFT_io_out_valid),
    .io_out_bits_0_real(BiplexFFT_io_out_bits_0_real),
    .io_out_bits_0_imag(BiplexFFT_io_out_bits_0_imag),
    .io_out_bits_1_real(BiplexFFT_io_out_bits_1_real),
    .io_out_bits_1_imag(BiplexFFT_io_out_bits_1_imag),
    .io_out_bits_2_real(BiplexFFT_io_out_bits_2_real),
    .io_out_bits_2_imag(BiplexFFT_io_out_bits_2_imag),
    .io_out_bits_3_real(BiplexFFT_io_out_bits_3_real),
    .io_out_bits_3_imag(BiplexFFT_io_out_bits_3_imag),
    .io_out_bits_4_real(BiplexFFT_io_out_bits_4_real),
    .io_out_bits_4_imag(BiplexFFT_io_out_bits_4_imag),
    .io_out_bits_5_real(BiplexFFT_io_out_bits_5_real),
    .io_out_bits_5_imag(BiplexFFT_io_out_bits_5_imag),
    .io_out_bits_6_real(BiplexFFT_io_out_bits_6_real),
    .io_out_bits_6_imag(BiplexFFT_io_out_bits_6_imag),
    .io_out_bits_7_real(BiplexFFT_io_out_bits_7_real),
    .io_out_bits_7_imag(BiplexFFT_io_out_bits_7_imag),
    .io_out_sync(BiplexFFT_io_out_sync),
    ._GEN_13_0(BiplexFFT__GEN_13_0),
    ._GEN_52_0(BiplexFFT__GEN_52_0),
    ._GEN_28_0(BiplexFFT__GEN_28_0),
    ._GEN_44_0(BiplexFFT__GEN_44_0),
    ._GEN_36_0(BiplexFFT__GEN_36_0),
    ._GEN_12_0(BiplexFFT__GEN_12_0),
    ._GEN_20_0(BiplexFFT__GEN_20_0),
    ._GEN_55_0(BiplexFFT__GEN_55_0),
    ._GEN_49_1(BiplexFFT__GEN_49_1),
    ._GEN_41_0(BiplexFFT__GEN_41_0),
    ._GEN_25_0(BiplexFFT__GEN_25_0),
    ._GEN_33_0(BiplexFFT__GEN_33_0),
    ._GEN_5_0(BiplexFFT__GEN_5_0),
    ._GEN_17_1(BiplexFFT__GEN_17_1),
    ._GEN_51_0(BiplexFFT__GEN_51_0),
    ._GEN_32_0(BiplexFFT__GEN_32_0),
    ._GEN_43_0(BiplexFFT__GEN_43_0),
    ._GEN_4_0(BiplexFFT__GEN_4_0),
    ._GEN_35_0(BiplexFFT__GEN_35_0),
    ._GEN_27_0(BiplexFFT__GEN_27_0),
    ._GEN_54_1(BiplexFFT__GEN_54_1),
    ._GEN_48_0(BiplexFFT__GEN_48_0),
    ._GEN_9_1(BiplexFFT__GEN_9_1),
    ._GEN_19_1(BiplexFFT__GEN_19_1),
    ._GEN_40_0(BiplexFFT__GEN_40_0),
    ._GEN_24_0(BiplexFFT__GEN_24_0),
    ._GEN_16_1(BiplexFFT__GEN_16_1),
    ._GEN_47_0(BiplexFFT__GEN_47_0),
    ._GEN_50_1(BiplexFFT__GEN_50_1),
    ._GEN_31_0(BiplexFFT__GEN_31_0),
    ._GEN_42_1(BiplexFFT__GEN_42_1),
    ._GEN_23_0(BiplexFFT__GEN_23_0),
    ._GEN_26_1(BiplexFFT__GEN_26_1),
    ._GEN_53_1(BiplexFFT__GEN_53_1),
    ._GEN_34_1(BiplexFFT__GEN_34_1),
    ._GEN_39_0(BiplexFFT__GEN_39_0),
    ._GEN_18_0(BiplexFFT__GEN_18_0),
    ._GEN_8_1(BiplexFFT__GEN_8_1)
  );
  assign direct_metaReset = metaReset;
  assign BiplexFFT_metaReset = metaReset;
  assign io_out_valid = direct_io_out_valid; // @[FFT.scala 363:10]
  assign io_out_bits_0_real = direct_io_out_bits_0_real; // @[FFT.scala 363:10]
  assign io_out_bits_0_imag = direct_io_out_bits_0_imag; // @[FFT.scala 363:10]
  assign io_out_bits_1_real = direct_io_out_bits_1_real; // @[FFT.scala 363:10]
  assign io_out_bits_1_imag = direct_io_out_bits_1_imag; // @[FFT.scala 363:10]
  assign io_out_bits_2_real = direct_io_out_bits_2_real; // @[FFT.scala 363:10]
  assign io_out_bits_2_imag = direct_io_out_bits_2_imag; // @[FFT.scala 363:10]
  assign io_out_bits_3_real = direct_io_out_bits_3_real; // @[FFT.scala 363:10]
  assign io_out_bits_3_imag = direct_io_out_bits_3_imag; // @[FFT.scala 363:10]
  assign io_out_bits_4_real = direct_io_out_bits_4_real; // @[FFT.scala 363:10]
  assign io_out_bits_4_imag = direct_io_out_bits_4_imag; // @[FFT.scala 363:10]
  assign io_out_bits_5_real = direct_io_out_bits_5_real; // @[FFT.scala 363:10]
  assign io_out_bits_5_imag = direct_io_out_bits_5_imag; // @[FFT.scala 363:10]
  assign io_out_bits_6_real = direct_io_out_bits_6_real; // @[FFT.scala 363:10]
  assign io_out_bits_6_imag = direct_io_out_bits_6_imag; // @[FFT.scala 363:10]
  assign io_out_bits_7_real = direct_io_out_bits_7_real; // @[FFT.scala 363:10]
  assign io_out_bits_7_imag = direct_io_out_bits_7_imag; // @[FFT.scala 363:10]
  assign io_out_sync = direct_io_out_sync; // @[FFT.scala 363:10]
  assign io_data_set_end_status = dses; // @[FFT.scala 359:26]
  assign auto_cover_out = {_GEN_402,profilePin_190};
  assign direct_clock = clock;
  assign direct_reset = reset;
  assign direct_io_in_valid = BiplexFFT_io_out_valid; // @[FFT.scala 367:18]
  assign direct_io_in_bits_0_real = BiplexFFT_io_out_bits_0_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_0_imag = BiplexFFT_io_out_bits_0_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_1_real = BiplexFFT_io_out_bits_1_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_1_imag = BiplexFFT_io_out_bits_1_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_2_real = BiplexFFT_io_out_bits_2_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_2_imag = BiplexFFT_io_out_bits_2_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_3_real = BiplexFFT_io_out_bits_3_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_3_imag = BiplexFFT_io_out_bits_3_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_4_real = BiplexFFT_io_out_bits_4_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_4_imag = BiplexFFT_io_out_bits_4_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_5_real = BiplexFFT_io_out_bits_5_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_5_imag = BiplexFFT_io_out_bits_5_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_6_real = BiplexFFT_io_out_bits_6_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_6_imag = BiplexFFT_io_out_bits_6_imag; // @[FFT.scala 367:18]
  assign direct_io_in_bits_7_real = BiplexFFT_io_out_bits_7_real; // @[FFT.scala 367:18]
  assign direct_io_in_bits_7_imag = BiplexFFT_io_out_bits_7_imag; // @[FFT.scala 367:18]
  assign direct_io_in_sync = BiplexFFT_io_out_sync; // @[FFT.scala 367:18]
  assign BiplexFFT_clock = clock;
  assign BiplexFFT_reset = reset;
  assign BiplexFFT_io_in_valid = io_in_valid; // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_0_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_0_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_0_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_0_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_1_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_1_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_1_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_1_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_2_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_2_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_2_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_2_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_3_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_3_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_3_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_3_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_4_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_4_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_4_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_4_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_5_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_5_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_5_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_5_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_6_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_6_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_6_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_6_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_7_real = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_7_real); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_bits_7_imag = profilePin_0 ? $signed(16'sh0) : $signed(io_in_bits_7_imag); // @[FFT.scala 368:18]
  assign BiplexFFT_io_in_sync = io_in_sync; // @[FFT.scala 368:18]
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
  valid_delay = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dses = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      valid_delay <= 1'h0;
    end else begin
      valid_delay <= io_out_valid;
    end
    if (metaReset) begin
      dses <= 1'h0;
    end else if (reset) begin
      dses <= 1'h0;
    end else begin
      dses <= _GEN_34;
    end
  end
endmodule
module DirectFFT(
  input         metaReset,
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [16:0] io_in_bits_0_real,
  input  [16:0] io_in_bits_0_imag,
  input  [16:0] io_in_bits_1_real,
  input  [16:0] io_in_bits_1_imag,
  input  [16:0] io_in_bits_2_real,
  input  [16:0] io_in_bits_2_imag,
  input  [16:0] io_in_bits_3_real,
  input  [16:0] io_in_bits_3_imag,
  input  [16:0] io_in_bits_4_real,
  input  [16:0] io_in_bits_4_imag,
  input  [16:0] io_in_bits_5_real,
  input  [16:0] io_in_bits_5_imag,
  input  [16:0] io_in_bits_6_real,
  input  [16:0] io_in_bits_6_imag,
  input  [16:0] io_in_bits_7_real,
  input  [16:0] io_in_bits_7_imag,
  input         io_in_sync,
  output        io_out_valid,
  output [15:0] io_out_bits_0_real,
  output [15:0] io_out_bits_0_imag,
  output [15:0] io_out_bits_1_real,
  output [15:0] io_out_bits_1_imag,
  output [15:0] io_out_bits_2_real,
  output [15:0] io_out_bits_2_imag,
  output [15:0] io_out_bits_3_real,
  output [15:0] io_out_bits_3_imag,
  output [15:0] io_out_bits_4_real,
  output [15:0] io_out_bits_4_imag,
  output [15:0] io_out_bits_5_real,
  output [15:0] io_out_bits_5_imag,
  output [15:0] io_out_bits_6_real,
  output [15:0] io_out_bits_6_imag,
  output [15:0] io_out_bits_7_real,
  output [15:0] io_out_bits_7_imag,
  output        io_out_sync,
  output        _GEN_161_0,
  output        _GEN_104_0,
  output        _GEN_54_0,
  output        _GEN_176_0,
  output        _GEN_220_0,
  output        _GEN_92_0,
  output        _GEN_214_0,
  output        _GEN_193_0,
  output        _GEN_98_0,
  output        _GEN_142_0,
  output        _GEN_77_0,
  output        _GEN_119_0,
  output        _GEN_179_0,
  output        _GEN_170_0,
  output        _GEN_61_0,
  output        _GEN_107_0,
  output        _GEN_30_0,
  output        _GEN_202_0,
  output        _GEN_101_0,
  output        _GEN_86_0,
  output        _GEN_208_0,
  output        _GEN_164_0,
  output        _GEN_173_0,
  output        _GEN_89_0,
  output        _GEN_49_0,
  output        _GEN_37_0,
  output        _GEN_19_0,
  output        _GEN_167_0,
  output        _GEN_42_0,
  output        _GEN_156_0,
  output        _GEN_135_0,
  output        _GEN_228_0,
  output        _GEN_222_0,
  output        _GEN_106_0,
  output        _GEN_121_0,
  output        _GEN_144_0,
  output        _GEN_159_0,
  output        _GEN_216_0,
  output        _GEN_207_0,
  output        _GEN_150_0,
  output        _GEN_109_0,
  output        _GEN_204_0,
  output        _GEN_210_0,
  output        _GEN_172_0,
  output        _GEN_115_0,
  output        _GEN_147_0,
  output        _GEN_153_0,
  output        _GEN_88_0,
  output        _GEN_94_0,
  output        _GEN_225_0,
  output        _GEN_175_0,
  output        _GEN_41_1,
  output        _GEN_97_0,
  output        _GEN_103_0,
  output        _GEN_91_0,
  output        _GEN_118_0,
  output        _GEN_53_0,
  output        _GEN_192_0,
  output        _GEN_219_0,
  output        _GEN_213_0,
  output        _GEN_160_0,
  output        _GEN_169_0,
  output        _GEN_112_0,
  output        _GEN_29_0,
  output        _GEN_163_0,
  output        _GEN_201_0,
  output        _GEN_58_0,
  output        _GEN_85_0,
  output        _GEN_100_0,
  output        _GEN_178_0,
  output        _GEN_76_0,
  output        _GEN_46_0,
  output        _GEN_34_0,
  output        _GEN_152_0,
  output        _GEN_166_0,
  output        _GEN_5_2,
  output        _GEN_146_0,
  output        _GEN_218_0,
  output        _GEN_111_0,
  output        _GEN_117_0,
  output        _GEN_155_0,
  output        _GEN_149_0,
  output        _GEN_134_0,
  output        _GEN_212_0,
  output        _GEN_200_0,
  output        _GEN_227_0,
  output        _GEN_177_0,
  output        _GEN_120_0,
  output        _GEN_143_0,
  output        _GEN_215_0,
  output        _GEN_158_0,
  output        _GEN_99_0,
  output        _GEN_105_0,
  output        _GEN_221_0,
  output        _GEN_62_0,
  output        _GEN_93_0,
  output        _GEN_108_0,
  output        _GEN_171_0,
  output        _GEN_114_0,
  output        _GEN_87_0,
  output        _GEN_209_0,
  output        _GEN_203_0,
  output        _GEN_102_0,
  output        _GEN_224_0,
  output        _GEN_165_0,
  output        _GEN_38_0,
  output        _GEN_174_0,
  output        _GEN_50_0,
  output        _GEN_206_0,
  output        _GEN_96_0,
  output        _GEN_168_0,
  output        _GEN_90_0,
  output        _GEN_180_0,
  output        _GEN_57_0,
  output        _GEN_84_0,
  output        _GEN_45_0,
  output        _GEN_157_0,
  output        _GEN_26_0,
  output        _GEN_162_0,
  output        _GEN_33_1,
  output        _GEN_4_1,
  output        _GEN_151_0,
  output        _GEN_122_0,
  output        _GEN_113_0,
  output        _GEN_229_0,
  output        _GEN_223_0,
  output        _GEN_145_0,
  output        _GEN_95_0,
  output        _GEN_217_0,
  output        _GEN_211_0,
  output        _GEN_205_0,
  output        _GEN_148_0,
  output        _GEN_116_0,
  output        _GEN_110_0,
  output        _GEN_226_0,
  output        _GEN_154_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  valid_delay; // @[FFT.scala 43:24]
  wire  _T_553 = ~valid_delay; // @[FFT.scala 44:62]
  wire  _T_554 = _T_553 & io_in_valid; // @[FFT.scala 44:75]
  reg  value; // @[Counter.scala 17:33]
  wire  _T_561 = value + 1'h1; // @[Counter.scala 26:22]
  wire  _GEN_1 = io_in_sync ? 1'h0 : _T_561; // @[CounterWithReset.scala 13:25]
  wire  _GEN_2 = _T_554 | _GEN_1; // @[CounterWithReset.scala 14:25]
  wire  sync = _T_554 ? 1'h0 : value; // @[CounterWithReset.scala 14:25]
  wire [2:0] _GEN_768 = {{2'd0}, sync}; // @[FFT.scala 67:19]
  wire [5:0] start = _GEN_768 * 3'h7; // @[FFT.scala 67:19]
  wire  _GEN_413 = 5'h3 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_7 = _GEN_413 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_414 = 5'h4 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_8 = _GEN_414 ? 3'h4 : _GEN_7; // @[FFT.scala 85:64]
  wire  _GEN_415 = 5'h5 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_9 = _GEN_415 ? 3'h2 : _GEN_8; // @[FFT.scala 85:64]
  wire  _GEN_416 = 5'h6 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_10 = _GEN_416 ? 3'h6 : _GEN_9; // @[FFT.scala 85:64]
  wire  _GEN_417 = 5'h7 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_11 = _GEN_417 ? 3'h4 : _GEN_10; // @[FFT.scala 85:64]
  wire  _GEN_418 = 5'h8 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_12 = _GEN_418 ? 3'h2 : _GEN_11; // @[FFT.scala 85:64]
  wire  _GEN_419 = 5'h9 == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_13 = _GEN_419 ? 3'h1 : _GEN_12; // @[FFT.scala 85:64]
  wire  _GEN_420 = 5'ha == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_14 = _GEN_420 ? 3'h5 : _GEN_13; // @[FFT.scala 85:64]
  wire  _GEN_421 = 5'hb == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_15 = _GEN_421 ? 3'h6 : _GEN_14; // @[FFT.scala 85:64]
  wire  _GEN_422 = 5'hc == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_16 = _GEN_422 ? 3'h3 : _GEN_15; // @[FFT.scala 85:64]
  wire  _GEN_423 = 5'hd == start[4:0]; // @[FFT.scala 85:64]
  wire [2:0] _GEN_17 = _GEN_423 ? 3'h7 : _GEN_16; // @[FFT.scala 85:64]
  wire  _GEN_424 = 2'h1 == _GEN_17[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_20 = _GEN_424 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_21 = _GEN_424 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_426 = 2'h2 == _GEN_17[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_22 = _GEN_426 ? $signed(20'sh2d414) : $signed(_GEN_20); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_23 = _GEN_426 ? $signed(-20'sh2d414) : $signed(_GEN_21); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_428 = 2'h3 == _GEN_17[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_24 = _GEN_428 ? $signed(20'sh187de) : $signed(_GEN_22); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_25 = _GEN_428 ? $signed(-20'sh3b20d) : $signed(_GEN_23); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_790 = 20'sh0 - $signed(_GEN_24); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_0_real = _GEN_17[2] ? $signed(_GEN_25) : $signed(_GEN_24); // @[FFT.scala 90:10]
  wire [19:0] _T_775_imag = _T_790[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_0_imag = _GEN_17[2] ? $signed(_T_775_imag) : $signed(_GEN_25); // @[FFT.scala 90:10]
  wire [5:0] _T_832 = start + 6'h1; // @[FFT.scala 85:55]
  wire  _GEN_464 = 6'h3 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_65 = _GEN_464 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_465 = 6'h4 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_66 = _GEN_465 ? 3'h4 : _GEN_65; // @[FFT.scala 85:64]
  wire  _GEN_466 = 6'h5 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_67 = _GEN_466 ? 3'h2 : _GEN_66; // @[FFT.scala 85:64]
  wire  _GEN_467 = 6'h6 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_68 = _GEN_467 ? 3'h6 : _GEN_67; // @[FFT.scala 85:64]
  wire  _GEN_468 = 6'h7 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_69 = _GEN_468 ? 3'h4 : _GEN_68; // @[FFT.scala 85:64]
  wire  _GEN_469 = 6'h8 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_70 = _GEN_469 ? 3'h2 : _GEN_69; // @[FFT.scala 85:64]
  wire  _GEN_470 = 6'h9 == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_71 = _GEN_470 ? 3'h1 : _GEN_70; // @[FFT.scala 85:64]
  wire  _GEN_471 = 6'ha == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_72 = _GEN_471 ? 3'h5 : _GEN_71; // @[FFT.scala 85:64]
  wire  _GEN_472 = 6'hb == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_73 = _GEN_472 ? 3'h6 : _GEN_72; // @[FFT.scala 85:64]
  wire  _GEN_473 = 6'hc == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_74 = _GEN_473 ? 3'h3 : _GEN_73; // @[FFT.scala 85:64]
  wire  _GEN_474 = 6'hd == _T_832; // @[FFT.scala 85:64]
  wire [2:0] _GEN_75 = _GEN_474 ? 3'h7 : _GEN_74; // @[FFT.scala 85:64]
  wire  _GEN_475 = 2'h1 == _GEN_75[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_78 = _GEN_475 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_79 = _GEN_475 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_477 = 2'h2 == _GEN_75[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_80 = _GEN_477 ? $signed(20'sh2d414) : $signed(_GEN_78); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_81 = _GEN_477 ? $signed(-20'sh2d414) : $signed(_GEN_79); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_479 = 2'h3 == _GEN_75[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_82 = _GEN_479 ? $signed(20'sh187de) : $signed(_GEN_80); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_83 = _GEN_479 ? $signed(-20'sh3b20d) : $signed(_GEN_81); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_844 = 20'sh0 - $signed(_GEN_82); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_1_real = _GEN_75[2] ? $signed(_GEN_83) : $signed(_GEN_82); // @[FFT.scala 90:10]
  wire [19:0] _T_829_imag = _T_844[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_1_imag = _GEN_75[2] ? $signed(_T_829_imag) : $signed(_GEN_83); // @[FFT.scala 90:10]
  wire [5:0] _T_886 = start + 6'h2; // @[FFT.scala 85:55]
  wire  _GEN_515 = 6'h3 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_123 = _GEN_515 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_516 = 6'h4 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_124 = _GEN_516 ? 3'h4 : _GEN_123; // @[FFT.scala 85:64]
  wire  _GEN_517 = 6'h5 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_125 = _GEN_517 ? 3'h2 : _GEN_124; // @[FFT.scala 85:64]
  wire  _GEN_518 = 6'h6 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_126 = _GEN_518 ? 3'h6 : _GEN_125; // @[FFT.scala 85:64]
  wire  _GEN_519 = 6'h7 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_127 = _GEN_519 ? 3'h4 : _GEN_126; // @[FFT.scala 85:64]
  wire  _GEN_520 = 6'h8 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_128 = _GEN_520 ? 3'h2 : _GEN_127; // @[FFT.scala 85:64]
  wire  _GEN_521 = 6'h9 == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_129 = _GEN_521 ? 3'h1 : _GEN_128; // @[FFT.scala 85:64]
  wire  _GEN_522 = 6'ha == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_130 = _GEN_522 ? 3'h5 : _GEN_129; // @[FFT.scala 85:64]
  wire  _GEN_523 = 6'hb == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_131 = _GEN_523 ? 3'h6 : _GEN_130; // @[FFT.scala 85:64]
  wire  _GEN_524 = 6'hc == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_132 = _GEN_524 ? 3'h3 : _GEN_131; // @[FFT.scala 85:64]
  wire  _GEN_525 = 6'hd == _T_886; // @[FFT.scala 85:64]
  wire [2:0] _GEN_133 = _GEN_525 ? 3'h7 : _GEN_132; // @[FFT.scala 85:64]
  wire  _GEN_526 = 2'h1 == _GEN_133[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_136 = _GEN_526 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_137 = _GEN_526 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_528 = 2'h2 == _GEN_133[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_138 = _GEN_528 ? $signed(20'sh2d414) : $signed(_GEN_136); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_139 = _GEN_528 ? $signed(-20'sh2d414) : $signed(_GEN_137); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_530 = 2'h3 == _GEN_133[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_140 = _GEN_530 ? $signed(20'sh187de) : $signed(_GEN_138); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_141 = _GEN_530 ? $signed(-20'sh3b20d) : $signed(_GEN_139); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_898 = 20'sh0 - $signed(_GEN_140); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_2_real = _GEN_133[2] ? $signed(_GEN_141) : $signed(_GEN_140); // @[FFT.scala 90:10]
  wire [19:0] _T_883_imag = _T_898[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_2_imag = _GEN_133[2] ? $signed(_T_883_imag) : $signed(_GEN_141); // @[FFT.scala 90:10]
  wire [5:0] _T_940 = start + 6'h3; // @[FFT.scala 85:55]
  wire  _GEN_566 = 6'h3 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_181 = _GEN_566 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_567 = 6'h4 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_182 = _GEN_567 ? 3'h4 : _GEN_181; // @[FFT.scala 85:64]
  wire  _GEN_568 = 6'h5 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_183 = _GEN_568 ? 3'h2 : _GEN_182; // @[FFT.scala 85:64]
  wire  _GEN_569 = 6'h6 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_184 = _GEN_569 ? 3'h6 : _GEN_183; // @[FFT.scala 85:64]
  wire  _GEN_570 = 6'h7 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_185 = _GEN_570 ? 3'h4 : _GEN_184; // @[FFT.scala 85:64]
  wire  _GEN_571 = 6'h8 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_186 = _GEN_571 ? 3'h2 : _GEN_185; // @[FFT.scala 85:64]
  wire  _GEN_572 = 6'h9 == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_187 = _GEN_572 ? 3'h1 : _GEN_186; // @[FFT.scala 85:64]
  wire  _GEN_573 = 6'ha == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_188 = _GEN_573 ? 3'h5 : _GEN_187; // @[FFT.scala 85:64]
  wire  _GEN_574 = 6'hb == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_189 = _GEN_574 ? 3'h6 : _GEN_188; // @[FFT.scala 85:64]
  wire  _GEN_575 = 6'hc == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_190 = _GEN_575 ? 3'h3 : _GEN_189; // @[FFT.scala 85:64]
  wire  _GEN_576 = 6'hd == _T_940; // @[FFT.scala 85:64]
  wire [2:0] _GEN_191 = _GEN_576 ? 3'h7 : _GEN_190; // @[FFT.scala 85:64]
  wire  _GEN_577 = 2'h1 == _GEN_191[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_194 = _GEN_577 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_195 = _GEN_577 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_579 = 2'h2 == _GEN_191[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_196 = _GEN_579 ? $signed(20'sh2d414) : $signed(_GEN_194); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_197 = _GEN_579 ? $signed(-20'sh2d414) : $signed(_GEN_195); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_581 = 2'h3 == _GEN_191[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_198 = _GEN_581 ? $signed(20'sh187de) : $signed(_GEN_196); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_199 = _GEN_581 ? $signed(-20'sh3b20d) : $signed(_GEN_197); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_952 = 20'sh0 - $signed(_GEN_198); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_3_real = _GEN_191[2] ? $signed(_GEN_199) : $signed(_GEN_198); // @[FFT.scala 90:10]
  wire [19:0] _T_937_imag = _T_952[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_3_imag = _GEN_191[2] ? $signed(_T_937_imag) : $signed(_GEN_199); // @[FFT.scala 90:10]
  wire [5:0] _T_994 = start + 6'h4; // @[FFT.scala 85:55]
  wire  _GEN_617 = 6'h3 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_239 = _GEN_617 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_618 = 6'h4 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_240 = _GEN_618 ? 3'h4 : _GEN_239; // @[FFT.scala 85:64]
  wire  _GEN_619 = 6'h5 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_241 = _GEN_619 ? 3'h2 : _GEN_240; // @[FFT.scala 85:64]
  wire  _GEN_620 = 6'h6 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_242 = _GEN_620 ? 3'h6 : _GEN_241; // @[FFT.scala 85:64]
  wire  _GEN_621 = 6'h7 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_243 = _GEN_621 ? 3'h4 : _GEN_242; // @[FFT.scala 85:64]
  wire  _GEN_622 = 6'h8 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_244 = _GEN_622 ? 3'h2 : _GEN_243; // @[FFT.scala 85:64]
  wire  _GEN_623 = 6'h9 == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_245 = _GEN_623 ? 3'h1 : _GEN_244; // @[FFT.scala 85:64]
  wire  _GEN_624 = 6'ha == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_246 = _GEN_624 ? 3'h5 : _GEN_245; // @[FFT.scala 85:64]
  wire  _GEN_625 = 6'hb == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_247 = _GEN_625 ? 3'h6 : _GEN_246; // @[FFT.scala 85:64]
  wire  _GEN_626 = 6'hc == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_248 = _GEN_626 ? 3'h3 : _GEN_247; // @[FFT.scala 85:64]
  wire  _GEN_627 = 6'hd == _T_994; // @[FFT.scala 85:64]
  wire [2:0] _GEN_249 = _GEN_627 ? 3'h7 : _GEN_248; // @[FFT.scala 85:64]
  wire  _GEN_628 = 2'h1 == _GEN_249[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_252 = _GEN_628 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_253 = _GEN_628 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_630 = 2'h2 == _GEN_249[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_254 = _GEN_630 ? $signed(20'sh2d414) : $signed(_GEN_252); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_255 = _GEN_630 ? $signed(-20'sh2d414) : $signed(_GEN_253); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_632 = 2'h3 == _GEN_249[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_256 = _GEN_632 ? $signed(20'sh187de) : $signed(_GEN_254); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_257 = _GEN_632 ? $signed(-20'sh3b20d) : $signed(_GEN_255); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1006 = 20'sh0 - $signed(_GEN_256); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_4_real = _GEN_249[2] ? $signed(_GEN_257) : $signed(_GEN_256); // @[FFT.scala 90:10]
  wire [19:0] _T_991_imag = _T_1006[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_4_imag = _GEN_249[2] ? $signed(_T_991_imag) : $signed(_GEN_257); // @[FFT.scala 90:10]
  wire [5:0] _T_1048 = start + 6'h5; // @[FFT.scala 85:55]
  wire  _GEN_668 = 6'h3 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_297 = _GEN_668 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_669 = 6'h4 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_298 = _GEN_669 ? 3'h4 : _GEN_297; // @[FFT.scala 85:64]
  wire  _GEN_670 = 6'h5 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_299 = _GEN_670 ? 3'h2 : _GEN_298; // @[FFT.scala 85:64]
  wire  _GEN_671 = 6'h6 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_300 = _GEN_671 ? 3'h6 : _GEN_299; // @[FFT.scala 85:64]
  wire  _GEN_672 = 6'h7 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_301 = _GEN_672 ? 3'h4 : _GEN_300; // @[FFT.scala 85:64]
  wire  _GEN_673 = 6'h8 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_302 = _GEN_673 ? 3'h2 : _GEN_301; // @[FFT.scala 85:64]
  wire  _GEN_674 = 6'h9 == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_303 = _GEN_674 ? 3'h1 : _GEN_302; // @[FFT.scala 85:64]
  wire  _GEN_675 = 6'ha == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_304 = _GEN_675 ? 3'h5 : _GEN_303; // @[FFT.scala 85:64]
  wire  _GEN_676 = 6'hb == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_305 = _GEN_676 ? 3'h6 : _GEN_304; // @[FFT.scala 85:64]
  wire  _GEN_677 = 6'hc == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_306 = _GEN_677 ? 3'h3 : _GEN_305; // @[FFT.scala 85:64]
  wire  _GEN_678 = 6'hd == _T_1048; // @[FFT.scala 85:64]
  wire [2:0] _GEN_307 = _GEN_678 ? 3'h7 : _GEN_306; // @[FFT.scala 85:64]
  wire  _GEN_679 = 2'h1 == _GEN_307[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_310 = _GEN_679 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_311 = _GEN_679 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_681 = 2'h2 == _GEN_307[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_312 = _GEN_681 ? $signed(20'sh2d414) : $signed(_GEN_310); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_313 = _GEN_681 ? $signed(-20'sh2d414) : $signed(_GEN_311); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_683 = 2'h3 == _GEN_307[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_314 = _GEN_683 ? $signed(20'sh187de) : $signed(_GEN_312); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_315 = _GEN_683 ? $signed(-20'sh3b20d) : $signed(_GEN_313); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1060 = 20'sh0 - $signed(_GEN_314); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_5_real = _GEN_307[2] ? $signed(_GEN_315) : $signed(_GEN_314); // @[FFT.scala 90:10]
  wire [19:0] _T_1045_imag = _T_1060[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_5_imag = _GEN_307[2] ? $signed(_T_1045_imag) : $signed(_GEN_315); // @[FFT.scala 90:10]
  wire [5:0] _T_1102 = start + 6'h6; // @[FFT.scala 85:55]
  wire  _GEN_719 = 6'h3 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_355 = _GEN_719 ? 3'h4 : 3'h0; // @[FFT.scala 85:64]
  wire  _GEN_720 = 6'h4 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_356 = _GEN_720 ? 3'h4 : _GEN_355; // @[FFT.scala 85:64]
  wire  _GEN_721 = 6'h5 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_357 = _GEN_721 ? 3'h2 : _GEN_356; // @[FFT.scala 85:64]
  wire  _GEN_722 = 6'h6 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_358 = _GEN_722 ? 3'h6 : _GEN_357; // @[FFT.scala 85:64]
  wire  _GEN_723 = 6'h7 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_359 = _GEN_723 ? 3'h4 : _GEN_358; // @[FFT.scala 85:64]
  wire  _GEN_724 = 6'h8 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_360 = _GEN_724 ? 3'h2 : _GEN_359; // @[FFT.scala 85:64]
  wire  _GEN_725 = 6'h9 == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_361 = _GEN_725 ? 3'h1 : _GEN_360; // @[FFT.scala 85:64]
  wire  _GEN_726 = 6'ha == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_362 = _GEN_726 ? 3'h5 : _GEN_361; // @[FFT.scala 85:64]
  wire  _GEN_727 = 6'hb == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_363 = _GEN_727 ? 3'h6 : _GEN_362; // @[FFT.scala 85:64]
  wire  _GEN_728 = 6'hc == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_364 = _GEN_728 ? 3'h3 : _GEN_363; // @[FFT.scala 85:64]
  wire  _GEN_729 = 6'hd == _T_1102; // @[FFT.scala 85:64]
  wire [2:0] _GEN_365 = _GEN_729 ? 3'h7 : _GEN_364; // @[FFT.scala 85:64]
  wire  _GEN_730 = 2'h1 == _GEN_365[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_368 = _GEN_730 ? $signed(20'sh3b20d) : $signed(20'sh40000); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_369 = _GEN_730 ? $signed(-20'sh187de) : $signed(20'sh0); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_732 = 2'h2 == _GEN_365[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_370 = _GEN_732 ? $signed(20'sh2d414) : $signed(_GEN_368); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_371 = _GEN_732 ? $signed(-20'sh2d414) : $signed(_GEN_369); // @[FixedPointTypeClass.scala 30:22]
  wire  _GEN_734 = 2'h3 == _GEN_365[1:0]; // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_372 = _GEN_734 ? $signed(20'sh187de) : $signed(_GEN_370); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] _GEN_373 = _GEN_734 ? $signed(-20'sh3b20d) : $signed(_GEN_371); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1114 = 20'sh0 - $signed(_GEN_372); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] twiddle_6_real = _GEN_365[2] ? $signed(_GEN_373) : $signed(_GEN_372); // @[FFT.scala 90:10]
  wire [19:0] _T_1099_imag = _T_1114[19:0]; // @[FFT.scala 84:30 FFT.scala 85:23]
  wire [19:0] twiddle_6_imag = _GEN_365[2] ? $signed(_T_1099_imag) : $signed(_GEN_373); // @[FFT.scala 90:10]
  wire [20:0] _T_1279 = $signed(twiddle_0_real) + $signed(twiddle_0_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_4_real = {{3{io_in_bits_4_real[16]}},io_in_bits_4_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [19:0] stage_outputs_0_4_imag = {{3{io_in_bits_4_imag[16]}},io_in_bits_4_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [20:0] _T_1281 = $signed(stage_outputs_0_4_real) + $signed(stage_outputs_0_4_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1283 = $signed(stage_outputs_0_4_imag) - $signed(stage_outputs_0_4_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_776 = {{1{stage_outputs_0_4_real[19]}},stage_outputs_0_4_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1285 = $signed(_GEN_776) * $signed(_T_1279); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1287 = _T_1285[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_777 = {{1{twiddle_0_imag[19]}},twiddle_0_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1288 = $signed(_T_1281) * $signed(_GEN_777); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1290 = _T_1288[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_778 = {{1{twiddle_0_real[19]}},twiddle_0_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1291 = $signed(_T_1283) * $signed(_GEN_778); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1293 = _T_1291[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1294 = $signed(_T_1287) - $signed(_T_1290); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1296 = $signed(_T_1287) + $signed(_T_1293); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_0_real = {{3{io_in_bits_0_real[16]}},io_in_bits_0_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_779 = {$signed(stage_outputs_0_0_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_780 = {{4{_GEN_779[30]}},_GEN_779}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_0 = {{1{_GEN_780[34]}},_GEN_780}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1306 = $signed(_GEN_0) + $signed(_T_1294); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_0_imag = {{3{io_in_bits_0_imag[16]}},io_in_bits_0_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_781 = {$signed(stage_outputs_0_0_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_782 = {{4{_GEN_781[30]}},_GEN_781}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_3 = {{1{_GEN_782[34]}},_GEN_782}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1308 = $signed(_GEN_3) + $signed(_T_1296); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1318 = $signed(_GEN_0) - $signed(_T_1294); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1320 = $signed(_GEN_3) - $signed(_T_1296); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] stage_outputs_0_5_real = {{3{io_in_bits_5_real[16]}},io_in_bits_5_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [19:0] stage_outputs_0_5_imag = {{3{io_in_bits_5_imag[16]}},io_in_bits_5_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [20:0] _T_1338 = $signed(stage_outputs_0_5_real) + $signed(stage_outputs_0_5_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1340 = $signed(stage_outputs_0_5_imag) - $signed(stage_outputs_0_5_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_787 = {{1{stage_outputs_0_5_real[19]}},stage_outputs_0_5_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1342 = $signed(_GEN_787) * $signed(_T_1279); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1344 = _T_1342[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1345 = $signed(_T_1338) * $signed(_GEN_777); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1347 = _T_1345[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1348 = $signed(_T_1340) * $signed(_GEN_778); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1350 = _T_1348[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1351 = $signed(_T_1344) - $signed(_T_1347); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1353 = $signed(_T_1344) + $signed(_T_1350); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_1_real = {{3{io_in_bits_1_real[16]}},io_in_bits_1_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_790 = {$signed(stage_outputs_0_1_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_791 = {{4{_GEN_790[30]}},_GEN_790}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_6 = {{1{_GEN_791[34]}},_GEN_791}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1363 = $signed(_GEN_6) + $signed(_T_1351); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_1_imag = {{3{io_in_bits_1_imag[16]}},io_in_bits_1_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_792 = {$signed(stage_outputs_0_1_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_793 = {{4{_GEN_792[30]}},_GEN_792}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_18 = {{1{_GEN_793[34]}},_GEN_793}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1365 = $signed(_GEN_18) + $signed(_T_1353); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1375 = $signed(_GEN_6) - $signed(_T_1351); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1377 = $signed(_GEN_18) - $signed(_T_1353); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] stage_outputs_0_6_real = {{3{io_in_bits_6_real[16]}},io_in_bits_6_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [19:0] stage_outputs_0_6_imag = {{3{io_in_bits_6_imag[16]}},io_in_bits_6_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [20:0] _T_1395 = $signed(stage_outputs_0_6_real) + $signed(stage_outputs_0_6_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1397 = $signed(stage_outputs_0_6_imag) - $signed(stage_outputs_0_6_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_798 = {{1{stage_outputs_0_6_real[19]}},stage_outputs_0_6_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1399 = $signed(_GEN_798) * $signed(_T_1279); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1401 = _T_1399[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1402 = $signed(_T_1395) * $signed(_GEN_777); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1404 = _T_1402[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1405 = $signed(_T_1397) * $signed(_GEN_778); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1407 = _T_1405[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1408 = $signed(_T_1401) - $signed(_T_1404); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1410 = $signed(_T_1401) + $signed(_T_1407); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_2_real = {{3{io_in_bits_2_real[16]}},io_in_bits_2_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_801 = {$signed(stage_outputs_0_2_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_802 = {{4{_GEN_801[30]}},_GEN_801}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_27 = {{1{_GEN_802[34]}},_GEN_802}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1420 = $signed(_GEN_27) + $signed(_T_1408); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_2_imag = {{3{io_in_bits_2_imag[16]}},io_in_bits_2_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_803 = {$signed(stage_outputs_0_2_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_804 = {{4{_GEN_803[30]}},_GEN_803}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_28 = {{1{_GEN_804[34]}},_GEN_804}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1422 = $signed(_GEN_28) + $signed(_T_1410); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1432 = $signed(_GEN_27) - $signed(_T_1408); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1434 = $signed(_GEN_28) - $signed(_T_1410); // @[FixedPointTypeClass.scala 30:22]
  wire [19:0] stage_outputs_0_7_real = {{3{io_in_bits_7_real[16]}},io_in_bits_7_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [19:0] stage_outputs_0_7_imag = {{3{io_in_bits_7_imag[16]}},io_in_bits_7_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [20:0] _T_1452 = $signed(stage_outputs_0_7_real) + $signed(stage_outputs_0_7_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1454 = $signed(stage_outputs_0_7_imag) - $signed(stage_outputs_0_7_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_809 = {{1{stage_outputs_0_7_real[19]}},stage_outputs_0_7_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1456 = $signed(_GEN_809) * $signed(_T_1279); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1458 = _T_1456[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1459 = $signed(_T_1452) * $signed(_GEN_777); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1461 = _T_1459[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1462 = $signed(_T_1454) * $signed(_GEN_778); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1464 = _T_1462[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1465 = $signed(_T_1458) - $signed(_T_1461); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1467 = $signed(_T_1458) + $signed(_T_1464); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_3_real = {{3{io_in_bits_3_real[16]}},io_in_bits_3_real}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_812 = {$signed(stage_outputs_0_3_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_813 = {{4{_GEN_812[30]}},_GEN_812}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_31 = {{1{_GEN_813[34]}},_GEN_813}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1477 = $signed(_GEN_31) + $signed(_T_1465); // @[FixedPointTypeClass.scala 22:22]
  wire [19:0] stage_outputs_0_3_imag = {{3{io_in_bits_3_imag[16]}},io_in_bits_3_imag}; // @[FFT.scala 99:75 FFT.scala 100:67]
  wire [30:0] _GEN_814 = {$signed(stage_outputs_0_3_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_815 = {{4{_GEN_814[30]}},_GEN_814}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_32 = {{1{_GEN_815[34]}},_GEN_815}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1479 = $signed(_GEN_32) + $signed(_T_1467); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1489 = $signed(_GEN_31) - $signed(_T_1465); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1491 = $signed(_GEN_32) - $signed(_T_1467); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1507 = $signed(twiddle_1_real) + $signed(twiddle_1_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_820 = _T_1420[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_2_real = _GEN_820[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_822 = _T_1422[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_2_imag = _GEN_822[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1509 = $signed(stage_outputs_1_2_real) + $signed(stage_outputs_1_2_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1511 = $signed(stage_outputs_1_2_imag) - $signed(stage_outputs_1_2_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_824 = {{1{stage_outputs_1_2_real[19]}},stage_outputs_1_2_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1513 = $signed(_GEN_824) * $signed(_T_1507); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1515 = _T_1513[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_825 = {{1{twiddle_1_imag[19]}},twiddle_1_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1516 = $signed(_T_1509) * $signed(_GEN_825); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1518 = _T_1516[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_826 = {{1{twiddle_1_real[19]}},twiddle_1_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1519 = $signed(_T_1511) * $signed(_GEN_826); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1521 = _T_1519[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1522 = $signed(_T_1515) - $signed(_T_1518); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1524 = $signed(_T_1515) + $signed(_T_1521); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_827 = _T_1306[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_0_real = _GEN_827[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_829 = {$signed(stage_outputs_1_0_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_830 = {{4{_GEN_829[30]}},_GEN_829}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_35 = {{1{_GEN_830[34]}},_GEN_830}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1534 = $signed(_GEN_35) + $signed(_T_1522); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_831 = _T_1308[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_0_imag = _GEN_831[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_833 = {$signed(stage_outputs_1_0_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_834 = {{4{_GEN_833[30]}},_GEN_833}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_36 = {{1{_GEN_834[34]}},_GEN_834}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1536 = $signed(_GEN_36) + $signed(_T_1524); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1546 = $signed(_GEN_35) - $signed(_T_1522); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1548 = $signed(_GEN_36) - $signed(_T_1524); // @[FixedPointTypeClass.scala 30:22]
  wire [25:0] _GEN_839 = _T_1477[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_3_real = _GEN_839[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_841 = _T_1479[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_3_imag = _GEN_841[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1566 = $signed(stage_outputs_1_3_real) + $signed(stage_outputs_1_3_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1568 = $signed(stage_outputs_1_3_imag) - $signed(stage_outputs_1_3_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_843 = {{1{stage_outputs_1_3_real[19]}},stage_outputs_1_3_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1570 = $signed(_GEN_843) * $signed(_T_1507); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1572 = _T_1570[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1573 = $signed(_T_1566) * $signed(_GEN_825); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1575 = _T_1573[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1576 = $signed(_T_1568) * $signed(_GEN_826); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1578 = _T_1576[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1579 = $signed(_T_1572) - $signed(_T_1575); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1581 = $signed(_T_1572) + $signed(_T_1578); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_846 = _T_1363[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_1_real = _GEN_846[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_848 = {$signed(stage_outputs_1_1_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_849 = {{4{_GEN_848[30]}},_GEN_848}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_39 = {{1{_GEN_849[34]}},_GEN_849}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1591 = $signed(_GEN_39) + $signed(_T_1579); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_850 = _T_1365[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_1_imag = _GEN_850[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_852 = {$signed(stage_outputs_1_1_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_853 = {{4{_GEN_852[30]}},_GEN_852}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_40 = {{1{_GEN_853[34]}},_GEN_853}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1593 = $signed(_GEN_40) + $signed(_T_1581); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1603 = $signed(_GEN_39) - $signed(_T_1579); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1605 = $signed(_GEN_40) - $signed(_T_1581); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1621 = $signed(twiddle_4_real) + $signed(twiddle_4_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_858 = _T_1432[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_6_real = _GEN_858[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_860 = _T_1434[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_6_imag = _GEN_860[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1623 = $signed(stage_outputs_1_6_real) + $signed(stage_outputs_1_6_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1625 = $signed(stage_outputs_1_6_imag) - $signed(stage_outputs_1_6_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_862 = {{1{stage_outputs_1_6_real[19]}},stage_outputs_1_6_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1627 = $signed(_GEN_862) * $signed(_T_1621); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1629 = _T_1627[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_863 = {{1{twiddle_4_imag[19]}},twiddle_4_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1630 = $signed(_T_1623) * $signed(_GEN_863); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1632 = _T_1630[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_864 = {{1{twiddle_4_real[19]}},twiddle_4_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1633 = $signed(_T_1625) * $signed(_GEN_864); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1635 = _T_1633[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1636 = $signed(_T_1629) - $signed(_T_1632); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1638 = $signed(_T_1629) + $signed(_T_1635); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_865 = _T_1318[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_4_real = _GEN_865[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_867 = {$signed(stage_outputs_1_4_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_868 = {{4{_GEN_867[30]}},_GEN_867}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_43 = {{1{_GEN_868[34]}},_GEN_868}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1648 = $signed(_GEN_43) + $signed(_T_1636); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_869 = _T_1320[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_4_imag = _GEN_869[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_871 = {$signed(stage_outputs_1_4_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_872 = {{4{_GEN_871[30]}},_GEN_871}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_44 = {{1{_GEN_872[34]}},_GEN_872}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1650 = $signed(_GEN_44) + $signed(_T_1638); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1660 = $signed(_GEN_43) - $signed(_T_1636); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1662 = $signed(_GEN_44) - $signed(_T_1638); // @[FixedPointTypeClass.scala 30:22]
  wire [25:0] _GEN_877 = _T_1489[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_7_real = _GEN_877[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_879 = _T_1491[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_7_imag = _GEN_879[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1680 = $signed(stage_outputs_1_7_real) + $signed(stage_outputs_1_7_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1682 = $signed(stage_outputs_1_7_imag) - $signed(stage_outputs_1_7_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_881 = {{1{stage_outputs_1_7_real[19]}},stage_outputs_1_7_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1684 = $signed(_GEN_881) * $signed(_T_1621); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1686 = _T_1684[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1687 = $signed(_T_1680) * $signed(_GEN_863); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1689 = _T_1687[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [41:0] _T_1690 = $signed(_T_1682) * $signed(_GEN_864); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1692 = _T_1690[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1693 = $signed(_T_1686) - $signed(_T_1689); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1695 = $signed(_T_1686) + $signed(_T_1692); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_884 = _T_1375[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_5_real = _GEN_884[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_886 = {$signed(stage_outputs_1_5_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_887 = {{4{_GEN_886[30]}},_GEN_886}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_47 = {{1{_GEN_887[34]}},_GEN_887}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1705 = $signed(_GEN_47) + $signed(_T_1693); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_888 = _T_1377[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_1_5_imag = _GEN_888[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_890 = {$signed(stage_outputs_1_5_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_891 = {{4{_GEN_890[30]}},_GEN_890}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_48 = {{1{_GEN_891[34]}},_GEN_891}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1707 = $signed(_GEN_48) + $signed(_T_1695); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1717 = $signed(_GEN_47) - $signed(_T_1693); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1719 = $signed(_GEN_48) - $signed(_T_1695); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1735 = $signed(twiddle_2_real) + $signed(twiddle_2_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_896 = _T_1591[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_1_real = _GEN_896[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_898 = _T_1593[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_1_imag = _GEN_898[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1737 = $signed(stage_outputs_2_1_real) + $signed(stage_outputs_2_1_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1739 = $signed(stage_outputs_2_1_imag) - $signed(stage_outputs_2_1_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_900 = {{1{stage_outputs_2_1_real[19]}},stage_outputs_2_1_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1741 = $signed(_GEN_900) * $signed(_T_1735); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1743 = _T_1741[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_901 = {{1{twiddle_2_imag[19]}},twiddle_2_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1744 = $signed(_T_1737) * $signed(_GEN_901); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1746 = _T_1744[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_902 = {{1{twiddle_2_real[19]}},twiddle_2_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1747 = $signed(_T_1739) * $signed(_GEN_902); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1749 = _T_1747[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1750 = $signed(_T_1743) - $signed(_T_1746); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1752 = $signed(_T_1743) + $signed(_T_1749); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_903 = _T_1534[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_0_real = _GEN_903[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_905 = {$signed(stage_outputs_2_0_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_906 = {{4{_GEN_905[30]}},_GEN_905}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_51 = {{1{_GEN_906[34]}},_GEN_906}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1762 = $signed(_GEN_51) + $signed(_T_1750); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_907 = _T_1536[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_0_imag = _GEN_907[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_909 = {$signed(stage_outputs_2_0_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_910 = {{4{_GEN_909[30]}},_GEN_909}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_52 = {{1{_GEN_910[34]}},_GEN_910}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1764 = $signed(_GEN_52) + $signed(_T_1752); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1774 = $signed(_GEN_51) - $signed(_T_1750); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1776 = $signed(_GEN_52) - $signed(_T_1752); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1792 = $signed(twiddle_3_real) + $signed(twiddle_3_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_915 = _T_1603[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_3_real = _GEN_915[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_917 = _T_1605[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_3_imag = _GEN_917[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1794 = $signed(stage_outputs_2_3_real) + $signed(stage_outputs_2_3_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1796 = $signed(stage_outputs_2_3_imag) - $signed(stage_outputs_2_3_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_919 = {{1{stage_outputs_2_3_real[19]}},stage_outputs_2_3_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1798 = $signed(_GEN_919) * $signed(_T_1792); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1800 = _T_1798[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_920 = {{1{twiddle_3_imag[19]}},twiddle_3_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1801 = $signed(_T_1794) * $signed(_GEN_920); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1803 = _T_1801[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_921 = {{1{twiddle_3_real[19]}},twiddle_3_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1804 = $signed(_T_1796) * $signed(_GEN_921); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1806 = _T_1804[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1807 = $signed(_T_1800) - $signed(_T_1803); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1809 = $signed(_T_1800) + $signed(_T_1806); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_922 = _T_1546[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_2_real = _GEN_922[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_924 = {$signed(stage_outputs_2_2_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_925 = {{4{_GEN_924[30]}},_GEN_924}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_55 = {{1{_GEN_925[34]}},_GEN_925}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1819 = $signed(_GEN_55) + $signed(_T_1807); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_926 = _T_1548[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_2_imag = _GEN_926[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_928 = {$signed(stage_outputs_2_2_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_929 = {{4{_GEN_928[30]}},_GEN_928}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_56 = {{1{_GEN_929[34]}},_GEN_929}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1821 = $signed(_GEN_56) + $signed(_T_1809); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1831 = $signed(_GEN_55) - $signed(_T_1807); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1833 = $signed(_GEN_56) - $signed(_T_1809); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1849 = $signed(twiddle_5_real) + $signed(twiddle_5_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_934 = _T_1705[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_5_real = _GEN_934[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_936 = _T_1707[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_5_imag = _GEN_936[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1851 = $signed(stage_outputs_2_5_real) + $signed(stage_outputs_2_5_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1853 = $signed(stage_outputs_2_5_imag) - $signed(stage_outputs_2_5_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_938 = {{1{stage_outputs_2_5_real[19]}},stage_outputs_2_5_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1855 = $signed(_GEN_938) * $signed(_T_1849); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1857 = _T_1855[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_939 = {{1{twiddle_5_imag[19]}},twiddle_5_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1858 = $signed(_T_1851) * $signed(_GEN_939); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1860 = _T_1858[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_940 = {{1{twiddle_5_real[19]}},twiddle_5_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1861 = $signed(_T_1853) * $signed(_GEN_940); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1863 = _T_1861[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1864 = $signed(_T_1857) - $signed(_T_1860); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1866 = $signed(_T_1857) + $signed(_T_1863); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_941 = _T_1648[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_4_real = _GEN_941[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_943 = {$signed(stage_outputs_2_4_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_944 = {{4{_GEN_943[30]}},_GEN_943}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_59 = {{1{_GEN_944[34]}},_GEN_944}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1876 = $signed(_GEN_59) + $signed(_T_1864); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_945 = _T_1650[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_4_imag = _GEN_945[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_947 = {$signed(stage_outputs_2_4_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_948 = {{4{_GEN_947[30]}},_GEN_947}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_60 = {{1{_GEN_948[34]}},_GEN_948}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1878 = $signed(_GEN_60) + $signed(_T_1866); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1888 = $signed(_GEN_59) - $signed(_T_1864); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1890 = $signed(_GEN_60) - $signed(_T_1866); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _T_1906 = $signed(twiddle_6_real) + $signed(twiddle_6_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_953 = _T_1717[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_7_real = _GEN_953[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_955 = _T_1719[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_7_imag = _GEN_955[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [20:0] _T_1908 = $signed(stage_outputs_2_7_real) + $signed(stage_outputs_2_7_imag); // @[FixedPointTypeClass.scala 22:22]
  wire [20:0] _T_1910 = $signed(stage_outputs_2_7_imag) - $signed(stage_outputs_2_7_real); // @[FixedPointTypeClass.scala 30:22]
  wire [20:0] _GEN_957 = {{1{stage_outputs_2_7_real[19]}},stage_outputs_2_7_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1912 = $signed(_GEN_957) * $signed(_T_1906); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1914 = _T_1912[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_958 = {{1{twiddle_6_imag[19]}},twiddle_6_imag}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1915 = $signed(_T_1908) * $signed(_GEN_958); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1917 = _T_1915[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [20:0] _GEN_959 = {{1{twiddle_6_real[19]}},twiddle_6_real}; // @[FixedPointTypeClass.scala 155:35]
  wire [41:0] _T_1918 = $signed(_T_1910) * $signed(_GEN_959); // @[FixedPointTypeClass.scala 155:35]
  wire [34:0] _T_1920 = _T_1918[41:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1921 = $signed(_T_1914) - $signed(_T_1917); // @[FixedPointTypeClass.scala 30:22]
  wire [35:0] _T_1923 = $signed(_T_1914) + $signed(_T_1920); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_960 = _T_1660[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_6_real = _GEN_960[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_962 = {$signed(stage_outputs_2_6_real), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_963 = {{4{_GEN_962[30]}},_GEN_962}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_63 = {{1{_GEN_963[34]}},_GEN_963}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1933 = $signed(_GEN_63) + $signed(_T_1921); // @[FixedPointTypeClass.scala 22:22]
  wire [25:0] _GEN_964 = _T_1662[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_2_6_imag = _GEN_964[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [30:0] _GEN_966 = {$signed(stage_outputs_2_6_imag), 11'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [34:0] _GEN_967 = {{4{_GEN_966[30]}},_GEN_966}; // @[FixedPointTypeClass.scala 22:22]
  wire [35:0] _GEN_64 = {{1{_GEN_967[34]}},_GEN_967}; // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1935 = $signed(_GEN_64) + $signed(_T_1923); // @[FixedPointTypeClass.scala 22:22]
  wire [36:0] _T_1945 = $signed(_GEN_63) - $signed(_T_1921); // @[FixedPointTypeClass.scala 30:22]
  wire [36:0] _T_1947 = $signed(_GEN_64) - $signed(_T_1923); // @[FixedPointTypeClass.scala 30:22]
  wire [25:0] _GEN_972 = _T_1762[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_0_real = _GEN_972[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_974 = _T_1764[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_0_imag = _GEN_974[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_976 = _T_1774[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_1_real = _GEN_976[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_978 = _T_1776[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_1_imag = _GEN_978[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_980 = _T_1819[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_2_real = _GEN_980[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_982 = _T_1821[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_2_imag = _GEN_982[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_984 = _T_1831[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_3_real = _GEN_984[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_986 = _T_1833[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_3_imag = _GEN_986[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_988 = _T_1876[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_4_real = _GEN_988[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_990 = _T_1878[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_4_imag = _GEN_990[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_992 = _T_1888[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_5_real = _GEN_992[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_994 = _T_1890[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_5_imag = _GEN_994[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_996 = _T_1933[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_6_real = _GEN_996[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_998 = _T_1935[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_6_imag = _GEN_998[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_1000 = _T_1945[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_7_real = _GEN_1000[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [25:0] _GEN_1002 = _T_1947[36:11]; // @[FFT.scala 99:75 FFT.scala 124:14]
  wire [19:0] stage_outputs_3_7_imag = _GEN_1002[19:0]; // @[FFT.scala 99:75 FFT.scala 124:14]
  assign io_out_valid = io_in_valid; // @[FFT.scala 46:16]
  assign io_out_bits_0_real = stage_outputs_3_0_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_0_imag = stage_outputs_3_0_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_1_real = stage_outputs_3_1_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_1_imag = stage_outputs_3_1_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_2_real = stage_outputs_3_2_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_2_imag = stage_outputs_3_2_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_3_real = stage_outputs_3_3_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_3_imag = stage_outputs_3_3_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_4_real = stage_outputs_3_4_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_4_imag = stage_outputs_3_4_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_5_real = stage_outputs_3_5_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_5_imag = stage_outputs_3_5_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_6_real = stage_outputs_3_6_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_6_imag = stage_outputs_3_6_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_7_real = stage_outputs_3_7_real[15:0]; // @[FFT.scala 132:15]
  assign io_out_bits_7_imag = stage_outputs_3_7_imag[15:0]; // @[FFT.scala 132:15]
  assign io_out_sync = io_in_valid & sync; // @[FFT.scala 45:15]
  assign _GEN_161_0 = 6'h9 == _T_994;
  assign _GEN_104_0 = 6'h7 == _T_886;
  assign _GEN_54_0 = 2'h3 == _GEN_17[1:0];
  assign _GEN_176_0 = 6'h5 == _T_1048;
  assign _GEN_220_0 = 6'hd == _T_1102;
  assign _GEN_92_0 = 2'h1 == _GEN_75[1:0];
  assign _GEN_214_0 = 6'h7 == _T_1102;
  assign _GEN_193_0 = 6'hb == _T_1048;
  assign _GEN_98_0 = _GEN_75[2];
  assign _GEN_142_0 = 6'h9 == _T_940;
  assign _GEN_77_0 = 6'h5 == _T_832;
  assign _GEN_119_0 = 6'h3 == _T_940;
  assign _GEN_179_0 = 6'h8 == _T_1048;
  assign _GEN_170_0 = 2'h3 == _GEN_249[1:0];
  assign _GEN_61_0 = _GEN_17[2];
  assign _GEN_107_0 = 6'ha == _T_886;
  assign _GEN_30_0 = 5'h6 == start[4:0];
  assign _GEN_202_0 = 2'h1 == _GEN_307[1:0];
  assign _GEN_101_0 = 6'h4 == _T_886;
  assign _GEN_86_0 = 6'h8 == _T_832;
  assign _GEN_208_0 = _GEN_307[2];
  assign _GEN_164_0 = 6'hc == _T_994;
  assign _GEN_173_0 = _GEN_249[2];
  assign _GEN_89_0 = 6'hb == _T_832;
  assign _GEN_49_0 = 2'h1 == _GEN_17[1:0];
  assign _GEN_37_0 = 5'h9 == start[4:0];
  assign _GEN_19_0 = 5'h3 == start[4:0];
  assign _GEN_167_0 = 2'h1 == _GEN_249[1:0];
  assign _GEN_42_0 = 5'hc == start[4:0];
  assign _GEN_156_0 = 6'h4 == _T_994;
  assign _GEN_135_0 = 6'h8 == _T_940;
  assign _GEN_228_0 = _GEN_365[2];
  assign _GEN_222_0 = 2'h1 == _GEN_365[1:0];
  assign _GEN_106_0 = 6'h9 == _T_886;
  assign _GEN_121_0 = 6'h5 == _T_940;
  assign _GEN_144_0 = 6'hb == _T_940;
  assign _GEN_159_0 = 6'h7 == _T_994;
  assign _GEN_216_0 = 6'h9 == _T_1102;
  assign _GEN_207_0 = 2'h3 == _GEN_307[1:0];
  assign _GEN_150_0 = 2'h2 == _GEN_191[1:0];
  assign _GEN_109_0 = 6'hc == _T_886;
  assign _GEN_204_0 = 2'h2 == _GEN_307[1:0];
  assign _GEN_210_0 = 6'h3 == _T_1102;
  assign _GEN_172_0 = _GEN_249[2];
  assign _GEN_115_0 = 2'h3 == _GEN_133[1:0];
  assign _GEN_147_0 = 2'h1 == _GEN_191[1:0];
  assign _GEN_153_0 = _GEN_191[2];
  assign _GEN_88_0 = 6'ha == _T_832;
  assign _GEN_94_0 = 2'h2 == _GEN_75[1:0];
  assign _GEN_225_0 = 2'h3 == _GEN_365[1:0];
  assign _GEN_175_0 = 6'h4 == _T_1048;
  assign _GEN_41_1 = 5'hb == start[4:0];
  assign _GEN_97_0 = 2'h3 == _GEN_75[1:0];
  assign _GEN_103_0 = 6'h6 == _T_886;
  assign _GEN_91_0 = 6'hd == _T_832;
  assign _GEN_118_0 = _GEN_133[2];
  assign _GEN_53_0 = 2'h2 == _GEN_17[1:0];
  assign _GEN_192_0 = 6'ha == _T_1048;
  assign _GEN_219_0 = 6'hc == _T_1102;
  assign _GEN_213_0 = 6'h6 == _T_1102;
  assign _GEN_160_0 = 6'h8 == _T_994;
  assign _GEN_169_0 = 2'h2 == _GEN_249[1:0];
  assign _GEN_112_0 = 2'h1 == _GEN_133[1:0];
  assign _GEN_29_0 = 5'h5 == start[4:0];
  assign _GEN_163_0 = 6'hb == _T_994;
  assign _GEN_201_0 = 6'hd == _T_1048;
  assign _GEN_58_0 = _GEN_17[2];
  assign _GEN_85_0 = 6'h7 == _T_832;
  assign _GEN_100_0 = 6'h3 == _T_886;
  assign _GEN_178_0 = 6'h7 == _T_1048;
  assign _GEN_76_0 = 6'h4 == _T_832;
  assign _GEN_46_0 = 2'h1 == _GEN_17[1:0];
  assign _GEN_34_0 = 5'h8 == start[4:0];
  assign _GEN_152_0 = 2'h3 == _GEN_191[1:0];
  assign _GEN_166_0 = 2'h1 == _GEN_249[1:0];
  assign _GEN_5_2 = _T_553 & io_in_valid;
  assign _GEN_146_0 = 6'hd == _T_940;
  assign _GEN_218_0 = 6'hb == _T_1102;
  assign _GEN_111_0 = 2'h1 == _GEN_133[1:0];
  assign _GEN_117_0 = _GEN_133[2];
  assign _GEN_155_0 = 6'h3 == _T_994;
  assign _GEN_149_0 = 2'h2 == _GEN_191[1:0];
  assign _GEN_134_0 = 6'h7 == _T_940;
  assign _GEN_212_0 = 6'h5 == _T_1102;
  assign _GEN_200_0 = 6'hc == _T_1048;
  assign _GEN_227_0 = _GEN_365[2];
  assign _GEN_177_0 = 6'h6 == _T_1048;
  assign _GEN_120_0 = 6'h4 == _T_940;
  assign _GEN_143_0 = 6'ha == _T_940;
  assign _GEN_215_0 = 6'h8 == _T_1102;
  assign _GEN_158_0 = 6'h6 == _T_994;
  assign _GEN_99_0 = _GEN_75[2];
  assign _GEN_105_0 = 6'h8 == _T_886;
  assign _GEN_221_0 = 2'h1 == _GEN_365[1:0];
  assign _GEN_62_0 = 6'h3 == _T_832;
  assign _GEN_93_0 = 2'h1 == _GEN_75[1:0];
  assign _GEN_108_0 = 6'hb == _T_886;
  assign _GEN_171_0 = 2'h3 == _GEN_249[1:0];
  assign _GEN_114_0 = 2'h2 == _GEN_133[1:0];
  assign _GEN_87_0 = 6'h9 == _T_832;
  assign _GEN_209_0 = _GEN_307[2];
  assign _GEN_203_0 = 2'h1 == _GEN_307[1:0];
  assign _GEN_102_0 = 6'h5 == _T_886;
  assign _GEN_224_0 = 2'h2 == _GEN_365[1:0];
  assign _GEN_165_0 = 6'hd == _T_994;
  assign _GEN_38_0 = 5'ha == start[4:0];
  assign _GEN_174_0 = 6'h3 == _T_1048;
  assign _GEN_50_0 = 2'h2 == _GEN_17[1:0];
  assign _GEN_206_0 = 2'h3 == _GEN_307[1:0];
  assign _GEN_96_0 = 2'h3 == _GEN_75[1:0];
  assign _GEN_168_0 = 2'h2 == _GEN_249[1:0];
  assign _GEN_90_0 = 6'hc == _T_832;
  assign _GEN_180_0 = 6'h9 == _T_1048;
  assign _GEN_57_0 = 2'h3 == _GEN_17[1:0];
  assign _GEN_84_0 = 6'h6 == _T_832;
  assign _GEN_45_0 = 5'hd == start[4:0];
  assign _GEN_157_0 = 6'h5 == _T_994;
  assign _GEN_26_0 = 5'h4 == start[4:0];
  assign _GEN_162_0 = 6'ha == _T_994;
  assign _GEN_33_1 = 5'h7 == start[4:0];
  assign _GEN_4_1 = io_in_sync;
  assign _GEN_151_0 = 2'h3 == _GEN_191[1:0];
  assign _GEN_122_0 = 6'h6 == _T_940;
  assign _GEN_113_0 = 2'h2 == _GEN_133[1:0];
  assign _GEN_229_0 = reset;
  assign _GEN_223_0 = 2'h2 == _GEN_365[1:0];
  assign _GEN_145_0 = 6'hc == _T_940;
  assign _GEN_95_0 = 2'h2 == _GEN_75[1:0];
  assign _GEN_217_0 = 6'ha == _T_1102;
  assign _GEN_211_0 = 6'h4 == _T_1102;
  assign _GEN_205_0 = 2'h2 == _GEN_307[1:0];
  assign _GEN_148_0 = 2'h1 == _GEN_191[1:0];
  assign _GEN_116_0 = 2'h3 == _GEN_133[1:0];
  assign _GEN_110_0 = 6'hd == _T_886;
  assign _GEN_226_0 = 2'h3 == _GEN_365[1:0];
  assign _GEN_154_0 = _GEN_191[2];
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
  valid_delay = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      valid_delay <= 1'h0;
    end else begin
      valid_delay <= io_in_valid;
    end
    if (metaReset) begin
      value <= 1'h0;
    end else if (reset) begin
      value <= 1'h0;
    end else begin
      value <= _GEN_2;
    end
  end
endmodule
module BiplexFFT(
  input         metaReset,
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [15:0] io_in_bits_0_real,
  input  [15:0] io_in_bits_0_imag,
  input  [15:0] io_in_bits_1_real,
  input  [15:0] io_in_bits_1_imag,
  input  [15:0] io_in_bits_2_real,
  input  [15:0] io_in_bits_2_imag,
  input  [15:0] io_in_bits_3_real,
  input  [15:0] io_in_bits_3_imag,
  input  [15:0] io_in_bits_4_real,
  input  [15:0] io_in_bits_4_imag,
  input  [15:0] io_in_bits_5_real,
  input  [15:0] io_in_bits_5_imag,
  input  [15:0] io_in_bits_6_real,
  input  [15:0] io_in_bits_6_imag,
  input  [15:0] io_in_bits_7_real,
  input  [15:0] io_in_bits_7_imag,
  input         io_in_sync,
  output        io_out_valid,
  output [16:0] io_out_bits_0_real,
  output [16:0] io_out_bits_0_imag,
  output [16:0] io_out_bits_1_real,
  output [16:0] io_out_bits_1_imag,
  output [16:0] io_out_bits_2_real,
  output [16:0] io_out_bits_2_imag,
  output [16:0] io_out_bits_3_real,
  output [16:0] io_out_bits_3_imag,
  output [16:0] io_out_bits_4_real,
  output [16:0] io_out_bits_4_imag,
  output [16:0] io_out_bits_5_real,
  output [16:0] io_out_bits_5_imag,
  output [16:0] io_out_bits_6_real,
  output [16:0] io_out_bits_6_imag,
  output [16:0] io_out_bits_7_real,
  output [16:0] io_out_bits_7_imag,
  output        io_out_sync,
  output        _GEN_13_0,
  output        _GEN_52_0,
  output        _GEN_28_0,
  output        _GEN_44_0,
  output        _GEN_36_0,
  output        _GEN_12_0,
  output        _GEN_20_0,
  output        _GEN_55_0,
  output        _GEN_49_1,
  output        _GEN_41_0,
  output        _GEN_25_0,
  output        _GEN_33_0,
  output        _GEN_5_0,
  output        _GEN_17_1,
  output        _GEN_51_0,
  output        _GEN_32_0,
  output        _GEN_43_0,
  output        _GEN_4_0,
  output        _GEN_35_0,
  output        _GEN_27_0,
  output        _GEN_54_1,
  output        _GEN_48_0,
  output        _GEN_9_1,
  output        _GEN_19_1,
  output        _GEN_40_0,
  output        _GEN_24_0,
  output        _GEN_16_1,
  output        _GEN_47_0,
  output        _GEN_50_1,
  output        _GEN_31_0,
  output        _GEN_42_1,
  output        _GEN_23_0,
  output        _GEN_26_1,
  output        _GEN_53_1,
  output        _GEN_34_1,
  output        _GEN_39_0,
  output        _GEN_18_0,
  output        _GEN_8_1
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
`endif // RANDOMIZE_REG_INIT
  reg  valid_delay; // @[FFT.scala 154:24]
  wire  _T_555 = ~valid_delay; // @[FFT.scala 155:62]
  wire  _T_556 = _T_555 & io_in_valid; // @[FFT.scala 155:75]
  reg  value; // @[Counter.scala 17:33]
  wire  _T_563 = value + 1'h1; // @[Counter.scala 26:22]
  wire  _GEN_1 = io_in_sync ? 1'h0 : _T_563; // @[CounterWithReset.scala 13:25]
  wire  _GEN_2 = _T_556 | _GEN_1; // @[CounterWithReset.scala 14:25]
  wire  sync_0 = _T_556 ? 1'h0 : value; // @[CounterWithReset.scala 14:25]
  reg  sync_1; // @[Reg.scala 22:20]
  reg  _T_579; // @[Reg.scala 22:20]
  reg  _T_581; // @[Reg.scala 22:20]
  reg [16:0] _T_776_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_776_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [1:0] _T_807 = {{1'd0}, sync_0}; // @[FFTUtilities.scala 27:20]
  wire  _T_818 = sync_0 + 1'h1; // @[FFTUtilities.scala 27:20]
  wire [16:0] stage_outputs_0_0_real = {{1{io_in_bits_0_real[15]}},io_in_bits_0_real}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] stage_outputs_0_0_imag = {{1{io_in_bits_0_imag[15]}},io_in_bits_0_imag}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] _GEN_21 = _T_818 ? $signed(_T_776_real) : $signed(stage_outputs_0_0_real); // @[FFTUtilities.scala 25:8]
  wire [16:0] _GEN_22 = _T_818 ? $signed(_T_776_imag) : $signed(stage_outputs_0_0_imag); // @[FFTUtilities.scala 25:8]
  reg [16:0] _T_855_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_855_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [17:0] _T_861 = $signed(_GEN_21) + $signed(_GEN_22); // @[FixedPointTypeClass.scala 22:22]
  wire [17:0] _T_863 = $signed(_GEN_22) - $signed(_GEN_21); // @[FixedPointTypeClass.scala 30:22]
  wire [17:0] _GEN_121 = {{1{_GEN_21[16]}},_GEN_21}; // @[FixedPointTypeClass.scala 155:35]
  wire [35:0] _T_865 = $signed(_GEN_121) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_867 = _T_865[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_868 = $signed(_T_861) * 18'sh0; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_870 = _T_868[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_871 = $signed(_T_863) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_873 = _T_871[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [29:0] _T_874 = $signed(_T_867) - $signed(_T_870); // @[FixedPointTypeClass.scala 30:22]
  wire [29:0] _T_876 = $signed(_T_867) + $signed(_T_873); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_122 = {$signed(_T_855_real), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_123 = {{4{_GEN_122[24]}},_GEN_122}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_0 = {{1{_GEN_123[28]}},_GEN_123}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_886 = $signed(_GEN_0) + $signed(_T_874); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_124 = {$signed(_T_855_imag), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_125 = {{4{_GEN_124[24]}},_GEN_124}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_3 = {{1{_GEN_125[28]}},_GEN_125}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_888 = $signed(_GEN_3) + $signed(_T_876); // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_898 = $signed(_GEN_0) - $signed(_T_874); // @[FixedPointTypeClass.scala 30:22]
  wire [30:0] _T_900 = $signed(_GEN_3) - $signed(_T_876); // @[FixedPointTypeClass.scala 30:22]
  reg [16:0] _T_918_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_918_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [16:0] stage_outputs_0_2_real = {{1{io_in_bits_2_real[15]}},io_in_bits_2_real}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] stage_outputs_0_2_imag = {{1{io_in_bits_2_imag[15]}},io_in_bits_2_imag}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] _GEN_29 = _T_818 ? $signed(_T_918_real) : $signed(stage_outputs_0_2_real); // @[FFTUtilities.scala 25:8]
  wire [16:0] _GEN_30 = _T_818 ? $signed(_T_918_imag) : $signed(stage_outputs_0_2_imag); // @[FFTUtilities.scala 25:8]
  reg [16:0] _T_997_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_997_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [17:0] _T_1003 = $signed(_GEN_29) + $signed(_GEN_30); // @[FixedPointTypeClass.scala 22:22]
  wire [17:0] _T_1005 = $signed(_GEN_30) - $signed(_GEN_29); // @[FixedPointTypeClass.scala 30:22]
  wire [17:0] _GEN_130 = {{1{_GEN_29[16]}},_GEN_29}; // @[FixedPointTypeClass.scala 155:35]
  wire [35:0] _T_1007 = $signed(_GEN_130) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1009 = _T_1007[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1010 = $signed(_T_1003) * 18'sh0; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1012 = _T_1010[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1013 = $signed(_T_1005) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1015 = _T_1013[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [29:0] _T_1016 = $signed(_T_1009) - $signed(_T_1012); // @[FixedPointTypeClass.scala 30:22]
  wire [29:0] _T_1018 = $signed(_T_1009) + $signed(_T_1015); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_131 = {$signed(_T_997_real), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_132 = {{4{_GEN_131[24]}},_GEN_131}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_6 = {{1{_GEN_132[28]}},_GEN_132}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1028 = $signed(_GEN_6) + $signed(_T_1016); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_133 = {$signed(_T_997_imag), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_134 = {{4{_GEN_133[24]}},_GEN_133}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_7 = {{1{_GEN_134[28]}},_GEN_134}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1030 = $signed(_GEN_7) + $signed(_T_1018); // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1040 = $signed(_GEN_6) - $signed(_T_1016); // @[FixedPointTypeClass.scala 30:22]
  wire [30:0] _T_1042 = $signed(_GEN_7) - $signed(_T_1018); // @[FixedPointTypeClass.scala 30:22]
  reg [16:0] _T_1060_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1060_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [16:0] stage_outputs_0_4_real = {{1{io_in_bits_4_real[15]}},io_in_bits_4_real}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] stage_outputs_0_4_imag = {{1{io_in_bits_4_imag[15]}},io_in_bits_4_imag}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] _GEN_37 = _T_818 ? $signed(_T_1060_real) : $signed(stage_outputs_0_4_real); // @[FFTUtilities.scala 25:8]
  wire [16:0] _GEN_38 = _T_818 ? $signed(_T_1060_imag) : $signed(stage_outputs_0_4_imag); // @[FFTUtilities.scala 25:8]
  reg [16:0] _T_1139_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1139_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [17:0] _T_1145 = $signed(_GEN_37) + $signed(_GEN_38); // @[FixedPointTypeClass.scala 22:22]
  wire [17:0] _T_1147 = $signed(_GEN_38) - $signed(_GEN_37); // @[FixedPointTypeClass.scala 30:22]
  wire [17:0] _GEN_139 = {{1{_GEN_37[16]}},_GEN_37}; // @[FixedPointTypeClass.scala 155:35]
  wire [35:0] _T_1149 = $signed(_GEN_139) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1151 = _T_1149[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1152 = $signed(_T_1145) * 18'sh0; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1154 = _T_1152[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1155 = $signed(_T_1147) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1157 = _T_1155[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [29:0] _T_1158 = $signed(_T_1151) - $signed(_T_1154); // @[FixedPointTypeClass.scala 30:22]
  wire [29:0] _T_1160 = $signed(_T_1151) + $signed(_T_1157); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_140 = {$signed(_T_1139_real), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_141 = {{4{_GEN_140[24]}},_GEN_140}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_10 = {{1{_GEN_141[28]}},_GEN_141}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1170 = $signed(_GEN_10) + $signed(_T_1158); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_142 = {$signed(_T_1139_imag), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_143 = {{4{_GEN_142[24]}},_GEN_142}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_11 = {{1{_GEN_143[28]}},_GEN_143}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1172 = $signed(_GEN_11) + $signed(_T_1160); // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1182 = $signed(_GEN_10) - $signed(_T_1158); // @[FixedPointTypeClass.scala 30:22]
  wire [30:0] _T_1184 = $signed(_GEN_11) - $signed(_T_1160); // @[FixedPointTypeClass.scala 30:22]
  reg [16:0] _T_1202_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1202_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [16:0] stage_outputs_0_6_real = {{1{io_in_bits_6_real[15]}},io_in_bits_6_real}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] stage_outputs_0_6_imag = {{1{io_in_bits_6_imag[15]}},io_in_bits_6_imag}; // @[FFT.scala 201:77 FFT.scala 202:67]
  wire [16:0] _GEN_45 = _T_818 ? $signed(_T_1202_real) : $signed(stage_outputs_0_6_real); // @[FFTUtilities.scala 25:8]
  wire [16:0] _GEN_46 = _T_818 ? $signed(_T_1202_imag) : $signed(stage_outputs_0_6_imag); // @[FFTUtilities.scala 25:8]
  reg [16:0] _T_1281_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1281_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [17:0] _T_1287 = $signed(_GEN_45) + $signed(_GEN_46); // @[FixedPointTypeClass.scala 22:22]
  wire [17:0] _T_1289 = $signed(_GEN_46) - $signed(_GEN_45); // @[FixedPointTypeClass.scala 30:22]
  wire [17:0] _GEN_148 = {{1{_GEN_45[16]}},_GEN_45}; // @[FixedPointTypeClass.scala 155:35]
  wire [35:0] _T_1291 = $signed(_GEN_148) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1293 = _T_1291[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1294 = $signed(_T_1287) * 18'sh0; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1296 = _T_1294[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [35:0] _T_1297 = $signed(_T_1289) * 18'sh8000; // @[FixedPointTypeClass.scala 155:35]
  wire [28:0] _T_1299 = _T_1297[35:7]; // @[FixedPointTypeClass.scala 141:39]
  wire [29:0] _T_1300 = $signed(_T_1293) - $signed(_T_1296); // @[FixedPointTypeClass.scala 30:22]
  wire [29:0] _T_1302 = $signed(_T_1293) + $signed(_T_1299); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_149 = {$signed(_T_1281_real), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_150 = {{4{_GEN_149[24]}},_GEN_149}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_14 = {{1{_GEN_150[28]}},_GEN_150}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1312 = $signed(_GEN_14) + $signed(_T_1300); // @[FixedPointTypeClass.scala 22:22]
  wire [24:0] _GEN_151 = {$signed(_T_1281_imag), 8'h0}; // @[FixedPointTypeClass.scala 22:22]
  wire [28:0] _GEN_152 = {{4{_GEN_151[24]}},_GEN_151}; // @[FixedPointTypeClass.scala 22:22]
  wire [29:0] _GEN_15 = {{1{_GEN_152[28]}},_GEN_152}; // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1314 = $signed(_GEN_15) + $signed(_T_1302); // @[FixedPointTypeClass.scala 22:22]
  wire [30:0] _T_1324 = $signed(_GEN_14) - $signed(_T_1300); // @[FixedPointTypeClass.scala 30:22]
  wire [30:0] _T_1326 = $signed(_GEN_15) - $signed(_T_1302); // @[FixedPointTypeClass.scala 30:22]
  reg [16:0] _T_1344_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1344_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [1:0] _T_1375 = {{1'd0}, sync_1}; // @[FFTUtilities.scala 27:20]
  wire  _T_1386 = sync_1 + 1'h1; // @[FFTUtilities.scala 27:20]
  wire [22:0] _GEN_157 = _T_886[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_0_real = _GEN_157[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_159 = _T_888[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_0_imag = _GEN_159[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  reg [16:0] stage_outputs_2_0_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] stage_outputs_2_0_imag; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1430_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1430_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [22:0] _GEN_161 = _T_1028[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_2_real = _GEN_161[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_163 = _T_1030[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_2_imag = _GEN_163[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  reg [16:0] stage_outputs_2_2_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] stage_outputs_2_2_imag; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1516_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1516_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [22:0] _GEN_165 = _T_1170[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_4_real = _GEN_165[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_167 = _T_1172[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_4_imag = _GEN_167[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  reg [16:0] stage_outputs_2_4_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] stage_outputs_2_4_imag; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1602_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] _T_1602_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [22:0] _GEN_169 = _T_1312[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_6_real = _GEN_169[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_171 = _T_1314[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [16:0] stage_outputs_1_6_imag = _GEN_171[16:0]; // @[FFT.scala 201:77 FFT.scala 217:232]
  reg [16:0] stage_outputs_2_6_real; // @[ShiftRegisterMem.scala 18:20]
  reg [16:0] stage_outputs_2_6_imag; // @[ShiftRegisterMem.scala 18:20]
  wire [22:0] _GEN_173 = _T_898[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_175 = _T_900[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_177 = _T_1040[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_179 = _T_1042[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_181 = _T_1182[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_183 = _T_1184[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_185 = _T_1324[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  wire [22:0] _GEN_187 = _T_1326[30:8]; // @[FFT.scala 201:77 FFT.scala 217:232]
  assign io_out_valid = _T_581; // @[FFT.scala 158:16]
  assign io_out_bits_0_real = stage_outputs_2_0_real; // @[FFT.scala 224:15]
  assign io_out_bits_0_imag = stage_outputs_2_0_imag; // @[FFT.scala 224:15]
  assign io_out_bits_1_real = _T_1386 ? $signed(_T_1344_real) : $signed(stage_outputs_1_0_real); // @[FFT.scala 224:15]
  assign io_out_bits_1_imag = _T_1386 ? $signed(_T_1344_imag) : $signed(stage_outputs_1_0_imag); // @[FFT.scala 224:15]
  assign io_out_bits_2_real = stage_outputs_2_2_real; // @[FFT.scala 224:15]
  assign io_out_bits_2_imag = stage_outputs_2_2_imag; // @[FFT.scala 224:15]
  assign io_out_bits_3_real = _T_1386 ? $signed(_T_1430_real) : $signed(stage_outputs_1_2_real); // @[FFT.scala 224:15]
  assign io_out_bits_3_imag = _T_1386 ? $signed(_T_1430_imag) : $signed(stage_outputs_1_2_imag); // @[FFT.scala 224:15]
  assign io_out_bits_4_real = stage_outputs_2_4_real; // @[FFT.scala 224:15]
  assign io_out_bits_4_imag = stage_outputs_2_4_imag; // @[FFT.scala 224:15]
  assign io_out_bits_5_real = _T_1386 ? $signed(_T_1516_real) : $signed(stage_outputs_1_4_real); // @[FFT.scala 224:15]
  assign io_out_bits_5_imag = _T_1386 ? $signed(_T_1516_imag) : $signed(stage_outputs_1_4_imag); // @[FFT.scala 224:15]
  assign io_out_bits_6_real = stage_outputs_2_6_real; // @[FFT.scala 224:15]
  assign io_out_bits_6_imag = stage_outputs_2_6_imag; // @[FFT.scala 224:15]
  assign io_out_bits_7_real = _T_1386 ? $signed(_T_1602_real) : $signed(stage_outputs_1_6_real); // @[FFT.scala 224:15]
  assign io_out_bits_7_imag = _T_1386 ? $signed(_T_1602_imag) : $signed(stage_outputs_1_6_imag); // @[FFT.scala 224:15]
  assign io_out_sync = ~sync_1; // @[FFT.scala 157:15]
  assign _GEN_13_0 = sync_0 + 1'h1;
  assign _GEN_52_0 = _T_1375[0];
  assign _GEN_28_0 = sync_1 + 1'h1;
  assign _GEN_44_0 = _T_807[0];
  assign _GEN_36_0 = _T_807[0];
  assign _GEN_12_0 = sync_0 + 1'h1;
  assign _GEN_20_0 = sync_1 + 1'h1;
  assign _GEN_55_0 = _T_1375[0];
  assign _GEN_49_1 = _T_1375[0];
  assign _GEN_41_0 = _T_807[0];
  assign _GEN_25_0 = sync_1 + 1'h1;
  assign _GEN_33_0 = reset;
  assign _GEN_5_0 = _T_555 & io_in_valid;
  assign _GEN_17_1 = sync_0 + 1'h1;
  assign _GEN_51_0 = _T_1375[0];
  assign _GEN_32_0 = reset;
  assign _GEN_43_0 = _T_807[0];
  assign _GEN_4_0 = io_in_sync;
  assign _GEN_35_0 = reset;
  assign _GEN_27_0 = sync_1 + 1'h1;
  assign _GEN_54_1 = _T_1375[0];
  assign _GEN_48_0 = _T_1375[0];
  assign _GEN_9_1 = sync_0 + 1'h1;
  assign _GEN_19_1 = sync_0 + 1'h1;
  assign _GEN_40_0 = _T_807[0];
  assign _GEN_24_0 = sync_1 + 1'h1;
  assign _GEN_16_1 = sync_0 + 1'h1;
  assign _GEN_47_0 = _T_807[0];
  assign _GEN_50_1 = _T_1375[0];
  assign _GEN_31_0 = sync_1 + 1'h1;
  assign _GEN_42_1 = _T_807[0];
  assign _GEN_23_0 = sync_1 + 1'h1;
  assign _GEN_26_1 = sync_1 + 1'h1;
  assign _GEN_53_1 = _T_1375[0];
  assign _GEN_34_1 = reset;
  assign _GEN_39_0 = _T_807[0];
  assign _GEN_18_0 = sync_0 + 1'h1;
  assign _GEN_8_1 = sync_0 + 1'h1;
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
  valid_delay = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sync_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_579 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_581 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_776_real = _RAND_5[16:0];
  _RAND_6 = {1{`RANDOM}};
  _T_776_imag = _RAND_6[16:0];
  _RAND_7 = {1{`RANDOM}};
  _T_855_real = _RAND_7[16:0];
  _RAND_8 = {1{`RANDOM}};
  _T_855_imag = _RAND_8[16:0];
  _RAND_9 = {1{`RANDOM}};
  _T_918_real = _RAND_9[16:0];
  _RAND_10 = {1{`RANDOM}};
  _T_918_imag = _RAND_10[16:0];
  _RAND_11 = {1{`RANDOM}};
  _T_997_real = _RAND_11[16:0];
  _RAND_12 = {1{`RANDOM}};
  _T_997_imag = _RAND_12[16:0];
  _RAND_13 = {1{`RANDOM}};
  _T_1060_real = _RAND_13[16:0];
  _RAND_14 = {1{`RANDOM}};
  _T_1060_imag = _RAND_14[16:0];
  _RAND_15 = {1{`RANDOM}};
  _T_1139_real = _RAND_15[16:0];
  _RAND_16 = {1{`RANDOM}};
  _T_1139_imag = _RAND_16[16:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1202_real = _RAND_17[16:0];
  _RAND_18 = {1{`RANDOM}};
  _T_1202_imag = _RAND_18[16:0];
  _RAND_19 = {1{`RANDOM}};
  _T_1281_real = _RAND_19[16:0];
  _RAND_20 = {1{`RANDOM}};
  _T_1281_imag = _RAND_20[16:0];
  _RAND_21 = {1{`RANDOM}};
  _T_1344_real = _RAND_21[16:0];
  _RAND_22 = {1{`RANDOM}};
  _T_1344_imag = _RAND_22[16:0];
  _RAND_23 = {1{`RANDOM}};
  stage_outputs_2_0_real = _RAND_23[16:0];
  _RAND_24 = {1{`RANDOM}};
  stage_outputs_2_0_imag = _RAND_24[16:0];
  _RAND_25 = {1{`RANDOM}};
  _T_1430_real = _RAND_25[16:0];
  _RAND_26 = {1{`RANDOM}};
  _T_1430_imag = _RAND_26[16:0];
  _RAND_27 = {1{`RANDOM}};
  stage_outputs_2_2_real = _RAND_27[16:0];
  _RAND_28 = {1{`RANDOM}};
  stage_outputs_2_2_imag = _RAND_28[16:0];
  _RAND_29 = {1{`RANDOM}};
  _T_1516_real = _RAND_29[16:0];
  _RAND_30 = {1{`RANDOM}};
  _T_1516_imag = _RAND_30[16:0];
  _RAND_31 = {1{`RANDOM}};
  stage_outputs_2_4_real = _RAND_31[16:0];
  _RAND_32 = {1{`RANDOM}};
  stage_outputs_2_4_imag = _RAND_32[16:0];
  _RAND_33 = {1{`RANDOM}};
  _T_1602_real = _RAND_33[16:0];
  _RAND_34 = {1{`RANDOM}};
  _T_1602_imag = _RAND_34[16:0];
  _RAND_35 = {1{`RANDOM}};
  stage_outputs_2_6_real = _RAND_35[16:0];
  _RAND_36 = {1{`RANDOM}};
  stage_outputs_2_6_imag = _RAND_36[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      valid_delay <= 1'h0;
    end else begin
      valid_delay <= io_in_valid;
    end
    if (metaReset) begin
      value <= 1'h0;
    end else if (reset) begin
      value <= 1'h0;
    end else begin
      value <= _GEN_2;
    end
    if (metaReset) begin
      sync_1 <= 1'h0;
    end else if (reset) begin
      sync_1 <= 1'h0;
    end else if (_T_556) begin
      sync_1 <= 1'h0;
    end else begin
      sync_1 <= value;
    end
    if (metaReset) begin
      _T_579 <= 1'h0;
    end else if (reset) begin
      _T_579 <= 1'h0;
    end else begin
      _T_579 <= io_in_valid;
    end
    if (metaReset) begin
      _T_581 <= 1'h0;
    end else if (reset) begin
      _T_581 <= 1'h0;
    end else begin
      _T_581 <= _T_579;
    end
    if (metaReset) begin
      _T_776_real <= 17'sh0;
    end else begin
      _T_776_real <= {{1{io_in_bits_1_real[15]}},io_in_bits_1_real};
    end
    if (metaReset) begin
      _T_776_imag <= 17'sh0;
    end else begin
      _T_776_imag <= {{1{io_in_bits_1_imag[15]}},io_in_bits_1_imag};
    end
    if (metaReset) begin
      _T_855_real <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_855_real <= _T_776_real;
    end else begin
      _T_855_real <= stage_outputs_0_0_real;
    end
    if (metaReset) begin
      _T_855_imag <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_855_imag <= _T_776_imag;
    end else begin
      _T_855_imag <= stage_outputs_0_0_imag;
    end
    if (metaReset) begin
      _T_918_real <= 17'sh0;
    end else begin
      _T_918_real <= {{1{io_in_bits_3_real[15]}},io_in_bits_3_real};
    end
    if (metaReset) begin
      _T_918_imag <= 17'sh0;
    end else begin
      _T_918_imag <= {{1{io_in_bits_3_imag[15]}},io_in_bits_3_imag};
    end
    if (metaReset) begin
      _T_997_real <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_997_real <= _T_918_real;
    end else begin
      _T_997_real <= stage_outputs_0_2_real;
    end
    if (metaReset) begin
      _T_997_imag <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_997_imag <= _T_918_imag;
    end else begin
      _T_997_imag <= stage_outputs_0_2_imag;
    end
    if (metaReset) begin
      _T_1060_real <= 17'sh0;
    end else begin
      _T_1060_real <= {{1{io_in_bits_5_real[15]}},io_in_bits_5_real};
    end
    if (metaReset) begin
      _T_1060_imag <= 17'sh0;
    end else begin
      _T_1060_imag <= {{1{io_in_bits_5_imag[15]}},io_in_bits_5_imag};
    end
    if (metaReset) begin
      _T_1139_real <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_1139_real <= _T_1060_real;
    end else begin
      _T_1139_real <= stage_outputs_0_4_real;
    end
    if (metaReset) begin
      _T_1139_imag <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_1139_imag <= _T_1060_imag;
    end else begin
      _T_1139_imag <= stage_outputs_0_4_imag;
    end
    if (metaReset) begin
      _T_1202_real <= 17'sh0;
    end else begin
      _T_1202_real <= {{1{io_in_bits_7_real[15]}},io_in_bits_7_real};
    end
    if (metaReset) begin
      _T_1202_imag <= 17'sh0;
    end else begin
      _T_1202_imag <= {{1{io_in_bits_7_imag[15]}},io_in_bits_7_imag};
    end
    if (metaReset) begin
      _T_1281_real <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_1281_real <= _T_1202_real;
    end else begin
      _T_1281_real <= stage_outputs_0_6_real;
    end
    if (metaReset) begin
      _T_1281_imag <= 17'sh0;
    end else if (_T_807[0]) begin
      _T_1281_imag <= _T_1202_imag;
    end else begin
      _T_1281_imag <= stage_outputs_0_6_imag;
    end
    if (metaReset) begin
      _T_1344_real <= 17'sh0;
    end else begin
      _T_1344_real <= _GEN_173[16:0];
    end
    if (metaReset) begin
      _T_1344_imag <= 17'sh0;
    end else begin
      _T_1344_imag <= _GEN_175[16:0];
    end
    if (metaReset) begin
      stage_outputs_2_0_real <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_0_real <= _T_1344_real;
    end else begin
      stage_outputs_2_0_real <= stage_outputs_1_0_real;
    end
    if (metaReset) begin
      stage_outputs_2_0_imag <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_0_imag <= _T_1344_imag;
    end else begin
      stage_outputs_2_0_imag <= stage_outputs_1_0_imag;
    end
    if (metaReset) begin
      _T_1430_real <= 17'sh0;
    end else begin
      _T_1430_real <= _GEN_177[16:0];
    end
    if (metaReset) begin
      _T_1430_imag <= 17'sh0;
    end else begin
      _T_1430_imag <= _GEN_179[16:0];
    end
    if (metaReset) begin
      stage_outputs_2_2_real <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_2_real <= _T_1430_real;
    end else begin
      stage_outputs_2_2_real <= stage_outputs_1_2_real;
    end
    if (metaReset) begin
      stage_outputs_2_2_imag <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_2_imag <= _T_1430_imag;
    end else begin
      stage_outputs_2_2_imag <= stage_outputs_1_2_imag;
    end
    if (metaReset) begin
      _T_1516_real <= 17'sh0;
    end else begin
      _T_1516_real <= _GEN_181[16:0];
    end
    if (metaReset) begin
      _T_1516_imag <= 17'sh0;
    end else begin
      _T_1516_imag <= _GEN_183[16:0];
    end
    if (metaReset) begin
      stage_outputs_2_4_real <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_4_real <= _T_1516_real;
    end else begin
      stage_outputs_2_4_real <= stage_outputs_1_4_real;
    end
    if (metaReset) begin
      stage_outputs_2_4_imag <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_4_imag <= _T_1516_imag;
    end else begin
      stage_outputs_2_4_imag <= stage_outputs_1_4_imag;
    end
    if (metaReset) begin
      _T_1602_real <= 17'sh0;
    end else begin
      _T_1602_real <= _GEN_185[16:0];
    end
    if (metaReset) begin
      _T_1602_imag <= 17'sh0;
    end else begin
      _T_1602_imag <= _GEN_187[16:0];
    end
    if (metaReset) begin
      stage_outputs_2_6_real <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_6_real <= _T_1602_real;
    end else begin
      stage_outputs_2_6_real <= stage_outputs_1_6_real;
    end
    if (metaReset) begin
      stage_outputs_2_6_imag <= 17'sh0;
    end else if (_T_1375[0]) begin
      stage_outputs_2_6_imag <= _T_1602_imag;
    end else begin
      stage_outputs_2_6_imag <= stage_outputs_1_6_imag;
    end
  end
endmodule
