module TLSPI(
  input          metaReset,
  input          clock,
  input          reset,
  output         auto_int_out_0,
  output         auto_r_in_a_ready,
  input          auto_r_in_a_valid,
  input  [2:0]   auto_r_in_a_bits_opcode,
  input  [2:0]   auto_r_in_a_bits_param,
  input  [1:0]   auto_r_in_a_bits_size,
  input  [6:0]   auto_r_in_a_bits_source,
  input  [28:0]  auto_r_in_a_bits_address,
  input  [3:0]   auto_r_in_a_bits_mask,
  input  [31:0]  auto_r_in_a_bits_data,
  input          auto_r_in_b_ready,
  output         auto_r_in_b_valid,
  output [2:0]   auto_r_in_b_bits_opcode,
  output [1:0]   auto_r_in_b_bits_param,
  output [1:0]   auto_r_in_b_bits_size,
  output [6:0]   auto_r_in_b_bits_source,
  output [28:0]  auto_r_in_b_bits_address,
  output [3:0]   auto_r_in_b_bits_mask,
  output [31:0]  auto_r_in_b_bits_data,
  output         auto_r_in_c_ready,
  input          auto_r_in_c_valid,
  input  [2:0]   auto_r_in_c_bits_opcode,
  input  [2:0]   auto_r_in_c_bits_param,
  input  [1:0]   auto_r_in_c_bits_size,
  input  [6:0]   auto_r_in_c_bits_source,
  input  [28:0]  auto_r_in_c_bits_address,
  input  [31:0]  auto_r_in_c_bits_data,
  input          auto_r_in_c_bits_error,
  input          auto_r_in_d_ready,
  output         auto_r_in_d_valid,
  output [2:0]   auto_r_in_d_bits_opcode,
  output [1:0]   auto_r_in_d_bits_param,
  output [1:0]   auto_r_in_d_bits_size,
  output [6:0]   auto_r_in_d_bits_source,
  output         auto_r_in_d_bits_sink,
  output [31:0]  auto_r_in_d_bits_data,
  output         auto_r_in_d_bits_error,
  output         auto_r_in_e_ready,
  input          auto_r_in_e_valid,
  input          auto_r_in_e_bits_sink,
  output         io_port_sck,
  input          io_port_dq_0_i,
  output         io_port_dq_0_o,
  output         io_port_dq_0_oe,
  input          io_port_dq_1_i,
  output         io_port_dq_1_o,
  output         io_port_dq_1_oe,
  input          io_port_dq_2_i,
  output         io_port_dq_2_o,
  output         io_port_dq_2_oe,
  input          io_port_dq_3_i,
  output         io_port_dq_3_o,
  output         io_port_dq_3_oe,
  output         io_port_cs_0,
  output         io_port_cs_1,
  output         io_port_cs_2,
  output         io_port_cs_3,
  output [51:0]  assert_out,
  output [283:0] auto_cover_out
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
  wire  TLMonitor__GEN_23_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_87_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_39_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_70_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_63_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_46_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_33_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_42_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_49_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_56_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_26_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_36_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_29_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_86_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_12_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_79_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_72_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_21_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_65_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_55_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_5_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_82_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_51_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_58_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_35_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_89_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_2_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_9_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_75_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_38_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_44_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_62_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_68_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_22_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_32_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_25_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_48_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_41_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_8_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_81_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_28_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_1_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_67_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_84_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_11_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_4_3; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_60_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_88_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_47_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_78_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_40_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_64_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_20_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_71_3; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_34_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_57_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_50_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_74_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_27_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_37_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_54_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_30_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_43_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_17_0; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_24_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_7_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_80_3; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_73_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_59_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_66_3; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_52_1; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_83_3; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_3_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_76_2; // @[Nodes.scala 25:25]
  wire  TLMonitor__GEN_10_2; // @[Nodes.scala 25:25]
  wire  fifo_metaReset; // @[TLSPI.scala 60:20]
  wire  fifo_clock; // @[TLSPI.scala 60:20]
  wire  fifo_reset; // @[TLSPI.scala 60:20]
  wire [1:0] fifo_io_ctrl_fmt_proto; // @[TLSPI.scala 60:20]
  wire  fifo_io_ctrl_fmt_endian; // @[TLSPI.scala 60:20]
  wire  fifo_io_ctrl_fmt_iodir; // @[TLSPI.scala 60:20]
  wire [3:0] fifo_io_ctrl_fmt_len; // @[TLSPI.scala 60:20]
  wire [1:0] fifo_io_ctrl_cs_mode; // @[TLSPI.scala 60:20]
  wire [3:0] fifo_io_ctrl_wm_tx; // @[TLSPI.scala 60:20]
  wire [3:0] fifo_io_ctrl_wm_rx; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_tx_ready; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_tx_valid; // @[TLSPI.scala 60:20]
  wire [7:0] fifo_io_link_tx_bits; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_rx_valid; // @[TLSPI.scala 60:20]
  wire [7:0] fifo_io_link_rx_bits; // @[TLSPI.scala 60:20]
  wire [7:0] fifo_io_link_cnt; // @[TLSPI.scala 60:20]
  wire [1:0] fifo_io_link_fmt_proto; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_fmt_endian; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_fmt_iodir; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_cs_set; // @[TLSPI.scala 60:20]
  wire  fifo_io_link_cs_clear; // @[TLSPI.scala 60:20]
  wire  fifo_io_tx_ready; // @[TLSPI.scala 60:20]
  wire  fifo_io_tx_valid; // @[TLSPI.scala 60:20]
  wire [7:0] fifo_io_tx_bits; // @[TLSPI.scala 60:20]
  wire  fifo_io_rx_ready; // @[TLSPI.scala 60:20]
  wire  fifo_io_rx_valid; // @[TLSPI.scala 60:20]
  wire [7:0] fifo_io_rx_bits; // @[TLSPI.scala 60:20]
  wire  fifo_io_ip_txwm; // @[TLSPI.scala 60:20]
  wire  fifo_io_ip_rxwm; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_2_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_1_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_7_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_4_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_4_1; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_10_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_1_1; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_3_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_0_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_6_0; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_9_1; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_3_1; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_0_1; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_8_1; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_11_2; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_8_2; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_8_3; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_2_2; // @[TLSPI.scala 60:20]
  wire  fifo__GEN_5_1; // @[TLSPI.scala 60:20]
  wire  mac_metaReset; // @[TLSPI.scala 61:19]
  wire  mac_clock; // @[TLSPI.scala 61:19]
  wire  mac_reset; // @[TLSPI.scala 61:19]
  wire  mac_io_port_sck; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_0_i; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_0_o; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_0_oe; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_1_i; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_1_o; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_1_oe; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_2_i; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_2_o; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_2_oe; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_3_i; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_3_o; // @[TLSPI.scala 61:19]
  wire  mac_io_port_dq_3_oe; // @[TLSPI.scala 61:19]
  wire  mac_io_port_cs_0; // @[TLSPI.scala 61:19]
  wire  mac_io_port_cs_1; // @[TLSPI.scala 61:19]
  wire  mac_io_port_cs_2; // @[TLSPI.scala 61:19]
  wire  mac_io_port_cs_3; // @[TLSPI.scala 61:19]
  wire [11:0] mac_io_ctrl_sck_div; // @[TLSPI.scala 61:19]
  wire  mac_io_ctrl_sck_pol; // @[TLSPI.scala 61:19]
  wire  mac_io_ctrl_sck_pha; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_ctrl_dla_cssck; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_ctrl_dla_sckcs; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_ctrl_dla_intercs; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_ctrl_dla_interxfr; // @[TLSPI.scala 61:19]
  wire [1:0] mac_io_ctrl_cs_id; // @[TLSPI.scala 61:19]
  wire  mac_io_ctrl_cs_dflt_0; // @[TLSPI.scala 61:19]
  wire  mac_io_ctrl_cs_dflt_1; // @[TLSPI.scala 61:19]
  wire  mac_io_ctrl_cs_dflt_2; // @[TLSPI.scala 61:19]
  wire  mac_io_ctrl_cs_dflt_3; // @[TLSPI.scala 61:19]
  wire  mac_io_link_tx_ready; // @[TLSPI.scala 61:19]
  wire  mac_io_link_tx_valid; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_link_tx_bits; // @[TLSPI.scala 61:19]
  wire  mac_io_link_rx_valid; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_link_rx_bits; // @[TLSPI.scala 61:19]
  wire [7:0] mac_io_link_cnt; // @[TLSPI.scala 61:19]
  wire [1:0] mac_io_link_fmt_proto; // @[TLSPI.scala 61:19]
  wire  mac_io_link_fmt_endian; // @[TLSPI.scala 61:19]
  wire  mac_io_link_fmt_iodir; // @[TLSPI.scala 61:19]
  wire  mac_io_link_cs_set; // @[TLSPI.scala 61:19]
  wire  mac_io_link_cs_clear; // @[TLSPI.scala 61:19]
  wire  mac__GEN_115_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_105_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_39_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_111_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_96_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_132_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_109_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_117_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_121_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_130_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_126_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_120_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_124_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_93_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_114_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_83_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_87_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_99_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_118_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_135_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_103_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_89_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_102_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_92_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_106_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_75_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_43_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_108_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_77_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_81_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_96_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_90_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_68_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_112_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_67_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_84_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_95_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_99_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_60_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_86_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_71_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_80_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_78_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_21_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_119_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_57_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_72_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_123_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_64_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_134_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_63_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_128_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_132_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_11_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_107_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_101_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_111_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_105_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_120_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_122_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_126_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_131_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_135_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_129_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_116_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_125_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_98_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_110_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_114_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_108_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_104_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_94_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_82_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_98_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_63_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_113_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_71_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_80_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_88_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_102_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_92_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_86_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_117_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_73_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_91_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_89_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_74_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_4_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_66_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_66_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_95_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_85_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_10_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_79_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_130_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_59_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_83_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_134_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_20_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_70_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_77_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_118_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_62_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_133_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_55_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_122_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_112_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_116_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_127_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_100_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_131_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_121_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_104_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_106_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_115_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_125_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_119_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_113_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_128_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_109_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_103_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_78_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_82_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_93_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_107_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_97_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_124_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_81_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_87_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_100_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_85_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_61_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_72_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_97_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_79_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_101_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_91_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_110_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_61_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_65_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_88_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_90_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_94_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_84_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_65_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_73_3; // @[TLSPI.scala 61:19]
  wire  mac__GEN_69_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_76_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_127_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_129_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_14_0; // @[TLSPI.scala 61:19]
  wire  mac__GEN_133_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_123_1; // @[TLSPI.scala 61:19]
  wire  mac__GEN_58_2; // @[TLSPI.scala 61:19]
  wire  mac__GEN_70_3; // @[TLSPI.scala 61:19]
  wire  profilePin_109 = TLMonitor__GEN_32_1;
  wire  profilePin_110 = TLMonitor__GEN_33_0;
  wire  profilePin_111 = TLMonitor__GEN_34_1;
  wire  profilePin_112 = TLMonitor__GEN_35_1;
  wire  profilePin_113 = TLMonitor__GEN_36_0;
  wire  profilePin_114 = TLMonitor__GEN_37_1;
  wire  profilePin_115 = TLMonitor__GEN_38_1;
  wire  profilePin_116 = TLMonitor__GEN_39_1;
  wire  profilePin_117 = TLMonitor__GEN_40_1;
  wire  profilePin_118 = TLMonitor__GEN_41_1;
  wire [9:0] _GEN_231 = {profilePin_109,profilePin_110,profilePin_111,profilePin_112,profilePin_113,profilePin_114,profilePin_115,profilePin_116,profilePin_117,profilePin_118};
  wire  profilePin_119 = TLMonitor__GEN_42_0;
  wire  profilePin_120 = TLMonitor__GEN_43_2;
  wire  profilePin_121 = TLMonitor__GEN_44_1;
  wire  profilePin_122 = TLMonitor__GEN_46_0;
  wire  profilePin_123 = TLMonitor__GEN_47_1;
  wire  profilePin_124 = TLMonitor__GEN_48_0;
  wire  profilePin_125 = TLMonitor__GEN_49_0;
  wire  profilePin_126 = TLMonitor__GEN_50_1;
  wire  profilePin_127 = TLMonitor__GEN_51_0;
  wire [18:0] _GEN_240 = {_GEN_231,profilePin_119,profilePin_120,profilePin_121,profilePin_122,profilePin_123,profilePin_124,profilePin_125,profilePin_126,profilePin_127};
  wire  profilePin_128 = TLMonitor__GEN_52_1;
  wire  profilePin_129 = TLMonitor__GEN_54_1;
  wire  profilePin_130 = TLMonitor__GEN_55_0;
  wire  profilePin_131 = TLMonitor__GEN_56_1;
  wire  profilePin_132 = TLMonitor__GEN_57_1;
  wire  profilePin_133 = TLMonitor__GEN_58_0;
  wire  profilePin_134 = TLMonitor__GEN_59_2;
  wire  profilePin_135 = TLMonitor__GEN_60_1;
  wire  profilePin_136 = TLMonitor__GEN_62_1;
  wire [27:0] _GEN_249 = {_GEN_240,profilePin_128,profilePin_129,profilePin_130,profilePin_131,profilePin_132,profilePin_133,profilePin_134,profilePin_135,profilePin_136};
  wire  profilePin_137 = TLMonitor__GEN_63_0;
  wire  profilePin_138 = TLMonitor__GEN_64_2;
  wire  profilePin_139 = TLMonitor__GEN_65_1;
  wire  profilePin_140 = TLMonitor__GEN_66_3;
  wire  profilePin_141 = TLMonitor__GEN_67_2;
  wire  profilePin_142 = TLMonitor__GEN_68_2;
  wire  profilePin_143 = TLMonitor__GEN_70_0;
  wire  profilePin_144 = TLMonitor__GEN_71_3;
  wire  profilePin_145 = TLMonitor__GEN_72_0;
  wire [36:0] _GEN_258 = {_GEN_249,profilePin_137,profilePin_138,profilePin_139,profilePin_140,profilePin_141,profilePin_142,profilePin_143,profilePin_144,profilePin_145};
  wire  profilePin_146 = TLMonitor__GEN_73_2;
  wire  profilePin_147 = TLMonitor__GEN_74_1;
  wire  profilePin_148 = TLMonitor__GEN_75_1;
  wire  profilePin_149 = TLMonitor__GEN_76_2;
  wire  profilePin_150 = TLMonitor__GEN_78_1;
  wire  profilePin_151 = TLMonitor__GEN_79_0;
  wire  profilePin_152 = TLMonitor__GEN_80_3;
  wire  profilePin_153 = TLMonitor__GEN_81_1;
  wire  profilePin_154 = TLMonitor__GEN_82_0;
  wire [45:0] _GEN_267 = {_GEN_258,profilePin_146,profilePin_147,profilePin_148,profilePin_149,profilePin_150,profilePin_151,profilePin_152,profilePin_153,profilePin_154};
  wire  profilePin_155 = TLMonitor__GEN_83_3;
  wire  profilePin_156 = TLMonitor__GEN_84_1;
  wire  profilePin_157 = TLMonitor__GEN_86_1;
  wire  profilePin_158 = TLMonitor__GEN_87_0;
  wire  profilePin_159 = TLMonitor__GEN_88_2;
  wire [50:0] _GEN_272 = {_GEN_267,profilePin_155,profilePin_156,profilePin_157,profilePin_158,profilePin_159};
  wire  profilePin_160 = TLMonitor__GEN_89_1;
  wire  profilePin = auto_r_in_a_bits_mask[0]; // @[Bitwise.scala 27:51]
  wire  profilePin_0 = auto_r_in_a_bits_mask[1]; // @[Bitwise.scala 27:51]
  wire  profilePin_1 = auto_r_in_a_bits_mask[2]; // @[Bitwise.scala 27:51]
  wire  profilePin_2 = auto_r_in_a_bits_mask[3]; // @[Bitwise.scala 27:51]
  wire  _T_2085 = auto_r_in_a_valid & auto_r_in_d_ready; // @[RegisterRouter.scala 62:24]
  wire  _T_281 = auto_r_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 55:36]
  wire  _T_2382 = ~_T_281; // @[RegisterRouter.scala 62:24]
  wire  _T_2383 = _T_2085 & _T_2382; // @[RegisterRouter.scala 62:24]
  wire [4:0] _T_2016 = {auto_r_in_a_bits_address[6],auto_r_in_a_bits_address[5],auto_r_in_a_bits_address[4],auto_r_in_a_bits_address[3],auto_r_in_a_bits_address[2]}; // @[Cat.scala 30:58]
  wire [31:0] _T_2018 = 32'h1 << _T_2016; // @[OneHot.scala 45:35]
  wire  _T_2386 = _T_2383 & _T_2018[0]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_366 = auto_r_in_a_bits_address[11:2] & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_368 = _T_366 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2387 = _T_2386 & _T_368; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_681 = profilePin_2 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_677 = profilePin_1 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_673 = profilePin_0 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_669 = profilePin ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_684 = {_T_681,_T_677,_T_673,_T_669}; // @[Cat.scala 30:58]
  wire [11:0] _T_712 = ~_T_684[11:0]; // @[RegisterRouter.scala 62:24]
  wire  _T_714 = _T_712 == 12'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_3 = _T_2387 & _T_714; // @[RegisterRouter.scala 62:24]
  wire  _T_2426 = _T_2383 & _T_2018[5]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_374 = auto_r_in_a_bits_address[11:2] ^ 10'h5; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_375 = _T_374 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_377 = _T_375 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2427 = _T_2426 & _T_377; // @[RegisterRouter.scala 62:24]
  wire  _T_756 = ~_T_684[0]; // @[RegisterRouter.scala 62:24]
  wire  _T_758 = ~_T_756; // @[RegisterRouter.scala 62:24]
  wire  profilePin_4 = _T_2427 & _T_758; // @[RegisterRouter.scala 62:24]
  wire  _T_800 = ~_T_684[1]; // @[RegisterRouter.scala 62:24]
  wire  _T_802 = ~_T_800; // @[RegisterRouter.scala 62:24]
  wire  profilePin_5 = _T_2427 & _T_802; // @[RegisterRouter.scala 62:24]
  wire  _T_844 = ~_T_684[2]; // @[RegisterRouter.scala 62:24]
  wire  _T_846 = ~_T_844; // @[RegisterRouter.scala 62:24]
  wire  profilePin_6 = _T_2427 & _T_846; // @[RegisterRouter.scala 62:24]
  wire  _T_888 = ~_T_684[3]; // @[RegisterRouter.scala 62:24]
  wire  _T_890 = ~_T_888; // @[RegisterRouter.scala 62:24]
  wire  profilePin_7 = _T_2427 & _T_890; // @[RegisterRouter.scala 62:24]
  wire  _T_2466 = _T_2383 & _T_2018[10]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_383 = auto_r_in_a_bits_address[11:2] ^ 10'ha; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_384 = _T_383 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_386 = _T_384 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2467 = _T_2466 & _T_386; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_932 = ~_T_684[7:0]; // @[RegisterRouter.scala 62:24]
  wire  _T_934 = _T_932 == 8'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_8 = _T_2467 & _T_934; // @[RegisterRouter.scala 62:24]
  wire [9:0] _GEN_610 = {profilePin,profilePin_0,profilePin_1,profilePin_2,profilePin_3,profilePin_4,profilePin_5,profilePin_6,profilePin_7,profilePin_8};
  wire [7:0] _T_976 = ~_T_684[23:16]; // @[RegisterRouter.scala 62:24]
  wire  _T_978 = _T_976 == 8'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_9 = _T_2467 & _T_978; // @[RegisterRouter.scala 62:24]
  wire  _T_2546 = _T_2383 & _T_2018[20]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_392 = auto_r_in_a_bits_address[11:2] ^ 10'h14; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_393 = _T_392 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_395 = _T_393 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2547 = _T_2546 & _T_395; // @[RegisterRouter.scala 62:24]
  wire [3:0] _T_1020 = ~_T_684[3:0]; // @[RegisterRouter.scala 62:24]
  wire  _T_1022 = _T_1020 == 4'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_10 = _T_2547 & _T_1022; // @[RegisterRouter.scala 62:24]
  wire  _T_2394 = _T_2383 & _T_2018[1]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_410 = auto_r_in_a_bits_address[11:2] ^ 10'h1; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_411 = _T_410 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_413 = _T_411 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2395 = _T_2394 & _T_413; // @[RegisterRouter.scala 62:24]
  wire  profilePin_11 = _T_2395 & _T_758; // @[RegisterRouter.scala 62:24]
  wire  profilePin_12 = _T_2395 & _T_802; // @[RegisterRouter.scala 62:24]
  wire  _T_2434 = _T_2383 & _T_2018[6]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_419 = auto_r_in_a_bits_address[11:2] ^ 10'h6; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_420 = _T_419 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_422 = _T_420 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2435 = _T_2434 & _T_422; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1240 = ~_T_684[1:0]; // @[RegisterRouter.scala 62:24]
  wire  _T_1242 = _T_1240 == 2'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_13 = _T_2435 & _T_1242; // @[RegisterRouter.scala 62:24]
  wire  _T_2610 = _T_2383 & _T_2018[28]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_428 = auto_r_in_a_bits_address[11:2] ^ 10'h1c; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_429 = _T_428 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_431 = _T_429 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2611 = _T_2610 & _T_431; // @[RegisterRouter.scala 62:24]
  wire  profilePin_14 = _T_2611 & _T_758; // @[RegisterRouter.scala 62:24]
  wire  profilePin_15 = _T_2611 & _T_802; // @[RegisterRouter.scala 62:24]
  wire  _T_2554 = _T_2383 & _T_2018[21]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_437 = auto_r_in_a_bits_address[11:2] ^ 10'h15; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_438 = _T_437 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_440 = _T_438 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2555 = _T_2554 & _T_440; // @[RegisterRouter.scala 62:24]
  wire  profilePin_16 = _T_2555 & _T_1022; // @[RegisterRouter.scala 62:24]
  wire  _T_2514 = _T_2383 & _T_2018[16]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_455 = auto_r_in_a_bits_address[11:2] ^ 10'h10; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_456 = _T_455 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_458 = _T_456 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2515 = _T_2514 & _T_458; // @[RegisterRouter.scala 62:24]
  wire  profilePin_17 = _T_2515 & _T_1242; // @[RegisterRouter.scala 62:24]
  wire [18:0] _GEN_619 = {_GEN_610,profilePin_9,profilePin_10,profilePin_11,profilePin_12,profilePin_13,profilePin_14,profilePin_15,profilePin_16,profilePin_17};
  wire  profilePin_18 = _T_2515 & _T_846; // @[RegisterRouter.scala 62:24]
  wire  profilePin_19 = _T_2515 & _T_890; // @[RegisterRouter.scala 62:24]
  wire [3:0] _T_1685 = ~_T_684[19:16]; // @[RegisterRouter.scala 62:24]
  wire  _T_1687 = _T_1685 == 4'h0; // @[RegisterRouter.scala 62:24]
  wire  profilePin_20 = _T_2515 & _T_1687; // @[RegisterRouter.scala 62:24]
  wire  _T_2474 = _T_2383 & _T_2018[11]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_464 = auto_r_in_a_bits_address[11:2] ^ 10'hb; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_465 = _T_464 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_467 = _T_465 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2475 = _T_2474 & _T_467; // @[RegisterRouter.scala 62:24]
  wire  profilePin_21 = _T_2475 & _T_934; // @[RegisterRouter.scala 62:24]
  wire  profilePin_22 = _T_2475 & _T_978; // @[RegisterRouter.scala 62:24]
  wire  _T_2418 = _T_2383 & _T_2018[4]; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_482 = auto_r_in_a_bits_address[11:2] ^ 10'h4; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_483 = _T_482 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_485 = _T_483 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _T_2419 = _T_2418 & _T_485; // @[RegisterRouter.scala 62:24]
  wire  profilePin_23 = _T_2419 & _T_1242; // @[RegisterRouter.scala 62:24]
  wire  profilePin_24 = 5'h1 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_25 = 5'h4 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_26 = 5'h5 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire [27:0] _GEN_628 = {_GEN_619,profilePin_18,profilePin_19,profilePin_20,profilePin_21,profilePin_22,profilePin_23,profilePin_24,profilePin_25,profilePin_26};
  wire  profilePin_27 = 5'h6 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_28 = 5'ha == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_29 = 5'hb == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_30 = 5'h10 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_31 = 5'h12 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_32 = 5'h13 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_33 = 5'h14 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_34 = 5'h15 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_35 = 5'h1c == _T_2016; // @[RegisterRouter.scala 62:24]
  wire [36:0] _GEN_637 = {_GEN_628,profilePin_27,profilePin_28,profilePin_29,profilePin_30,profilePin_31,profilePin_32,profilePin_33,profilePin_34,profilePin_35};
  wire  profilePin_36 = 5'h1d == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_38 = 5'h2 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_39 = 5'h3 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_43 = 5'h7 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_44 = 5'h8 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire [45:0] _GEN_646 = {_GEN_637,profilePin_36,profilePin_24,profilePin_38,profilePin_39,profilePin_25,profilePin_26,profilePin_27,profilePin_43,profilePin_44};
  wire  profilePin_45 = 5'h9 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_48 = 5'hc == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_49 = 5'hd == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_50 = 5'he == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_51 = 5'hf == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_53 = 5'h11 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire [54:0] _GEN_655 = {_GEN_646,profilePin_45,profilePin_28,profilePin_29,profilePin_48,profilePin_49,profilePin_50,profilePin_51,profilePin_30,profilePin_53};
  wire  profilePin_58 = 5'h16 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_59 = 5'h17 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_60 = 5'h18 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_61 = 5'h19 == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_62 = 5'h1a == _T_2016; // @[RegisterRouter.scala 62:24]
  wire [63:0] _GEN_664 = {_GEN_655,profilePin_31,profilePin_32,profilePin_33,profilePin_34,profilePin_58,profilePin_59,profilePin_60,profilePin_61,profilePin_62};
  wire  profilePin_63 = 5'h1b == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_66 = 5'h1e == _T_2016; // @[RegisterRouter.scala 62:24]
  wire  profilePin_67 = 5'h1f == _T_2016; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_401 = auto_r_in_a_bits_address[11:2] ^ 10'h1d; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_402 = _T_401 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_404 = _T_402 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_473 = auto_r_in_a_bits_address[11:2] ^ 10'h13; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_474 = _T_473 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_476 = _T_474 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_446 = auto_r_in_a_bits_address[11:2] ^ 10'h12; // @[RegisterRouter.scala 62:24]
  wire [9:0] _T_447 = _T_446 & 10'h3e0; // @[RegisterRouter.scala 62:24]
  wire  _T_449 = _T_447 == 10'h0; // @[RegisterRouter.scala 62:24]
  wire  _GEN_150 = profilePin_24 ? _T_413 : _T_368; // @[RegisterRouter.scala 62:24]
  wire  _GEN_151 = profilePin_38 | _GEN_150; // @[RegisterRouter.scala 62:24]
  wire  _GEN_152 = profilePin_39 | _GEN_151; // @[RegisterRouter.scala 62:24]
  wire  _GEN_153 = profilePin_25 ? _T_485 : _GEN_152; // @[RegisterRouter.scala 62:24]
  wire  _GEN_154 = profilePin_26 ? _T_377 : _GEN_153; // @[RegisterRouter.scala 62:24]
  wire  _GEN_155 = profilePin_27 ? _T_422 : _GEN_154; // @[RegisterRouter.scala 62:24]
  wire  _GEN_156 = profilePin_43 | _GEN_155; // @[RegisterRouter.scala 62:24]
  wire  _GEN_157 = profilePin_44 | _GEN_156; // @[RegisterRouter.scala 62:24]
  wire  _GEN_158 = profilePin_45 | _GEN_157; // @[RegisterRouter.scala 62:24]
  wire  _GEN_159 = profilePin_28 ? _T_386 : _GEN_158; // @[RegisterRouter.scala 62:24]
  wire  _GEN_160 = profilePin_29 ? _T_467 : _GEN_159; // @[RegisterRouter.scala 62:24]
  wire  _GEN_161 = profilePin_48 | _GEN_160; // @[RegisterRouter.scala 62:24]
  wire  _GEN_162 = profilePin_49 | _GEN_161; // @[RegisterRouter.scala 62:24]
  wire  _GEN_163 = profilePin_50 | _GEN_162; // @[RegisterRouter.scala 62:24]
  wire  _GEN_164 = profilePin_51 | _GEN_163; // @[RegisterRouter.scala 62:24]
  wire  _GEN_165 = profilePin_30 ? _T_458 : _GEN_164; // @[RegisterRouter.scala 62:24]
  wire  _GEN_166 = profilePin_53 | _GEN_165; // @[RegisterRouter.scala 62:24]
  wire  _GEN_167 = profilePin_31 ? _T_449 : _GEN_166; // @[RegisterRouter.scala 62:24]
  wire  _GEN_168 = profilePin_32 ? _T_476 : _GEN_167; // @[RegisterRouter.scala 62:24]
  wire  _GEN_169 = profilePin_33 ? _T_395 : _GEN_168; // @[RegisterRouter.scala 62:24]
  wire  _GEN_170 = profilePin_34 ? _T_440 : _GEN_169; // @[RegisterRouter.scala 62:24]
  wire  _GEN_171 = profilePin_58 | _GEN_170; // @[RegisterRouter.scala 62:24]
  wire  _GEN_172 = profilePin_59 | _GEN_171; // @[RegisterRouter.scala 62:24]
  wire  _GEN_173 = profilePin_60 | _GEN_172; // @[RegisterRouter.scala 62:24]
  wire  _GEN_174 = profilePin_61 | _GEN_173; // @[RegisterRouter.scala 62:24]
  wire  _GEN_175 = profilePin_62 | _GEN_174; // @[RegisterRouter.scala 62:24]
  wire  _GEN_176 = profilePin_63 | _GEN_175; // @[RegisterRouter.scala 62:24]
  wire  _GEN_177 = profilePin_35 ? _T_431 : _GEN_176; // @[RegisterRouter.scala 62:24]
  wire  _GEN_178 = profilePin_36 ? _T_404 : _GEN_177; // @[RegisterRouter.scala 62:24]
  wire  _GEN_179 = profilePin_66 | _GEN_178; // @[RegisterRouter.scala 62:24]
  wire  profilePin_68 = profilePin_67 | _GEN_179; // @[RegisterRouter.scala 62:24]
  wire [72:0] _GEN_673 = {_GEN_664,profilePin_63,profilePin_35,profilePin_36,profilePin_66,profilePin_67,profilePin_68,reset,reset,reset};
  wire [81:0] _GEN_682 = {_GEN_673,reset,reset,reset,reset,reset,reset,reset,reset,reset};
  wire  profilePin_86 = TLMonitor__GEN_1_2;
  wire  profilePin_87 = TLMonitor__GEN_2_1;
  wire  profilePin_88 = TLMonitor__GEN_3_2;
  wire  profilePin_89 = TLMonitor__GEN_4_3;
  wire [90:0] _GEN_691 = {_GEN_682,reset,reset,reset,reset,reset,profilePin_86,profilePin_87,profilePin_88,profilePin_89};
  wire  profilePin_90 = TLMonitor__GEN_5_0;
  wire  profilePin_91 = TLMonitor__GEN_7_1;
  wire  profilePin_92 = TLMonitor__GEN_8_0;
  wire  profilePin_93 = TLMonitor__GEN_9_0;
  wire  profilePin_94 = TLMonitor__GEN_10_2;
  wire  profilePin_95 = TLMonitor__GEN_11_1;
  wire  profilePin_96 = TLMonitor__GEN_12_0;
  wire  profilePin_97 = TLMonitor__GEN_17_0;
  wire  profilePin_98 = TLMonitor__GEN_20_1;
  wire [99:0] _GEN_700 = {_GEN_691,profilePin_90,profilePin_91,profilePin_92,profilePin_93,profilePin_94,profilePin_95,profilePin_96,profilePin_97,profilePin_98};
  wire  profilePin_99 = TLMonitor__GEN_21_2;
  wire  profilePin_100 = TLMonitor__GEN_22_0;
  wire  profilePin_101 = TLMonitor__GEN_23_0;
  wire  profilePin_102 = TLMonitor__GEN_24_1;
  wire  profilePin_103 = TLMonitor__GEN_25_0;
  wire  profilePin_104 = TLMonitor__GEN_26_0;
  wire  profilePin_105 = TLMonitor__GEN_27_1;
  wire  profilePin_106 = TLMonitor__GEN_28_0;
  wire  profilePin_107 = TLMonitor__GEN_29_0;
  wire [108:0] _GEN_709 = {_GEN_700,profilePin_99,profilePin_100,profilePin_101,profilePin_102,profilePin_103,profilePin_104,profilePin_105,profilePin_106,profilePin_107};
  wire  profilePin_108 = TLMonitor__GEN_30_1;
  wire  profilePin_161 = fifo__GEN_5_1;
  wire  profilePin_162 = fifo__GEN_6_0;
  wire  profilePin_163 = fifo__GEN_7_0;
  wire  profilePin_164 = fifo__GEN_8_1;
  wire  profilePin_165 = fifo__GEN_9_1;
  wire  profilePin_166 = fifo__GEN_10_0;
  wire  profilePin_167 = fifo__GEN_11_2;
  wire  profilePin_168 = mac__GEN_4_2;
  wire [117:0] _GEN_718 = {_GEN_709,profilePin_108,profilePin_161,profilePin_162,profilePin_163,profilePin_164,profilePin_165,profilePin_166,profilePin_167,profilePin_168};
  wire  profilePin_169 = mac__GEN_43_0;
  wire  profilePin_170 = mac__GEN_61_1;
  wire  profilePin_171 = mac__GEN_63_2;
  wire  profilePin_172 = mac__GEN_64_0;
  wire  profilePin_173 = mac__GEN_65_3;
  wire  profilePin_174 = mac__GEN_66_0;
  wire  profilePin_175 = mac__GEN_68_1;
  wire  profilePin_176 = mac__GEN_69_1;
  wire  profilePin_177 = mac__GEN_70_2;
  wire [126:0] _GEN_727 = {_GEN_718,profilePin_169,profilePin_170,profilePin_171,profilePin_172,profilePin_173,profilePin_174,profilePin_175,profilePin_176,profilePin_177};
  wire  profilePin_178 = mac__GEN_71_1;
  wire  profilePin_179 = mac__GEN_72_3;
  wire  profilePin_180 = mac__GEN_73_1;
  wire  profilePin_181 = mac__GEN_77_1;
  wire  profilePin_182 = mac__GEN_78_3;
  wire  profilePin_183 = mac__GEN_79_2;
  wire  profilePin_184 = mac__GEN_80_1;
  wire  profilePin_185 = mac__GEN_81_3;
  wire  profilePin_186 = mac__GEN_82_2;
  wire [135:0] _GEN_736 = {_GEN_727,profilePin_178,profilePin_179,profilePin_180,profilePin_181,profilePin_182,profilePin_183,profilePin_184,profilePin_185,profilePin_186};
  wire  profilePin_187 = mac__GEN_83_1;
  wire  profilePin_188 = mac__GEN_84_3;
  wire  profilePin_189 = mac__GEN_85_1;
  wire  profilePin_190 = mac__GEN_86_2;
  wire  profilePin_191 = mac__GEN_87_3;
  wire  profilePin_192 = mac__GEN_88_1;
  wire  profilePin_193 = mac__GEN_89_0;
  wire  profilePin_194 = mac__GEN_90_2;
  wire  profilePin_195 = mac__GEN_91_1;
  wire [144:0] _GEN_745 = {_GEN_736,profilePin_187,profilePin_188,profilePin_189,profilePin_190,profilePin_191,profilePin_192,profilePin_193,profilePin_194,profilePin_195};
  wire  profilePin_196 = mac__GEN_92_0;
  wire  profilePin_197 = mac__GEN_93_2;
  wire  profilePin_198 = mac__GEN_94_1;
  wire  profilePin_199 = mac__GEN_95_0;
  wire  profilePin_200 = mac__GEN_96_0;
  wire  profilePin_201 = mac__GEN_97_2;
  wire  profilePin_202 = mac__GEN_98_2;
  wire  profilePin_203 = mac__GEN_99_0;
  wire  profilePin_204 = mac__GEN_100_1;
  wire [153:0] _GEN_754 = {_GEN_745,profilePin_196,profilePin_197,profilePin_198,profilePin_199,profilePin_200,profilePin_201,profilePin_202,profilePin_203,profilePin_204};
  wire  profilePin_205 = mac__GEN_101_0;
  wire  profilePin_206 = mac__GEN_102_0;
  wire  profilePin_207 = mac__GEN_103_2;
  wire  profilePin_208 = mac__GEN_104_1;
  wire  profilePin_209 = mac__GEN_105_0;
  wire  profilePin_210 = mac__GEN_106_2;
  wire  profilePin_211 = mac__GEN_107_0;
  wire  profilePin_212 = mac__GEN_108_0;
  wire  profilePin_213 = mac__GEN_109_1;
  wire [162:0] _GEN_763 = {_GEN_754,profilePin_205,profilePin_206,profilePin_207,profilePin_208,profilePin_209,profilePin_210,profilePin_211,profilePin_212,profilePin_213};
  wire  profilePin_214 = mac__GEN_110_0;
  wire  profilePin_215 = mac__GEN_111_0;
  wire  profilePin_216 = mac__GEN_112_1;
  wire  profilePin_217 = mac__GEN_113_0;
  wire  profilePin_218 = mac__GEN_114_0;
  wire  profilePin_219 = mac__GEN_115_1;
  wire  profilePin_220 = mac__GEN_116_0;
  wire  profilePin_221 = mac__GEN_117_0;
  wire  profilePin_222 = mac__GEN_118_1;
  wire [171:0] _GEN_772 = {_GEN_763,profilePin_214,profilePin_215,profilePin_216,profilePin_217,profilePin_218,profilePin_219,profilePin_220,profilePin_221,profilePin_222};
  wire  profilePin_223 = mac__GEN_119_0;
  wire  profilePin_224 = mac__GEN_120_0;
  wire  profilePin_225 = mac__GEN_121_1;
  wire  profilePin_226 = mac__GEN_122_0;
  wire  profilePin_227 = mac__GEN_123_1;
  wire  profilePin_228 = mac__GEN_124_1;
  wire  profilePin_229 = mac__GEN_125_0;
  wire  profilePin_230 = mac__GEN_126_0;
  wire  profilePin_231 = mac__GEN_127_0;
  wire [180:0] _GEN_781 = {_GEN_772,profilePin_223,profilePin_224,profilePin_225,profilePin_226,profilePin_227,profilePin_228,profilePin_229,profilePin_230,profilePin_231};
  wire  profilePin_232 = mac__GEN_128_0;
  wire  profilePin_233 = mac__GEN_129_1;
  wire  profilePin_234 = mac__GEN_130_1;
  wire  profilePin_235 = mac__GEN_131_0;
  wire  profilePin_236 = mac__GEN_132_0;
  wire  profilePin_237 = mac__GEN_133_0;
  wire  profilePin_238 = mac__GEN_134_0;
  wire  profilePin_239 = mac__GEN_135_0;
  wire  profilePin_240 = fifo__GEN_0_0;
  wire [189:0] _GEN_790 = {_GEN_781,profilePin_232,profilePin_233,profilePin_234,profilePin_235,profilePin_236,profilePin_237,profilePin_238,profilePin_239,profilePin_240};
  wire  profilePin_241 = fifo__GEN_1_0;
  wire  profilePin_242 = fifo__GEN_2_0;
  wire  profilePin_243 = fifo__GEN_3_1;
  wire  profilePin_244 = fifo__GEN_4_1;
  wire  profilePin_245 = fifo__GEN_8_2;
  wire  profilePin_246 = fifo__GEN_0_1;
  wire  profilePin_247 = fifo__GEN_1_1;
  wire  profilePin_248 = fifo__GEN_2_2;
  wire  profilePin_249 = fifo__GEN_3_0;
  wire [198:0] _GEN_799 = {_GEN_790,profilePin_241,profilePin_242,profilePin_243,profilePin_244,profilePin_245,profilePin_246,profilePin_247,profilePin_248,profilePin_249};
  wire  profilePin_250 = fifo__GEN_4_0;
  wire  profilePin_251 = fifo__GEN_8_3;
  wire  profilePin_252 = mac__GEN_10_1;
  wire  profilePin_253 = mac__GEN_11_0;
  wire  profilePin_254 = mac__GEN_14_0;
  wire  profilePin_255 = mac__GEN_20_0;
  wire  profilePin_256 = mac__GEN_21_1;
  wire  profilePin_257 = mac__GEN_39_0;
  wire  profilePin_258 = mac__GEN_55_2;
  wire [207:0] _GEN_808 = {_GEN_799,profilePin_250,profilePin_251,profilePin_252,profilePin_253,profilePin_254,profilePin_255,profilePin_256,profilePin_257,profilePin_258};
  wire  profilePin_259 = mac__GEN_57_0;
  wire  profilePin_260 = mac__GEN_58_2;
  wire  profilePin_261 = mac__GEN_59_1;
  wire  profilePin_262 = mac__GEN_60_0;
  wire  profilePin_263 = mac__GEN_61_2;
  wire  profilePin_264 = mac__GEN_62_2;
  wire  profilePin_265 = mac__GEN_63_1;
  wire  profilePin_266 = mac__GEN_65_2;
  wire  profilePin_267 = mac__GEN_66_1;
  wire [216:0] _GEN_817 = {_GEN_808,profilePin_259,profilePin_260,profilePin_261,profilePin_262,profilePin_263,profilePin_264,profilePin_265,profilePin_266,profilePin_267};
  wire  profilePin_268 = mac__GEN_67_0;
  wire  profilePin_269 = mac__GEN_70_3;
  wire  profilePin_270 = mac__GEN_71_2;
  wire  profilePin_271 = mac__GEN_72_1;
  wire  profilePin_272 = mac__GEN_73_3;
  wire  profilePin_273 = mac__GEN_74_0;
  wire  profilePin_274 = mac__GEN_75_0;
  wire  profilePin_275 = mac__GEN_76_1;
  wire  profilePin_276 = mac__GEN_77_2;
  wire [225:0] _GEN_826 = {_GEN_817,profilePin_268,profilePin_269,profilePin_270,profilePin_271,profilePin_272,profilePin_273,profilePin_274,profilePin_275,profilePin_276};
  wire  profilePin_277 = mac__GEN_78_0;
  wire  profilePin_278 = mac__GEN_79_3;
  wire  profilePin_279 = mac__GEN_80_2;
  wire  profilePin_280 = mac__GEN_81_0;
  wire  profilePin_281 = mac__GEN_82_3;
  wire  profilePin_282 = mac__GEN_83_2;
  wire  profilePin_283 = mac__GEN_84_0;
  wire  profilePin_284 = mac__GEN_85_2;
  wire  profilePin_285 = mac__GEN_86_3;
  wire [234:0] _GEN_835 = {_GEN_826,profilePin_277,profilePin_278,profilePin_279,profilePin_280,profilePin_281,profilePin_282,profilePin_283,profilePin_284,profilePin_285};
  wire  profilePin_286 = mac__GEN_87_1;
  wire  profilePin_287 = mac__GEN_88_3;
  wire  profilePin_288 = mac__GEN_89_2;
  wire  profilePin_289 = mac__GEN_90_0;
  wire  profilePin_290 = mac__GEN_91_2;
  wire  profilePin_291 = mac__GEN_92_1;
  wire  profilePin_292 = mac__GEN_93_0;
  wire  profilePin_293 = mac__GEN_94_2;
  wire  profilePin_294 = mac__GEN_95_1;
  wire [243:0] _GEN_844 = {_GEN_835,profilePin_286,profilePin_287,profilePin_288,profilePin_289,profilePin_290,profilePin_291,profilePin_292,profilePin_293,profilePin_294};
  wire  profilePin_295 = mac__GEN_96_1;
  wire  profilePin_296 = mac__GEN_97_1;
  wire  profilePin_297 = mac__GEN_98_1;
  wire  profilePin_298 = mac__GEN_99_1;
  wire  profilePin_299 = mac__GEN_100_2;
  wire  profilePin_300 = mac__GEN_101_1;
  wire  profilePin_301 = mac__GEN_102_1;
  wire  profilePin_302 = mac__GEN_103_0;
  wire  profilePin_303 = mac__GEN_104_2;
  wire [252:0] _GEN_853 = {_GEN_844,profilePin_295,profilePin_296,profilePin_297,profilePin_298,profilePin_299,profilePin_300,profilePin_301,profilePin_302,profilePin_303};
  wire  profilePin_304 = mac__GEN_105_1;
  wire  profilePin_305 = mac__GEN_106_0;
  wire  profilePin_306 = mac__GEN_107_1;
  wire  profilePin_307 = mac__GEN_108_1;
  wire  profilePin_308 = mac__GEN_109_0;
  wire  profilePin_309 = mac__GEN_110_1;
  wire  profilePin_310 = mac__GEN_111_1;
  wire  profilePin_311 = mac__GEN_112_0;
  wire  profilePin_312 = mac__GEN_113_1;
  wire [261:0] _GEN_862 = {_GEN_853,profilePin_304,profilePin_305,profilePin_306,profilePin_307,profilePin_308,profilePin_309,profilePin_310,profilePin_311,profilePin_312};
  wire  profilePin_313 = mac__GEN_114_1;
  wire  profilePin_314 = mac__GEN_115_0;
  wire  profilePin_315 = mac__GEN_116_1;
  wire  profilePin_316 = mac__GEN_117_1;
  wire  profilePin_317 = mac__GEN_118_0;
  wire  profilePin_318 = mac__GEN_119_1;
  wire  profilePin_319 = mac__GEN_120_1;
  wire  profilePin_320 = mac__GEN_121_0;
  wire  profilePin_321 = mac__GEN_122_1;
  wire [270:0] _GEN_871 = {_GEN_862,profilePin_313,profilePin_314,profilePin_315,profilePin_316,profilePin_317,profilePin_318,profilePin_319,profilePin_320,profilePin_321};
  wire  profilePin_322 = mac__GEN_123_0;
  wire  profilePin_323 = mac__GEN_124_0;
  wire  profilePin_324 = mac__GEN_125_1;
  wire  profilePin_325 = mac__GEN_126_1;
  wire  profilePin_326 = mac__GEN_127_1;
  wire  profilePin_327 = mac__GEN_128_1;
  wire  profilePin_328 = mac__GEN_129_0;
  wire  profilePin_329 = mac__GEN_130_0;
  wire  profilePin_330 = mac__GEN_131_1;
  wire [279:0] _GEN_880 = {_GEN_871,profilePin_322,profilePin_323,profilePin_324,profilePin_325,profilePin_326,profilePin_327,profilePin_328,profilePin_329,profilePin_330};
  wire  profilePin_331 = mac__GEN_132_1;
  wire  profilePin_332 = mac__GEN_133_1;
  wire  profilePin_333 = mac__GEN_134_1;
  wire [282:0] _GEN_883 = {_GEN_880,profilePin_331,profilePin_332,profilePin_333};
  wire  profilePin_334 = mac__GEN_135_1;
  reg [1:0] ctrl_fmt_proto; // @[TLSPI.scala 58:17]
  reg  ctrl_fmt_endian; // @[TLSPI.scala 58:17]
  reg  ctrl_fmt_iodir; // @[TLSPI.scala 58:17]
  reg [3:0] ctrl_fmt_len; // @[TLSPI.scala 58:17]
  reg [11:0] ctrl_sck_div; // @[TLSPI.scala 58:17]
  reg  ctrl_sck_pol; // @[TLSPI.scala 58:17]
  reg  ctrl_sck_pha; // @[TLSPI.scala 58:17]
  reg [1:0] ctrl_cs_id; // @[TLSPI.scala 58:17]
  reg  ctrl_cs_dflt_0; // @[TLSPI.scala 58:17]
  reg  ctrl_cs_dflt_1; // @[TLSPI.scala 58:17]
  reg  ctrl_cs_dflt_2; // @[TLSPI.scala 58:17]
  reg  ctrl_cs_dflt_3; // @[TLSPI.scala 58:17]
  reg [1:0] ctrl_cs_mode; // @[TLSPI.scala 58:17]
  reg [7:0] ctrl_dla_cssck; // @[TLSPI.scala 58:17]
  reg [7:0] ctrl_dla_sckcs; // @[TLSPI.scala 58:17]
  reg [7:0] ctrl_dla_intercs; // @[TLSPI.scala 58:17]
  reg [7:0] ctrl_dla_interxfr; // @[TLSPI.scala 58:17]
  reg [3:0] ctrl_wm_tx; // @[TLSPI.scala 58:17]
  reg [3:0] ctrl_wm_rx; // @[TLSPI.scala 58:17]
  reg  ie_txwm; // @[TLSPI.scala 71:15]
  reg  ie_rxwm; // @[TLSPI.scala 71:15]
  wire  _T_261 = fifo_io_ip_txwm & ie_txwm; // @[TLSPI.scala 74:25]
  wire  _T_262 = fifo_io_ip_rxwm & ie_rxwm; // @[TLSPI.scala 74:49]
  wire  _T_269 = ~fifo_io_tx_ready; // @[RegMapFIFO.scala 24:9]
  wire  _T_272 = ~fifo_io_rx_valid; // @[RegMapFIFO.scala 45:21]
  wire [8:0] _T_283 = {auto_r_in_a_bits_source,auto_r_in_a_bits_size}; // @[Cat.scala 30:58]
  wire  _T_2086 = _T_2085 & _T_281; // @[RegisterRouter.scala 62:24]
  wire  _GEN_1 = profilePin_4 ? auto_r_in_a_bits_data[0] : ctrl_cs_dflt_0; // @[RegField.scala 135:88]
  wire  _GEN_2 = profilePin_5 ? auto_r_in_a_bits_data[1] : ctrl_cs_dflt_1; // @[RegField.scala 135:88]
  wire [1:0] _T_835 = {ctrl_cs_dflt_1, 1'h0}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _GEN_399 = {{1'd0}, ctrl_cs_dflt_0}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_839 = _GEN_399 | _T_835; // @[RegisterRouter.scala 62:24]
  wire  _GEN_3 = profilePin_6 ? auto_r_in_a_bits_data[2] : ctrl_cs_dflt_2; // @[RegField.scala 135:88]
  wire [2:0] _T_879 = {ctrl_cs_dflt_2, 2'h0}; // @[RegisterRouter.scala 62:24]
  wire [2:0] _GEN_400 = {{1'd0}, _T_839}; // @[RegisterRouter.scala 62:24]
  wire [2:0] _T_883 = _GEN_400 | _T_879; // @[RegisterRouter.scala 62:24]
  wire  _GEN_4 = profilePin_7 ? auto_r_in_a_bits_data[3] : ctrl_cs_dflt_3; // @[RegField.scala 135:88]
  wire [3:0] _T_923 = {ctrl_cs_dflt_3, 3'h0}; // @[RegisterRouter.scala 62:24]
  wire [3:0] _GEN_401 = {{1'd0}, _T_883}; // @[RegisterRouter.scala 62:24]
  wire [3:0] _T_927 = _GEN_401 | _T_923; // @[RegisterRouter.scala 62:24]
  wire  _T_930 = _T_684[7:0] != 8'h0; // @[RegisterRouter.scala 62:24]
  wire [23:0] _T_1011 = {ctrl_dla_sckcs, 16'h0}; // @[RegisterRouter.scala 62:24]
  wire [23:0] _GEN_402 = {{16'd0}, ctrl_dla_cssck}; // @[RegisterRouter.scala 62:24]
  wire [23:0] _T_1015 = _GEN_402 | _T_1011; // @[RegisterRouter.scala 62:24]
  wire  _T_1099 = fifo_io_ip_txwm; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1143 = {fifo_io_ip_rxwm, 1'h0}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _GEN_403 = {{1'd0}, _T_1099}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1147 = _GEN_403 | _T_1143; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1231 = {ctrl_sck_pol, 1'h0}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _GEN_404 = {{1'd0}, ctrl_sck_pha}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1235 = _GEN_404 | _T_1231; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1363 = {ie_rxwm, 1'h0}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _GEN_405 = {{1'd0}, ie_txwm}; // @[RegisterRouter.scala 62:24]
  wire [1:0] _T_1367 = _GEN_405 | _T_1363; // @[RegisterRouter.scala 62:24]
  wire  _T_2530 = _T_2383 & _T_2018[18]; // @[RegisterRouter.scala 62:24]
  wire  _T_2531 = _T_2530 & _T_449; // @[RegisterRouter.scala 62:24]
  wire  _T_1428 = _T_2531 & _T_934; // @[RegisterRouter.scala 62:24]
  wire  _T_1514 = ~_T_684[31]; // @[RegisterRouter.scala 62:24]
  wire  _T_1516 = ~_T_1514; // @[RegisterRouter.scala 62:24]
  wire  _T_1520 = _T_2531 & _T_1516; // @[RegisterRouter.scala 62:24]
  wire  _T_1526 = _T_1520 & auto_r_in_a_bits_data[31]; // @[RegMapFIFO.scala 26:26]
  wire  _T_1435 = ~_T_1526; // @[RegMapFIFO.scala 18:33]
  wire [31:0] _T_1544 = {_T_269, 31'h0}; // @[RegisterRouter.scala 62:24]
  wire [2:0] _T_1632 = {ctrl_fmt_endian, 2'h0}; // @[RegisterRouter.scala 62:24]
  wire [2:0] _GEN_406 = {{1'd0}, ctrl_fmt_proto}; // @[RegisterRouter.scala 62:24]
  wire [2:0] _T_1636 = _GEN_406 | _T_1632; // @[RegisterRouter.scala 62:24]
  wire [3:0] _T_1676 = {ctrl_fmt_iodir, 3'h0}; // @[RegisterRouter.scala 62:24]
  wire [3:0] _GEN_407 = {{1'd0}, _T_1636}; // @[RegisterRouter.scala 62:24]
  wire [3:0] _T_1680 = _GEN_407 | _T_1676; // @[RegisterRouter.scala 62:24]
  wire [19:0] _T_1720 = {ctrl_fmt_len, 16'h0}; // @[RegisterRouter.scala 62:24]
  wire [19:0] _GEN_408 = {{16'd0}, _T_1680}; // @[RegisterRouter.scala 62:24]
  wire [19:0] _T_1724 = _GEN_408 | _T_1720; // @[RegisterRouter.scala 62:24]
  wire [23:0] _T_1808 = {ctrl_dla_interxfr, 16'h0}; // @[RegisterRouter.scala 62:24]
  wire [23:0] _GEN_409 = {{16'd0}, ctrl_dla_intercs}; // @[RegisterRouter.scala 62:24]
  wire [23:0] _T_1812 = _GEN_409 | _T_1808; // @[RegisterRouter.scala 62:24]
  wire  _T_2241 = _T_2086 & _T_2018[19]; // @[RegisterRouter.scala 62:24]
  wire  _T_2242 = _T_2241 & _T_476; // @[RegisterRouter.scala 62:24]
  wire [7:0] _T_1852 = fifo_io_rx_bits; // @[RegisterRouter.scala 62:24]
  wire [30:0] _T_1900 = {{23'd0}, _T_1852}; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_1940 = {_T_272, 31'h0}; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_410 = {{1'd0}, _T_1900}; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_1944 = _GEN_410 | _T_1940; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_0 = {{20'd0}, ctrl_sck_div}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_1 = {{30'd0}, _T_1235}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_182 = profilePin_24 ? _T_3319_1 : _T_3319_0; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_183 = profilePin_38 ? 32'h0 : _GEN_182; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_184 = profilePin_39 ? 32'h0 : _GEN_183; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_4 = {{30'd0}, ctrl_cs_id}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_185 = profilePin_25 ? _T_3319_4 : _GEN_184; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_5 = {{28'd0}, _T_927}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_186 = profilePin_26 ? _T_3319_5 : _GEN_185; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_6 = {{30'd0}, ctrl_cs_mode}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_187 = profilePin_27 ? _T_3319_6 : _GEN_186; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_188 = profilePin_43 ? 32'h0 : _GEN_187; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_189 = profilePin_44 ? 32'h0 : _GEN_188; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_190 = profilePin_45 ? 32'h0 : _GEN_189; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_10 = {{8'd0}, _T_1015}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_191 = profilePin_28 ? _T_3319_10 : _GEN_190; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_11 = {{8'd0}, _T_1812}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_192 = profilePin_29 ? _T_3319_11 : _GEN_191; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_193 = profilePin_48 ? 32'h0 : _GEN_192; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_194 = profilePin_49 ? 32'h0 : _GEN_193; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_195 = profilePin_50 ? 32'h0 : _GEN_194; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_196 = profilePin_51 ? 32'h0 : _GEN_195; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_16 = {{12'd0}, _T_1724}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_197 = profilePin_30 ? _T_3319_16 : _GEN_196; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_198 = profilePin_53 ? 32'h0 : _GEN_197; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_199 = profilePin_31 ? _T_1544 : _GEN_198; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_200 = profilePin_32 ? _T_1944 : _GEN_199; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_20 = {{28'd0}, ctrl_wm_tx}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_201 = profilePin_33 ? _T_3319_20 : _GEN_200; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_21 = {{28'd0}, ctrl_wm_rx}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_202 = profilePin_34 ? _T_3319_21 : _GEN_201; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_203 = profilePin_58 ? 32'h0 : _GEN_202; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_204 = profilePin_59 ? 32'h0 : _GEN_203; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_205 = profilePin_60 ? 32'h0 : _GEN_204; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_206 = profilePin_61 ? 32'h0 : _GEN_205; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_207 = profilePin_62 ? 32'h0 : _GEN_206; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_208 = profilePin_63 ? 32'h0 : _GEN_207; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_28 = {{30'd0}, _T_1367}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_209 = profilePin_35 ? _T_3319_28 : _GEN_208; // @[RegisterRouter.scala 62:24]
  wire [31:0] _T_3319_29 = {{30'd0}, _T_1147}; // @[RegisterRouter.scala 62:24 RegisterRouter.scala 62:24]
  wire [31:0] _GEN_210 = profilePin_36 ? _T_3319_29 : _GEN_209; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_211 = profilePin_66 ? 32'h0 : _GEN_210; // @[RegisterRouter.scala 62:24]
  wire [31:0] _GEN_212 = profilePin_67 ? 32'h0 : _GEN_211; // @[RegisterRouter.scala 62:24]
  TLMonitor_66 TLMonitor ( // @[Nodes.scala 25:25]
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
    ._GEN_23_0(TLMonitor__GEN_23_0),
    ._GEN_87_0(TLMonitor__GEN_87_0),
    ._GEN_39_1(TLMonitor__GEN_39_1),
    ._GEN_70_0(TLMonitor__GEN_70_0),
    ._GEN_63_0(TLMonitor__GEN_63_0),
    ._GEN_46_0(TLMonitor__GEN_46_0),
    ._GEN_33_0(TLMonitor__GEN_33_0),
    ._GEN_42_0(TLMonitor__GEN_42_0),
    ._GEN_49_0(TLMonitor__GEN_49_0),
    ._GEN_56_1(TLMonitor__GEN_56_1),
    ._GEN_26_0(TLMonitor__GEN_26_0),
    ._GEN_36_0(TLMonitor__GEN_36_0),
    ._GEN_29_0(TLMonitor__GEN_29_0),
    ._GEN_86_1(TLMonitor__GEN_86_1),
    ._GEN_12_0(TLMonitor__GEN_12_0),
    ._GEN_79_0(TLMonitor__GEN_79_0),
    ._GEN_72_0(TLMonitor__GEN_72_0),
    ._GEN_21_2(TLMonitor__GEN_21_2),
    ._GEN_65_1(TLMonitor__GEN_65_1),
    ._GEN_55_0(TLMonitor__GEN_55_0),
    ._GEN_5_0(TLMonitor__GEN_5_0),
    ._GEN_82_0(TLMonitor__GEN_82_0),
    ._GEN_51_0(TLMonitor__GEN_51_0),
    ._GEN_58_0(TLMonitor__GEN_58_0),
    ._GEN_35_1(TLMonitor__GEN_35_1),
    ._GEN_89_1(TLMonitor__GEN_89_1),
    ._GEN_2_1(TLMonitor__GEN_2_1),
    ._GEN_9_0(TLMonitor__GEN_9_0),
    ._GEN_75_1(TLMonitor__GEN_75_1),
    ._GEN_38_1(TLMonitor__GEN_38_1),
    ._GEN_44_1(TLMonitor__GEN_44_1),
    ._GEN_62_1(TLMonitor__GEN_62_1),
    ._GEN_68_2(TLMonitor__GEN_68_2),
    ._GEN_22_0(TLMonitor__GEN_22_0),
    ._GEN_32_1(TLMonitor__GEN_32_1),
    ._GEN_25_0(TLMonitor__GEN_25_0),
    ._GEN_48_0(TLMonitor__GEN_48_0),
    ._GEN_41_1(TLMonitor__GEN_41_1),
    ._GEN_8_0(TLMonitor__GEN_8_0),
    ._GEN_81_1(TLMonitor__GEN_81_1),
    ._GEN_28_0(TLMonitor__GEN_28_0),
    ._GEN_1_2(TLMonitor__GEN_1_2),
    ._GEN_67_2(TLMonitor__GEN_67_2),
    ._GEN_84_1(TLMonitor__GEN_84_1),
    ._GEN_11_1(TLMonitor__GEN_11_1),
    ._GEN_4_3(TLMonitor__GEN_4_3),
    ._GEN_60_1(TLMonitor__GEN_60_1),
    ._GEN_88_2(TLMonitor__GEN_88_2),
    ._GEN_47_1(TLMonitor__GEN_47_1),
    ._GEN_78_1(TLMonitor__GEN_78_1),
    ._GEN_40_1(TLMonitor__GEN_40_1),
    ._GEN_64_2(TLMonitor__GEN_64_2),
    ._GEN_20_1(TLMonitor__GEN_20_1),
    ._GEN_71_3(TLMonitor__GEN_71_3),
    ._GEN_34_1(TLMonitor__GEN_34_1),
    ._GEN_57_1(TLMonitor__GEN_57_1),
    ._GEN_50_1(TLMonitor__GEN_50_1),
    ._GEN_74_1(TLMonitor__GEN_74_1),
    ._GEN_27_1(TLMonitor__GEN_27_1),
    ._GEN_37_1(TLMonitor__GEN_37_1),
    ._GEN_54_1(TLMonitor__GEN_54_1),
    ._GEN_30_1(TLMonitor__GEN_30_1),
    ._GEN_43_2(TLMonitor__GEN_43_2),
    ._GEN_17_0(TLMonitor__GEN_17_0),
    ._GEN_24_1(TLMonitor__GEN_24_1),
    ._GEN_7_1(TLMonitor__GEN_7_1),
    ._GEN_80_3(TLMonitor__GEN_80_3),
    ._GEN_73_2(TLMonitor__GEN_73_2),
    ._GEN_59_2(TLMonitor__GEN_59_2),
    ._GEN_66_3(TLMonitor__GEN_66_3),
    ._GEN_52_1(TLMonitor__GEN_52_1),
    ._GEN_83_3(TLMonitor__GEN_83_3),
    ._GEN_3_2(TLMonitor__GEN_3_2),
    ._GEN_76_2(TLMonitor__GEN_76_2),
    ._GEN_10_2(TLMonitor__GEN_10_2)
  );
  SPIFIFO_1 fifo ( // @[TLSPI.scala 60:20]
    .metaReset(fifo_metaReset),
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_ctrl_fmt_proto(fifo_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(fifo_io_ctrl_fmt_endian),
    .io_ctrl_fmt_iodir(fifo_io_ctrl_fmt_iodir),
    .io_ctrl_fmt_len(fifo_io_ctrl_fmt_len),
    .io_ctrl_cs_mode(fifo_io_ctrl_cs_mode),
    .io_ctrl_wm_tx(fifo_io_ctrl_wm_tx),
    .io_ctrl_wm_rx(fifo_io_ctrl_wm_rx),
    .io_link_tx_ready(fifo_io_link_tx_ready),
    .io_link_tx_valid(fifo_io_link_tx_valid),
    .io_link_tx_bits(fifo_io_link_tx_bits),
    .io_link_rx_valid(fifo_io_link_rx_valid),
    .io_link_rx_bits(fifo_io_link_rx_bits),
    .io_link_cnt(fifo_io_link_cnt),
    .io_link_fmt_proto(fifo_io_link_fmt_proto),
    .io_link_fmt_endian(fifo_io_link_fmt_endian),
    .io_link_fmt_iodir(fifo_io_link_fmt_iodir),
    .io_link_cs_set(fifo_io_link_cs_set),
    .io_link_cs_clear(fifo_io_link_cs_clear),
    .io_tx_ready(fifo_io_tx_ready),
    .io_tx_valid(fifo_io_tx_valid),
    .io_tx_bits(fifo_io_tx_bits),
    .io_rx_ready(fifo_io_rx_ready),
    .io_rx_valid(fifo_io_rx_valid),
    .io_rx_bits(fifo_io_rx_bits),
    .io_ip_txwm(fifo_io_ip_txwm),
    .io_ip_rxwm(fifo_io_ip_rxwm),
    ._GEN_2_0(fifo__GEN_2_0),
    ._GEN_1_0(fifo__GEN_1_0),
    ._GEN_7_0(fifo__GEN_7_0),
    ._GEN_4_0(fifo__GEN_4_0),
    ._GEN_4_1(fifo__GEN_4_1),
    ._GEN_10_0(fifo__GEN_10_0),
    ._GEN_1_1(fifo__GEN_1_1),
    ._GEN_3_0(fifo__GEN_3_0),
    ._GEN_0_0(fifo__GEN_0_0),
    ._GEN_6_0(fifo__GEN_6_0),
    ._GEN_9_1(fifo__GEN_9_1),
    ._GEN_3_1(fifo__GEN_3_1),
    ._GEN_0_1(fifo__GEN_0_1),
    ._GEN_8_1(fifo__GEN_8_1),
    ._GEN_11_2(fifo__GEN_11_2),
    ._GEN_8_2(fifo__GEN_8_2),
    ._GEN_8_3(fifo__GEN_8_3),
    ._GEN_2_2(fifo__GEN_2_2),
    ._GEN_5_1(fifo__GEN_5_1)
  );
  SPIMedia_1 mac ( // @[TLSPI.scala 61:19]
    .metaReset(mac_metaReset),
    .clock(mac_clock),
    .reset(mac_reset),
    .io_port_sck(mac_io_port_sck),
    .io_port_dq_0_i(mac_io_port_dq_0_i),
    .io_port_dq_0_o(mac_io_port_dq_0_o),
    .io_port_dq_0_oe(mac_io_port_dq_0_oe),
    .io_port_dq_1_i(mac_io_port_dq_1_i),
    .io_port_dq_1_o(mac_io_port_dq_1_o),
    .io_port_dq_1_oe(mac_io_port_dq_1_oe),
    .io_port_dq_2_i(mac_io_port_dq_2_i),
    .io_port_dq_2_o(mac_io_port_dq_2_o),
    .io_port_dq_2_oe(mac_io_port_dq_2_oe),
    .io_port_dq_3_i(mac_io_port_dq_3_i),
    .io_port_dq_3_o(mac_io_port_dq_3_o),
    .io_port_dq_3_oe(mac_io_port_dq_3_oe),
    .io_port_cs_0(mac_io_port_cs_0),
    .io_port_cs_1(mac_io_port_cs_1),
    .io_port_cs_2(mac_io_port_cs_2),
    .io_port_cs_3(mac_io_port_cs_3),
    .io_ctrl_sck_div(mac_io_ctrl_sck_div),
    .io_ctrl_sck_pol(mac_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(mac_io_ctrl_sck_pha),
    .io_ctrl_dla_cssck(mac_io_ctrl_dla_cssck),
    .io_ctrl_dla_sckcs(mac_io_ctrl_dla_sckcs),
    .io_ctrl_dla_intercs(mac_io_ctrl_dla_intercs),
    .io_ctrl_dla_interxfr(mac_io_ctrl_dla_interxfr),
    .io_ctrl_cs_id(mac_io_ctrl_cs_id),
    .io_ctrl_cs_dflt_0(mac_io_ctrl_cs_dflt_0),
    .io_ctrl_cs_dflt_1(mac_io_ctrl_cs_dflt_1),
    .io_ctrl_cs_dflt_2(mac_io_ctrl_cs_dflt_2),
    .io_ctrl_cs_dflt_3(mac_io_ctrl_cs_dflt_3),
    .io_link_tx_ready(mac_io_link_tx_ready),
    .io_link_tx_valid(mac_io_link_tx_valid),
    .io_link_tx_bits(mac_io_link_tx_bits),
    .io_link_rx_valid(mac_io_link_rx_valid),
    .io_link_rx_bits(mac_io_link_rx_bits),
    .io_link_cnt(mac_io_link_cnt),
    .io_link_fmt_proto(mac_io_link_fmt_proto),
    .io_link_fmt_endian(mac_io_link_fmt_endian),
    .io_link_fmt_iodir(mac_io_link_fmt_iodir),
    .io_link_cs_set(mac_io_link_cs_set),
    .io_link_cs_clear(mac_io_link_cs_clear),
    ._GEN_115_0(mac__GEN_115_0),
    ._GEN_105_0(mac__GEN_105_0),
    ._GEN_39_0(mac__GEN_39_0),
    ._GEN_111_0(mac__GEN_111_0),
    ._GEN_96_0(mac__GEN_96_0),
    ._GEN_132_0(mac__GEN_132_0),
    ._GEN_109_0(mac__GEN_109_0),
    ._GEN_117_0(mac__GEN_117_0),
    ._GEN_121_0(mac__GEN_121_0),
    ._GEN_130_0(mac__GEN_130_0),
    ._GEN_126_0(mac__GEN_126_0),
    ._GEN_120_0(mac__GEN_120_0),
    ._GEN_124_0(mac__GEN_124_0),
    ._GEN_93_0(mac__GEN_93_0),
    ._GEN_114_0(mac__GEN_114_0),
    ._GEN_83_1(mac__GEN_83_1),
    ._GEN_87_1(mac__GEN_87_1),
    ._GEN_99_0(mac__GEN_99_0),
    ._GEN_118_0(mac__GEN_118_0),
    ._GEN_135_0(mac__GEN_135_0),
    ._GEN_103_0(mac__GEN_103_0),
    ._GEN_89_0(mac__GEN_89_0),
    ._GEN_102_0(mac__GEN_102_0),
    ._GEN_92_0(mac__GEN_92_0),
    ._GEN_106_0(mac__GEN_106_0),
    ._GEN_75_0(mac__GEN_75_0),
    ._GEN_43_0(mac__GEN_43_0),
    ._GEN_108_0(mac__GEN_108_0),
    ._GEN_77_1(mac__GEN_77_1),
    ._GEN_81_0(mac__GEN_81_0),
    ._GEN_96_1(mac__GEN_96_1),
    ._GEN_90_0(mac__GEN_90_0),
    ._GEN_68_1(mac__GEN_68_1),
    ._GEN_112_0(mac__GEN_112_0),
    ._GEN_67_0(mac__GEN_67_0),
    ._GEN_84_0(mac__GEN_84_0),
    ._GEN_95_0(mac__GEN_95_0),
    ._GEN_99_1(mac__GEN_99_1),
    ._GEN_60_0(mac__GEN_60_0),
    ._GEN_86_2(mac__GEN_86_2),
    ._GEN_71_1(mac__GEN_71_1),
    ._GEN_80_1(mac__GEN_80_1),
    ._GEN_78_0(mac__GEN_78_0),
    ._GEN_21_1(mac__GEN_21_1),
    ._GEN_119_0(mac__GEN_119_0),
    ._GEN_57_0(mac__GEN_57_0),
    ._GEN_72_1(mac__GEN_72_1),
    ._GEN_123_0(mac__GEN_123_0),
    ._GEN_64_0(mac__GEN_64_0),
    ._GEN_134_0(mac__GEN_134_0),
    ._GEN_63_1(mac__GEN_63_1),
    ._GEN_128_0(mac__GEN_128_0),
    ._GEN_132_1(mac__GEN_132_1),
    ._GEN_11_0(mac__GEN_11_0),
    ._GEN_107_0(mac__GEN_107_0),
    ._GEN_101_0(mac__GEN_101_0),
    ._GEN_111_1(mac__GEN_111_1),
    ._GEN_105_1(mac__GEN_105_1),
    ._GEN_120_1(mac__GEN_120_1),
    ._GEN_122_0(mac__GEN_122_0),
    ._GEN_126_1(mac__GEN_126_1),
    ._GEN_131_0(mac__GEN_131_0),
    ._GEN_135_1(mac__GEN_135_1),
    ._GEN_129_0(mac__GEN_129_0),
    ._GEN_116_0(mac__GEN_116_0),
    ._GEN_125_0(mac__GEN_125_0),
    ._GEN_98_1(mac__GEN_98_1),
    ._GEN_110_0(mac__GEN_110_0),
    ._GEN_114_1(mac__GEN_114_1),
    ._GEN_108_1(mac__GEN_108_1),
    ._GEN_104_1(mac__GEN_104_1),
    ._GEN_94_1(mac__GEN_94_1),
    ._GEN_82_2(mac__GEN_82_2),
    ._GEN_98_2(mac__GEN_98_2),
    ._GEN_63_2(mac__GEN_63_2),
    ._GEN_113_0(mac__GEN_113_0),
    ._GEN_71_2(mac__GEN_71_2),
    ._GEN_80_2(mac__GEN_80_2),
    ._GEN_88_1(mac__GEN_88_1),
    ._GEN_102_1(mac__GEN_102_1),
    ._GEN_92_1(mac__GEN_92_1),
    ._GEN_86_3(mac__GEN_86_3),
    ._GEN_117_1(mac__GEN_117_1),
    ._GEN_73_1(mac__GEN_73_1),
    ._GEN_91_1(mac__GEN_91_1),
    ._GEN_89_2(mac__GEN_89_2),
    ._GEN_74_0(mac__GEN_74_0),
    ._GEN_4_2(mac__GEN_4_2),
    ._GEN_66_0(mac__GEN_66_0),
    ._GEN_66_1(mac__GEN_66_1),
    ._GEN_95_1(mac__GEN_95_1),
    ._GEN_85_1(mac__GEN_85_1),
    ._GEN_10_1(mac__GEN_10_1),
    ._GEN_79_2(mac__GEN_79_2),
    ._GEN_130_1(mac__GEN_130_1),
    ._GEN_59_1(mac__GEN_59_1),
    ._GEN_83_2(mac__GEN_83_2),
    ._GEN_134_1(mac__GEN_134_1),
    ._GEN_20_0(mac__GEN_20_0),
    ._GEN_70_2(mac__GEN_70_2),
    ._GEN_77_2(mac__GEN_77_2),
    ._GEN_118_1(mac__GEN_118_1),
    ._GEN_62_2(mac__GEN_62_2),
    ._GEN_133_0(mac__GEN_133_0),
    ._GEN_55_2(mac__GEN_55_2),
    ._GEN_122_1(mac__GEN_122_1),
    ._GEN_112_1(mac__GEN_112_1),
    ._GEN_116_1(mac__GEN_116_1),
    ._GEN_127_0(mac__GEN_127_0),
    ._GEN_100_1(mac__GEN_100_1),
    ._GEN_131_1(mac__GEN_131_1),
    ._GEN_121_1(mac__GEN_121_1),
    ._GEN_104_2(mac__GEN_104_2),
    ._GEN_106_2(mac__GEN_106_2),
    ._GEN_115_1(mac__GEN_115_1),
    ._GEN_125_1(mac__GEN_125_1),
    ._GEN_119_1(mac__GEN_119_1),
    ._GEN_113_1(mac__GEN_113_1),
    ._GEN_128_1(mac__GEN_128_1),
    ._GEN_109_1(mac__GEN_109_1),
    ._GEN_103_2(mac__GEN_103_2),
    ._GEN_78_3(mac__GEN_78_3),
    ._GEN_82_3(mac__GEN_82_3),
    ._GEN_93_2(mac__GEN_93_2),
    ._GEN_107_1(mac__GEN_107_1),
    ._GEN_97_1(mac__GEN_97_1),
    ._GEN_124_1(mac__GEN_124_1),
    ._GEN_81_3(mac__GEN_81_3),
    ._GEN_87_3(mac__GEN_87_3),
    ._GEN_100_2(mac__GEN_100_2),
    ._GEN_85_2(mac__GEN_85_2),
    ._GEN_61_1(mac__GEN_61_1),
    ._GEN_72_3(mac__GEN_72_3),
    ._GEN_97_2(mac__GEN_97_2),
    ._GEN_79_3(mac__GEN_79_3),
    ._GEN_101_1(mac__GEN_101_1),
    ._GEN_91_2(mac__GEN_91_2),
    ._GEN_110_1(mac__GEN_110_1),
    ._GEN_61_2(mac__GEN_61_2),
    ._GEN_65_2(mac__GEN_65_2),
    ._GEN_88_3(mac__GEN_88_3),
    ._GEN_90_2(mac__GEN_90_2),
    ._GEN_94_2(mac__GEN_94_2),
    ._GEN_84_3(mac__GEN_84_3),
    ._GEN_65_3(mac__GEN_65_3),
    ._GEN_73_3(mac__GEN_73_3),
    ._GEN_69_1(mac__GEN_69_1),
    ._GEN_76_1(mac__GEN_76_1),
    ._GEN_127_1(mac__GEN_127_1),
    ._GEN_129_1(mac__GEN_129_1),
    ._GEN_14_0(mac__GEN_14_0),
    ._GEN_133_1(mac__GEN_133_1),
    ._GEN_123_1(mac__GEN_123_1),
    ._GEN_58_2(mac__GEN_58_2),
    ._GEN_70_3(mac__GEN_70_3)
  );
  assign TLMonitor_metaReset = metaReset;
  assign fifo_metaReset = metaReset;
  assign mac_metaReset = metaReset;
  assign auto_int_out_0 = _T_261 | _T_262; // @[LazyModule.scala 171:49]
  assign auto_r_in_a_ready = auto_r_in_d_ready; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_valid = 1'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_opcode = 3'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_param = 2'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_size = 2'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_source = 7'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_address = 29'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_mask = 4'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_b_bits_data = 32'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_c_ready = 1'h1; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_valid = auto_r_in_a_valid; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_opcode = {{2'd0}, _T_281}; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_param = 2'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_size = _T_283[1:0]; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_source = _T_283[8:2]; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_sink = 1'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_data = profilePin_68 ? _GEN_212 : 32'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_d_bits_error = 1'h0; // @[LazyModule.scala 171:31]
  assign auto_r_in_e_ready = 1'h1; // @[LazyModule.scala 171:31]
  assign io_port_sck = mac_io_port_sck; // @[TLSPI.scala 62:11]
  assign io_port_dq_0_o = mac_io_port_dq_0_o; // @[TLSPI.scala 62:11]
  assign io_port_dq_0_oe = mac_io_port_dq_0_oe; // @[TLSPI.scala 62:11]
  assign io_port_dq_1_o = mac_io_port_dq_1_o; // @[TLSPI.scala 62:11]
  assign io_port_dq_1_oe = mac_io_port_dq_1_oe; // @[TLSPI.scala 62:11]
  assign io_port_dq_2_o = mac_io_port_dq_2_o; // @[TLSPI.scala 62:11]
  assign io_port_dq_2_oe = mac_io_port_dq_2_oe; // @[TLSPI.scala 62:11]
  assign io_port_dq_3_o = mac_io_port_dq_3_o; // @[TLSPI.scala 62:11]
  assign io_port_dq_3_oe = mac_io_port_dq_3_oe; // @[TLSPI.scala 62:11]
  assign io_port_cs_0 = mac_io_port_cs_0; // @[TLSPI.scala 62:11]
  assign io_port_cs_1 = mac_io_port_cs_1; // @[TLSPI.scala 62:11]
  assign io_port_cs_2 = mac_io_port_cs_2; // @[TLSPI.scala 62:11]
  assign io_port_cs_3 = mac_io_port_cs_3; // @[TLSPI.scala 62:11]
  assign assert_out = {_GEN_272,profilePin_160};
  assign auto_cover_out = {_GEN_883,profilePin_334};
  assign TLMonitor_clock = clock;
  assign TLMonitor_reset = reset;
  assign TLMonitor_io_in_a_ready = auto_r_in_d_ready; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_valid = auto_r_in_a_valid; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_opcode = auto_r_in_a_bits_opcode; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_param = auto_r_in_a_bits_param; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_size = auto_r_in_a_bits_size; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_source = auto_r_in_a_bits_source; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_address = auto_r_in_a_bits_address; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_a_bits_mask = auto_r_in_a_bits_mask; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_c_valid = auto_r_in_c_valid; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_ready = auto_r_in_d_ready; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_valid = auto_r_in_a_valid; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_281}; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_bits_size = _T_283[1:0]; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_d_bits_source = _T_283[8:2]; // @[Nodes.scala 26:19]
  assign TLMonitor_io_in_e_valid = auto_r_in_e_valid; // @[Nodes.scala 26:19]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_ctrl_fmt_proto = ctrl_fmt_proto; // @[TLSPI.scala 64:20]
  assign fifo_io_ctrl_fmt_endian = ctrl_fmt_endian; // @[TLSPI.scala 64:20]
  assign fifo_io_ctrl_fmt_iodir = ctrl_fmt_iodir; // @[TLSPI.scala 64:20]
  assign fifo_io_ctrl_fmt_len = ctrl_fmt_len; // @[TLSPI.scala 64:20]
  assign fifo_io_ctrl_cs_mode = ctrl_cs_mode; // @[TLSPI.scala 65:19]
  assign fifo_io_ctrl_wm_tx = ctrl_wm_tx; // @[TLSPI.scala 66:19]
  assign fifo_io_ctrl_wm_rx = ctrl_wm_rx; // @[TLSPI.scala 66:19]
  assign fifo_io_link_tx_ready = mac_io_link_tx_ready; // @[TLSPI.scala 118:17]
  assign fifo_io_link_rx_valid = mac_io_link_rx_valid; // @[TLSPI.scala 118:17]
  assign fifo_io_link_rx_bits = mac_io_link_rx_bits; // @[TLSPI.scala 118:17]
  assign fifo_io_tx_valid = _T_1428 & _T_1435; // @[RegMapFIFO.scala 18:21]
  assign fifo_io_tx_bits = auto_r_in_a_bits_data[7:0]; // @[RegMapFIFO.scala 19:20]
  assign fifo_io_rx_ready = _T_2242 & _T_930; // @[RegMapFIFO.scala 41:21]
  assign mac_clock = clock;
  assign mac_reset = reset;
  assign mac_io_port_dq_0_i = io_port_dq_0_i; // @[TLSPI.scala 62:11]
  assign mac_io_port_dq_1_i = io_port_dq_1_i; // @[TLSPI.scala 62:11]
  assign mac_io_port_dq_2_i = io_port_dq_2_i; // @[TLSPI.scala 62:11]
  assign mac_io_port_dq_3_i = io_port_dq_3_i; // @[TLSPI.scala 62:11]
  assign mac_io_ctrl_sck_div = ctrl_sck_div; // @[TLSPI.scala 67:19]
  assign mac_io_ctrl_sck_pol = ctrl_sck_pol; // @[TLSPI.scala 67:19]
  assign mac_io_ctrl_sck_pha = ctrl_sck_pha; // @[TLSPI.scala 67:19]
  assign mac_io_ctrl_dla_cssck = ctrl_dla_cssck; // @[TLSPI.scala 68:19]
  assign mac_io_ctrl_dla_sckcs = ctrl_dla_sckcs; // @[TLSPI.scala 68:19]
  assign mac_io_ctrl_dla_intercs = ctrl_dla_intercs; // @[TLSPI.scala 68:19]
  assign mac_io_ctrl_dla_interxfr = ctrl_dla_interxfr; // @[TLSPI.scala 68:19]
  assign mac_io_ctrl_cs_id = ctrl_cs_id; // @[TLSPI.scala 69:18]
  assign mac_io_ctrl_cs_dflt_0 = ctrl_cs_dflt_0; // @[TLSPI.scala 69:18]
  assign mac_io_ctrl_cs_dflt_1 = ctrl_cs_dflt_1; // @[TLSPI.scala 69:18]
  assign mac_io_ctrl_cs_dflt_2 = ctrl_cs_dflt_2; // @[TLSPI.scala 69:18]
  assign mac_io_ctrl_cs_dflt_3 = ctrl_cs_dflt_3; // @[TLSPI.scala 69:18]
  assign mac_io_link_tx_valid = fifo_io_link_tx_valid; // @[TLSPI.scala 118:17]
  assign mac_io_link_tx_bits = fifo_io_link_tx_bits; // @[TLSPI.scala 118:17]
  assign mac_io_link_cnt = fifo_io_link_cnt; // @[TLSPI.scala 118:17]
  assign mac_io_link_fmt_proto = fifo_io_link_fmt_proto; // @[TLSPI.scala 118:17]
  assign mac_io_link_fmt_endian = fifo_io_link_fmt_endian; // @[TLSPI.scala 118:17]
  assign mac_io_link_fmt_iodir = fifo_io_link_fmt_iodir; // @[TLSPI.scala 118:17]
  assign mac_io_link_cs_set = fifo_io_link_cs_set; // @[TLSPI.scala 118:17]
  assign mac_io_link_cs_clear = fifo_io_link_cs_clear; // @[TLSPI.scala 118:17]
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
  ctrl_fmt_proto = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  ctrl_fmt_endian = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ctrl_fmt_iodir = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ctrl_fmt_len = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  ctrl_sck_div = _RAND_4[11:0];
  _RAND_5 = {1{`RANDOM}};
  ctrl_sck_pol = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ctrl_sck_pha = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ctrl_cs_id = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  ctrl_cs_dflt_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ctrl_cs_dflt_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ctrl_cs_dflt_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ctrl_cs_dflt_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ctrl_cs_mode = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  ctrl_dla_cssck = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  ctrl_dla_sckcs = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  ctrl_dla_intercs = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  ctrl_dla_interxfr = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  ctrl_wm_tx = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  ctrl_wm_rx = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  ie_txwm = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  ie_rxwm = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      ctrl_fmt_proto <= 2'h0;
    end else if (reset) begin
      ctrl_fmt_proto <= 2'h0;
    end else if (profilePin_17) begin
      ctrl_fmt_proto <= auto_r_in_a_bits_data[1:0];
    end
    if (metaReset) begin
      ctrl_fmt_endian <= 1'h0;
    end else if (reset) begin
      ctrl_fmt_endian <= 1'h0;
    end else if (profilePin_18) begin
      ctrl_fmt_endian <= auto_r_in_a_bits_data[2];
    end
    if (metaReset) begin
      ctrl_fmt_iodir <= 1'h0;
    end else if (reset) begin
      ctrl_fmt_iodir <= 1'h0;
    end else if (profilePin_19) begin
      ctrl_fmt_iodir <= auto_r_in_a_bits_data[3];
    end
    if (metaReset) begin
      ctrl_fmt_len <= 4'h0;
    end else if (reset) begin
      ctrl_fmt_len <= 4'h8;
    end else if (profilePin_20) begin
      ctrl_fmt_len <= auto_r_in_a_bits_data[19:16];
    end
    if (metaReset) begin
      ctrl_sck_div <= 12'h0;
    end else if (reset) begin
      ctrl_sck_div <= 12'h3;
    end else if (profilePin_3) begin
      ctrl_sck_div <= auto_r_in_a_bits_data[11:0];
    end
    if (metaReset) begin
      ctrl_sck_pol <= 1'h0;
    end else if (reset) begin
      ctrl_sck_pol <= 1'h0;
    end else if (profilePin_12) begin
      ctrl_sck_pol <= auto_r_in_a_bits_data[1];
    end
    if (metaReset) begin
      ctrl_sck_pha <= 1'h0;
    end else if (reset) begin
      ctrl_sck_pha <= 1'h0;
    end else if (profilePin_11) begin
      ctrl_sck_pha <= auto_r_in_a_bits_data[0];
    end
    if (metaReset) begin
      ctrl_cs_id <= 2'h0;
    end else if (reset) begin
      ctrl_cs_id <= 2'h0;
    end else if (profilePin_23) begin
      ctrl_cs_id <= auto_r_in_a_bits_data[1:0];
    end
    if (metaReset) begin
      ctrl_cs_dflt_0 <= 1'h0;
    end else begin
      ctrl_cs_dflt_0 <= reset | _GEN_1;
    end
    if (metaReset) begin
      ctrl_cs_dflt_1 <= 1'h0;
    end else begin
      ctrl_cs_dflt_1 <= reset | _GEN_2;
    end
    if (metaReset) begin
      ctrl_cs_dflt_2 <= 1'h0;
    end else begin
      ctrl_cs_dflt_2 <= reset | _GEN_3;
    end
    if (metaReset) begin
      ctrl_cs_dflt_3 <= 1'h0;
    end else begin
      ctrl_cs_dflt_3 <= reset | _GEN_4;
    end
    if (metaReset) begin
      ctrl_cs_mode <= 2'h0;
    end else if (reset) begin
      ctrl_cs_mode <= 2'h0;
    end else if (profilePin_13) begin
      ctrl_cs_mode <= auto_r_in_a_bits_data[1:0];
    end
    if (metaReset) begin
      ctrl_dla_cssck <= 8'h0;
    end else if (reset) begin
      ctrl_dla_cssck <= 8'h1;
    end else if (profilePin_8) begin
      ctrl_dla_cssck <= auto_r_in_a_bits_data[7:0];
    end
    if (metaReset) begin
      ctrl_dla_sckcs <= 8'h0;
    end else if (reset) begin
      ctrl_dla_sckcs <= 8'h1;
    end else if (profilePin_9) begin
      ctrl_dla_sckcs <= auto_r_in_a_bits_data[23:16];
    end
    if (metaReset) begin
      ctrl_dla_intercs <= 8'h0;
    end else if (reset) begin
      ctrl_dla_intercs <= 8'h1;
    end else if (profilePin_21) begin
      ctrl_dla_intercs <= auto_r_in_a_bits_data[7:0];
    end
    if (metaReset) begin
      ctrl_dla_interxfr <= 8'h0;
    end else if (reset) begin
      ctrl_dla_interxfr <= 8'h0;
    end else if (profilePin_22) begin
      ctrl_dla_interxfr <= auto_r_in_a_bits_data[23:16];
    end
    if (metaReset) begin
      ctrl_wm_tx <= 4'h0;
    end else if (reset) begin
      ctrl_wm_tx <= 4'h0;
    end else if (profilePin_10) begin
      ctrl_wm_tx <= auto_r_in_a_bits_data[3:0];
    end
    if (metaReset) begin
      ctrl_wm_rx <= 4'h0;
    end else if (reset) begin
      ctrl_wm_rx <= 4'h0;
    end else if (profilePin_16) begin
      ctrl_wm_rx <= auto_r_in_a_bits_data[3:0];
    end
    if (metaReset) begin
      ie_txwm <= 1'h0;
    end else if (reset) begin
      ie_txwm <= 1'h0;
    end else if (profilePin_14) begin
      ie_txwm <= auto_r_in_a_bits_data[0];
    end
    if (metaReset) begin
      ie_rxwm <= 1'h0;
    end else if (reset) begin
      ie_rxwm <= 1'h0;
    end else if (profilePin_15) begin
      ie_rxwm <= auto_r_in_a_bits_data[1];
    end
  end
endmodule
module TLMonitor_66(
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
  output        _GEN_23_0,
  output        _GEN_87_0,
  output        _GEN_39_1,
  output        _GEN_70_0,
  output        _GEN_63_0,
  output        _GEN_46_0,
  output        _GEN_33_0,
  output        _GEN_42_0,
  output        _GEN_49_0,
  output        _GEN_56_1,
  output        _GEN_26_0,
  output        _GEN_36_0,
  output        _GEN_29_0,
  output        _GEN_86_1,
  output        _GEN_12_0,
  output        _GEN_79_0,
  output        _GEN_72_0,
  output        _GEN_21_2,
  output        _GEN_65_1,
  output        _GEN_55_0,
  output        _GEN_5_0,
  output        _GEN_82_0,
  output        _GEN_51_0,
  output        _GEN_58_0,
  output        _GEN_35_1,
  output        _GEN_89_1,
  output        _GEN_2_1,
  output        _GEN_9_0,
  output        _GEN_75_1,
  output        _GEN_38_1,
  output        _GEN_44_1,
  output        _GEN_62_1,
  output        _GEN_68_2,
  output        _GEN_22_0,
  output        _GEN_32_1,
  output        _GEN_25_0,
  output        _GEN_48_0,
  output        _GEN_41_1,
  output        _GEN_8_0,
  output        _GEN_81_1,
  output        _GEN_28_0,
  output        _GEN_1_2,
  output        _GEN_67_2,
  output        _GEN_84_1,
  output        _GEN_11_1,
  output        _GEN_4_3,
  output        _GEN_60_1,
  output        _GEN_88_2,
  output        _GEN_47_1,
  output        _GEN_78_1,
  output        _GEN_40_1,
  output        _GEN_64_2,
  output        _GEN_20_1,
  output        _GEN_71_3,
  output        _GEN_34_1,
  output        _GEN_57_1,
  output        _GEN_50_1,
  output        _GEN_74_1,
  output        _GEN_27_1,
  output        _GEN_37_1,
  output        _GEN_54_1,
  output        _GEN_30_1,
  output        _GEN_43_2,
  output        _GEN_17_0,
  output        _GEN_24_1,
  output        _GEN_7_1,
  output        _GEN_80_3,
  output        _GEN_73_2,
  output        _GEN_59_2,
  output        _GEN_66_3,
  output        _GEN_52_1,
  output        _GEN_83_3,
  output        _GEN_3_2,
  output        _GEN_76_2,
  output        _GEN_10_2
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
  wire [28:0] _T_92 = io_in_a_bits_address ^ 29'h10024000; // @[Parameters.scala 119:31]
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
  assign _GEN_23_0 = _T_599 & _T_619;
  assign _GEN_87_0 = _T_712 & _T_732;
  assign _GEN_39_1 = _GEN_31 & _T_105;
  assign _GEN_70_0 = _GEN_85 & _T_124;
  assign _GEN_63_0 = _GEN_69 & _T_238;
  assign _GEN_46_0 = _GEN_45 & _T_219;
  assign _GEN_33_0 = _GEN_19 & _T_105;
  assign _GEN_42_0 = _GEN_31 & _T_130;
  assign _GEN_49_0 = _GEN_45 & _T_238;
  assign _GEN_56_1 = _GEN_61 & _T_124;
  assign _GEN_26_0 = _T_669 & _T_687;
  assign _GEN_36_0 = _GEN_19 & _T_130;
  assign _GEN_29_0 = reset;
  assign _GEN_86_1 = _T_712 & _T_727;
  assign _GEN_12_0 = reset;
  assign _GEN_79_0 = _T_641 & _T_646;
  assign _GEN_72_0 = io_in_d_valid & _T_444;
  assign _GEN_21_2 = _T_599 & _T_619;
  assign _GEN_65_1 = _GEN_77 & _T_124;
  assign _GEN_55_0 = _GEN_61 & _T_219;
  assign _GEN_5_0 = ~_T_764;
  assign _GEN_82_0 = _T_641 & _T_661;
  assign _GEN_51_0 = _GEN_53 & _T_124;
  assign _GEN_58_0 = _GEN_61 & _T_327;
  assign _GEN_35_1 = _GEN_19 & _T_124;
  assign _GEN_89_1 = _T_836 & _T_845;
  assign _GEN_2_1 = io_in_a_ready & io_in_a_valid;
  assign _GEN_9_0 = io_in_d_ready & io_in_d_valid;
  assign _GEN_75_1 = _GEN_95 & _T_482;
  assign _GEN_38_1 = _GEN_31 & _T_105;
  assign _GEN_44_1 = _GEN_31 & _T_137;
  assign _GEN_62_1 = _GEN_69 & _T_361;
  assign _GEN_68_2 = _GEN_85 & _T_105;
  assign _GEN_22_0 = _T_599 & _T_619;
  assign _GEN_32_1 = _GEN_19 & _T_105;
  assign _GEN_25_0 = _T_669 & _T_687;
  assign _GEN_48_0 = _GEN_45 & _T_233;
  assign _GEN_41_1 = _GEN_31 & _T_124;
  assign _GEN_8_0 = ~_T_792;
  assign _GEN_81_1 = _T_641 & _T_656;
  assign _GEN_28_0 = reset;
  assign _GEN_1_2 = ~_T_613;
  assign _GEN_67_2 = _GEN_77 & _T_238;
  assign _GEN_84_1 = _T_712 & _T_717;
  assign _GEN_11_1 = _T_831 & _T_835;
  assign _GEN_4_3 = io_in_d_ready & io_in_d_valid;
  assign _GEN_60_1 = _GEN_69 & _T_124;
  assign _GEN_88_2 = _T_812 & _T_824;
  assign _GEN_47_1 = _GEN_45 & _T_124;
  assign _GEN_78_1 = ~_T_596;
  assign _GEN_40_1 = _GEN_31 & _T_120;
  assign _GEN_64_2 = _GEN_77 & _T_105;
  assign _GEN_20_1 = _T_599 & _T_619;
  assign _GEN_71_3 = _GEN_85 & _T_238;
  assign _GEN_34_1 = _GEN_19 & _T_120;
  assign _GEN_57_1 = _GEN_61 & _T_233;
  assign _GEN_50_1 = _GEN_53 & _T_219;
  assign _GEN_74_1 = _GEN_93 & _T_482;
  assign _GEN_27_1 = _T_669 & _T_687;
  assign _GEN_37_1 = _GEN_19 & _T_137;
  assign _GEN_54_1 = _GEN_53 & _T_238;
  assign _GEN_30_1 = reset;
  assign _GEN_43_2 = _GEN_31 & _T_188;
  assign _GEN_17_0 = _T_599 & _T_619;
  assign _GEN_24_1 = reset;
  assign _GEN_7_1 = io_in_a_ready & io_in_a_valid;
  assign _GEN_80_3 = _T_641 & _T_651;
  assign _GEN_73_2 = _GEN_91 & _T_482;
  assign _GEN_59_2 = _GEN_69 & _T_105;
  assign _GEN_66_3 = _GEN_77 & _T_400;
  assign _GEN_52_1 = _GEN_53 & _T_233;
  assign _GEN_83_3 = _T_641 & _T_666;
  assign _GEN_3_2 = ~_T_681;
  assign _GEN_76_2 = ~_T_590;
  assign _GEN_10_2 = _T_599 & _T_770;
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
module SPIFIFO_1(
  input        metaReset,
  input        clock,
  input        reset,
  input  [1:0] io_ctrl_fmt_proto,
  input        io_ctrl_fmt_endian,
  input        io_ctrl_fmt_iodir,
  input  [3:0] io_ctrl_fmt_len,
  input  [1:0] io_ctrl_cs_mode,
  input  [3:0] io_ctrl_wm_tx,
  input  [3:0] io_ctrl_wm_rx,
  input        io_link_tx_ready,
  output       io_link_tx_valid,
  output [7:0] io_link_tx_bits,
  input        io_link_rx_valid,
  input  [7:0] io_link_rx_bits,
  output [7:0] io_link_cnt,
  output [1:0] io_link_fmt_proto,
  output       io_link_fmt_endian,
  output       io_link_fmt_iodir,
  output       io_link_cs_set,
  output       io_link_cs_clear,
  output       io_tx_ready,
  input        io_tx_valid,
  input  [7:0] io_tx_bits,
  input        io_rx_ready,
  output       io_rx_valid,
  output [7:0] io_rx_bits,
  output       io_ip_txwm,
  output       io_ip_rxwm,
  output       _GEN_2_0,
  output       _GEN_1_0,
  output       _GEN_7_0,
  output       _GEN_4_0,
  output       _GEN_4_1,
  output       _GEN_10_0,
  output       _GEN_1_1,
  output       _GEN_3_0,
  output       _GEN_0_0,
  output       _GEN_6_0,
  output       _GEN_9_1,
  output       _GEN_3_1,
  output       _GEN_0_1,
  output       _GEN_8_1,
  output       _GEN_11_2,
  output       _GEN_8_2,
  output       _GEN_8_3,
  output       _GEN_2_2,
  output       _GEN_5_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  txq_metaReset; // @[SPIFIFO.scala 21:19]
  wire  txq_clock; // @[SPIFIFO.scala 21:19]
  wire  txq_reset; // @[SPIFIFO.scala 21:19]
  wire  txq_io_enq_ready; // @[SPIFIFO.scala 21:19]
  wire  txq_io_enq_valid; // @[SPIFIFO.scala 21:19]
  wire [7:0] txq_io_enq_bits; // @[SPIFIFO.scala 21:19]
  wire  txq_io_deq_ready; // @[SPIFIFO.scala 21:19]
  wire  txq_io_deq_valid; // @[SPIFIFO.scala 21:19]
  wire [7:0] txq_io_deq_bits; // @[SPIFIFO.scala 21:19]
  wire [3:0] txq_io_count; // @[SPIFIFO.scala 21:19]
  wire  txq__GEN_2_0; // @[SPIFIFO.scala 21:19]
  wire  txq__GEN_1_0; // @[SPIFIFO.scala 21:19]
  wire  txq__GEN_4_1; // @[SPIFIFO.scala 21:19]
  wire  txq__GEN_0_0; // @[SPIFIFO.scala 21:19]
  wire  txq__GEN_3_1; // @[SPIFIFO.scala 21:19]
  wire  txq__GEN_8_2; // @[SPIFIFO.scala 21:19]
  wire  rxq_metaReset; // @[SPIFIFO.scala 22:19]
  wire  rxq_clock; // @[SPIFIFO.scala 22:19]
  wire  rxq_reset; // @[SPIFIFO.scala 22:19]
  wire  rxq_io_enq_ready; // @[SPIFIFO.scala 22:19]
  wire  rxq_io_enq_valid; // @[SPIFIFO.scala 22:19]
  wire [7:0] rxq_io_enq_bits; // @[SPIFIFO.scala 22:19]
  wire  rxq_io_deq_ready; // @[SPIFIFO.scala 22:19]
  wire  rxq_io_deq_valid; // @[SPIFIFO.scala 22:19]
  wire [7:0] rxq_io_deq_bits; // @[SPIFIFO.scala 22:19]
  wire [3:0] rxq_io_count; // @[SPIFIFO.scala 22:19]
  wire  rxq__GEN_4_0; // @[SPIFIFO.scala 22:19]
  wire  rxq__GEN_1_1; // @[SPIFIFO.scala 22:19]
  wire  rxq__GEN_3_0; // @[SPIFIFO.scala 22:19]
  wire  rxq__GEN_0_1; // @[SPIFIFO.scala 22:19]
  wire  rxq__GEN_8_3; // @[SPIFIFO.scala 22:19]
  wire  rxq__GEN_2_2; // @[SPIFIFO.scala 22:19]
  wire  fire_tx = io_link_tx_ready & io_link_tx_valid; // @[Decoupled.scala 37:37]
  reg  rxen; // @[SPIFIFO.scala 29:17]
  wire  _T_34 = ~io_link_fmt_iodir; // @[SPIFIFO.scala 39:32]
  wire  _T_38 = 2'h0 == io_link_fmt_proto; // @[SPIConsts.scala 13:48]
  wire  _T_39 = 2'h1 == io_link_fmt_proto; // @[SPIConsts.scala 13:48]
  wire  _T_40 = 2'h2 == io_link_fmt_proto; // @[SPIConsts.scala 13:48]
  wire [3:0] _T_46 = _T_38 ? io_ctrl_fmt_len : 4'h0; // @[Mux.scala 19:72]
  wire [2:0] _T_48 = _T_39 ? io_ctrl_fmt_len[3:1] : 3'h0; // @[Mux.scala 19:72]
  wire [1:0] _T_50 = _T_40 ? io_ctrl_fmt_len[3:2] : 2'h0; // @[Mux.scala 19:72]
  wire [3:0] _GEN_2 = {{1'd0}, _T_48}; // @[Mux.scala 19:72]
  wire [3:0] _T_51 = _T_46 | _GEN_2; // @[Mux.scala 19:72]
  wire [3:0] _GEN_3 = {{2'd0}, _T_50}; // @[Mux.scala 19:72]
  wire [3:0] cnt_quot = _T_51 | _GEN_3; // @[Mux.scala 19:72]
  wire  _T_60 = io_ctrl_fmt_len[1:0] != 2'h0; // @[SPIFIFO.scala 44:92]
  wire  _T_65 = _T_39 & io_ctrl_fmt_len[0]; // @[Mux.scala 19:72]
  wire  _T_67 = _T_40 & _T_60; // @[Mux.scala 19:72]
  wire  cnt_rmdr = _T_65 | _T_67; // @[Mux.scala 19:72]
  wire [3:0] _GEN_4 = {{3'd0}, cnt_rmdr}; // @[SPIFIFO.scala 46:27]
  wire [3:0] _T_72 = cnt_quot + _GEN_4; // @[SPIFIFO.scala 46:27]
  reg [1:0] cs_mode; // @[SPIFIFO.scala 48:24]
  wire  cs_mode_hold = cs_mode == 2'h2; // @[SPIFIFO.scala 49:31]
  wire  cs_mode_off = cs_mode == 2'h3; // @[SPIFIFO.scala 50:30]
  wire  cs_update = cs_mode != io_ctrl_cs_mode; // @[SPIFIFO.scala 51:28]
  wire  _T_77 = cs_mode_hold | cs_mode_off; // @[SPIFIFO.scala 52:33]
  wire  cs_clear = ~_T_77; // @[SPIFIFO.scala 52:18]
  wire  _T_81 = fire_tx & cs_clear; // @[SPIFIFO.scala 55:45]
  Queue_18 txq ( // @[SPIFIFO.scala 21:19]
    .metaReset(txq_metaReset),
    .clock(txq_clock),
    .reset(txq_reset),
    .io_enq_ready(txq_io_enq_ready),
    .io_enq_valid(txq_io_enq_valid),
    .io_enq_bits(txq_io_enq_bits),
    .io_deq_ready(txq_io_deq_ready),
    .io_deq_valid(txq_io_deq_valid),
    .io_deq_bits(txq_io_deq_bits),
    .io_count(txq_io_count),
    ._GEN_2_0(txq__GEN_2_0),
    ._GEN_1_0(txq__GEN_1_0),
    ._GEN_4_1(txq__GEN_4_1),
    ._GEN_0_0(txq__GEN_0_0),
    ._GEN_3_1(txq__GEN_3_1),
    ._GEN_8_2(txq__GEN_8_2)
  );
  Queue_19 rxq ( // @[SPIFIFO.scala 22:19]
    .metaReset(rxq_metaReset),
    .clock(rxq_clock),
    .reset(rxq_reset),
    .io_enq_ready(rxq_io_enq_ready),
    .io_enq_valid(rxq_io_enq_valid),
    .io_enq_bits(rxq_io_enq_bits),
    .io_deq_ready(rxq_io_deq_ready),
    .io_deq_valid(rxq_io_deq_valid),
    .io_deq_bits(rxq_io_deq_bits),
    .io_count(rxq_io_count),
    ._GEN_4_0(rxq__GEN_4_0),
    ._GEN_1_1(rxq__GEN_1_1),
    ._GEN_3_0(rxq__GEN_3_0),
    ._GEN_0_1(rxq__GEN_0_1),
    ._GEN_8_3(rxq__GEN_8_3),
    ._GEN_2_2(rxq__GEN_2_2)
  );
  assign txq_metaReset = metaReset;
  assign rxq_metaReset = metaReset;
  assign io_link_tx_valid = txq_io_deq_valid; // @[SPIFIFO.scala 25:14]
  assign io_link_tx_bits = txq_io_deq_bits; // @[SPIFIFO.scala 25:14]
  assign io_link_cnt = {{4'd0}, _T_72}; // @[SPIFIFO.scala 46:15]
  assign io_link_fmt_proto = io_ctrl_fmt_proto; // @[SPIFIFO.scala 45:15]
  assign io_link_fmt_endian = io_ctrl_fmt_endian; // @[SPIFIFO.scala 45:15]
  assign io_link_fmt_iodir = io_ctrl_fmt_iodir; // @[SPIFIFO.scala 45:15]
  assign io_link_cs_set = ~cs_mode_off; // @[SPIFIFO.scala 54:18]
  assign io_link_cs_clear = cs_update | _T_81; // @[SPIFIFO.scala 55:20]
  assign io_tx_ready = txq_io_enq_ready; // @[SPIFIFO.scala 24:14]
  assign io_rx_valid = rxq_io_deq_valid; // @[SPIFIFO.scala 33:9]
  assign io_rx_bits = rxq_io_deq_bits; // @[SPIFIFO.scala 33:9]
  assign io_ip_txwm = txq_io_count < io_ctrl_wm_tx; // @[SPIFIFO.scala 60:14]
  assign io_ip_rxwm = rxq_io_count > io_ctrl_wm_rx; // @[SPIFIFO.scala 61:14]
  assign _GEN_2_0 = txq__GEN_2_0;
  assign _GEN_1_0 = txq__GEN_1_0;
  assign _GEN_7_0 = 2'h0 == io_link_fmt_proto;
  assign _GEN_4_0 = rxq__GEN_4_0;
  assign _GEN_4_1 = txq__GEN_4_1;
  assign _GEN_10_0 = reset;
  assign _GEN_1_1 = rxq__GEN_1_1;
  assign _GEN_3_0 = rxq__GEN_3_0;
  assign _GEN_0_0 = txq__GEN_0_0;
  assign _GEN_6_0 = io_link_tx_ready & io_link_tx_valid;
  assign _GEN_9_1 = 2'h2 == io_link_fmt_proto;
  assign _GEN_3_1 = txq__GEN_3_1;
  assign _GEN_0_1 = rxq__GEN_0_1;
  assign _GEN_8_1 = 2'h1 == io_link_fmt_proto;
  assign _GEN_11_2 = reset;
  assign _GEN_8_2 = txq__GEN_8_2;
  assign _GEN_8_3 = rxq__GEN_8_3;
  assign _GEN_2_2 = rxq__GEN_2_2;
  assign _GEN_5_1 = io_link_rx_valid;
  assign txq_clock = clock;
  assign txq_reset = reset;
  assign txq_io_enq_valid = io_tx_valid; // @[SPIFIFO.scala 24:14]
  assign txq_io_enq_bits = io_tx_bits; // @[SPIFIFO.scala 24:14]
  assign txq_io_deq_ready = io_link_tx_ready; // @[SPIFIFO.scala 25:14]
  assign rxq_clock = clock;
  assign rxq_reset = reset;
  assign rxq_io_enq_valid = io_link_rx_valid & rxen; // @[SPIFIFO.scala 31:20]
  assign rxq_io_enq_bits = io_link_rx_bits; // @[SPIFIFO.scala 32:19]
  assign rxq_io_deq_ready = io_rx_ready; // @[SPIFIFO.scala 33:9]
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
  rxen = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cs_mode = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      rxen <= 1'h0;
    end else if (reset) begin
      rxen <= 1'h0;
    end else if (fire_tx) begin
      rxen <= _T_34;
    end else if (io_link_rx_valid) begin
      rxen <= 1'h0;
    end
    if (metaReset) begin
      cs_mode <= 2'h0;
    end else if (reset) begin
      cs_mode <= 2'h0;
    end else begin
      cs_mode <= io_ctrl_cs_mode;
    end
  end
endmodule
module SPIMedia_1(
  input         metaReset,
  input         clock,
  input         reset,
  output        io_port_sck,
  input         io_port_dq_0_i,
  output        io_port_dq_0_o,
  output        io_port_dq_0_oe,
  input         io_port_dq_1_i,
  output        io_port_dq_1_o,
  output        io_port_dq_1_oe,
  input         io_port_dq_2_i,
  output        io_port_dq_2_o,
  output        io_port_dq_2_oe,
  input         io_port_dq_3_i,
  output        io_port_dq_3_o,
  output        io_port_dq_3_oe,
  output        io_port_cs_0,
  output        io_port_cs_1,
  output        io_port_cs_2,
  output        io_port_cs_3,
  input  [11:0] io_ctrl_sck_div,
  input         io_ctrl_sck_pol,
  input         io_ctrl_sck_pha,
  input  [7:0]  io_ctrl_dla_cssck,
  input  [7:0]  io_ctrl_dla_sckcs,
  input  [7:0]  io_ctrl_dla_intercs,
  input  [7:0]  io_ctrl_dla_interxfr,
  input  [1:0]  io_ctrl_cs_id,
  input         io_ctrl_cs_dflt_0,
  input         io_ctrl_cs_dflt_1,
  input         io_ctrl_cs_dflt_2,
  input         io_ctrl_cs_dflt_3,
  output        io_link_tx_ready,
  input         io_link_tx_valid,
  input  [7:0]  io_link_tx_bits,
  output        io_link_rx_valid,
  output [7:0]  io_link_rx_bits,
  input  [7:0]  io_link_cnt,
  input  [1:0]  io_link_fmt_proto,
  input         io_link_fmt_endian,
  input         io_link_fmt_iodir,
  input         io_link_cs_set,
  input         io_link_cs_clear,
  output        _GEN_115_0,
  output        _GEN_105_0,
  output        _GEN_39_0,
  output        _GEN_111_0,
  output        _GEN_96_0,
  output        _GEN_132_0,
  output        _GEN_109_0,
  output        _GEN_117_0,
  output        _GEN_121_0,
  output        _GEN_130_0,
  output        _GEN_126_0,
  output        _GEN_120_0,
  output        _GEN_124_0,
  output        _GEN_93_0,
  output        _GEN_114_0,
  output        _GEN_83_1,
  output        _GEN_87_1,
  output        _GEN_99_0,
  output        _GEN_118_0,
  output        _GEN_135_0,
  output        _GEN_103_0,
  output        _GEN_89_0,
  output        _GEN_102_0,
  output        _GEN_92_0,
  output        _GEN_106_0,
  output        _GEN_75_0,
  output        _GEN_43_0,
  output        _GEN_108_0,
  output        _GEN_77_1,
  output        _GEN_81_0,
  output        _GEN_96_1,
  output        _GEN_90_0,
  output        _GEN_68_1,
  output        _GEN_112_0,
  output        _GEN_67_0,
  output        _GEN_84_0,
  output        _GEN_95_0,
  output        _GEN_99_1,
  output        _GEN_60_0,
  output        _GEN_86_2,
  output        _GEN_71_1,
  output        _GEN_80_1,
  output        _GEN_78_0,
  output        _GEN_21_1,
  output        _GEN_119_0,
  output        _GEN_57_0,
  output        _GEN_72_1,
  output        _GEN_123_0,
  output        _GEN_64_0,
  output        _GEN_134_0,
  output        _GEN_63_1,
  output        _GEN_128_0,
  output        _GEN_132_1,
  output        _GEN_11_0,
  output        _GEN_107_0,
  output        _GEN_101_0,
  output        _GEN_111_1,
  output        _GEN_105_1,
  output        _GEN_120_1,
  output        _GEN_122_0,
  output        _GEN_126_1,
  output        _GEN_131_0,
  output        _GEN_135_1,
  output        _GEN_129_0,
  output        _GEN_116_0,
  output        _GEN_125_0,
  output        _GEN_98_1,
  output        _GEN_110_0,
  output        _GEN_114_1,
  output        _GEN_108_1,
  output        _GEN_104_1,
  output        _GEN_94_1,
  output        _GEN_82_2,
  output        _GEN_98_2,
  output        _GEN_63_2,
  output        _GEN_113_0,
  output        _GEN_71_2,
  output        _GEN_80_2,
  output        _GEN_88_1,
  output        _GEN_102_1,
  output        _GEN_92_1,
  output        _GEN_86_3,
  output        _GEN_117_1,
  output        _GEN_73_1,
  output        _GEN_91_1,
  output        _GEN_89_2,
  output        _GEN_74_0,
  output        _GEN_4_2,
  output        _GEN_66_0,
  output        _GEN_66_1,
  output        _GEN_95_1,
  output        _GEN_85_1,
  output        _GEN_10_1,
  output        _GEN_79_2,
  output        _GEN_130_1,
  output        _GEN_59_1,
  output        _GEN_83_2,
  output        _GEN_134_1,
  output        _GEN_20_0,
  output        _GEN_70_2,
  output        _GEN_77_2,
  output        _GEN_118_1,
  output        _GEN_62_2,
  output        _GEN_133_0,
  output        _GEN_55_2,
  output        _GEN_122_1,
  output        _GEN_112_1,
  output        _GEN_116_1,
  output        _GEN_127_0,
  output        _GEN_100_1,
  output        _GEN_131_1,
  output        _GEN_121_1,
  output        _GEN_104_2,
  output        _GEN_106_2,
  output        _GEN_115_1,
  output        _GEN_125_1,
  output        _GEN_119_1,
  output        _GEN_113_1,
  output        _GEN_128_1,
  output        _GEN_109_1,
  output        _GEN_103_2,
  output        _GEN_78_3,
  output        _GEN_82_3,
  output        _GEN_93_2,
  output        _GEN_107_1,
  output        _GEN_97_1,
  output        _GEN_124_1,
  output        _GEN_81_3,
  output        _GEN_87_3,
  output        _GEN_100_2,
  output        _GEN_85_2,
  output        _GEN_61_1,
  output        _GEN_72_3,
  output        _GEN_97_2,
  output        _GEN_79_3,
  output        _GEN_101_1,
  output        _GEN_91_2,
  output        _GEN_110_1,
  output        _GEN_61_2,
  output        _GEN_65_2,
  output        _GEN_88_3,
  output        _GEN_90_2,
  output        _GEN_94_2,
  output        _GEN_84_3,
  output        _GEN_65_3,
  output        _GEN_73_3,
  output        _GEN_69_1,
  output        _GEN_76_1,
  output        _GEN_127_1,
  output        _GEN_129_1,
  output        _GEN_14_0,
  output        _GEN_133_1,
  output        _GEN_123_1,
  output        _GEN_58_2,
  output        _GEN_70_3
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
`endif // RANDOMIZE_REG_INIT
  wire  phy_metaReset; // @[SPIMedia.scala 31:19]
  wire  phy_clock; // @[SPIMedia.scala 31:19]
  wire  phy_reset; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_sck; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_0_i; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_0_o; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_0_oe; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_1_i; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_1_o; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_1_oe; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_2_i; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_2_o; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_2_oe; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_3_i; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_3_o; // @[SPIMedia.scala 31:19]
  wire  phy_io_port_dq_3_oe; // @[SPIMedia.scala 31:19]
  wire [11:0] phy_io_ctrl_sck_div; // @[SPIMedia.scala 31:19]
  wire  phy_io_ctrl_sck_pol; // @[SPIMedia.scala 31:19]
  wire  phy_io_ctrl_sck_pha; // @[SPIMedia.scala 31:19]
  wire [1:0] phy_io_ctrl_fmt_proto; // @[SPIMedia.scala 31:19]
  wire  phy_io_ctrl_fmt_endian; // @[SPIMedia.scala 31:19]
  wire  phy_io_ctrl_fmt_iodir; // @[SPIMedia.scala 31:19]
  wire  phy_io_op_ready; // @[SPIMedia.scala 31:19]
  wire  phy_io_op_valid; // @[SPIMedia.scala 31:19]
  wire  phy_io_op_bits_fn; // @[SPIMedia.scala 31:19]
  wire  phy_io_op_bits_stb; // @[SPIMedia.scala 31:19]
  wire [7:0] phy_io_op_bits_cnt; // @[SPIMedia.scala 31:19]
  wire [7:0] phy_io_op_bits_data; // @[SPIMedia.scala 31:19]
  wire  phy_io_rx_valid; // @[SPIMedia.scala 31:19]
  wire [7:0] phy_io_rx_bits; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_115_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_39_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_109_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_121_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_130_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_124_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_93_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_87_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_118_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_103_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_106_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_75_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_81_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_96_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_90_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_112_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_67_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_84_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_99_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_60_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_78_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_21_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_57_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_72_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_123_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_63_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_132_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_11_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_111_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_105_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_120_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_126_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_135_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_129_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_98_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_114_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_108_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_71_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_80_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_102_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_92_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_86_3; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_117_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_89_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_74_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_66_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_95_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_10_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_59_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_83_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_134_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_20_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_77_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_62_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_55_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_122_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_116_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_131_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_104_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_125_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_119_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_113_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_128_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_82_3; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_107_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_97_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_100_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_85_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_79_3; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_101_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_91_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_110_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_61_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_65_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_88_3; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_94_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_73_3; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_76_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_127_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_14_0; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_133_1; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_58_2; // @[SPIMedia.scala 31:19]
  wire  phy__GEN_70_3; // @[SPIMedia.scala 31:19]
  reg [1:0] cs_id; // @[SPIMedia.scala 42:15]
  reg  cs_dflt_0; // @[SPIMedia.scala 42:15]
  reg  cs_dflt_1; // @[SPIMedia.scala 42:15]
  reg  cs_dflt_2; // @[SPIMedia.scala 42:15]
  reg  cs_dflt_3; // @[SPIMedia.scala 42:15]
  reg  cs_set; // @[SPIMedia.scala 43:19]
  wire [3:0] _GEN_75 = {{3'd0}, io_link_cs_set}; // @[SPIBundle.scala 47:19]
  wire [3:0] _T_68 = _GEN_75 << io_ctrl_cs_id; // @[SPIBundle.scala 47:19]
  wire [3:0] _T_71 = {io_ctrl_cs_dflt_3,io_ctrl_cs_dflt_2,io_ctrl_cs_dflt_1,io_ctrl_cs_dflt_0}; // @[Cat.scala 30:58]
  wire [3:0] _T_72 = _T_71 ^ _T_68; // @[SPIBundle.scala 48:33]
  wire  cs_active_0 = _T_72[0]; // @[SPIBundle.scala 49:32]
  wire  cs_active_1 = _T_72[1]; // @[SPIBundle.scala 49:32]
  wire  cs_active_2 = _T_72[2]; // @[SPIBundle.scala 49:32]
  wire  cs_active_3 = _T_72[3]; // @[SPIBundle.scala 49:32]
  wire [3:0] _T_87 = {cs_active_3,cs_active_2,cs_active_1,cs_active_0}; // @[SPIMedia.scala 45:30]
  wire [3:0] _T_90 = {cs_dflt_3,cs_dflt_2,cs_dflt_1,cs_dflt_0}; // @[SPIMedia.scala 45:49]
  wire  cs_update = _T_87 != _T_90; // @[SPIMedia.scala 45:37]
  reg  clear; // @[SPIMedia.scala 47:18]
  reg  cs_assert; // @[SPIMedia.scala 48:22]
  wire  cs_deassert = clear | cs_update; // @[SPIMedia.scala 49:27]
  wire  _T_98 = io_link_cs_clear & cs_assert; // @[SPIMedia.scala 51:39]
  wire  _T_99 = clear | _T_98; // @[SPIMedia.scala 51:18]
  wire  continuous = io_ctrl_dla_interxfr == 8'h0; // @[SPIMedia.scala 53:42]
  reg [1:0] state; // @[SPIMedia.scala 64:18]
  wire  _T_104 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_107 = phy_io_op_ready & phy_io_op_valid; // @[Decoupled.scala 37:37]
  wire [7:0] _GEN_2 = cs_deassert ? io_ctrl_dla_sckcs : io_link_cnt; // @[SPIMedia.scala 69:28]
  wire  _GEN_5 = cs_deassert ? 1'h0 : 1'h1; // @[SPIMedia.scala 69:28]
  wire  _GEN_6 = cs_deassert | io_link_tx_valid; // @[SPIMedia.scala 69:28]
  wire  _GEN_7 = cs_deassert ? 1'h0 : phy_io_op_ready; // @[SPIMedia.scala 69:28]
  wire  _GEN_8 = phy_io_op_ready | cs_assert; // @[SPIMedia.scala 87:25]
  wire [7:0] _GEN_14 = io_link_tx_valid ? io_ctrl_dla_cssck : 8'h0; // @[SPIMedia.scala 84:38]
  wire  _GEN_21 = io_link_tx_valid ? 1'h0 : 1'h1; // @[SPIMedia.scala 84:38]
  wire [7:0] _GEN_23 = cs_assert ? _GEN_2 : _GEN_14; // @[SPIMedia.scala 68:24]
  wire  _GEN_25 = cs_assert ? cs_deassert : 1'h1; // @[SPIMedia.scala 68:24]
  wire  _GEN_26 = cs_assert ? _GEN_5 : _GEN_21; // @[SPIMedia.scala 68:24]
  wire  _GEN_27 = cs_assert ? _GEN_6 : 1'h1; // @[SPIMedia.scala 68:24]
  wire  _GEN_28 = cs_assert & _GEN_7; // @[SPIMedia.scala 68:24]
  wire  _T_111 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_113 = ~continuous; // @[SPIMedia.scala 102:19]
  wire  _T_114 = phy_io_op_ready | continuous; // @[SPIMedia.scala 104:22]
  wire  _T_115 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_76 = {{3'd0}, cs_set}; // @[SPIBundle.scala 47:19]
  wire [3:0] _T_119 = _GEN_76 << cs_id; // @[SPIBundle.scala 47:19]
  wire [3:0] _T_123 = _T_90 ^ _T_119; // @[SPIBundle.scala 48:33]
  wire [7:0] _GEN_42 = _T_115 ? io_ctrl_dla_intercs : io_link_cnt; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_111 ? _T_113 : 1'h1; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_52 = _T_111 ? io_ctrl_dla_interxfr : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_111 ? 1'h0 : _T_115; // @[Conditional.scala 39:67]
  SPIPhysical_1 phy ( // @[SPIMedia.scala 31:19]
    .metaReset(phy_metaReset),
    .clock(phy_clock),
    .reset(phy_reset),
    .io_port_sck(phy_io_port_sck),
    .io_port_dq_0_i(phy_io_port_dq_0_i),
    .io_port_dq_0_o(phy_io_port_dq_0_o),
    .io_port_dq_0_oe(phy_io_port_dq_0_oe),
    .io_port_dq_1_i(phy_io_port_dq_1_i),
    .io_port_dq_1_o(phy_io_port_dq_1_o),
    .io_port_dq_1_oe(phy_io_port_dq_1_oe),
    .io_port_dq_2_i(phy_io_port_dq_2_i),
    .io_port_dq_2_o(phy_io_port_dq_2_o),
    .io_port_dq_2_oe(phy_io_port_dq_2_oe),
    .io_port_dq_3_i(phy_io_port_dq_3_i),
    .io_port_dq_3_o(phy_io_port_dq_3_o),
    .io_port_dq_3_oe(phy_io_port_dq_3_oe),
    .io_ctrl_sck_div(phy_io_ctrl_sck_div),
    .io_ctrl_sck_pol(phy_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(phy_io_ctrl_sck_pha),
    .io_ctrl_fmt_proto(phy_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(phy_io_ctrl_fmt_endian),
    .io_ctrl_fmt_iodir(phy_io_ctrl_fmt_iodir),
    .io_op_ready(phy_io_op_ready),
    .io_op_valid(phy_io_op_valid),
    .io_op_bits_fn(phy_io_op_bits_fn),
    .io_op_bits_stb(phy_io_op_bits_stb),
    .io_op_bits_cnt(phy_io_op_bits_cnt),
    .io_op_bits_data(phy_io_op_bits_data),
    .io_rx_valid(phy_io_rx_valid),
    .io_rx_bits(phy_io_rx_bits),
    ._GEN_115_0(phy__GEN_115_0),
    ._GEN_39_0(phy__GEN_39_0),
    ._GEN_109_0(phy__GEN_109_0),
    ._GEN_121_0(phy__GEN_121_0),
    ._GEN_130_0(phy__GEN_130_0),
    ._GEN_124_0(phy__GEN_124_0),
    ._GEN_93_0(phy__GEN_93_0),
    ._GEN_87_1(phy__GEN_87_1),
    ._GEN_118_0(phy__GEN_118_0),
    ._GEN_103_0(phy__GEN_103_0),
    ._GEN_106_0(phy__GEN_106_0),
    ._GEN_75_0(phy__GEN_75_0),
    ._GEN_81_0(phy__GEN_81_0),
    ._GEN_96_1(phy__GEN_96_1),
    ._GEN_90_0(phy__GEN_90_0),
    ._GEN_112_0(phy__GEN_112_0),
    ._GEN_67_0(phy__GEN_67_0),
    ._GEN_84_0(phy__GEN_84_0),
    ._GEN_99_1(phy__GEN_99_1),
    ._GEN_60_0(phy__GEN_60_0),
    ._GEN_78_0(phy__GEN_78_0),
    ._GEN_21_1(phy__GEN_21_1),
    ._GEN_57_0(phy__GEN_57_0),
    ._GEN_72_1(phy__GEN_72_1),
    ._GEN_123_0(phy__GEN_123_0),
    ._GEN_63_1(phy__GEN_63_1),
    ._GEN_132_1(phy__GEN_132_1),
    ._GEN_11_0(phy__GEN_11_0),
    ._GEN_111_1(phy__GEN_111_1),
    ._GEN_105_1(phy__GEN_105_1),
    ._GEN_120_1(phy__GEN_120_1),
    ._GEN_126_1(phy__GEN_126_1),
    ._GEN_135_1(phy__GEN_135_1),
    ._GEN_129_0(phy__GEN_129_0),
    ._GEN_98_1(phy__GEN_98_1),
    ._GEN_114_1(phy__GEN_114_1),
    ._GEN_108_1(phy__GEN_108_1),
    ._GEN_71_2(phy__GEN_71_2),
    ._GEN_80_2(phy__GEN_80_2),
    ._GEN_102_1(phy__GEN_102_1),
    ._GEN_92_1(phy__GEN_92_1),
    ._GEN_86_3(phy__GEN_86_3),
    ._GEN_117_1(phy__GEN_117_1),
    ._GEN_89_2(phy__GEN_89_2),
    ._GEN_74_0(phy__GEN_74_0),
    ._GEN_66_1(phy__GEN_66_1),
    ._GEN_95_1(phy__GEN_95_1),
    ._GEN_10_1(phy__GEN_10_1),
    ._GEN_59_1(phy__GEN_59_1),
    ._GEN_83_2(phy__GEN_83_2),
    ._GEN_134_1(phy__GEN_134_1),
    ._GEN_20_0(phy__GEN_20_0),
    ._GEN_77_2(phy__GEN_77_2),
    ._GEN_62_2(phy__GEN_62_2),
    ._GEN_55_2(phy__GEN_55_2),
    ._GEN_122_1(phy__GEN_122_1),
    ._GEN_116_1(phy__GEN_116_1),
    ._GEN_131_1(phy__GEN_131_1),
    ._GEN_104_2(phy__GEN_104_2),
    ._GEN_125_1(phy__GEN_125_1),
    ._GEN_119_1(phy__GEN_119_1),
    ._GEN_113_1(phy__GEN_113_1),
    ._GEN_128_1(phy__GEN_128_1),
    ._GEN_82_3(phy__GEN_82_3),
    ._GEN_107_1(phy__GEN_107_1),
    ._GEN_97_1(phy__GEN_97_1),
    ._GEN_100_2(phy__GEN_100_2),
    ._GEN_85_2(phy__GEN_85_2),
    ._GEN_79_3(phy__GEN_79_3),
    ._GEN_101_1(phy__GEN_101_1),
    ._GEN_91_2(phy__GEN_91_2),
    ._GEN_110_1(phy__GEN_110_1),
    ._GEN_61_2(phy__GEN_61_2),
    ._GEN_65_2(phy__GEN_65_2),
    ._GEN_88_3(phy__GEN_88_3),
    ._GEN_94_2(phy__GEN_94_2),
    ._GEN_73_3(phy__GEN_73_3),
    ._GEN_76_1(phy__GEN_76_1),
    ._GEN_127_1(phy__GEN_127_1),
    ._GEN_14_0(phy__GEN_14_0),
    ._GEN_133_1(phy__GEN_133_1),
    ._GEN_58_2(phy__GEN_58_2),
    ._GEN_70_3(phy__GEN_70_3)
  );
  assign phy_metaReset = metaReset;
  assign io_port_sck = phy_io_port_sck; // @[SPIMedia.scala 55:15]
  assign io_port_dq_0_o = phy_io_port_dq_0_o; // @[SPIMedia.scala 56:14]
  assign io_port_dq_0_oe = phy_io_port_dq_0_oe; // @[SPIMedia.scala 56:14]
  assign io_port_dq_1_o = phy_io_port_dq_1_o; // @[SPIMedia.scala 56:14]
  assign io_port_dq_1_oe = phy_io_port_dq_1_oe; // @[SPIMedia.scala 56:14]
  assign io_port_dq_2_o = phy_io_port_dq_2_o; // @[SPIMedia.scala 56:14]
  assign io_port_dq_2_oe = phy_io_port_dq_2_oe; // @[SPIMedia.scala 56:14]
  assign io_port_dq_3_o = phy_io_port_dq_3_o; // @[SPIMedia.scala 56:14]
  assign io_port_dq_3_oe = phy_io_port_dq_3_oe; // @[SPIMedia.scala 56:14]
  assign io_port_cs_0 = cs_dflt_0; // @[SPIMedia.scala 57:14]
  assign io_port_cs_1 = cs_dflt_1; // @[SPIMedia.scala 57:14]
  assign io_port_cs_2 = cs_dflt_2; // @[SPIMedia.scala 57:14]
  assign io_port_cs_3 = cs_dflt_3; // @[SPIMedia.scala 57:14]
  assign io_link_tx_ready = _T_104 & _GEN_28; // @[SPIMedia.scala 60:20 SPIMedia.scala 79:28]
  assign io_link_rx_valid = phy_io_rx_valid; // @[SPIMedia.scala 59:14]
  assign io_link_rx_bits = phy_io_rx_bits; // @[SPIMedia.scala 59:14]
  assign _GEN_115_0 = phy__GEN_115_0;
  assign _GEN_105_0 = 2'h2 == state;
  assign _GEN_39_0 = phy__GEN_39_0;
  assign _GEN_111_0 = 2'h1 == state;
  assign _GEN_96_0 = phy_io_op_ready | continuous;
  assign _GEN_132_0 = 2'h0 == state;
  assign _GEN_109_0 = phy__GEN_109_0;
  assign _GEN_117_0 = 2'h1 == state;
  assign _GEN_121_0 = phy__GEN_121_0;
  assign _GEN_130_0 = phy__GEN_130_0;
  assign _GEN_126_0 = 2'h0 == state;
  assign _GEN_120_0 = 2'h0 == state;
  assign _GEN_124_0 = phy__GEN_124_0;
  assign _GEN_93_0 = phy__GEN_93_0;
  assign _GEN_114_0 = 2'h1 == state;
  assign _GEN_83_1 = io_link_tx_valid;
  assign _GEN_87_1 = phy__GEN_87_1;
  assign _GEN_99_0 = phy_io_op_ready;
  assign _GEN_118_0 = phy__GEN_118_0;
  assign _GEN_135_0 = reset;
  assign _GEN_103_0 = phy__GEN_103_0;
  assign _GEN_89_0 = cs_assert;
  assign _GEN_102_0 = 2'h2 == state;
  assign _GEN_92_0 = cs_assert;
  assign _GEN_106_0 = phy__GEN_106_0;
  assign _GEN_75_0 = phy__GEN_75_0;
  assign _GEN_43_0 = phy_io_op_ready & phy_io_op_valid;
  assign _GEN_108_0 = 2'h2 == state;
  assign _GEN_77_1 = io_link_tx_valid;
  assign _GEN_81_0 = phy__GEN_81_0;
  assign _GEN_96_1 = phy__GEN_96_1;
  assign _GEN_90_0 = phy__GEN_90_0;
  assign _GEN_68_1 = phy_io_op_ready;
  assign _GEN_112_0 = phy__GEN_112_0;
  assign _GEN_67_0 = phy__GEN_67_0;
  assign _GEN_84_0 = phy__GEN_84_0;
  assign _GEN_95_0 = cs_assert;
  assign _GEN_99_1 = phy__GEN_99_1;
  assign _GEN_60_0 = phy__GEN_60_0;
  assign _GEN_86_2 = cs_assert;
  assign _GEN_71_1 = phy_io_op_ready;
  assign _GEN_80_1 = io_link_tx_valid;
  assign _GEN_78_0 = phy__GEN_78_0;
  assign _GEN_21_1 = phy__GEN_21_1;
  assign _GEN_119_0 = 2'h1 == state;
  assign _GEN_57_0 = phy__GEN_57_0;
  assign _GEN_72_1 = phy__GEN_72_1;
  assign _GEN_123_0 = phy__GEN_123_0;
  assign _GEN_64_0 = clear | cs_update;
  assign _GEN_134_0 = reset;
  assign _GEN_63_1 = phy__GEN_63_1;
  assign _GEN_128_0 = 2'h0 == state;
  assign _GEN_132_1 = phy__GEN_132_1;
  assign _GEN_11_0 = phy__GEN_11_0;
  assign _GEN_107_0 = 2'h2 == state;
  assign _GEN_101_0 = phy_io_op_ready;
  assign _GEN_111_1 = phy__GEN_111_1;
  assign _GEN_105_1 = phy__GEN_105_1;
  assign _GEN_120_1 = phy__GEN_120_1;
  assign _GEN_122_0 = 2'h0 == state;
  assign _GEN_126_1 = phy__GEN_126_1;
  assign _GEN_131_0 = 2'h0 == state;
  assign _GEN_135_1 = phy__GEN_135_1;
  assign _GEN_129_0 = phy__GEN_129_0;
  assign _GEN_116_0 = 2'h1 == state;
  assign _GEN_125_0 = 2'h0 == state;
  assign _GEN_98_1 = phy__GEN_98_1;
  assign _GEN_110_0 = 2'h1 == state;
  assign _GEN_114_1 = phy__GEN_114_1;
  assign _GEN_108_1 = phy__GEN_108_1;
  assign _GEN_104_1 = 2'h2 == state;
  assign _GEN_94_1 = cs_assert;
  assign _GEN_82_2 = io_link_tx_valid;
  assign _GEN_98_2 = phy_io_op_ready;
  assign _GEN_63_2 = clear | cs_update;
  assign _GEN_113_0 = 2'h1 == state;
  assign _GEN_71_2 = phy__GEN_71_2;
  assign _GEN_80_2 = phy__GEN_80_2;
  assign _GEN_88_1 = cs_assert;
  assign _GEN_102_1 = phy__GEN_102_1;
  assign _GEN_92_1 = phy__GEN_92_1;
  assign _GEN_86_3 = phy__GEN_86_3;
  assign _GEN_117_1 = phy__GEN_117_1;
  assign _GEN_73_1 = io_link_tx_valid;
  assign _GEN_91_1 = cs_assert;
  assign _GEN_89_2 = phy__GEN_89_2;
  assign _GEN_74_0 = phy__GEN_74_0;
  assign _GEN_4_2 = phy_io_op_ready;
  assign _GEN_66_0 = phy_io_op_ready;
  assign _GEN_66_1 = phy__GEN_66_1;
  assign _GEN_95_1 = phy__GEN_95_1;
  assign _GEN_85_1 = cs_assert;
  assign _GEN_10_1 = phy__GEN_10_1;
  assign _GEN_79_2 = io_link_tx_valid;
  assign _GEN_130_1 = 2'h0 == state;
  assign _GEN_59_1 = phy__GEN_59_1;
  assign _GEN_83_2 = phy__GEN_83_2;
  assign _GEN_134_1 = phy__GEN_134_1;
  assign _GEN_20_0 = phy__GEN_20_0;
  assign _GEN_70_2 = phy_io_op_ready;
  assign _GEN_77_2 = phy__GEN_77_2;
  assign _GEN_118_1 = 2'h1 == state;
  assign _GEN_62_2 = phy__GEN_62_2;
  assign _GEN_133_0 = reset;
  assign _GEN_55_2 = phy__GEN_55_2;
  assign _GEN_122_1 = phy__GEN_122_1;
  assign _GEN_112_1 = 2'h1 == state;
  assign _GEN_116_1 = phy__GEN_116_1;
  assign _GEN_127_0 = 2'h0 == state;
  assign _GEN_100_1 = phy_io_op_ready;
  assign _GEN_131_1 = phy__GEN_131_1;
  assign _GEN_121_1 = 2'h0 == state;
  assign _GEN_104_2 = phy__GEN_104_2;
  assign _GEN_106_2 = 2'h2 == state;
  assign _GEN_115_1 = 2'h1 == state;
  assign _GEN_125_1 = phy__GEN_125_1;
  assign _GEN_119_1 = phy__GEN_119_1;
  assign _GEN_113_1 = phy__GEN_113_1;
  assign _GEN_128_1 = phy__GEN_128_1;
  assign _GEN_109_1 = 2'h2 == state;
  assign _GEN_103_2 = 2'h2 == state;
  assign _GEN_78_3 = io_link_tx_valid;
  assign _GEN_82_3 = phy__GEN_82_3;
  assign _GEN_93_2 = cs_assert;
  assign _GEN_107_1 = phy__GEN_107_1;
  assign _GEN_97_1 = phy__GEN_97_1;
  assign _GEN_124_1 = 2'h0 == state;
  assign _GEN_81_3 = io_link_tx_valid;
  assign _GEN_87_3 = cs_assert;
  assign _GEN_100_2 = phy__GEN_100_2;
  assign _GEN_85_2 = phy__GEN_85_2;
  assign _GEN_61_1 = clear | cs_update;
  assign _GEN_72_3 = io_link_tx_valid;
  assign _GEN_97_2 = phy_io_op_ready;
  assign _GEN_79_3 = phy__GEN_79_3;
  assign _GEN_101_1 = phy__GEN_101_1;
  assign _GEN_91_2 = phy__GEN_91_2;
  assign _GEN_110_1 = phy__GEN_110_1;
  assign _GEN_61_2 = phy__GEN_61_2;
  assign _GEN_65_2 = phy__GEN_65_2;
  assign _GEN_88_3 = phy__GEN_88_3;
  assign _GEN_90_2 = cs_assert;
  assign _GEN_94_2 = phy__GEN_94_2;
  assign _GEN_84_3 = cs_assert;
  assign _GEN_65_3 = clear | cs_update;
  assign _GEN_73_3 = phy__GEN_73_3;
  assign _GEN_69_1 = phy_io_op_ready;
  assign _GEN_76_1 = phy__GEN_76_1;
  assign _GEN_127_1 = phy__GEN_127_1;
  assign _GEN_129_1 = 2'h0 == state;
  assign _GEN_14_0 = phy__GEN_14_0;
  assign _GEN_133_1 = phy__GEN_133_1;
  assign _GEN_123_1 = 2'h0 == state;
  assign _GEN_58_2 = phy__GEN_58_2;
  assign _GEN_70_3 = phy__GEN_70_3;
  assign phy_clock = clock;
  assign phy_reset = reset;
  assign phy_io_port_dq_0_i = io_port_dq_0_i; // @[SPIMedia.scala 56:14]
  assign phy_io_port_dq_1_i = io_port_dq_1_i; // @[SPIMedia.scala 56:14]
  assign phy_io_port_dq_2_i = io_port_dq_2_i; // @[SPIMedia.scala 56:14]
  assign phy_io_port_dq_3_i = io_port_dq_3_i; // @[SPIMedia.scala 56:14]
  assign phy_io_ctrl_sck_div = io_ctrl_sck_div; // @[SPIMedia.scala 32:19]
  assign phy_io_ctrl_sck_pol = io_ctrl_sck_pol; // @[SPIMedia.scala 32:19]
  assign phy_io_ctrl_sck_pha = io_ctrl_sck_pha; // @[SPIMedia.scala 32:19]
  assign phy_io_ctrl_fmt_proto = io_link_fmt_proto; // @[SPIMedia.scala 33:19]
  assign phy_io_ctrl_fmt_endian = io_link_fmt_endian; // @[SPIMedia.scala 33:19]
  assign phy_io_ctrl_fmt_iodir = io_link_fmt_iodir; // @[SPIMedia.scala 33:19]
  assign phy_io_op_valid = _T_104 ? _GEN_27 : _GEN_51; // @[SPIMedia.scala 36:12 SPIMedia.scala 78:20 SPIMedia.scala 102:16]
  assign phy_io_op_bits_fn = _T_104 ? _GEN_25 : 1'h1; // @[SPIMedia.scala 37:14 SPIMedia.scala 75:22]
  assign phy_io_op_bits_stb = _T_104 ? _GEN_26 : _GEN_54; // @[SPIMedia.scala 38:15 SPIMedia.scala 76:23 SPIMedia.scala 95:21 SPIMedia.scala 112:19]
  assign phy_io_op_bits_cnt = _T_104 ? _GEN_23 : _GEN_52; // @[SPIMedia.scala 39:15 SPIMedia.scala 70:23 SPIMedia.scala 86:21 SPIMedia.scala 94:21 SPIMedia.scala 103:19 SPIMedia.scala 111:19]
  assign phy_io_op_bits_data = io_link_tx_bits; // @[SPIMedia.scala 40:16]
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
  cs_id = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  cs_dflt_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cs_dflt_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cs_dflt_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cs_dflt_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cs_set = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  clear = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  cs_assert = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state = _RAND_8[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      cs_id <= 2'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (!(io_link_tx_valid)) begin
          cs_id <= io_ctrl_cs_id;
        end
      end
    end
    if (metaReset) begin
      cs_dflt_0 <= 1'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_dflt_0 <= cs_active_0;
          end
        end else begin
          cs_dflt_0 <= io_ctrl_cs_dflt_0;
        end
      end
    end else if (!(_T_111)) begin
      if (_T_115) begin
        if (phy_io_op_ready) begin
          cs_dflt_0 <= _T_123[0];
        end
      end
    end
    if (metaReset) begin
      cs_dflt_1 <= 1'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_dflt_1 <= cs_active_1;
          end
        end else begin
          cs_dflt_1 <= io_ctrl_cs_dflt_1;
        end
      end
    end else if (!(_T_111)) begin
      if (_T_115) begin
        if (phy_io_op_ready) begin
          cs_dflt_1 <= _T_123[1];
        end
      end
    end
    if (metaReset) begin
      cs_dflt_2 <= 1'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_dflt_2 <= cs_active_2;
          end
        end else begin
          cs_dflt_2 <= io_ctrl_cs_dflt_2;
        end
      end
    end else if (!(_T_111)) begin
      if (_T_115) begin
        if (phy_io_op_ready) begin
          cs_dflt_2 <= _T_123[2];
        end
      end
    end
    if (metaReset) begin
      cs_dflt_3 <= 1'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_dflt_3 <= cs_active_3;
          end
        end else begin
          cs_dflt_3 <= io_ctrl_cs_dflt_3;
        end
      end
    end else if (!(_T_111)) begin
      if (_T_115) begin
        if (phy_io_op_ready) begin
          cs_dflt_3 <= _T_123[3];
        end
      end
    end
    if (metaReset) begin
      cs_set <= 1'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_set <= io_link_cs_set;
          end
        end
      end
    end
    if (metaReset) begin
      clear <= 1'h0;
    end else if (reset) begin
      clear <= 1'h0;
    end else if (_T_104) begin
      clear <= _T_99;
    end else if (_T_111) begin
      clear <= _T_99;
    end else if (_T_115) begin
      clear <= 1'h0;
    end else begin
      clear <= _T_99;
    end
    if (metaReset) begin
      cs_assert <= 1'h0;
    end else if (reset) begin
      cs_assert <= 1'h0;
    end else if (_T_104) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          cs_assert <= _GEN_8;
        end
      end
    end else if (!(_T_111)) begin
      if (_T_115) begin
        cs_assert <= 1'h0;
      end
    end
    if (metaReset) begin
      state <= 2'h0;
    end else if (reset) begin
      state <= 2'h0;
    end else if (_T_104) begin
      if (cs_assert) begin
        if (cs_deassert) begin
          if (phy_io_op_ready) begin
            state <= 2'h2;
          end
        end else if (_T_107) begin
          state <= 2'h1;
        end
      end
    end else if (_T_111) begin
      if (_T_114) begin
        state <= 2'h0;
      end
    end else if (_T_115) begin
      if (phy_io_op_ready) begin
        state <= 2'h0;
      end
    end
  end
endmodule
module Queue_18(
  input        metaReset,
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits,
  output [3:0] io_count,
  output       _GEN_2_0,
  output       _GEN_1_0,
  output       _GEN_4_1,
  output       _GEN_0_0,
  output       _GEN_3_1,
  output       _GEN_8_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  mem_sparse_metaReset; // @[Decoupled.scala 214:24]
  wire  mem_sparse_clock; // @[Decoupled.scala 214:24]
  wire  mem_sparse_reset; // @[Decoupled.scala 214:24]
  wire [2:0] mem_sparse_io_w_0_addr; // @[Decoupled.scala 214:24]
  wire  mem_sparse_io_w_0_en; // @[Decoupled.scala 214:24]
  wire [7:0] mem_sparse_io_w_0_data; // @[Decoupled.scala 214:24]
  wire [2:0] mem_sparse_io_r_0_addr; // @[Decoupled.scala 214:24]
  wire [7:0] mem_sparse_io_r_0_data; // @[Decoupled.scala 214:24]
  reg [2:0] value; // @[Counter.scala 26:33]
  reg [2:0] value_1; // @[Counter.scala 26:33]
  reg  maybe_full; // @[Decoupled.scala 217:35]
  wire  _T_41 = value == value_1; // @[Decoupled.scala 219:41]
  wire  _T_43 = ~maybe_full; // @[Decoupled.scala 220:36]
  wire  empty = _T_41 & _T_43; // @[Decoupled.scala 220:33]
  wire  _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 221:32]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37]
  wire [2:0] _T_53 = value + 3'h1; // @[Counter.scala 35:22]
  wire [2:0] _T_57 = value_1 + 3'h1; // @[Counter.scala 35:22]
  wire  _T_58 = do_enq != do_deq; // @[Decoupled.scala 232:16]
  wire [2:0] _T_66 = value - value_1; // @[Decoupled.scala 253:40]
  wire  _T_67 = maybe_full & _T_41; // @[Decoupled.scala 255:32]
  SparseMem mem_sparse ( // @[Decoupled.scala 214:24]
    .metaReset(mem_sparse_metaReset),
    .clock(mem_sparse_clock),
    .reset(mem_sparse_reset),
    .io_w_0_addr(mem_sparse_io_w_0_addr),
    .io_w_0_en(mem_sparse_io_w_0_en),
    .io_w_0_data(mem_sparse_io_w_0_data),
    .io_r_0_addr(mem_sparse_io_r_0_addr),
    .io_r_0_data(mem_sparse_io_r_0_data)
  );
  assign mem_sparse_metaReset = metaReset;
  assign io_enq_ready = ~_T_44; // @[Decoupled.scala 237:16]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 236:16]
  assign io_deq_bits = mem_sparse_io_r_0_data; // @[Decoupled.scala 238:15]
  assign io_count = {_T_67,_T_66}; // @[Decoupled.scala 255:14]
  assign _GEN_2_0 = do_enq != do_deq;
  assign _GEN_1_0 = io_deq_ready & io_deq_valid;
  assign _GEN_4_1 = reset;
  assign _GEN_0_0 = io_enq_ready & io_enq_valid;
  assign _GEN_3_1 = reset;
  assign _GEN_8_2 = reset;
  assign mem_sparse_clock = clock;
  assign mem_sparse_reset = reset;
  assign mem_sparse_io_w_0_addr = value;
  assign mem_sparse_io_w_0_en = io_enq_ready & io_enq_valid;
  assign mem_sparse_io_w_0_data = io_enq_bits;
  assign mem_sparse_io_r_0_addr = value_1;
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
  value = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  value_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  maybe_full = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      value <= 3'h0;
    end else if (reset) begin
      value <= 3'h0;
    end else if (do_enq) begin
      value <= _T_53;
    end
    if (metaReset) begin
      value_1 <= 3'h0;
    end else if (reset) begin
      value_1 <= 3'h0;
    end else if (do_deq) begin
      value_1 <= _T_57;
    end
    if (metaReset) begin
      maybe_full <= 1'h0;
    end else if (reset) begin
      maybe_full <= 1'h0;
    end else if (_T_58) begin
      maybe_full <= do_enq;
    end
  end
endmodule
module SparseMem(
  input        metaReset,
  input        clock,
  input        reset,
  input  [2:0] io_w_0_addr,
  input        io_w_0_en,
  input  [7:0] io_w_0_data,
  input  [2:0] io_r_0_addr,
  output [7:0] io_r_0_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:7];
  wire [7:0] mem__T_46_data;
  wire [2:0] mem__T_46_addr;
  wire [7:0] mem__T_93_data;
  wire [2:0] mem__T_93_addr;
  wire  mem__T_93_mask;
  wire  mem__T_93_en;
  reg  addresses_0_valid;
  reg [2:0] addresses_0_bits;
  reg  addresses_1_valid;
  reg [2:0] addresses_1_bits;
  reg  addresses_2_valid;
  reg [2:0] addresses_2_bits;
  reg  addresses_3_valid;
  reg [2:0] addresses_3_bits;
  reg  addresses_4_valid;
  reg [2:0] addresses_4_bits;
  reg  addresses_5_valid;
  reg [2:0] addresses_5_bits;
  reg  addresses_6_valid;
  reg [2:0] addresses_6_bits;
  reg  addresses_7_valid;
  reg [2:0] addresses_7_bits;
  wire  _T_9 = addresses_0_bits == io_r_0_addr;
  wire  _T_10 = addresses_0_valid & _T_9;
  wire  _T_11 = addresses_1_bits == io_r_0_addr;
  wire  _T_12 = addresses_1_valid & _T_11;
  wire  _T_13 = addresses_2_bits == io_r_0_addr;
  wire  _T_14 = addresses_2_valid & _T_13;
  wire  _T_15 = addresses_3_bits == io_r_0_addr;
  wire  _T_16 = addresses_3_valid & _T_15;
  wire  _T_17 = addresses_4_bits == io_r_0_addr;
  wire  _T_18 = addresses_4_valid & _T_17;
  wire  _T_19 = addresses_5_bits == io_r_0_addr;
  wire  _T_20 = addresses_5_valid & _T_19;
  wire  _T_21 = addresses_6_bits == io_r_0_addr;
  wire  _T_22 = addresses_6_valid & _T_21;
  wire  _T_23 = addresses_7_bits == io_r_0_addr;
  wire  _T_24 = addresses_7_valid & _T_23;
  wire [7:0] _T_32 = {_T_24,_T_22,_T_20,_T_18,_T_16,_T_14,_T_12,_T_10};
  wire  _T_33 = _T_32 != 8'h0;
  wire  _T_36 = |_T_32[7:4];
  wire [3:0] _T_37 = _T_32[7:4] | _T_32[3:0];
  wire  _T_40 = |_T_37[3:2];
  wire [1:0] _T_41 = _T_37[3:2] | _T_37[1:0];
  wire [1:0] _T_43 = {_T_40,_T_41[1]};
  reg [3:0] nextAddr;
  wire [3:0] _T_50 = nextAddr + 4'h1;
  wire  _T_51 = addresses_0_bits == io_w_0_addr;
  wire  _T_52 = addresses_0_valid & _T_51;
  wire  _T_53 = addresses_1_bits == io_w_0_addr;
  wire  _T_54 = addresses_1_valid & _T_53;
  wire  _T_55 = addresses_2_bits == io_w_0_addr;
  wire  _T_56 = addresses_2_valid & _T_55;
  wire  _T_57 = addresses_3_bits == io_w_0_addr;
  wire  _T_58 = addresses_3_valid & _T_57;
  wire  _T_59 = addresses_4_bits == io_w_0_addr;
  wire  _T_60 = addresses_4_valid & _T_59;
  wire  _T_61 = addresses_5_bits == io_w_0_addr;
  wire  _T_62 = addresses_5_valid & _T_61;
  wire  _T_63 = addresses_6_bits == io_w_0_addr;
  wire  _T_64 = addresses_6_valid & _T_63;
  wire  _T_65 = addresses_7_bits == io_w_0_addr;
  wire  _T_66 = addresses_7_valid & _T_65;
  wire [7:0] _T_74 = {_T_66,_T_64,_T_62,_T_60,_T_58,_T_56,_T_54,_T_52};
  wire  _T_75 = _T_74 != 8'h0;
  wire  _T_78 = |_T_74[7:4];
  wire [3:0] _T_79 = _T_74[7:4] | _T_74[3:0];
  wire  _T_82 = |_T_79[3:2];
  wire [1:0] _T_83 = _T_79[3:2] | _T_79[1:0];
  wire [2:0] _T_86 = {_T_78,_T_82,_T_83[1]};
  wire  _T_87 = ~_T_75;
  wire  _T_88 = io_w_0_en & _T_87;
  wire [3:0] _T_89 = _T_75 ? {{1'd0}, _T_86} : nextAddr;
  wire  _GEN_37 = 3'h0 == _T_89[2:0];
  wire  _GEN_0 = _GEN_37 | addresses_0_valid;
  wire  _GEN_38 = 3'h1 == _T_89[2:0];
  wire  _GEN_1 = _GEN_38 | addresses_1_valid;
  wire  _GEN_39 = 3'h2 == _T_89[2:0];
  wire  _GEN_2 = _GEN_39 | addresses_2_valid;
  wire  _GEN_40 = 3'h3 == _T_89[2:0];
  wire  _GEN_3 = _GEN_40 | addresses_3_valid;
  wire  _GEN_41 = 3'h4 == _T_89[2:0];
  wire  _GEN_4 = _GEN_41 | addresses_4_valid;
  wire  _GEN_42 = 3'h5 == _T_89[2:0];
  wire  _GEN_5 = _GEN_42 | addresses_5_valid;
  wire  _GEN_43 = 3'h6 == _T_89[2:0];
  wire  _GEN_6 = _GEN_43 | addresses_6_valid;
  wire  _GEN_44 = 3'h7 == _T_89[2:0];
  wire  _GEN_7 = _GEN_44 | addresses_7_valid;
  wire [3:0] nextAddrUpdate = _T_88 ? _T_50 : nextAddr;
  wire  _T_96 = nextAddrUpdate <= 4'h8;
  wire  _T_98 = _T_96 | reset;
  wire  _T_99 = ~_T_98;
  assign mem__T_46_addr = {_T_36,_T_43};
  assign mem__T_46_data = mem[mem__T_46_addr];
  assign mem__T_93_data = io_w_0_data;
  assign mem__T_93_addr = _T_89[2:0];
  assign mem__T_93_mask = 1'h1;
  assign mem__T_93_en = io_w_0_en;
  assign io_r_0_data = _T_33 ? mem__T_46_data : 8'h0;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addresses_0_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  addresses_0_bits = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  addresses_1_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addresses_1_bits = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  addresses_2_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  addresses_2_bits = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  addresses_3_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  addresses_3_bits = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  addresses_4_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  addresses_4_bits = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  addresses_5_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  addresses_5_bits = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  addresses_6_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  addresses_6_bits = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  addresses_7_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  addresses_7_bits = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  nextAddr = _RAND_17[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem__T_93_en & mem__T_93_mask) begin
      mem[mem__T_93_addr] <= mem__T_93_data;
    end
    if (metaReset) begin
      addresses_0_valid <= 1'h0;
    end else if (reset) begin
      addresses_0_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_0_valid <= _GEN_0;
    end
    if (metaReset) begin
      addresses_0_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h0 == _T_89[2:0]) begin
        addresses_0_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_1_valid <= 1'h0;
    end else if (reset) begin
      addresses_1_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_1_valid <= _GEN_1;
    end
    if (metaReset) begin
      addresses_1_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h1 == _T_89[2:0]) begin
        addresses_1_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_2_valid <= 1'h0;
    end else if (reset) begin
      addresses_2_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_2_valid <= _GEN_2;
    end
    if (metaReset) begin
      addresses_2_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h2 == _T_89[2:0]) begin
        addresses_2_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_3_valid <= 1'h0;
    end else if (reset) begin
      addresses_3_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_3_valid <= _GEN_3;
    end
    if (metaReset) begin
      addresses_3_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h3 == _T_89[2:0]) begin
        addresses_3_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_4_valid <= 1'h0;
    end else if (reset) begin
      addresses_4_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_4_valid <= _GEN_4;
    end
    if (metaReset) begin
      addresses_4_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h4 == _T_89[2:0]) begin
        addresses_4_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_5_valid <= 1'h0;
    end else if (reset) begin
      addresses_5_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_5_valid <= _GEN_5;
    end
    if (metaReset) begin
      addresses_5_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h5 == _T_89[2:0]) begin
        addresses_5_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_6_valid <= 1'h0;
    end else if (reset) begin
      addresses_6_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_6_valid <= _GEN_6;
    end
    if (metaReset) begin
      addresses_6_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h6 == _T_89[2:0]) begin
        addresses_6_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_7_valid <= 1'h0;
    end else if (reset) begin
      addresses_7_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_7_valid <= _GEN_7;
    end
    if (metaReset) begin
      addresses_7_bits <= 3'h0;
    end else if (io_w_0_en) begin
      if (3'h7 == _T_89[2:0]) begin
        addresses_7_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      nextAddr <= 4'h0;
    end else if (reset) begin
      nextAddr <= 4'h0;
    end else if (_T_88) begin
      nextAddr <= _T_50;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Queue_19(
  input        metaReset,
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits,
  output [3:0] io_count,
  output       _GEN_4_0,
  output       _GEN_1_1,
  output       _GEN_3_0,
  output       _GEN_0_1,
  output       _GEN_8_3,
  output       _GEN_2_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  mem_sparse_metaReset; // @[Decoupled.scala 214:24]
  wire  mem_sparse_clock; // @[Decoupled.scala 214:24]
  wire  mem_sparse_reset; // @[Decoupled.scala 214:24]
  wire [2:0] mem_sparse_io_w_0_addr; // @[Decoupled.scala 214:24]
  wire  mem_sparse_io_w_0_en; // @[Decoupled.scala 214:24]
  wire [7:0] mem_sparse_io_w_0_data; // @[Decoupled.scala 214:24]
  wire [2:0] mem_sparse_io_r_0_addr; // @[Decoupled.scala 214:24]
  wire [7:0] mem_sparse_io_r_0_data; // @[Decoupled.scala 214:24]
  reg [2:0] value; // @[Counter.scala 26:33]
  reg [2:0] value_1; // @[Counter.scala 26:33]
  reg  maybe_full; // @[Decoupled.scala 217:35]
  wire  _T_41 = value == value_1; // @[Decoupled.scala 219:41]
  wire  _T_43 = ~maybe_full; // @[Decoupled.scala 220:36]
  wire  empty = _T_41 & _T_43; // @[Decoupled.scala 220:33]
  wire  _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 221:32]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37]
  wire [2:0] _T_53 = value + 3'h1; // @[Counter.scala 35:22]
  wire [2:0] _T_57 = value_1 + 3'h1; // @[Counter.scala 35:22]
  wire  _T_58 = do_enq != do_deq; // @[Decoupled.scala 232:16]
  wire [2:0] _T_66 = value - value_1; // @[Decoupled.scala 253:40]
  wire  _T_67 = maybe_full & _T_41; // @[Decoupled.scala 255:32]
  SparseMem mem_sparse ( // @[Decoupled.scala 214:24]
    .metaReset(mem_sparse_metaReset),
    .clock(mem_sparse_clock),
    .reset(mem_sparse_reset),
    .io_w_0_addr(mem_sparse_io_w_0_addr),
    .io_w_0_en(mem_sparse_io_w_0_en),
    .io_w_0_data(mem_sparse_io_w_0_data),
    .io_r_0_addr(mem_sparse_io_r_0_addr),
    .io_r_0_data(mem_sparse_io_r_0_data)
  );
  assign mem_sparse_metaReset = metaReset;
  assign io_enq_ready = ~_T_44; // @[Decoupled.scala 237:16]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 236:16]
  assign io_deq_bits = mem_sparse_io_r_0_data; // @[Decoupled.scala 238:15]
  assign io_count = {_T_67,_T_66}; // @[Decoupled.scala 255:14]
  assign _GEN_4_0 = reset;
  assign _GEN_1_1 = io_deq_ready & io_deq_valid;
  assign _GEN_3_0 = reset;
  assign _GEN_0_1 = io_enq_ready & io_enq_valid;
  assign _GEN_8_3 = reset;
  assign _GEN_2_2 = do_enq != do_deq;
  assign mem_sparse_clock = clock;
  assign mem_sparse_reset = reset;
  assign mem_sparse_io_w_0_addr = value;
  assign mem_sparse_io_w_0_en = io_enq_ready & io_enq_valid;
  assign mem_sparse_io_w_0_data = io_enq_bits;
  assign mem_sparse_io_r_0_addr = value_1;
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
  value = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  value_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  maybe_full = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      value <= 3'h0;
    end else if (reset) begin
      value <= 3'h0;
    end else if (do_enq) begin
      value <= _T_53;
    end
    if (metaReset) begin
      value_1 <= 3'h0;
    end else if (reset) begin
      value_1 <= 3'h0;
    end else if (do_deq) begin
      value_1 <= _T_57;
    end
    if (metaReset) begin
      maybe_full <= 1'h0;
    end else if (reset) begin
      maybe_full <= 1'h0;
    end else if (_T_58) begin
      maybe_full <= do_enq;
    end
  end
endmodule
module SPIPhysical_1(
  input         metaReset,
  input         clock,
  input         reset,
  output        io_port_sck,
  input         io_port_dq_0_i,
  output        io_port_dq_0_o,
  output        io_port_dq_0_oe,
  input         io_port_dq_1_i,
  output        io_port_dq_1_o,
  output        io_port_dq_1_oe,
  input         io_port_dq_2_i,
  output        io_port_dq_2_o,
  output        io_port_dq_2_oe,
  input         io_port_dq_3_i,
  output        io_port_dq_3_o,
  output        io_port_dq_3_oe,
  input  [11:0] io_ctrl_sck_div,
  input         io_ctrl_sck_pol,
  input         io_ctrl_sck_pha,
  input  [1:0]  io_ctrl_fmt_proto,
  input         io_ctrl_fmt_endian,
  input         io_ctrl_fmt_iodir,
  output        io_op_ready,
  input         io_op_valid,
  input         io_op_bits_fn,
  input         io_op_bits_stb,
  input  [7:0]  io_op_bits_cnt,
  input  [7:0]  io_op_bits_data,
  output        io_rx_valid,
  output [7:0]  io_rx_bits,
  output        _GEN_115_0,
  output        _GEN_39_0,
  output        _GEN_109_0,
  output        _GEN_121_0,
  output        _GEN_130_0,
  output        _GEN_124_0,
  output        _GEN_93_0,
  output        _GEN_87_1,
  output        _GEN_118_0,
  output        _GEN_103_0,
  output        _GEN_106_0,
  output        _GEN_75_0,
  output        _GEN_81_0,
  output        _GEN_96_1,
  output        _GEN_90_0,
  output        _GEN_112_0,
  output        _GEN_67_0,
  output        _GEN_84_0,
  output        _GEN_99_1,
  output        _GEN_60_0,
  output        _GEN_78_0,
  output        _GEN_21_1,
  output        _GEN_57_0,
  output        _GEN_72_1,
  output        _GEN_123_0,
  output        _GEN_63_1,
  output        _GEN_132_1,
  output        _GEN_11_0,
  output        _GEN_111_1,
  output        _GEN_105_1,
  output        _GEN_120_1,
  output        _GEN_126_1,
  output        _GEN_135_1,
  output        _GEN_129_0,
  output        _GEN_98_1,
  output        _GEN_114_1,
  output        _GEN_108_1,
  output        _GEN_71_2,
  output        _GEN_80_2,
  output        _GEN_102_1,
  output        _GEN_92_1,
  output        _GEN_86_3,
  output        _GEN_117_1,
  output        _GEN_89_2,
  output        _GEN_74_0,
  output        _GEN_66_1,
  output        _GEN_95_1,
  output        _GEN_10_1,
  output        _GEN_59_1,
  output        _GEN_83_2,
  output        _GEN_134_1,
  output        _GEN_20_0,
  output        _GEN_77_2,
  output        _GEN_62_2,
  output        _GEN_55_2,
  output        _GEN_122_1,
  output        _GEN_116_1,
  output        _GEN_131_1,
  output        _GEN_104_2,
  output        _GEN_125_1,
  output        _GEN_119_1,
  output        _GEN_113_1,
  output        _GEN_128_1,
  output        _GEN_82_3,
  output        _GEN_107_1,
  output        _GEN_97_1,
  output        _GEN_100_2,
  output        _GEN_85_2,
  output        _GEN_79_3,
  output        _GEN_101_1,
  output        _GEN_91_2,
  output        _GEN_110_1,
  output        _GEN_61_2,
  output        _GEN_65_2,
  output        _GEN_88_3,
  output        _GEN_94_2,
  output        _GEN_73_3,
  output        _GEN_76_1,
  output        _GEN_127_1,
  output        _GEN_14_0,
  output        _GEN_133_1,
  output        _GEN_58_2,
  output        _GEN_70_3
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
`endif // RANDOMIZE_REG_INIT
  reg [11:0] ctrl_sck_div; // @[SPIPhysical.scala 33:17]
  reg  ctrl_sck_pol; // @[SPIPhysical.scala 33:17]
  reg  ctrl_sck_pha; // @[SPIPhysical.scala 33:17]
  reg [1:0] ctrl_fmt_proto; // @[SPIPhysical.scala 33:17]
  reg  ctrl_fmt_endian; // @[SPIPhysical.scala 33:17]
  reg  ctrl_fmt_iodir; // @[SPIPhysical.scala 33:17]
  wire  proto_0 = 2'h0 == ctrl_fmt_proto; // @[SPIConsts.scala 13:48]
  wire  proto_1 = 2'h1 == ctrl_fmt_proto; // @[SPIConsts.scala 13:48]
  wire  proto_2 = 2'h2 == ctrl_fmt_proto; // @[SPIConsts.scala 13:48]
  reg  setup_d; // @[SPIPhysical.scala 41:20]
  reg  _T_50; // @[ShiftReg.scala 15:18]
  reg  _T_51; // @[ShiftReg.scala 15:18]
  reg  sample_d; // @[ShiftReg.scala 15:18]
  reg  _T_53; // @[ShiftReg.scala 15:18]
  reg  _T_54; // @[ShiftReg.scala 15:18]
  reg  last_d; // @[ShiftReg.scala 15:18]
  reg [7:0] scnt; // @[SPIPhysical.scala 45:17]
  reg [11:0] tcnt; // @[SPIPhysical.scala 46:17]
  wire  stop = scnt == 8'h0; // @[SPIPhysical.scala 48:20]
  wire  beat = tcnt == 12'h0; // @[SPIPhysical.scala 49:20]
  wire [11:0] _T_59 = beat ? {{4'd0}, scnt} : tcnt; // @[SPIPhysical.scala 50:17]
  wire [11:0] decr = _T_59 - 12'h1; // @[SPIPhysical.scala 50:36]
  wire  sched = stop | beat; // @[SPIPhysical.scala 105:15]
  reg  sck; // @[SPIPhysical.scala 54:16]
  reg  cref; // @[SPIPhysical.scala 55:17]
  wire  cinv = ctrl_sck_pha ^ ctrl_sck_pol; // @[SPIPhysical.scala 56:27]
  wire [3:0] rxd = {io_port_dq_3_i,io_port_dq_2_i,io_port_dq_1_i,io_port_dq_0_i}; // @[Cat.scala 30:58]
  wire  samples_0 = rxd[1]; // @[SPIPhysical.scala 62:24]
  wire [1:0] samples_1 = rxd[1:0]; // @[SPIPhysical.scala 62:32]
  reg [7:0] buffer; // @[SPIPhysical.scala 64:19]
  wire  _T_71 = ~io_ctrl_fmt_endian; // @[SPIPhysical.scala 59:20]
  wire [7:0] _T_86 = {io_op_bits_data[0],io_op_bits_data[1],io_op_bits_data[2],io_op_bits_data[3],io_op_bits_data[4],io_op_bits_data[5],io_op_bits_data[6],io_op_bits_data[7]}; // @[Cat.scala 30:58]
  wire [7:0] buffer_in = _T_71 ? io_op_bits_data : _T_86; // @[SPIPhysical.scala 59:8]
  wire  _T_87 = sample_d & stop; // @[SPIPhysical.scala 66:59]
  wire  shift = setup_d | _T_87; // @[SPIPhysical.scala 66:46]
  wire [6:0] _T_90 = shift ? buffer[6:0] : buffer[7:1]; // @[SPIPhysical.scala 70:12]
  wire  _T_92 = sample_d ? samples_0 : buffer[0]; // @[SPIPhysical.scala 71:12]
  wire [7:0] _T_93 = {_T_90,_T_92}; // @[Cat.scala 30:58]
  wire [5:0] _T_96 = shift ? buffer[5:0] : buffer[7:2]; // @[SPIPhysical.scala 70:12]
  wire [1:0] _T_98 = sample_d ? samples_1 : buffer[1:0]; // @[SPIPhysical.scala 71:12]
  wire [7:0] _T_99 = {_T_96,_T_98}; // @[Cat.scala 30:58]
  wire [3:0] _T_102 = shift ? buffer[3:0] : buffer[7:4]; // @[SPIPhysical.scala 70:12]
  wire [3:0] _T_104 = sample_d ? rxd : buffer[3:0]; // @[SPIPhysical.scala 71:12]
  wire [7:0] _T_105 = {_T_102,_T_104}; // @[Cat.scala 30:58]
  wire [7:0] _T_108 = proto_0 ? _T_93 : 8'h0; // @[Mux.scala 19:72]
  wire [7:0] _T_110 = proto_1 ? _T_99 : 8'h0; // @[Mux.scala 19:72]
  wire [7:0] _T_112 = proto_2 ? _T_105 : 8'h0; // @[Mux.scala 19:72]
  wire [7:0] _T_113 = _T_108 | _T_110; // @[Mux.scala 19:72]
  wire [7:0] _T_114 = _T_113 | _T_112; // @[Mux.scala 19:72]
  reg [3:0] txd; // @[SPIPhysical.scala 76:16]
  wire  _T_190 = scnt == 8'h1; // @[SPIPhysical.scala 122:14]
  wire  _T_194 = ~cref; // @[SPIPhysical.scala 124:19]
  wire  _T_195 = beat & _T_194; // @[SPIPhysical.scala 124:16]
  wire  _GEN_17 = _T_195 | stop; // @[SPIPhysical.scala 124:26]
  wire  accept = _T_190 ? _GEN_17 : stop; // @[SPIPhysical.scala 122:27]
  wire [3:0] txd_in = accept ? buffer_in[7:4] : buffer[7:4]; // @[SPIPhysical.scala 77:19]
  wire [1:0] _T_121 = accept ? io_ctrl_fmt_proto : ctrl_fmt_proto; // @[SPIPhysical.scala 78:39]
  wire  txd_sel_0 = 2'h0 == _T_121; // @[SPIConsts.scala 13:48]
  wire  txd_sel_1 = 2'h1 == _T_121; // @[SPIConsts.scala 13:48]
  wire  txd_sel_2 = 2'h2 == _T_121; // @[SPIConsts.scala 13:48]
  wire  txd_shf_0 = txd_in[3]; // @[SPIPhysical.scala 79:55]
  wire [1:0] txd_shf_1 = txd_in[3:2]; // @[SPIPhysical.scala 79:55]
  wire  _T_127 = txd_sel_0 & txd_shf_0; // @[Mux.scala 19:72]
  wire [1:0] _T_129 = txd_sel_1 ? txd_shf_1 : 2'h0; // @[Mux.scala 19:72]
  wire [3:0] _T_131 = txd_sel_2 ? txd_in : 4'h0; // @[Mux.scala 19:72]
  wire [1:0] _GEN_68 = {{1'd0}, _T_127}; // @[Mux.scala 19:72]
  wire [1:0] _T_132 = _GEN_68 | _T_129; // @[Mux.scala 19:72]
  wire [3:0] _GEN_69 = {{2'd0}, _T_132}; // @[Mux.scala 19:72]
  wire [3:0] _T_133 = _GEN_69 | _T_131; // @[Mux.scala 19:72]
  reg  done; // @[SPIPhysical.scala 97:17]
  wire  _T_198 = accept & done; // @[SPIPhysical.scala 131:16]
  wire  _T_202 = ~io_op_bits_fn; // @[Conditional.scala 37:30]
  reg  xfr; // @[SPIPhysical.scala 103:16]
  wire  _GEN_3 = xfr & _T_194; // @[SPIPhysical.scala 111:18]
  wire  _GEN_8 = beat & _GEN_3; // @[SPIPhysical.scala 109:17]
  wire  _GEN_15 = stop ? 1'h0 : _GEN_8; // @[SPIPhysical.scala 105:15]
  wire  _GEN_18 = _T_195 ? 1'h0 : _GEN_15; // @[SPIPhysical.scala 124:26]
  wire  _GEN_22 = _T_190 ? _GEN_18 : _GEN_15; // @[SPIPhysical.scala 122:27]
  wire  _GEN_37 = _T_202 | _GEN_22; // @[Conditional.scala 40:58]
  wire  _GEN_50 = io_op_valid ? _GEN_37 : _GEN_22; // @[SPIPhysical.scala 133:24]
  wire  setup = _T_198 ? _GEN_50 : _GEN_22; // @[SPIPhysical.scala 131:25]
  wire  _T_137 = proto_1 & ctrl_fmt_iodir; // @[SPIPhysical.scala 85:49]
  wire  txen_2 = proto_2 & ctrl_fmt_iodir; // @[SPIPhysical.scala 85:49]
  wire  txen_1 = _T_137 | txen_2; // @[SPIPhysical.scala 85:82]
  wire  _T_160 = done | last_d; // @[SPIPhysical.scala 98:16]
  wire  _T_162 = ~ctrl_fmt_endian; // @[SPIPhysical.scala 59:20]
  wire [7:0] _T_177 = {buffer[0],buffer[1],buffer[2],buffer[3],buffer[4],buffer[5],buffer[6],buffer[7]}; // @[Cat.scala 30:58]
  wire  _T_184 = cref ^ cinv; // @[SPIPhysical.scala 112:21]
  wire  _GEN_1 = xfr ? _T_184 : sck; // @[SPIPhysical.scala 111:18]
  wire  _GEN_2 = xfr & cref; // @[SPIPhysical.scala 111:18]
  wire [11:0] _GEN_4 = _T_194 ? decr : {{4'd0}, scnt}; // @[SPIPhysical.scala 116:20]
  wire  _GEN_5 = beat ? _T_194 : cref; // @[SPIPhysical.scala 109:17]
  wire  _GEN_6 = beat ? _GEN_1 : sck; // @[SPIPhysical.scala 109:17]
  wire  _GEN_7 = beat & _GEN_2; // @[SPIPhysical.scala 109:17]
  wire [11:0] _GEN_9 = beat ? _GEN_4 : {{4'd0}, scnt}; // @[SPIPhysical.scala 109:17]
  wire  _GEN_12 = stop ? cref : _GEN_5; // @[SPIPhysical.scala 105:15]
  wire  _GEN_13 = stop ? sck : _GEN_6; // @[SPIPhysical.scala 105:15]
  wire [11:0] _GEN_16 = stop ? {{4'd0}, scnt} : _GEN_9; // @[SPIPhysical.scala 105:15]
  wire  _T_191 = beat & cref; // @[SPIPhysical.scala 123:18]
  wire  _T_192 = _T_191 & xfr; // @[SPIPhysical.scala 123:26]
  wire  last = _T_190 & _T_192; // @[SPIPhysical.scala 122:27]
  wire  _T_205 = io_op_bits_cnt == 8'h0; // @[SPIPhysical.scala 145:27]
  wire  _GEN_38 = _T_202 ? _T_205 : _T_160; // @[Conditional.scala 40:58]
  wire [11:0] _GEN_43 = io_op_valid ? {{4'd0}, io_op_bits_cnt} : _GEN_16; // @[SPIPhysical.scala 133:24]
  wire  _GEN_51 = io_op_valid ? _GEN_38 : _T_160; // @[SPIPhysical.scala 133:24]
  wire [11:0] _GEN_56 = _T_198 ? _GEN_43 : _GEN_16; // @[SPIPhysical.scala 131:25]
  wire  _GEN_64 = _T_198 ? _GEN_51 : _T_160; // @[SPIPhysical.scala 131:25]
  assign io_port_sck = sck; // @[SPIPhysical.scala 88:15]
  assign io_port_dq_0_o = txd[0]; // @[SPIPhysical.scala 92:12]
  assign io_port_dq_0_oe = proto_0 | txen_1; // @[SPIPhysical.scala 93:13]
  assign io_port_dq_1_o = txd[1]; // @[SPIPhysical.scala 92:12]
  assign io_port_dq_1_oe = _T_137 | txen_2; // @[SPIPhysical.scala 93:13]
  assign io_port_dq_2_o = txd[2]; // @[SPIPhysical.scala 92:12]
  assign io_port_dq_2_oe = proto_2 & ctrl_fmt_iodir; // @[SPIPhysical.scala 93:13]
  assign io_port_dq_3_o = txd[3]; // @[SPIPhysical.scala 92:12]
  assign io_port_dq_3_oe = proto_2 & ctrl_fmt_iodir; // @[SPIPhysical.scala 93:13]
  assign io_op_ready = accept & done; // @[SPIPhysical.scala 95:15 SPIPhysical.scala 132:17]
  assign io_rx_valid = done; // @[SPIPhysical.scala 100:15]
  assign io_rx_bits = _T_162 ? buffer : _T_177; // @[SPIPhysical.scala 101:14]
  assign _GEN_115_0 = accept & done;
  assign _GEN_39_0 = sample_d;
  assign _GEN_109_0 = io_op_valid;
  assign _GEN_121_0 = accept & done;
  assign _GEN_130_0 = reset;
  assign _GEN_124_0 = reset;
  assign _GEN_93_0 = io_op_bits_fn;
  assign _GEN_87_1 = io_op_bits_stb;
  assign _GEN_118_0 = accept & done;
  assign _GEN_103_0 = io_op_valid;
  assign _GEN_106_0 = io_op_valid;
  assign _GEN_75_0 = xfr;
  assign _GEN_81_0 = scnt == 8'h0;
  assign _GEN_96_1 = io_op_bits_fn;
  assign _GEN_90_0 = io_op_bits_stb;
  assign _GEN_112_0 = io_op_valid;
  assign _GEN_67_0 = scnt == 8'h0;
  assign _GEN_84_0 = beat & _T_194;
  assign _GEN_99_1 = ~io_op_bits_fn;
  assign _GEN_60_0 = 2'h2 == ctrl_fmt_proto;
  assign _GEN_78_0 = tcnt == 12'h0;
  assign _GEN_21_1 = setup_d | _T_87;
  assign _GEN_57_0 = sample_d;
  assign _GEN_72_1 = io_op_valid;
  assign _GEN_123_0 = accept & done;
  assign _GEN_63_1 = _T_190 ? _GEN_17 : stop;
  assign _GEN_132_1 = accept & done;
  assign _GEN_11_0 = ~io_ctrl_fmt_endian;
  assign _GEN_111_1 = io_op_valid;
  assign _GEN_105_1 = io_op_valid;
  assign _GEN_120_1 = accept & done;
  assign _GEN_126_1 = reset;
  assign _GEN_135_1 = accept & done;
  assign _GEN_129_0 = reset;
  assign _GEN_98_1 = ~io_op_bits_fn;
  assign _GEN_114_1 = accept & done;
  assign _GEN_108_1 = io_op_valid;
  assign _GEN_71_2 = scnt == 8'h1;
  assign _GEN_80_2 = scnt == 8'h0;
  assign _GEN_102_1 = ~io_op_bits_fn;
  assign _GEN_92_1 = io_op_bits_stb;
  assign _GEN_86_3 = io_op_bits_stb;
  assign _GEN_117_1 = accept & done;
  assign _GEN_89_2 = io_op_bits_stb;
  assign _GEN_74_0 = _T_198 ? _GEN_50 : _GEN_22;
  assign _GEN_66_1 = 2'h2 == _T_121;
  assign _GEN_95_1 = io_op_bits_fn;
  assign _GEN_10_1 = tcnt == 12'h0;
  assign _GEN_59_1 = 2'h1 == ctrl_fmt_proto;
  assign _GEN_83_2 = scnt == 8'h0;
  assign _GEN_134_1 = reset;
  assign _GEN_20_0 = sample_d;
  assign _GEN_77_2 = tcnt == 12'h0;
  assign _GEN_62_2 = _T_190 ? _GEN_17 : stop;
  assign _GEN_55_2 = setup_d | _T_87;
  assign _GEN_122_1 = accept & done;
  assign _GEN_116_1 = ~ctrl_fmt_endian;
  assign _GEN_131_1 = stop | beat;
  assign _GEN_104_2 = io_op_valid;
  assign _GEN_125_1 = reset;
  assign _GEN_119_1 = accept & done;
  assign _GEN_113_1 = io_op_valid;
  assign _GEN_128_1 = reset;
  assign _GEN_82_3 = scnt == 8'h0;
  assign _GEN_107_1 = io_op_valid;
  assign _GEN_97_1 = ~io_op_bits_fn;
  assign _GEN_100_2 = ~io_op_bits_fn;
  assign _GEN_85_2 = scnt == 8'h1;
  assign _GEN_79_3 = tcnt == 12'h0;
  assign _GEN_101_1 = ~io_op_bits_fn;
  assign _GEN_91_2 = io_op_bits_stb;
  assign _GEN_110_1 = io_op_valid;
  assign _GEN_61_2 = scnt == 8'h1;
  assign _GEN_65_2 = 2'h1 == _T_121;
  assign _GEN_88_3 = io_op_bits_stb;
  assign _GEN_94_2 = io_op_bits_fn;
  assign _GEN_73_3 = accept & done;
  assign _GEN_76_1 = ~cref;
  assign _GEN_127_1 = reset;
  assign _GEN_14_0 = setup_d | _T_87;
  assign _GEN_133_1 = accept & done;
  assign _GEN_58_2 = 2'h0 == ctrl_fmt_proto;
  assign _GEN_70_3 = beat & _T_194;
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
  ctrl_sck_div = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  ctrl_sck_pol = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ctrl_sck_pha = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ctrl_fmt_proto = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  ctrl_fmt_endian = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ctrl_fmt_iodir = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  setup_d = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_50 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_51 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sample_d = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_53 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_54 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  last_d = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  scnt = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  tcnt = _RAND_14[11:0];
  _RAND_15 = {1{`RANDOM}};
  sck = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  cref = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  buffer = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  txd = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  done = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  xfr = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      ctrl_sck_div <= 12'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (!(_T_202)) begin
          if (io_op_bits_fn) begin
            if (io_op_bits_stb) begin
              ctrl_sck_div <= io_ctrl_sck_div;
            end
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_pol <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (!(_T_202)) begin
          if (io_op_bits_fn) begin
            if (io_op_bits_stb) begin
              ctrl_sck_pol <= io_ctrl_sck_pol;
            end
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_pha <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (!(_T_202)) begin
          if (io_op_bits_fn) begin
            if (io_op_bits_stb) begin
              ctrl_sck_pha <= io_ctrl_sck_pha;
            end
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_proto <= 2'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (io_op_bits_stb) begin
          ctrl_fmt_proto <= io_ctrl_fmt_proto;
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_endian <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (io_op_bits_stb) begin
          ctrl_fmt_endian <= io_ctrl_fmt_endian;
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_iodir <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (io_op_bits_stb) begin
          ctrl_fmt_iodir <= io_ctrl_fmt_iodir;
        end
      end
    end
    if (metaReset) begin
      setup_d <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        setup_d <= _GEN_37;
      end else if (_T_190) begin
        if (_T_195) begin
          setup_d <= 1'h0;
        end else if (stop) begin
          setup_d <= 1'h0;
        end else begin
          setup_d <= _GEN_8;
        end
      end else if (stop) begin
        setup_d <= 1'h0;
      end else begin
        setup_d <= _GEN_8;
      end
    end else if (_T_190) begin
      if (_T_195) begin
        setup_d <= 1'h0;
      end else if (stop) begin
        setup_d <= 1'h0;
      end else begin
        setup_d <= _GEN_8;
      end
    end else if (stop) begin
      setup_d <= 1'h0;
    end else begin
      setup_d <= _GEN_8;
    end
    if (metaReset) begin
      _T_50 <= 1'h0;
    end else if (reset) begin
      _T_50 <= 1'h0;
    end else if (stop) begin
      _T_50 <= 1'h0;
    end else begin
      _T_50 <= _GEN_7;
    end
    if (metaReset) begin
      _T_51 <= 1'h0;
    end else if (reset) begin
      _T_51 <= 1'h0;
    end else begin
      _T_51 <= _T_50;
    end
    if (metaReset) begin
      sample_d <= 1'h0;
    end else if (reset) begin
      sample_d <= 1'h0;
    end else begin
      sample_d <= _T_51;
    end
    if (metaReset) begin
      _T_53 <= 1'h0;
    end else if (reset) begin
      _T_53 <= 1'h0;
    end else begin
      _T_53 <= last;
    end
    if (metaReset) begin
      _T_54 <= 1'h0;
    end else if (reset) begin
      _T_54 <= 1'h0;
    end else begin
      _T_54 <= _T_53;
    end
    if (metaReset) begin
      last_d <= 1'h0;
    end else if (reset) begin
      last_d <= 1'h0;
    end else begin
      last_d <= _T_54;
    end
    if (metaReset) begin
      scnt <= 8'h0;
    end else if (reset) begin
      scnt <= 8'h0;
    end else begin
      scnt <= _GEN_56[7:0];
    end
    if (metaReset) begin
      tcnt <= 12'h0;
    end else if (sched) begin
      tcnt <= ctrl_sck_div;
    end else begin
      tcnt <= decr;
    end
    if (metaReset) begin
      sck <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (_T_202) begin
          sck <= cinv;
        end else if (io_op_bits_fn) begin
          if (io_op_bits_stb) begin
            sck <= io_ctrl_sck_pol;
          end else if (_T_190) begin
            if (_T_195) begin
              sck <= ctrl_sck_pol;
            end else if (!(stop)) begin
              if (beat) begin
                if (xfr) begin
                  sck <= _T_184;
                end
              end
            end
          end else if (!(stop)) begin
            if (beat) begin
              if (xfr) begin
                sck <= _T_184;
              end
            end
          end
        end else if (_T_190) begin
          if (_T_195) begin
            sck <= ctrl_sck_pol;
          end else if (!(stop)) begin
            if (beat) begin
              if (xfr) begin
                sck <= _T_184;
              end
            end
          end
        end else if (!(stop)) begin
          if (beat) begin
            if (xfr) begin
              sck <= _T_184;
            end
          end
        end
      end else if (_T_190) begin
        if (_T_195) begin
          sck <= ctrl_sck_pol;
        end else begin
          sck <= _GEN_13;
        end
      end else begin
        sck <= _GEN_13;
      end
    end else if (_T_190) begin
      if (_T_195) begin
        sck <= ctrl_sck_pol;
      end else begin
        sck <= _GEN_13;
      end
    end else begin
      sck <= _GEN_13;
    end
    if (metaReset) begin
      cref <= 1'h0;
    end else begin
      cref <= reset | _GEN_12;
    end
    if (metaReset) begin
      buffer <= 8'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        if (_T_202) begin
          if (_T_71) begin
            buffer <= io_op_bits_data;
          end else begin
            buffer <= _T_86;
          end
        end else begin
          buffer <= _T_114;
        end
      end else begin
        buffer <= _T_114;
      end
    end else begin
      buffer <= _T_114;
    end
    if (metaReset) begin
      txd <= 4'h0;
    end else if (reset) begin
      txd <= 4'h0;
    end else if (setup) begin
      txd <= _T_133;
    end
    if (metaReset) begin
      done <= 1'h0;
    end else begin
      done <= reset | _GEN_64;
    end
    if (metaReset) begin
      xfr <= 1'h0;
    end else if (_T_198) begin
      if (io_op_valid) begin
        xfr <= _T_202;
      end
    end
  end
endmodule
