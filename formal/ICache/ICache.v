module ICache(
  input         metaReset,
  input         clock,
  input         reset,
  input         auto_master_out_a_ready,
  output        auto_master_out_a_valid,
  output [2:0]  auto_master_out_a_bits_opcode,
  output [2:0]  auto_master_out_a_bits_param,
  output [3:0]  auto_master_out_a_bits_size,
  output        auto_master_out_a_bits_source,
  output [31:0] auto_master_out_a_bits_address,
  output [7:0]  auto_master_out_a_bits_mask,
  output [63:0] auto_master_out_a_bits_data,
  output        auto_master_out_b_ready,
  input         auto_master_out_b_valid,
  input  [2:0]  auto_master_out_b_bits_opcode,
  input  [1:0]  auto_master_out_b_bits_param,
  input  [3:0]  auto_master_out_b_bits_size,
  input         auto_master_out_b_bits_source,
  input  [31:0] auto_master_out_b_bits_address,
  input  [7:0]  auto_master_out_b_bits_mask,
  input  [63:0] auto_master_out_b_bits_data,
  input         auto_master_out_c_ready,
  output        auto_master_out_c_valid,
  output [2:0]  auto_master_out_c_bits_opcode,
  output [2:0]  auto_master_out_c_bits_param,
  output [3:0]  auto_master_out_c_bits_size,
  output        auto_master_out_c_bits_source,
  output [31:0] auto_master_out_c_bits_address,
  output [63:0] auto_master_out_c_bits_data,
  output        auto_master_out_c_bits_error,
  output        auto_master_out_d_ready,
  input         auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [1:0]  auto_master_out_d_bits_param,
  input  [3:0]  auto_master_out_d_bits_size,
  input         auto_master_out_d_bits_source,
  input  [2:0]  auto_master_out_d_bits_sink,
  input  [63:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_error,
  input         auto_master_out_e_ready,
  output        auto_master_out_e_valid,
  output [2:0]  auto_master_out_e_bits_sink,
  input         io_hartid,
  output        io_req_ready,
  input         io_req_valid,
  input  [38:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input  [38:0] io_s2_vaddr,
  input         io_s1_kill,
  input         io_s2_kill,
  input         io_s2_prefetch,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output        io_resp_bits_replay,
  output        io_resp_bits_ae,
  input         io_invalidate,
  output        io_perf_acquire,
  output        assert_out,
  output [60:0] auto_cover_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [255:0] _RAND_1;
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
`endif // RANDOMIZE_REG_INIT
  wire  mem_sparse_metaReset; // @[ICache.scala 177:25]
  wire  mem_sparse_clock; // @[ICache.scala 177:25]
  wire  mem_sparse_reset; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_io_w_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_io_w_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_io_w_0_data; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_io_r_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_io_r_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_io_r_0_data; // @[ICache.scala 177:25]
  wire  mem_sparse_0_metaReset; // @[ICache.scala 177:25]
  wire  mem_sparse_0_clock; // @[ICache.scala 177:25]
  wire  mem_sparse_0_reset; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_0_io_w_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_0_io_w_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_0_io_w_0_data; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_0_io_r_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_0_io_r_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_0_io_r_0_data; // @[ICache.scala 177:25]
  wire  mem_sparse_1_metaReset; // @[ICache.scala 177:25]
  wire  mem_sparse_1_clock; // @[ICache.scala 177:25]
  wire  mem_sparse_1_reset; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_1_io_w_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_1_io_w_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_1_io_w_0_data; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_1_io_r_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_1_io_r_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_1_io_r_0_data; // @[ICache.scala 177:25]
  wire  mem_sparse_2_metaReset; // @[ICache.scala 177:25]
  wire  mem_sparse_2_clock; // @[ICache.scala 177:25]
  wire  mem_sparse_2_reset; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_2_io_w_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_2_io_w_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_2_io_w_0_data; // @[ICache.scala 177:25]
  wire [5:0] mem_sparse_2_io_r_0_addr; // @[ICache.scala 177:25]
  wire  mem_sparse_2_io_r_0_en; // @[ICache.scala 177:25]
  wire [20:0] mem_sparse_2_io_r_0_data; // @[ICache.scala 177:25]
  wire  mem_sparse_3_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_3_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_3_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_3_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_3_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_3_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_3_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_3_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_3_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_4_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_4_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_4_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_4_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_4_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_4_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_4_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_4_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_4_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_5_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_5_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_5_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_5_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_5_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_5_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_5_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_5_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_5_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_6_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_6_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_6_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_6_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_6_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_6_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_6_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_6_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_6_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_7_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_7_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_7_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_7_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_7_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_7_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_7_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_7_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_7_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_8_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_8_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_8_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_8_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_8_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_8_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_8_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_8_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_8_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_9_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_9_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_9_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_9_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_9_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_9_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_9_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_9_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_9_io_r_0_data; // @[ICache.scala 225:78]
  wire  mem_sparse_10_metaReset; // @[ICache.scala 225:78]
  wire  mem_sparse_10_clock; // @[ICache.scala 225:78]
  wire  mem_sparse_10_reset; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_10_io_w_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_10_io_w_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_10_io_w_0_data; // @[ICache.scala 225:78]
  wire [8:0] mem_sparse_10_io_r_0_addr; // @[ICache.scala 225:78]
  wire  mem_sparse_10_io_r_0_en; // @[ICache.scala 225:78]
  wire [31:0] mem_sparse_10_io_r_0_data; // @[ICache.scala 225:78]
  reg  s1_valid; // @[ICache.scala 138:21]
  wire  _T_492 = ~s1_valid; // @[ICache.scala 222:10]
  reg [255:0] vb_array; // @[ICache.scala 187:21]
  wire [6:0] _T_356 = {1'h0,io_s1_paddr[11:6]}; // @[Cat.scala 30:58]
  wire [255:0] _T_357 = vb_array >> _T_356; // @[ICache.scala 214:25]
  wire [20:0] tag_array_0_tag_rdata_data = mem_sparse_io_r_0_data; // @[ICache.scala 177:25]
  wire  _T_364 = tag_array_0_tag_rdata_data[19:0] == io_s1_paddr[31:12]; // @[ICache.scala 217:33]
  wire  s1_tag_hit_0 = _T_357[0] & _T_364; // @[ICache.scala 217:26]
  wire [6:0] _T_395 = {1'h1,io_s1_paddr[11:6]}; // @[Cat.scala 30:58]
  wire [255:0] _T_396 = vb_array >> _T_395; // @[ICache.scala 214:25]
  wire [20:0] tag_array_1_tag_rdata_data = mem_sparse_0_io_r_0_data; // @[ICache.scala 177:25]
  wire  _T_403 = tag_array_1_tag_rdata_data[19:0] == io_s1_paddr[31:12]; // @[ICache.scala 217:33]
  wire  s1_tag_hit_1 = _T_396[0] & _T_403; // @[ICache.scala 217:26]
  wire [1:0] _T_505 = s1_tag_hit_0 + s1_tag_hit_1; // @[Bitwise.scala 48:55]
  wire [7:0] _T_434 = {2'h2,io_s1_paddr[11:6]}; // @[Cat.scala 30:58]
  wire [255:0] _T_435 = vb_array >> _T_434; // @[ICache.scala 214:25]
  wire [20:0] tag_array_2_tag_rdata_data = mem_sparse_1_io_r_0_data; // @[ICache.scala 177:25]
  wire  _T_442 = tag_array_2_tag_rdata_data[19:0] == io_s1_paddr[31:12]; // @[ICache.scala 217:33]
  wire  s1_tag_hit_2 = _T_435[0] & _T_442; // @[ICache.scala 217:26]
  wire [7:0] _T_473 = {2'h3,io_s1_paddr[11:6]}; // @[Cat.scala 30:58]
  wire [255:0] _T_474 = vb_array >> _T_473; // @[ICache.scala 214:25]
  wire [20:0] tag_array_3_tag_rdata_data = mem_sparse_2_io_r_0_data; // @[ICache.scala 177:25]
  wire  _T_481 = tag_array_3_tag_rdata_data[19:0] == io_s1_paddr[31:12]; // @[ICache.scala 217:33]
  wire  s1_tag_hit_3 = _T_474[0] & _T_481; // @[ICache.scala 217:26]
  wire [1:0] _T_506 = s1_tag_hit_2 + s1_tag_hit_3; // @[Bitwise.scala 48:55]
  wire [2:0] _T_507 = _T_505 + _T_506; // @[Bitwise.scala 48:55]
  wire  _T_509 = _T_507 <= 3'h1; // @[ICache.scala 222:115]
  wire  _T_510 = _T_492 | _T_509; // @[ICache.scala 222:39]
  wire  _T_512 = _T_510 | reset; // @[ICache.scala 222:9]
  wire  profilePin = auto_master_out_d_bits_opcode[0]; // @[Edges.scala 106:36]
  reg [8:0] _T_180; // @[Edges.scala 220:27]
  wire  profilePin_0 = _T_180 == 9'h0; // @[Edges.scala 222:25]
  reg  s2_valid; // @[ICache.scala 141:25]
  reg  s2_hit; // @[ICache.scala 142:23]
  wire  _T_148 = ~s2_hit; // @[ICache.scala 149:29]
  wire  _T_149 = s2_valid & _T_148; // @[ICache.scala 149:26]
  wire  _T_151 = ~io_s2_kill; // @[ICache.scala 149:40]
  wire  _T_152 = _T_149 & _T_151; // @[ICache.scala 149:37]
  reg  _T_154; // @[ICache.scala 149:63]
  wire  _T_156 = ~_T_154; // @[ICache.scala 149:55]
  wire  s2_miss = _T_152 & _T_156; // @[ICache.scala 149:52]
  reg  refill_valid; // @[ICache.scala 145:29]
  wire  profilePin_46 = ~refill_valid; // @[ICache.scala 361:32]
  wire  tl_out_a_valid = s2_miss & profilePin_46; // @[ICache.scala 361:29]
  wire  refill_fire = auto_master_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 30:37]
  wire  refill_one_beat = auto_master_out_d_valid & profilePin; // @[ICache.scala 153:41]
  wire  _T_188 = _T_180 == 9'h1; // @[Edges.scala 223:25]
  wire [26:0] _T_171 = 27'hfff << auto_master_out_d_bits_size; // @[package.scala 82:77]
  wire [11:0] _T_173 = ~_T_171[11:0]; // @[package.scala 82:46]
  wire [8:0] _T_177 = profilePin ? _T_173[11:3] : 9'h0; // @[Edges.scala 212:14]
  wire  _T_190 = _T_177 == 9'h0; // @[Edges.scala 223:47]
  wire  _T_191 = _T_188 | _T_190; // @[Edges.scala 223:37]
  wire  d_done = _T_191 & auto_master_out_d_valid; // @[Edges.scala 224:22]
  wire  refill_done = refill_one_beat & d_done; // @[ICache.scala 161:37]
  reg  invalidated; // @[ICache.scala 144:24]
  wire  _T_293 = ~invalidated; // @[ICache.scala 190:75]
  wire  profilePin_3 = refill_done & _T_293; // @[ICache.scala 190:72]
  wire  profilePin_6 = io_s1_paddr[2]; // @[package.scala 64:13]
  wire [9:0] _GEN_141 = {profilePin,profilePin_0,auto_master_out_d_valid,refill_fire,profilePin_3,refill_one_beat,io_invalidate,profilePin_6,profilePin_6,profilePin_6};
  reg  s2_tag_hit_0; // @[Reg.scala 11:16]
  reg  s2_tag_hit_1; // @[Reg.scala 11:16]
  reg  s2_tag_hit_2; // @[Reg.scala 11:16]
  reg  s2_tag_hit_3; // @[Reg.scala 11:16]
  wire  _T_240 = ~refill_done; // @[ICache.scala 178:70]
  wire  s0_valid = io_req_ready & io_req_valid; // @[Decoupled.scala 30:37]
  wire  profilePin_15 = _T_240 & s0_valid;
  wire [18:0] _GEN_150 = {_GEN_141,profilePin_6,s2_tag_hit_0,s2_tag_hit_1,s2_tag_hit_2,s2_tag_hit_3,refill_done,profilePin_15,profilePin_15,profilePin_15};
  wire  _T_546 = refill_one_beat & _T_293; // @[ICache.scala 230:32]
  wire  _T_594 = ~_T_546; // @[ICache.scala 240:41]
  wire  _T_537 = ~io_req_bits_addr[2]; // @[ICache.scala 227:111]
  wire  _T_538 = s0_valid & _T_537; // @[ICache.scala 229:28]
  wire  profilePin_21 = _T_594 & _T_538;
  wire [27:0] _GEN_159 = {_GEN_150,profilePin_15,refill_one_beat,refill_one_beat,profilePin_21,refill_one_beat,refill_one_beat,profilePin_21,refill_one_beat,refill_one_beat};
  wire  _T_620 = s0_valid & io_req_bits_addr[2]; // @[ICache.scala 229:28]
  wire  profilePin_33 = _T_594 & _T_620;
  wire [36:0] _GEN_168 = {_GEN_159,profilePin_21,refill_one_beat,refill_one_beat,profilePin_21,refill_one_beat,refill_one_beat,profilePin_33,refill_one_beat,refill_one_beat};
  wire [45:0] _GEN_177 = {_GEN_168,profilePin_33,refill_one_beat,refill_one_beat,profilePin_33,refill_one_beat,refill_one_beat,profilePin_33,reset,reset};
  wire  _T_157 = refill_valid | s2_miss; // @[ICache.scala 150:71]
  wire  _T_159 = ~_T_157; // @[ICache.scala 150:56]
  wire  profilePin_48 = s1_valid & _T_159; // @[ICache.scala 150:53]
  wire [54:0] _GEN_186 = {_GEN_177,reset,profilePin_46,reset,profilePin_48,reset,reset,s1_valid,s1_valid,s1_valid};
  wire [59:0] _GEN_191 = {_GEN_186,s1_valid,s1_valid,s1_valid,s1_valid,s1_valid};
  reg  tag_array_0_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_0_tag_rdata_addr_pipe_0;
  reg  tag_array_1_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_1_tag_rdata_addr_pipe_0;
  reg  tag_array_2_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_2_tag_rdata_addr_pipe_0;
  reg  tag_array_3_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_3_tag_rdata_addr_pipe_0;
  reg  data_arrays_0_0__T_601_en_pipe_0;
  reg [8:0] data_arrays_0_0__T_601_addr_pipe_0;
  reg  data_arrays_0_1__T_601_en_pipe_0;
  reg [8:0] data_arrays_0_1__T_601_addr_pipe_0;
  reg  data_arrays_0_2__T_601_en_pipe_0;
  reg [8:0] data_arrays_0_2__T_601_addr_pipe_0;
  reg  data_arrays_0_3__T_601_en_pipe_0;
  reg [8:0] data_arrays_0_3__T_601_addr_pipe_0;
  reg  data_arrays_1_0__T_683_en_pipe_0;
  reg [8:0] data_arrays_1_0__T_683_addr_pipe_0;
  reg  data_arrays_1_1__T_683_en_pipe_0;
  reg [8:0] data_arrays_1_1__T_683_addr_pipe_0;
  reg  data_arrays_1_2__T_683_en_pipe_0;
  reg [8:0] data_arrays_1_2__T_683_addr_pipe_0;
  reg  data_arrays_1_3__T_683_en_pipe_0;
  reg [8:0] data_arrays_1_3__T_683_addr_pipe_0;
  wire  _T_125 = s1_tag_hit_0 | s1_tag_hit_1; // @[ICache.scala 140:35]
  wire  _T_126 = _T_125 | s1_tag_hit_2; // @[ICache.scala 140:35]
  wire  _T_132 = ~io_s1_kill; // @[ICache.scala 141:38]
  wire  _T_133 = s1_valid & _T_132; // @[ICache.scala 141:35]
  reg [31:0] refill_addr; // @[Reg.scala 11:16]
  wire [19:0] refill_tag = refill_addr[31:12]; // @[ICache.scala 151:31]
  wire [5:0] refill_idx = refill_addr[11:6]; // @[ICache.scala 152:31]
  wire [8:0] _T_184 = _T_180 - 9'h1; // @[Edges.scala 221:28]
  wire [8:0] _T_192 = ~_T_184; // @[Edges.scala 225:27]
  wire [8:0] refill_cnt = _T_177 & _T_192; // @[Edges.scala 225:25]
  reg [15:0] _T_198; // @[LFSR.scala 22:23]
  wire  _T_201 = _T_198[0] ^ _T_198[2]; // @[LFSR.scala 23:43]
  wire  _T_203 = _T_201 ^ _T_198[3]; // @[LFSR.scala 23:51]
  wire  _T_205 = _T_203 ^ _T_198[5]; // @[LFSR.scala 23:59]
  wire [15:0] _T_207 = {_T_205,_T_198[15:1]}; // @[Cat.scala 30:58]
  wire [1:0] repl_way = _T_198[1:0]; // @[ICache.scala 167:33]
  wire [7:0] _T_211 = {repl_way,refill_idx}; // @[Cat.scala 30:58]
  wire [255:0] _T_296 = 256'h1 << _T_211; // @[ICache.scala 190:32]
  wire [255:0] _T_297 = vb_array | _T_296; // @[ICache.scala 190:32]
  wire [255:0] _T_298 = ~vb_array; // @[ICache.scala 190:32]
  wire [255:0] _T_299 = _T_298 | _T_296; // @[ICache.scala 190:32]
  wire [255:0] _T_300 = ~_T_299; // @[ICache.scala 190:32]
  wire  _GEN_28 = io_invalidate | invalidated; // @[ICache.scala 193:21]
  wire  s1_tl_error_0 = s1_tag_hit_0 & tag_array_0_tag_rdata_data[20]; // @[ICache.scala 219:32]
  wire  s1_tl_error_1 = s1_tag_hit_1 & tag_array_1_tag_rdata_data[20]; // @[ICache.scala 219:32]
  wire  s1_tl_error_2 = s1_tag_hit_2 & tag_array_2_tag_rdata_data[20]; // @[ICache.scala 219:32]
  wire  s1_tl_error_3 = s1_tag_hit_3 & tag_array_3_tag_rdata_data[20]; // @[ICache.scala 219:32]
  wire [8:0] _T_552 = {refill_idx, 3'h0}; // @[ICache.scala 231:52]
  wire [8:0] _T_553 = _T_552 | refill_cnt; // @[ICache.scala 231:79]
  wire [31:0] data_arrays_0_0__T_601_data = mem_sparse_3_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_0_1__T_601_data = mem_sparse_4_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_0_2__T_601_data = mem_sparse_5_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_0_3__T_601_data = mem_sparse_6_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_1_0__T_683_data = mem_sparse_7_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_1_1__T_683_data = mem_sparse_8_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_1_2__T_683_data = mem_sparse_9_io_r_0_data; // @[ICache.scala 225:78]
  wire [31:0] data_arrays_1_3__T_683_data = mem_sparse_10_io_r_0_data; // @[ICache.scala 225:78]
  reg [31:0] s2_dout_0; // @[Reg.scala 11:16]
  reg [31:0] s2_dout_1; // @[Reg.scala 11:16]
  reg [31:0] s2_dout_2; // @[Reg.scala 11:16]
  reg [31:0] s2_dout_3; // @[Reg.scala 11:16]
  wire [31:0] _T_770 = s2_tag_hit_0 ? s2_dout_0 : 32'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_772 = s2_tag_hit_1 ? s2_dout_1 : 32'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_774 = s2_tag_hit_2 ? s2_dout_2 : 32'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_776 = s2_tag_hit_3 ? s2_dout_3 : 32'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_777 = _T_770 | _T_772; // @[Mux.scala 19:72]
  wire [31:0] _T_778 = _T_777 | _T_774; // @[Mux.scala 19:72]
  wire [3:0] _T_816 = {s1_tl_error_3,s1_tl_error_2,s1_tl_error_1,s1_tl_error_0}; // @[ICache.scala 254:43]
  wire  _T_818 = _T_816 != 4'h0; // @[ICache.scala 254:50]
  reg  s2_tl_error; // @[Reg.scala 11:16]
  wire  _GEN_99 = refill_fire | refill_valid; // @[ICache.scala 402:22]
  SparseMem mem_sparse ( // @[ICache.scala 177:25]
    .metaReset(mem_sparse_metaReset),
    .clock(mem_sparse_clock),
    .reset(mem_sparse_reset),
    .io_w_0_addr(mem_sparse_io_w_0_addr),
    .io_w_0_en(mem_sparse_io_w_0_en),
    .io_w_0_data(mem_sparse_io_w_0_data),
    .io_r_0_addr(mem_sparse_io_r_0_addr),
    .io_r_0_en(mem_sparse_io_r_0_en),
    .io_r_0_data(mem_sparse_io_r_0_data)
  );
  SparseMem mem_sparse_0 ( // @[ICache.scala 177:25]
    .metaReset(mem_sparse_0_metaReset),
    .clock(mem_sparse_0_clock),
    .reset(mem_sparse_0_reset),
    .io_w_0_addr(mem_sparse_0_io_w_0_addr),
    .io_w_0_en(mem_sparse_0_io_w_0_en),
    .io_w_0_data(mem_sparse_0_io_w_0_data),
    .io_r_0_addr(mem_sparse_0_io_r_0_addr),
    .io_r_0_en(mem_sparse_0_io_r_0_en),
    .io_r_0_data(mem_sparse_0_io_r_0_data)
  );
  SparseMem mem_sparse_1 ( // @[ICache.scala 177:25]
    .metaReset(mem_sparse_1_metaReset),
    .clock(mem_sparse_1_clock),
    .reset(mem_sparse_1_reset),
    .io_w_0_addr(mem_sparse_1_io_w_0_addr),
    .io_w_0_en(mem_sparse_1_io_w_0_en),
    .io_w_0_data(mem_sparse_1_io_w_0_data),
    .io_r_0_addr(mem_sparse_1_io_r_0_addr),
    .io_r_0_en(mem_sparse_1_io_r_0_en),
    .io_r_0_data(mem_sparse_1_io_r_0_data)
  );
  SparseMem mem_sparse_2 ( // @[ICache.scala 177:25]
    .metaReset(mem_sparse_2_metaReset),
    .clock(mem_sparse_2_clock),
    .reset(mem_sparse_2_reset),
    .io_w_0_addr(mem_sparse_2_io_w_0_addr),
    .io_w_0_en(mem_sparse_2_io_w_0_en),
    .io_w_0_data(mem_sparse_2_io_w_0_data),
    .io_r_0_addr(mem_sparse_2_io_r_0_addr),
    .io_r_0_en(mem_sparse_2_io_r_0_en),
    .io_r_0_data(mem_sparse_2_io_r_0_data)
  );
  SparseMem_3 mem_sparse_3 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_3_metaReset),
    .clock(mem_sparse_3_clock),
    .reset(mem_sparse_3_reset),
    .io_w_0_addr(mem_sparse_3_io_w_0_addr),
    .io_w_0_en(mem_sparse_3_io_w_0_en),
    .io_w_0_data(mem_sparse_3_io_w_0_data),
    .io_r_0_addr(mem_sparse_3_io_r_0_addr),
    .io_r_0_en(mem_sparse_3_io_r_0_en),
    .io_r_0_data(mem_sparse_3_io_r_0_data)
  );
  SparseMem_3 mem_sparse_4 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_4_metaReset),
    .clock(mem_sparse_4_clock),
    .reset(mem_sparse_4_reset),
    .io_w_0_addr(mem_sparse_4_io_w_0_addr),
    .io_w_0_en(mem_sparse_4_io_w_0_en),
    .io_w_0_data(mem_sparse_4_io_w_0_data),
    .io_r_0_addr(mem_sparse_4_io_r_0_addr),
    .io_r_0_en(mem_sparse_4_io_r_0_en),
    .io_r_0_data(mem_sparse_4_io_r_0_data)
  );
  SparseMem_3 mem_sparse_5 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_5_metaReset),
    .clock(mem_sparse_5_clock),
    .reset(mem_sparse_5_reset),
    .io_w_0_addr(mem_sparse_5_io_w_0_addr),
    .io_w_0_en(mem_sparse_5_io_w_0_en),
    .io_w_0_data(mem_sparse_5_io_w_0_data),
    .io_r_0_addr(mem_sparse_5_io_r_0_addr),
    .io_r_0_en(mem_sparse_5_io_r_0_en),
    .io_r_0_data(mem_sparse_5_io_r_0_data)
  );
  SparseMem_3 mem_sparse_6 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_6_metaReset),
    .clock(mem_sparse_6_clock),
    .reset(mem_sparse_6_reset),
    .io_w_0_addr(mem_sparse_6_io_w_0_addr),
    .io_w_0_en(mem_sparse_6_io_w_0_en),
    .io_w_0_data(mem_sparse_6_io_w_0_data),
    .io_r_0_addr(mem_sparse_6_io_r_0_addr),
    .io_r_0_en(mem_sparse_6_io_r_0_en),
    .io_r_0_data(mem_sparse_6_io_r_0_data)
  );
  SparseMem_3 mem_sparse_7 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_7_metaReset),
    .clock(mem_sparse_7_clock),
    .reset(mem_sparse_7_reset),
    .io_w_0_addr(mem_sparse_7_io_w_0_addr),
    .io_w_0_en(mem_sparse_7_io_w_0_en),
    .io_w_0_data(mem_sparse_7_io_w_0_data),
    .io_r_0_addr(mem_sparse_7_io_r_0_addr),
    .io_r_0_en(mem_sparse_7_io_r_0_en),
    .io_r_0_data(mem_sparse_7_io_r_0_data)
  );
  SparseMem_3 mem_sparse_8 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_8_metaReset),
    .clock(mem_sparse_8_clock),
    .reset(mem_sparse_8_reset),
    .io_w_0_addr(mem_sparse_8_io_w_0_addr),
    .io_w_0_en(mem_sparse_8_io_w_0_en),
    .io_w_0_data(mem_sparse_8_io_w_0_data),
    .io_r_0_addr(mem_sparse_8_io_r_0_addr),
    .io_r_0_en(mem_sparse_8_io_r_0_en),
    .io_r_0_data(mem_sparse_8_io_r_0_data)
  );
  SparseMem_3 mem_sparse_9 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_9_metaReset),
    .clock(mem_sparse_9_clock),
    .reset(mem_sparse_9_reset),
    .io_w_0_addr(mem_sparse_9_io_w_0_addr),
    .io_w_0_en(mem_sparse_9_io_w_0_en),
    .io_w_0_data(mem_sparse_9_io_w_0_data),
    .io_r_0_addr(mem_sparse_9_io_r_0_addr),
    .io_r_0_en(mem_sparse_9_io_r_0_en),
    .io_r_0_data(mem_sparse_9_io_r_0_data)
  );
  SparseMem_3 mem_sparse_10 ( // @[ICache.scala 225:78]
    .metaReset(mem_sparse_10_metaReset),
    .clock(mem_sparse_10_clock),
    .reset(mem_sparse_10_reset),
    .io_w_0_addr(mem_sparse_10_io_w_0_addr),
    .io_w_0_en(mem_sparse_10_io_w_0_en),
    .io_w_0_data(mem_sparse_10_io_w_0_data),
    .io_r_0_addr(mem_sparse_10_io_r_0_addr),
    .io_r_0_en(mem_sparse_10_io_r_0_en),
    .io_r_0_data(mem_sparse_10_io_r_0_data)
  );
  assign mem_sparse_metaReset = metaReset;
  assign mem_sparse_0_metaReset = metaReset;
  assign mem_sparse_1_metaReset = metaReset;
  assign mem_sparse_2_metaReset = metaReset;
  assign mem_sparse_3_metaReset = metaReset;
  assign mem_sparse_4_metaReset = metaReset;
  assign mem_sparse_5_metaReset = metaReset;
  assign mem_sparse_6_metaReset = metaReset;
  assign mem_sparse_7_metaReset = metaReset;
  assign mem_sparse_8_metaReset = metaReset;
  assign mem_sparse_9_metaReset = metaReset;
  assign mem_sparse_10_metaReset = metaReset;
  assign auto_master_out_a_valid = s2_miss & profilePin_46; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_opcode = 3'h4; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_param = 3'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_size = 4'h6; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_source = 1'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_address = {refill_addr[31:6], 6'h0}; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_mask = 8'hff; // @[LazyModule.scala 189:49]
  assign auto_master_out_a_bits_data = 64'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_b_ready = 1'h1; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_valid = 1'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_opcode = 3'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_param = 3'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_size = 4'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_source = 1'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_address = 32'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_data = 64'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_c_bits_error = 1'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_d_ready = 1'h1; // @[LazyModule.scala 189:49]
  assign auto_master_out_e_valid = 1'h0; // @[LazyModule.scala 189:49]
  assign auto_master_out_e_bits_sink = 3'h0; // @[LazyModule.scala 189:49]
  assign io_req_ready = ~refill_one_beat; // @[ICache.scala 155:16]
  assign io_resp_valid = s2_valid & s2_hit; // @[ICache.scala 281:21]
  assign io_resp_bits_data = _T_778 | _T_776; // @[ICache.scala 278:25]
  assign io_resp_bits_replay = 1'h0; // @[ICache.scala 280:27]
  assign io_resp_bits_ae = s2_tl_error; // @[ICache.scala 279:23]
  assign io_perf_acquire = auto_master_out_a_ready & tl_out_a_valid; // @[ICache.scala 405:19]
  assign assert_out = ~_T_512;
  assign auto_cover_out = {_GEN_191,s1_valid};
  assign mem_sparse_clock = clock;
  assign mem_sparse_reset = reset;
  assign mem_sparse_io_w_0_addr = refill_addr[11:6];
  assign mem_sparse_io_w_0_en = refill_one_beat & d_done;
  assign mem_sparse_io_w_0_data = {auto_master_out_d_bits_error,refill_tag};
  assign mem_sparse_io_r_0_addr = tag_array_0_tag_rdata_addr_pipe_0;
  assign mem_sparse_io_r_0_en = tag_array_0_tag_rdata_en_pipe_0;
  assign mem_sparse_0_clock = clock;
  assign mem_sparse_0_reset = reset;
  assign mem_sparse_0_io_w_0_addr = refill_addr[11:6];
  assign mem_sparse_0_io_w_0_en = refill_one_beat & d_done;
  assign mem_sparse_0_io_w_0_data = {auto_master_out_d_bits_error,refill_tag};
  assign mem_sparse_0_io_r_0_addr = tag_array_1_tag_rdata_addr_pipe_0;
  assign mem_sparse_0_io_r_0_en = tag_array_1_tag_rdata_en_pipe_0;
  assign mem_sparse_1_clock = clock;
  assign mem_sparse_1_reset = reset;
  assign mem_sparse_1_io_w_0_addr = refill_addr[11:6];
  assign mem_sparse_1_io_w_0_en = refill_one_beat & d_done;
  assign mem_sparse_1_io_w_0_data = {auto_master_out_d_bits_error,refill_tag};
  assign mem_sparse_1_io_r_0_addr = tag_array_2_tag_rdata_addr_pipe_0;
  assign mem_sparse_1_io_r_0_en = tag_array_2_tag_rdata_en_pipe_0;
  assign mem_sparse_2_clock = clock;
  assign mem_sparse_2_reset = reset;
  assign mem_sparse_2_io_w_0_addr = refill_addr[11:6];
  assign mem_sparse_2_io_w_0_en = refill_one_beat & d_done;
  assign mem_sparse_2_io_w_0_data = {auto_master_out_d_bits_error,refill_tag};
  assign mem_sparse_2_io_r_0_addr = tag_array_3_tag_rdata_addr_pipe_0;
  assign mem_sparse_2_io_r_0_en = tag_array_3_tag_rdata_en_pipe_0;
  assign mem_sparse_3_clock = clock;
  assign mem_sparse_3_reset = reset;
  assign mem_sparse_3_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_3_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_3_io_w_0_data = auto_master_out_d_bits_data[31:0];
  assign mem_sparse_3_io_r_0_addr = data_arrays_0_0__T_601_addr_pipe_0;
  assign mem_sparse_3_io_r_0_en = data_arrays_0_0__T_601_en_pipe_0;
  assign mem_sparse_4_clock = clock;
  assign mem_sparse_4_reset = reset;
  assign mem_sparse_4_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_4_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_4_io_w_0_data = auto_master_out_d_bits_data[31:0];
  assign mem_sparse_4_io_r_0_addr = data_arrays_0_1__T_601_addr_pipe_0;
  assign mem_sparse_4_io_r_0_en = data_arrays_0_1__T_601_en_pipe_0;
  assign mem_sparse_5_clock = clock;
  assign mem_sparse_5_reset = reset;
  assign mem_sparse_5_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_5_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_5_io_w_0_data = auto_master_out_d_bits_data[31:0];
  assign mem_sparse_5_io_r_0_addr = data_arrays_0_2__T_601_addr_pipe_0;
  assign mem_sparse_5_io_r_0_en = data_arrays_0_2__T_601_en_pipe_0;
  assign mem_sparse_6_clock = clock;
  assign mem_sparse_6_reset = reset;
  assign mem_sparse_6_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_6_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_6_io_w_0_data = auto_master_out_d_bits_data[31:0];
  assign mem_sparse_6_io_r_0_addr = data_arrays_0_3__T_601_addr_pipe_0;
  assign mem_sparse_6_io_r_0_en = data_arrays_0_3__T_601_en_pipe_0;
  assign mem_sparse_7_clock = clock;
  assign mem_sparse_7_reset = reset;
  assign mem_sparse_7_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_7_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_7_io_w_0_data = auto_master_out_d_bits_data[63:32];
  assign mem_sparse_7_io_r_0_addr = data_arrays_1_0__T_683_addr_pipe_0;
  assign mem_sparse_7_io_r_0_en = data_arrays_1_0__T_683_en_pipe_0;
  assign mem_sparse_8_clock = clock;
  assign mem_sparse_8_reset = reset;
  assign mem_sparse_8_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_8_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_8_io_w_0_data = auto_master_out_d_bits_data[63:32];
  assign mem_sparse_8_io_r_0_addr = data_arrays_1_1__T_683_addr_pipe_0;
  assign mem_sparse_8_io_r_0_en = data_arrays_1_1__T_683_en_pipe_0;
  assign mem_sparse_9_clock = clock;
  assign mem_sparse_9_reset = reset;
  assign mem_sparse_9_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_9_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_9_io_w_0_data = auto_master_out_d_bits_data[63:32];
  assign mem_sparse_9_io_r_0_addr = data_arrays_1_2__T_683_addr_pipe_0;
  assign mem_sparse_9_io_r_0_en = data_arrays_1_2__T_683_en_pipe_0;
  assign mem_sparse_10_clock = clock;
  assign mem_sparse_10_reset = reset;
  assign mem_sparse_10_io_w_0_addr = refill_one_beat ? _T_553 : io_req_bits_addr[11:3];
  assign mem_sparse_10_io_w_0_en = refill_one_beat & _T_293;
  assign mem_sparse_10_io_w_0_data = auto_master_out_d_bits_data[63:32];
  assign mem_sparse_10_io_r_0_addr = data_arrays_1_3__T_683_addr_pipe_0;
  assign mem_sparse_10_io_r_0_en = data_arrays_1_3__T_683_en_pipe_0;
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {8{`RANDOM}};
  vb_array = _RAND_1[255:0];
  _RAND_2 = {1{`RANDOM}};
  _T_180 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  s2_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s2_hit = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_154 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  refill_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  invalidated = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_tag_hit_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_tag_hit_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_tag_hit_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_tag_hit_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  tag_array_0_tag_rdata_en_pipe_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  tag_array_0_tag_rdata_addr_pipe_0 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  tag_array_1_tag_rdata_en_pipe_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  tag_array_1_tag_rdata_addr_pipe_0 = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  tag_array_2_tag_rdata_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  tag_array_2_tag_rdata_addr_pipe_0 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  tag_array_3_tag_rdata_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  tag_array_3_tag_rdata_addr_pipe_0 = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  data_arrays_0_0__T_601_en_pipe_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_arrays_0_0__T_601_addr_pipe_0 = _RAND_21[8:0];
  _RAND_22 = {1{`RANDOM}};
  data_arrays_0_1__T_601_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_arrays_0_1__T_601_addr_pipe_0 = _RAND_23[8:0];
  _RAND_24 = {1{`RANDOM}};
  data_arrays_0_2__T_601_en_pipe_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_arrays_0_2__T_601_addr_pipe_0 = _RAND_25[8:0];
  _RAND_26 = {1{`RANDOM}};
  data_arrays_0_3__T_601_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  data_arrays_0_3__T_601_addr_pipe_0 = _RAND_27[8:0];
  _RAND_28 = {1{`RANDOM}};
  data_arrays_1_0__T_683_en_pipe_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  data_arrays_1_0__T_683_addr_pipe_0 = _RAND_29[8:0];
  _RAND_30 = {1{`RANDOM}};
  data_arrays_1_1__T_683_en_pipe_0 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  data_arrays_1_1__T_683_addr_pipe_0 = _RAND_31[8:0];
  _RAND_32 = {1{`RANDOM}};
  data_arrays_1_2__T_683_en_pipe_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_arrays_1_2__T_683_addr_pipe_0 = _RAND_33[8:0];
  _RAND_34 = {1{`RANDOM}};
  data_arrays_1_3__T_683_en_pipe_0 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_arrays_1_3__T_683_addr_pipe_0 = _RAND_35[8:0];
  _RAND_36 = {1{`RANDOM}};
  refill_addr = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  _T_198 = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  s2_dout_0 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  s2_dout_1 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  s2_dout_2 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  s2_dout_3 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  s2_tl_error = _RAND_42[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (metaReset) begin
      s1_valid <= 1'h0;
    end else if (reset) begin
      s1_valid <= 1'h0;
    end else begin
      s1_valid <= s0_valid;
    end
    if (metaReset) begin
      vb_array <= 256'h0;
    end else if (reset) begin
      vb_array <= 256'h0;
    end else if (io_invalidate) begin
      vb_array <= 256'h0;
    end else if (refill_one_beat) begin
      if (profilePin_3) begin
        vb_array <= _T_297;
      end else begin
        vb_array <= _T_300;
      end
    end
    if (metaReset) begin
      _T_180 <= 9'h0;
    end else if (reset) begin
      _T_180 <= 9'h0;
    end else if (auto_master_out_d_valid) begin
      if (profilePin_0) begin
        if (profilePin) begin
          _T_180 <= _T_173[11:3];
        end else begin
          _T_180 <= 9'h0;
        end
      end else begin
        _T_180 <= _T_184;
      end
    end
    if (metaReset) begin
      s2_valid <= 1'h0;
    end else if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      s2_valid <= _T_133;
    end
    if (metaReset) begin
      s2_hit <= 1'h0;
    end else begin
      s2_hit <= _T_126 | s1_tag_hit_3;
    end
    if (metaReset) begin
      _T_154 <= 1'h0;
    end else begin
      _T_154 <= refill_valid;
    end
    if (metaReset) begin
      refill_valid <= 1'h0;
    end else if (reset) begin
      refill_valid <= 1'h0;
    end else if (refill_done) begin
      refill_valid <= 1'h0;
    end else begin
      refill_valid <= _GEN_99;
    end
    if (metaReset) begin
      invalidated <= 1'h0;
    end else if (profilePin_46) begin
      invalidated <= 1'h0;
    end else begin
      invalidated <= _GEN_28;
    end
    if (metaReset) begin
      s2_tag_hit_0 <= 1'h0;
    end else if (s1_valid) begin
      s2_tag_hit_0 <= s1_tag_hit_0;
    end
    if (metaReset) begin
      s2_tag_hit_1 <= 1'h0;
    end else if (s1_valid) begin
      s2_tag_hit_1 <= s1_tag_hit_1;
    end
    if (metaReset) begin
      s2_tag_hit_2 <= 1'h0;
    end else if (s1_valid) begin
      s2_tag_hit_2 <= s1_tag_hit_2;
    end
    if (metaReset) begin
      s2_tag_hit_3 <= 1'h0;
    end else if (s1_valid) begin
      s2_tag_hit_3 <= s1_tag_hit_3;
    end
    if (metaReset) begin
      tag_array_0_tag_rdata_en_pipe_0 <= 1'h0;
    end else begin
      tag_array_0_tag_rdata_en_pipe_0 <= _T_240 & s0_valid;
    end
    if (metaReset) begin
      tag_array_0_tag_rdata_addr_pipe_0 <= 6'h0;
    end else if (_T_240 & s0_valid) begin
      tag_array_0_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if (metaReset) begin
      tag_array_1_tag_rdata_en_pipe_0 <= 1'h0;
    end else begin
      tag_array_1_tag_rdata_en_pipe_0 <= _T_240 & s0_valid;
    end
    if (metaReset) begin
      tag_array_1_tag_rdata_addr_pipe_0 <= 6'h0;
    end else if (_T_240 & s0_valid) begin
      tag_array_1_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if (metaReset) begin
      tag_array_2_tag_rdata_en_pipe_0 <= 1'h0;
    end else begin
      tag_array_2_tag_rdata_en_pipe_0 <= _T_240 & s0_valid;
    end
    if (metaReset) begin
      tag_array_2_tag_rdata_addr_pipe_0 <= 6'h0;
    end else if (_T_240 & s0_valid) begin
      tag_array_2_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if (metaReset) begin
      tag_array_3_tag_rdata_en_pipe_0 <= 1'h0;
    end else begin
      tag_array_3_tag_rdata_en_pipe_0 <= _T_240 & s0_valid;
    end
    if (metaReset) begin
      tag_array_3_tag_rdata_addr_pipe_0 <= 6'h0;
    end else if (_T_240 & s0_valid) begin
      tag_array_3_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if (metaReset) begin
      data_arrays_0_0__T_601_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_0_0__T_601_en_pipe_0 <= _T_594 & _T_538;
    end
    if (metaReset) begin
      data_arrays_0_0__T_601_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_538) begin
      if (refill_one_beat) begin
        data_arrays_0_0__T_601_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_0_0__T_601_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_0_1__T_601_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_0_1__T_601_en_pipe_0 <= _T_594 & _T_538;
    end
    if (metaReset) begin
      data_arrays_0_1__T_601_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_538) begin
      if (refill_one_beat) begin
        data_arrays_0_1__T_601_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_0_1__T_601_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_0_2__T_601_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_0_2__T_601_en_pipe_0 <= _T_594 & _T_538;
    end
    if (metaReset) begin
      data_arrays_0_2__T_601_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_538) begin
      if (refill_one_beat) begin
        data_arrays_0_2__T_601_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_0_2__T_601_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_0_3__T_601_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_0_3__T_601_en_pipe_0 <= _T_594 & _T_538;
    end
    if (metaReset) begin
      data_arrays_0_3__T_601_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_538) begin
      if (refill_one_beat) begin
        data_arrays_0_3__T_601_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_0_3__T_601_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_1_0__T_683_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_1_0__T_683_en_pipe_0 <= _T_594 & _T_620;
    end
    if (metaReset) begin
      data_arrays_1_0__T_683_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_620) begin
      if (refill_one_beat) begin
        data_arrays_1_0__T_683_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_1_0__T_683_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_1_1__T_683_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_1_1__T_683_en_pipe_0 <= _T_594 & _T_620;
    end
    if (metaReset) begin
      data_arrays_1_1__T_683_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_620) begin
      if (refill_one_beat) begin
        data_arrays_1_1__T_683_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_1_1__T_683_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_1_2__T_683_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_1_2__T_683_en_pipe_0 <= _T_594 & _T_620;
    end
    if (metaReset) begin
      data_arrays_1_2__T_683_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_620) begin
      if (refill_one_beat) begin
        data_arrays_1_2__T_683_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_1_2__T_683_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      data_arrays_1_3__T_683_en_pipe_0 <= 1'h0;
    end else begin
      data_arrays_1_3__T_683_en_pipe_0 <= _T_594 & _T_620;
    end
    if (metaReset) begin
      data_arrays_1_3__T_683_addr_pipe_0 <= 9'h0;
    end else if (_T_594 & _T_620) begin
      if (refill_one_beat) begin
        data_arrays_1_3__T_683_addr_pipe_0 <= _T_553;
      end else begin
        data_arrays_1_3__T_683_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if (metaReset) begin
      refill_addr <= 32'h0;
    end else if (profilePin_48) begin
      refill_addr <= io_s1_paddr;
    end
    if (metaReset) begin
      _T_198 <= 16'h0;
    end else if (reset) begin
      _T_198 <= 16'h1;
    end else if (refill_fire) begin
      _T_198 <= _T_207;
    end
    if (metaReset) begin
      s2_dout_0 <= 32'h0;
    end else if (s1_valid) begin
      if (profilePin_6) begin
        s2_dout_0 <= data_arrays_1_0__T_683_data;
      end else begin
        s2_dout_0 <= data_arrays_0_0__T_601_data;
      end
    end
    if (metaReset) begin
      s2_dout_1 <= 32'h0;
    end else if (s1_valid) begin
      if (profilePin_6) begin
        s2_dout_1 <= data_arrays_1_1__T_683_data;
      end else begin
        s2_dout_1 <= data_arrays_0_1__T_601_data;
      end
    end
    if (metaReset) begin
      s2_dout_2 <= 32'h0;
    end else if (s1_valid) begin
      if (profilePin_6) begin
        s2_dout_2 <= data_arrays_1_2__T_683_data;
      end else begin
        s2_dout_2 <= data_arrays_0_2__T_601_data;
      end
    end
    if (metaReset) begin
      s2_dout_3 <= 32'h0;
    end else if (s1_valid) begin
      if (profilePin_6) begin
        s2_dout_3 <= data_arrays_1_3__T_683_data;
      end else begin
        s2_dout_3 <= data_arrays_0_3__T_601_data;
      end
    end
    if (metaReset) begin
      s2_tl_error <= 1'h0;
    end else if (s1_valid) begin
      s2_tl_error <= _T_818;
    end
  end
endmodule
module SparseMem(
  input         metaReset,
  input         clock,
  input         reset,
  input  [5:0]  io_w_0_addr,
  input         io_w_0_en,
  input  [20:0] io_w_0_data,
  input  [5:0]  io_r_0_addr,
  input         io_r_0_en,
  output [20:0] io_r_0_data
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
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
`endif // RANDOMIZE_REG_INIT
  reg [20:0] mem [0:31];
  wire [20:0] mem__T_152_data;
  wire [4:0] mem__T_152_addr;
  wire [20:0] mem__T_281_data;
  wire [4:0] mem__T_281_addr;
  wire  mem__T_281_mask;
  wire  mem__T_281_en;
  reg  addresses_0_valid;
  reg [5:0] addresses_0_bits;
  reg  addresses_1_valid;
  reg [5:0] addresses_1_bits;
  reg  addresses_2_valid;
  reg [5:0] addresses_2_bits;
  reg  addresses_3_valid;
  reg [5:0] addresses_3_bits;
  reg  addresses_4_valid;
  reg [5:0] addresses_4_bits;
  reg  addresses_5_valid;
  reg [5:0] addresses_5_bits;
  reg  addresses_6_valid;
  reg [5:0] addresses_6_bits;
  reg  addresses_7_valid;
  reg [5:0] addresses_7_bits;
  reg  addresses_8_valid;
  reg [5:0] addresses_8_bits;
  reg  addresses_9_valid;
  reg [5:0] addresses_9_bits;
  reg  addresses_10_valid;
  reg [5:0] addresses_10_bits;
  reg  addresses_11_valid;
  reg [5:0] addresses_11_bits;
  reg  addresses_12_valid;
  reg [5:0] addresses_12_bits;
  reg  addresses_13_valid;
  reg [5:0] addresses_13_bits;
  reg  addresses_14_valid;
  reg [5:0] addresses_14_bits;
  reg  addresses_15_valid;
  reg [5:0] addresses_15_bits;
  reg  addresses_16_valid;
  reg [5:0] addresses_16_bits;
  reg  addresses_17_valid;
  reg [5:0] addresses_17_bits;
  reg  addresses_18_valid;
  reg [5:0] addresses_18_bits;
  reg  addresses_19_valid;
  reg [5:0] addresses_19_bits;
  reg  addresses_20_valid;
  reg [5:0] addresses_20_bits;
  reg  addresses_21_valid;
  reg [5:0] addresses_21_bits;
  reg  addresses_22_valid;
  reg [5:0] addresses_22_bits;
  reg  addresses_23_valid;
  reg [5:0] addresses_23_bits;
  reg  addresses_24_valid;
  reg [5:0] addresses_24_bits;
  reg  addresses_25_valid;
  reg [5:0] addresses_25_bits;
  reg  addresses_26_valid;
  reg [5:0] addresses_26_bits;
  reg  addresses_27_valid;
  reg [5:0] addresses_27_bits;
  reg  addresses_28_valid;
  reg [5:0] addresses_28_bits;
  reg  addresses_29_valid;
  reg [5:0] addresses_29_bits;
  reg  addresses_30_valid;
  reg [5:0] addresses_30_bits;
  reg  addresses_31_valid;
  reg [5:0] addresses_31_bits;
  wire  _T_33 = addresses_0_bits == io_r_0_addr;
  wire  _T_34 = addresses_0_valid & _T_33;
  wire  _T_35 = addresses_1_bits == io_r_0_addr;
  wire  _T_36 = addresses_1_valid & _T_35;
  wire  _T_37 = addresses_2_bits == io_r_0_addr;
  wire  _T_38 = addresses_2_valid & _T_37;
  wire  _T_39 = addresses_3_bits == io_r_0_addr;
  wire  _T_40 = addresses_3_valid & _T_39;
  wire  _T_41 = addresses_4_bits == io_r_0_addr;
  wire  _T_42 = addresses_4_valid & _T_41;
  wire  _T_43 = addresses_5_bits == io_r_0_addr;
  wire  _T_44 = addresses_5_valid & _T_43;
  wire  _T_45 = addresses_6_bits == io_r_0_addr;
  wire  _T_46 = addresses_6_valid & _T_45;
  wire  _T_47 = addresses_7_bits == io_r_0_addr;
  wire  _T_48 = addresses_7_valid & _T_47;
  wire  _T_49 = addresses_8_bits == io_r_0_addr;
  wire  _T_50 = addresses_8_valid & _T_49;
  wire  _T_51 = addresses_9_bits == io_r_0_addr;
  wire  _T_52 = addresses_9_valid & _T_51;
  wire  _T_53 = addresses_10_bits == io_r_0_addr;
  wire  _T_54 = addresses_10_valid & _T_53;
  wire  _T_55 = addresses_11_bits == io_r_0_addr;
  wire  _T_56 = addresses_11_valid & _T_55;
  wire  _T_57 = addresses_12_bits == io_r_0_addr;
  wire  _T_58 = addresses_12_valid & _T_57;
  wire  _T_59 = addresses_13_bits == io_r_0_addr;
  wire  _T_60 = addresses_13_valid & _T_59;
  wire  _T_61 = addresses_14_bits == io_r_0_addr;
  wire  _T_62 = addresses_14_valid & _T_61;
  wire  _T_63 = addresses_15_bits == io_r_0_addr;
  wire  _T_64 = addresses_15_valid & _T_63;
  wire  _T_65 = addresses_16_bits == io_r_0_addr;
  wire  _T_66 = addresses_16_valid & _T_65;
  wire  _T_67 = addresses_17_bits == io_r_0_addr;
  wire  _T_68 = addresses_17_valid & _T_67;
  wire  _T_69 = addresses_18_bits == io_r_0_addr;
  wire  _T_70 = addresses_18_valid & _T_69;
  wire  _T_71 = addresses_19_bits == io_r_0_addr;
  wire  _T_72 = addresses_19_valid & _T_71;
  wire  _T_73 = addresses_20_bits == io_r_0_addr;
  wire  _T_74 = addresses_20_valid & _T_73;
  wire  _T_75 = addresses_21_bits == io_r_0_addr;
  wire  _T_76 = addresses_21_valid & _T_75;
  wire  _T_77 = addresses_22_bits == io_r_0_addr;
  wire  _T_78 = addresses_22_valid & _T_77;
  wire  _T_79 = addresses_23_bits == io_r_0_addr;
  wire  _T_80 = addresses_23_valid & _T_79;
  wire  _T_81 = addresses_24_bits == io_r_0_addr;
  wire  _T_82 = addresses_24_valid & _T_81;
  wire  _T_83 = addresses_25_bits == io_r_0_addr;
  wire  _T_84 = addresses_25_valid & _T_83;
  wire  _T_85 = addresses_26_bits == io_r_0_addr;
  wire  _T_86 = addresses_26_valid & _T_85;
  wire  _T_87 = addresses_27_bits == io_r_0_addr;
  wire  _T_88 = addresses_27_valid & _T_87;
  wire  _T_89 = addresses_28_bits == io_r_0_addr;
  wire  _T_90 = addresses_28_valid & _T_89;
  wire  _T_91 = addresses_29_bits == io_r_0_addr;
  wire  _T_92 = addresses_29_valid & _T_91;
  wire  _T_93 = addresses_30_bits == io_r_0_addr;
  wire  _T_94 = addresses_30_valid & _T_93;
  wire  _T_95 = addresses_31_bits == io_r_0_addr;
  wire  _T_96 = addresses_31_valid & _T_95;
  wire [7:0] _T_104 = {_T_48,_T_46,_T_44,_T_42,_T_40,_T_38,_T_36,_T_34};
  wire [15:0] _T_112 = {_T_64,_T_62,_T_60,_T_58,_T_56,_T_54,_T_52,_T_50,_T_104};
  wire [7:0] _T_119 = {_T_80,_T_78,_T_76,_T_74,_T_72,_T_70,_T_68,_T_66};
  wire [31:0] _T_128 = {_T_96,_T_94,_T_92,_T_90,_T_88,_T_86,_T_84,_T_82,_T_119,_T_112};
  wire  _T_129 = _T_128 != 32'h0;
  wire  _T_132 = |_T_128[31:16];
  wire [15:0] _T_133 = _T_128[31:16] | _T_128[15:0];
  wire  _T_136 = |_T_133[15:8];
  wire [7:0] _T_137 = _T_133[15:8] | _T_133[7:0];
  wire  _T_140 = |_T_137[7:4];
  wire [3:0] _T_141 = _T_137[7:4] | _T_137[3:0];
  wire  _T_144 = |_T_141[3:2];
  wire [1:0] _T_145 = _T_141[3:2] | _T_141[1:0];
  wire [3:0] _T_149 = {_T_136,_T_140,_T_144,_T_145[1]};
  wire  _T_151 = _T_129 & io_r_0_en;
  reg [5:0] nextAddr;
  wire [5:0] _T_156 = nextAddr + 6'h1;
  wire  _T_157 = addresses_0_bits == io_w_0_addr;
  wire  _T_158 = addresses_0_valid & _T_157;
  wire  _T_159 = addresses_1_bits == io_w_0_addr;
  wire  _T_160 = addresses_1_valid & _T_159;
  wire  _T_161 = addresses_2_bits == io_w_0_addr;
  wire  _T_162 = addresses_2_valid & _T_161;
  wire  _T_163 = addresses_3_bits == io_w_0_addr;
  wire  _T_164 = addresses_3_valid & _T_163;
  wire  _T_165 = addresses_4_bits == io_w_0_addr;
  wire  _T_166 = addresses_4_valid & _T_165;
  wire  _T_167 = addresses_5_bits == io_w_0_addr;
  wire  _T_168 = addresses_5_valid & _T_167;
  wire  _T_169 = addresses_6_bits == io_w_0_addr;
  wire  _T_170 = addresses_6_valid & _T_169;
  wire  _T_171 = addresses_7_bits == io_w_0_addr;
  wire  _T_172 = addresses_7_valid & _T_171;
  wire  _T_173 = addresses_8_bits == io_w_0_addr;
  wire  _T_174 = addresses_8_valid & _T_173;
  wire  _T_175 = addresses_9_bits == io_w_0_addr;
  wire  _T_176 = addresses_9_valid & _T_175;
  wire  _T_177 = addresses_10_bits == io_w_0_addr;
  wire  _T_178 = addresses_10_valid & _T_177;
  wire  _T_179 = addresses_11_bits == io_w_0_addr;
  wire  _T_180 = addresses_11_valid & _T_179;
  wire  _T_181 = addresses_12_bits == io_w_0_addr;
  wire  _T_182 = addresses_12_valid & _T_181;
  wire  _T_183 = addresses_13_bits == io_w_0_addr;
  wire  _T_184 = addresses_13_valid & _T_183;
  wire  _T_185 = addresses_14_bits == io_w_0_addr;
  wire  _T_186 = addresses_14_valid & _T_185;
  wire  _T_187 = addresses_15_bits == io_w_0_addr;
  wire  _T_188 = addresses_15_valid & _T_187;
  wire  _T_189 = addresses_16_bits == io_w_0_addr;
  wire  _T_190 = addresses_16_valid & _T_189;
  wire  _T_191 = addresses_17_bits == io_w_0_addr;
  wire  _T_192 = addresses_17_valid & _T_191;
  wire  _T_193 = addresses_18_bits == io_w_0_addr;
  wire  _T_194 = addresses_18_valid & _T_193;
  wire  _T_195 = addresses_19_bits == io_w_0_addr;
  wire  _T_196 = addresses_19_valid & _T_195;
  wire  _T_197 = addresses_20_bits == io_w_0_addr;
  wire  _T_198 = addresses_20_valid & _T_197;
  wire  _T_199 = addresses_21_bits == io_w_0_addr;
  wire  _T_200 = addresses_21_valid & _T_199;
  wire  _T_201 = addresses_22_bits == io_w_0_addr;
  wire  _T_202 = addresses_22_valid & _T_201;
  wire  _T_203 = addresses_23_bits == io_w_0_addr;
  wire  _T_204 = addresses_23_valid & _T_203;
  wire  _T_205 = addresses_24_bits == io_w_0_addr;
  wire  _T_206 = addresses_24_valid & _T_205;
  wire  _T_207 = addresses_25_bits == io_w_0_addr;
  wire  _T_208 = addresses_25_valid & _T_207;
  wire  _T_209 = addresses_26_bits == io_w_0_addr;
  wire  _T_210 = addresses_26_valid & _T_209;
  wire  _T_211 = addresses_27_bits == io_w_0_addr;
  wire  _T_212 = addresses_27_valid & _T_211;
  wire  _T_213 = addresses_28_bits == io_w_0_addr;
  wire  _T_214 = addresses_28_valid & _T_213;
  wire  _T_215 = addresses_29_bits == io_w_0_addr;
  wire  _T_216 = addresses_29_valid & _T_215;
  wire  _T_217 = addresses_30_bits == io_w_0_addr;
  wire  _T_218 = addresses_30_valid & _T_217;
  wire  _T_219 = addresses_31_bits == io_w_0_addr;
  wire  _T_220 = addresses_31_valid & _T_219;
  wire [7:0] _T_228 = {_T_172,_T_170,_T_168,_T_166,_T_164,_T_162,_T_160,_T_158};
  wire [15:0] _T_236 = {_T_188,_T_186,_T_184,_T_182,_T_180,_T_178,_T_176,_T_174,_T_228};
  wire [7:0] _T_243 = {_T_204,_T_202,_T_200,_T_198,_T_196,_T_194,_T_192,_T_190};
  wire [31:0] _T_252 = {_T_220,_T_218,_T_216,_T_214,_T_212,_T_210,_T_208,_T_206,_T_243,_T_236};
  wire  _T_253 = _T_252 != 32'h0;
  wire  _T_256 = |_T_252[31:16];
  wire [15:0] _T_257 = _T_252[31:16] | _T_252[15:0];
  wire  _T_260 = |_T_257[15:8];
  wire [7:0] _T_261 = _T_257[15:8] | _T_257[7:0];
  wire  _T_264 = |_T_261[7:4];
  wire [3:0] _T_265 = _T_261[7:4] | _T_261[3:0];
  wire  _T_268 = |_T_265[3:2];
  wire [1:0] _T_269 = _T_265[3:2] | _T_265[1:0];
  wire [4:0] _T_274 = {_T_256,_T_260,_T_264,_T_268,_T_269[1]};
  wire  _T_275 = ~_T_253;
  wire  _T_276 = io_w_0_en & _T_275;
  wire [5:0] _T_277 = _T_253 ? {{1'd0}, _T_274} : nextAddr;
  wire  _GEN_133 = 5'h0 == _T_277[4:0];
  wire  _GEN_0 = _GEN_133 | addresses_0_valid;
  wire  _GEN_134 = 5'h1 == _T_277[4:0];
  wire  _GEN_1 = _GEN_134 | addresses_1_valid;
  wire  _GEN_135 = 5'h2 == _T_277[4:0];
  wire  _GEN_2 = _GEN_135 | addresses_2_valid;
  wire  _GEN_136 = 5'h3 == _T_277[4:0];
  wire  _GEN_3 = _GEN_136 | addresses_3_valid;
  wire  _GEN_137 = 5'h4 == _T_277[4:0];
  wire  _GEN_4 = _GEN_137 | addresses_4_valid;
  wire  _GEN_138 = 5'h5 == _T_277[4:0];
  wire  _GEN_5 = _GEN_138 | addresses_5_valid;
  wire  _GEN_139 = 5'h6 == _T_277[4:0];
  wire  _GEN_6 = _GEN_139 | addresses_6_valid;
  wire  _GEN_140 = 5'h7 == _T_277[4:0];
  wire  _GEN_7 = _GEN_140 | addresses_7_valid;
  wire  _GEN_141 = 5'h8 == _T_277[4:0];
  wire  _GEN_8 = _GEN_141 | addresses_8_valid;
  wire  _GEN_142 = 5'h9 == _T_277[4:0];
  wire  _GEN_9 = _GEN_142 | addresses_9_valid;
  wire  _GEN_143 = 5'ha == _T_277[4:0];
  wire  _GEN_10 = _GEN_143 | addresses_10_valid;
  wire  _GEN_144 = 5'hb == _T_277[4:0];
  wire  _GEN_11 = _GEN_144 | addresses_11_valid;
  wire  _GEN_145 = 5'hc == _T_277[4:0];
  wire  _GEN_12 = _GEN_145 | addresses_12_valid;
  wire  _GEN_146 = 5'hd == _T_277[4:0];
  wire  _GEN_13 = _GEN_146 | addresses_13_valid;
  wire  _GEN_147 = 5'he == _T_277[4:0];
  wire  _GEN_14 = _GEN_147 | addresses_14_valid;
  wire  _GEN_148 = 5'hf == _T_277[4:0];
  wire  _GEN_15 = _GEN_148 | addresses_15_valid;
  wire  _GEN_149 = 5'h10 == _T_277[4:0];
  wire  _GEN_16 = _GEN_149 | addresses_16_valid;
  wire  _GEN_150 = 5'h11 == _T_277[4:0];
  wire  _GEN_17 = _GEN_150 | addresses_17_valid;
  wire  _GEN_151 = 5'h12 == _T_277[4:0];
  wire  _GEN_18 = _GEN_151 | addresses_18_valid;
  wire  _GEN_152 = 5'h13 == _T_277[4:0];
  wire  _GEN_19 = _GEN_152 | addresses_19_valid;
  wire  _GEN_153 = 5'h14 == _T_277[4:0];
  wire  _GEN_20 = _GEN_153 | addresses_20_valid;
  wire  _GEN_154 = 5'h15 == _T_277[4:0];
  wire  _GEN_21 = _GEN_154 | addresses_21_valid;
  wire  _GEN_155 = 5'h16 == _T_277[4:0];
  wire  _GEN_22 = _GEN_155 | addresses_22_valid;
  wire  _GEN_156 = 5'h17 == _T_277[4:0];
  wire  _GEN_23 = _GEN_156 | addresses_23_valid;
  wire  _GEN_157 = 5'h18 == _T_277[4:0];
  wire  _GEN_24 = _GEN_157 | addresses_24_valid;
  wire  _GEN_158 = 5'h19 == _T_277[4:0];
  wire  _GEN_25 = _GEN_158 | addresses_25_valid;
  wire  _GEN_159 = 5'h1a == _T_277[4:0];
  wire  _GEN_26 = _GEN_159 | addresses_26_valid;
  wire  _GEN_160 = 5'h1b == _T_277[4:0];
  wire  _GEN_27 = _GEN_160 | addresses_27_valid;
  wire  _GEN_161 = 5'h1c == _T_277[4:0];
  wire  _GEN_28 = _GEN_161 | addresses_28_valid;
  wire  _GEN_162 = 5'h1d == _T_277[4:0];
  wire  _GEN_29 = _GEN_162 | addresses_29_valid;
  wire  _GEN_163 = 5'h1e == _T_277[4:0];
  wire  _GEN_30 = _GEN_163 | addresses_30_valid;
  wire  _GEN_164 = 5'h1f == _T_277[4:0];
  wire  _GEN_31 = _GEN_164 | addresses_31_valid;
  wire [5:0] nextAddrUpdate = _T_276 ? _T_156 : nextAddr;
  wire  _T_284 = nextAddrUpdate <= 6'h20;
  wire  _T_286 = _T_284 | reset;
  wire  _T_287 = ~_T_286;
  assign mem__T_152_addr = {_T_132,_T_149};
  assign mem__T_152_data = mem[mem__T_152_addr];
  assign mem__T_281_data = io_w_0_data;
  assign mem__T_281_addr = _T_277[4:0];
  assign mem__T_281_mask = 1'h1;
  assign mem__T_281_en = io_w_0_en;
  assign io_r_0_data = _T_151 ? mem__T_152_data : 21'h0;
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem[initvar] = _RAND_0[20:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addresses_0_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  addresses_0_bits = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  addresses_1_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addresses_1_bits = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  addresses_2_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  addresses_2_bits = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  addresses_3_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  addresses_3_bits = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  addresses_4_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  addresses_4_bits = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  addresses_5_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  addresses_5_bits = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  addresses_6_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  addresses_6_bits = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  addresses_7_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  addresses_7_bits = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  addresses_8_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  addresses_8_bits = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  addresses_9_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  addresses_9_bits = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  addresses_10_valid = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  addresses_10_bits = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  addresses_11_valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  addresses_11_bits = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  addresses_12_valid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  addresses_12_bits = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  addresses_13_valid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  addresses_13_bits = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  addresses_14_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  addresses_14_bits = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  addresses_15_valid = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  addresses_15_bits = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  addresses_16_valid = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  addresses_16_bits = _RAND_34[5:0];
  _RAND_35 = {1{`RANDOM}};
  addresses_17_valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  addresses_17_bits = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  addresses_18_valid = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  addresses_18_bits = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  addresses_19_valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  addresses_19_bits = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  addresses_20_valid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  addresses_20_bits = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  addresses_21_valid = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  addresses_21_bits = _RAND_44[5:0];
  _RAND_45 = {1{`RANDOM}};
  addresses_22_valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  addresses_22_bits = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  addresses_23_valid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  addresses_23_bits = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  addresses_24_valid = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  addresses_24_bits = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  addresses_25_valid = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  addresses_25_bits = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  addresses_26_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  addresses_26_bits = _RAND_54[5:0];
  _RAND_55 = {1{`RANDOM}};
  addresses_27_valid = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  addresses_27_bits = _RAND_56[5:0];
  _RAND_57 = {1{`RANDOM}};
  addresses_28_valid = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  addresses_28_bits = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  addresses_29_valid = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  addresses_29_bits = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  addresses_30_valid = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  addresses_30_bits = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  addresses_31_valid = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  addresses_31_bits = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  nextAddr = _RAND_65[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem__T_281_en & mem__T_281_mask) begin
      mem[mem__T_281_addr] <= mem__T_281_data;
    end
    if (metaReset) begin
      addresses_0_valid <= 1'h0;
    end else if (reset) begin
      addresses_0_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_0_valid <= _GEN_0;
    end
    if (metaReset) begin
      addresses_0_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h0 == _T_277[4:0]) begin
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
      addresses_1_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1 == _T_277[4:0]) begin
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
      addresses_2_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h2 == _T_277[4:0]) begin
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
      addresses_3_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h3 == _T_277[4:0]) begin
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
      addresses_4_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h4 == _T_277[4:0]) begin
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
      addresses_5_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h5 == _T_277[4:0]) begin
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
      addresses_6_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h6 == _T_277[4:0]) begin
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
      addresses_7_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h7 == _T_277[4:0]) begin
        addresses_7_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_8_valid <= 1'h0;
    end else if (reset) begin
      addresses_8_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_8_valid <= _GEN_8;
    end
    if (metaReset) begin
      addresses_8_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h8 == _T_277[4:0]) begin
        addresses_8_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_9_valid <= 1'h0;
    end else if (reset) begin
      addresses_9_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_9_valid <= _GEN_9;
    end
    if (metaReset) begin
      addresses_9_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h9 == _T_277[4:0]) begin
        addresses_9_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_10_valid <= 1'h0;
    end else if (reset) begin
      addresses_10_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_10_valid <= _GEN_10;
    end
    if (metaReset) begin
      addresses_10_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'ha == _T_277[4:0]) begin
        addresses_10_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_11_valid <= 1'h0;
    end else if (reset) begin
      addresses_11_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_11_valid <= _GEN_11;
    end
    if (metaReset) begin
      addresses_11_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'hb == _T_277[4:0]) begin
        addresses_11_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_12_valid <= 1'h0;
    end else if (reset) begin
      addresses_12_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_12_valid <= _GEN_12;
    end
    if (metaReset) begin
      addresses_12_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'hc == _T_277[4:0]) begin
        addresses_12_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_13_valid <= 1'h0;
    end else if (reset) begin
      addresses_13_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_13_valid <= _GEN_13;
    end
    if (metaReset) begin
      addresses_13_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'hd == _T_277[4:0]) begin
        addresses_13_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_14_valid <= 1'h0;
    end else if (reset) begin
      addresses_14_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_14_valid <= _GEN_14;
    end
    if (metaReset) begin
      addresses_14_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'he == _T_277[4:0]) begin
        addresses_14_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_15_valid <= 1'h0;
    end else if (reset) begin
      addresses_15_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_15_valid <= _GEN_15;
    end
    if (metaReset) begin
      addresses_15_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'hf == _T_277[4:0]) begin
        addresses_15_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_16_valid <= 1'h0;
    end else if (reset) begin
      addresses_16_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_16_valid <= _GEN_16;
    end
    if (metaReset) begin
      addresses_16_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h10 == _T_277[4:0]) begin
        addresses_16_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_17_valid <= 1'h0;
    end else if (reset) begin
      addresses_17_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_17_valid <= _GEN_17;
    end
    if (metaReset) begin
      addresses_17_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h11 == _T_277[4:0]) begin
        addresses_17_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_18_valid <= 1'h0;
    end else if (reset) begin
      addresses_18_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_18_valid <= _GEN_18;
    end
    if (metaReset) begin
      addresses_18_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h12 == _T_277[4:0]) begin
        addresses_18_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_19_valid <= 1'h0;
    end else if (reset) begin
      addresses_19_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_19_valid <= _GEN_19;
    end
    if (metaReset) begin
      addresses_19_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h13 == _T_277[4:0]) begin
        addresses_19_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_20_valid <= 1'h0;
    end else if (reset) begin
      addresses_20_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_20_valid <= _GEN_20;
    end
    if (metaReset) begin
      addresses_20_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h14 == _T_277[4:0]) begin
        addresses_20_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_21_valid <= 1'h0;
    end else if (reset) begin
      addresses_21_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_21_valid <= _GEN_21;
    end
    if (metaReset) begin
      addresses_21_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h15 == _T_277[4:0]) begin
        addresses_21_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_22_valid <= 1'h0;
    end else if (reset) begin
      addresses_22_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_22_valid <= _GEN_22;
    end
    if (metaReset) begin
      addresses_22_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h16 == _T_277[4:0]) begin
        addresses_22_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_23_valid <= 1'h0;
    end else if (reset) begin
      addresses_23_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_23_valid <= _GEN_23;
    end
    if (metaReset) begin
      addresses_23_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h17 == _T_277[4:0]) begin
        addresses_23_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_24_valid <= 1'h0;
    end else if (reset) begin
      addresses_24_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_24_valid <= _GEN_24;
    end
    if (metaReset) begin
      addresses_24_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h18 == _T_277[4:0]) begin
        addresses_24_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_25_valid <= 1'h0;
    end else if (reset) begin
      addresses_25_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_25_valid <= _GEN_25;
    end
    if (metaReset) begin
      addresses_25_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h19 == _T_277[4:0]) begin
        addresses_25_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_26_valid <= 1'h0;
    end else if (reset) begin
      addresses_26_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_26_valid <= _GEN_26;
    end
    if (metaReset) begin
      addresses_26_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1a == _T_277[4:0]) begin
        addresses_26_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_27_valid <= 1'h0;
    end else if (reset) begin
      addresses_27_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_27_valid <= _GEN_27;
    end
    if (metaReset) begin
      addresses_27_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1b == _T_277[4:0]) begin
        addresses_27_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_28_valid <= 1'h0;
    end else if (reset) begin
      addresses_28_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_28_valid <= _GEN_28;
    end
    if (metaReset) begin
      addresses_28_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1c == _T_277[4:0]) begin
        addresses_28_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_29_valid <= 1'h0;
    end else if (reset) begin
      addresses_29_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_29_valid <= _GEN_29;
    end
    if (metaReset) begin
      addresses_29_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1d == _T_277[4:0]) begin
        addresses_29_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_30_valid <= 1'h0;
    end else if (reset) begin
      addresses_30_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_30_valid <= _GEN_30;
    end
    if (metaReset) begin
      addresses_30_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1e == _T_277[4:0]) begin
        addresses_30_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_31_valid <= 1'h0;
    end else if (reset) begin
      addresses_31_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_31_valid <= _GEN_31;
    end
    if (metaReset) begin
      addresses_31_bits <= 6'h0;
    end else if (io_w_0_en) begin
      if (5'h1f == _T_277[4:0]) begin
        addresses_31_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      nextAddr <= 6'h0;
    end else if (reset) begin
      nextAddr <= 6'h0;
    end else if (_T_276) begin
      nextAddr <= _T_156;
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
module SparseMem_3(
  input         metaReset,
  input         clock,
  input         reset,
  input  [8:0]  io_w_0_addr,
  input         io_w_0_en,
  input  [31:0] io_w_0_data,
  input  [8:0]  io_r_0_addr,
  input         io_r_0_en,
  output [31:0] io_r_0_data
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
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:31];
  wire [31:0] mem__T_152_data;
  wire [4:0] mem__T_152_addr;
  wire [31:0] mem__T_281_data;
  wire [4:0] mem__T_281_addr;
  wire  mem__T_281_mask;
  wire  mem__T_281_en;
  reg  addresses_0_valid;
  reg [8:0] addresses_0_bits;
  reg  addresses_1_valid;
  reg [8:0] addresses_1_bits;
  reg  addresses_2_valid;
  reg [8:0] addresses_2_bits;
  reg  addresses_3_valid;
  reg [8:0] addresses_3_bits;
  reg  addresses_4_valid;
  reg [8:0] addresses_4_bits;
  reg  addresses_5_valid;
  reg [8:0] addresses_5_bits;
  reg  addresses_6_valid;
  reg [8:0] addresses_6_bits;
  reg  addresses_7_valid;
  reg [8:0] addresses_7_bits;
  reg  addresses_8_valid;
  reg [8:0] addresses_8_bits;
  reg  addresses_9_valid;
  reg [8:0] addresses_9_bits;
  reg  addresses_10_valid;
  reg [8:0] addresses_10_bits;
  reg  addresses_11_valid;
  reg [8:0] addresses_11_bits;
  reg  addresses_12_valid;
  reg [8:0] addresses_12_bits;
  reg  addresses_13_valid;
  reg [8:0] addresses_13_bits;
  reg  addresses_14_valid;
  reg [8:0] addresses_14_bits;
  reg  addresses_15_valid;
  reg [8:0] addresses_15_bits;
  reg  addresses_16_valid;
  reg [8:0] addresses_16_bits;
  reg  addresses_17_valid;
  reg [8:0] addresses_17_bits;
  reg  addresses_18_valid;
  reg [8:0] addresses_18_bits;
  reg  addresses_19_valid;
  reg [8:0] addresses_19_bits;
  reg  addresses_20_valid;
  reg [8:0] addresses_20_bits;
  reg  addresses_21_valid;
  reg [8:0] addresses_21_bits;
  reg  addresses_22_valid;
  reg [8:0] addresses_22_bits;
  reg  addresses_23_valid;
  reg [8:0] addresses_23_bits;
  reg  addresses_24_valid;
  reg [8:0] addresses_24_bits;
  reg  addresses_25_valid;
  reg [8:0] addresses_25_bits;
  reg  addresses_26_valid;
  reg [8:0] addresses_26_bits;
  reg  addresses_27_valid;
  reg [8:0] addresses_27_bits;
  reg  addresses_28_valid;
  reg [8:0] addresses_28_bits;
  reg  addresses_29_valid;
  reg [8:0] addresses_29_bits;
  reg  addresses_30_valid;
  reg [8:0] addresses_30_bits;
  reg  addresses_31_valid;
  reg [8:0] addresses_31_bits;
  wire  _T_33 = addresses_0_bits == io_r_0_addr;
  wire  _T_34 = addresses_0_valid & _T_33;
  wire  _T_35 = addresses_1_bits == io_r_0_addr;
  wire  _T_36 = addresses_1_valid & _T_35;
  wire  _T_37 = addresses_2_bits == io_r_0_addr;
  wire  _T_38 = addresses_2_valid & _T_37;
  wire  _T_39 = addresses_3_bits == io_r_0_addr;
  wire  _T_40 = addresses_3_valid & _T_39;
  wire  _T_41 = addresses_4_bits == io_r_0_addr;
  wire  _T_42 = addresses_4_valid & _T_41;
  wire  _T_43 = addresses_5_bits == io_r_0_addr;
  wire  _T_44 = addresses_5_valid & _T_43;
  wire  _T_45 = addresses_6_bits == io_r_0_addr;
  wire  _T_46 = addresses_6_valid & _T_45;
  wire  _T_47 = addresses_7_bits == io_r_0_addr;
  wire  _T_48 = addresses_7_valid & _T_47;
  wire  _T_49 = addresses_8_bits == io_r_0_addr;
  wire  _T_50 = addresses_8_valid & _T_49;
  wire  _T_51 = addresses_9_bits == io_r_0_addr;
  wire  _T_52 = addresses_9_valid & _T_51;
  wire  _T_53 = addresses_10_bits == io_r_0_addr;
  wire  _T_54 = addresses_10_valid & _T_53;
  wire  _T_55 = addresses_11_bits == io_r_0_addr;
  wire  _T_56 = addresses_11_valid & _T_55;
  wire  _T_57 = addresses_12_bits == io_r_0_addr;
  wire  _T_58 = addresses_12_valid & _T_57;
  wire  _T_59 = addresses_13_bits == io_r_0_addr;
  wire  _T_60 = addresses_13_valid & _T_59;
  wire  _T_61 = addresses_14_bits == io_r_0_addr;
  wire  _T_62 = addresses_14_valid & _T_61;
  wire  _T_63 = addresses_15_bits == io_r_0_addr;
  wire  _T_64 = addresses_15_valid & _T_63;
  wire  _T_65 = addresses_16_bits == io_r_0_addr;
  wire  _T_66 = addresses_16_valid & _T_65;
  wire  _T_67 = addresses_17_bits == io_r_0_addr;
  wire  _T_68 = addresses_17_valid & _T_67;
  wire  _T_69 = addresses_18_bits == io_r_0_addr;
  wire  _T_70 = addresses_18_valid & _T_69;
  wire  _T_71 = addresses_19_bits == io_r_0_addr;
  wire  _T_72 = addresses_19_valid & _T_71;
  wire  _T_73 = addresses_20_bits == io_r_0_addr;
  wire  _T_74 = addresses_20_valid & _T_73;
  wire  _T_75 = addresses_21_bits == io_r_0_addr;
  wire  _T_76 = addresses_21_valid & _T_75;
  wire  _T_77 = addresses_22_bits == io_r_0_addr;
  wire  _T_78 = addresses_22_valid & _T_77;
  wire  _T_79 = addresses_23_bits == io_r_0_addr;
  wire  _T_80 = addresses_23_valid & _T_79;
  wire  _T_81 = addresses_24_bits == io_r_0_addr;
  wire  _T_82 = addresses_24_valid & _T_81;
  wire  _T_83 = addresses_25_bits == io_r_0_addr;
  wire  _T_84 = addresses_25_valid & _T_83;
  wire  _T_85 = addresses_26_bits == io_r_0_addr;
  wire  _T_86 = addresses_26_valid & _T_85;
  wire  _T_87 = addresses_27_bits == io_r_0_addr;
  wire  _T_88 = addresses_27_valid & _T_87;
  wire  _T_89 = addresses_28_bits == io_r_0_addr;
  wire  _T_90 = addresses_28_valid & _T_89;
  wire  _T_91 = addresses_29_bits == io_r_0_addr;
  wire  _T_92 = addresses_29_valid & _T_91;
  wire  _T_93 = addresses_30_bits == io_r_0_addr;
  wire  _T_94 = addresses_30_valid & _T_93;
  wire  _T_95 = addresses_31_bits == io_r_0_addr;
  wire  _T_96 = addresses_31_valid & _T_95;
  wire [7:0] _T_104 = {_T_48,_T_46,_T_44,_T_42,_T_40,_T_38,_T_36,_T_34};
  wire [15:0] _T_112 = {_T_64,_T_62,_T_60,_T_58,_T_56,_T_54,_T_52,_T_50,_T_104};
  wire [7:0] _T_119 = {_T_80,_T_78,_T_76,_T_74,_T_72,_T_70,_T_68,_T_66};
  wire [31:0] _T_128 = {_T_96,_T_94,_T_92,_T_90,_T_88,_T_86,_T_84,_T_82,_T_119,_T_112};
  wire  _T_129 = _T_128 != 32'h0;
  wire  _T_132 = |_T_128[31:16];
  wire [15:0] _T_133 = _T_128[31:16] | _T_128[15:0];
  wire  _T_136 = |_T_133[15:8];
  wire [7:0] _T_137 = _T_133[15:8] | _T_133[7:0];
  wire  _T_140 = |_T_137[7:4];
  wire [3:0] _T_141 = _T_137[7:4] | _T_137[3:0];
  wire  _T_144 = |_T_141[3:2];
  wire [1:0] _T_145 = _T_141[3:2] | _T_141[1:0];
  wire [3:0] _T_149 = {_T_136,_T_140,_T_144,_T_145[1]};
  wire  _T_151 = _T_129 & io_r_0_en;
  reg [5:0] nextAddr;
  wire [5:0] _T_156 = nextAddr + 6'h1;
  wire  _T_157 = addresses_0_bits == io_w_0_addr;
  wire  _T_158 = addresses_0_valid & _T_157;
  wire  _T_159 = addresses_1_bits == io_w_0_addr;
  wire  _T_160 = addresses_1_valid & _T_159;
  wire  _T_161 = addresses_2_bits == io_w_0_addr;
  wire  _T_162 = addresses_2_valid & _T_161;
  wire  _T_163 = addresses_3_bits == io_w_0_addr;
  wire  _T_164 = addresses_3_valid & _T_163;
  wire  _T_165 = addresses_4_bits == io_w_0_addr;
  wire  _T_166 = addresses_4_valid & _T_165;
  wire  _T_167 = addresses_5_bits == io_w_0_addr;
  wire  _T_168 = addresses_5_valid & _T_167;
  wire  _T_169 = addresses_6_bits == io_w_0_addr;
  wire  _T_170 = addresses_6_valid & _T_169;
  wire  _T_171 = addresses_7_bits == io_w_0_addr;
  wire  _T_172 = addresses_7_valid & _T_171;
  wire  _T_173 = addresses_8_bits == io_w_0_addr;
  wire  _T_174 = addresses_8_valid & _T_173;
  wire  _T_175 = addresses_9_bits == io_w_0_addr;
  wire  _T_176 = addresses_9_valid & _T_175;
  wire  _T_177 = addresses_10_bits == io_w_0_addr;
  wire  _T_178 = addresses_10_valid & _T_177;
  wire  _T_179 = addresses_11_bits == io_w_0_addr;
  wire  _T_180 = addresses_11_valid & _T_179;
  wire  _T_181 = addresses_12_bits == io_w_0_addr;
  wire  _T_182 = addresses_12_valid & _T_181;
  wire  _T_183 = addresses_13_bits == io_w_0_addr;
  wire  _T_184 = addresses_13_valid & _T_183;
  wire  _T_185 = addresses_14_bits == io_w_0_addr;
  wire  _T_186 = addresses_14_valid & _T_185;
  wire  _T_187 = addresses_15_bits == io_w_0_addr;
  wire  _T_188 = addresses_15_valid & _T_187;
  wire  _T_189 = addresses_16_bits == io_w_0_addr;
  wire  _T_190 = addresses_16_valid & _T_189;
  wire  _T_191 = addresses_17_bits == io_w_0_addr;
  wire  _T_192 = addresses_17_valid & _T_191;
  wire  _T_193 = addresses_18_bits == io_w_0_addr;
  wire  _T_194 = addresses_18_valid & _T_193;
  wire  _T_195 = addresses_19_bits == io_w_0_addr;
  wire  _T_196 = addresses_19_valid & _T_195;
  wire  _T_197 = addresses_20_bits == io_w_0_addr;
  wire  _T_198 = addresses_20_valid & _T_197;
  wire  _T_199 = addresses_21_bits == io_w_0_addr;
  wire  _T_200 = addresses_21_valid & _T_199;
  wire  _T_201 = addresses_22_bits == io_w_0_addr;
  wire  _T_202 = addresses_22_valid & _T_201;
  wire  _T_203 = addresses_23_bits == io_w_0_addr;
  wire  _T_204 = addresses_23_valid & _T_203;
  wire  _T_205 = addresses_24_bits == io_w_0_addr;
  wire  _T_206 = addresses_24_valid & _T_205;
  wire  _T_207 = addresses_25_bits == io_w_0_addr;
  wire  _T_208 = addresses_25_valid & _T_207;
  wire  _T_209 = addresses_26_bits == io_w_0_addr;
  wire  _T_210 = addresses_26_valid & _T_209;
  wire  _T_211 = addresses_27_bits == io_w_0_addr;
  wire  _T_212 = addresses_27_valid & _T_211;
  wire  _T_213 = addresses_28_bits == io_w_0_addr;
  wire  _T_214 = addresses_28_valid & _T_213;
  wire  _T_215 = addresses_29_bits == io_w_0_addr;
  wire  _T_216 = addresses_29_valid & _T_215;
  wire  _T_217 = addresses_30_bits == io_w_0_addr;
  wire  _T_218 = addresses_30_valid & _T_217;
  wire  _T_219 = addresses_31_bits == io_w_0_addr;
  wire  _T_220 = addresses_31_valid & _T_219;
  wire [7:0] _T_228 = {_T_172,_T_170,_T_168,_T_166,_T_164,_T_162,_T_160,_T_158};
  wire [15:0] _T_236 = {_T_188,_T_186,_T_184,_T_182,_T_180,_T_178,_T_176,_T_174,_T_228};
  wire [7:0] _T_243 = {_T_204,_T_202,_T_200,_T_198,_T_196,_T_194,_T_192,_T_190};
  wire [31:0] _T_252 = {_T_220,_T_218,_T_216,_T_214,_T_212,_T_210,_T_208,_T_206,_T_243,_T_236};
  wire  _T_253 = _T_252 != 32'h0;
  wire  _T_256 = |_T_252[31:16];
  wire [15:0] _T_257 = _T_252[31:16] | _T_252[15:0];
  wire  _T_260 = |_T_257[15:8];
  wire [7:0] _T_261 = _T_257[15:8] | _T_257[7:0];
  wire  _T_264 = |_T_261[7:4];
  wire [3:0] _T_265 = _T_261[7:4] | _T_261[3:0];
  wire  _T_268 = |_T_265[3:2];
  wire [1:0] _T_269 = _T_265[3:2] | _T_265[1:0];
  wire [4:0] _T_274 = {_T_256,_T_260,_T_264,_T_268,_T_269[1]};
  wire  _T_275 = ~_T_253;
  wire  _T_276 = io_w_0_en & _T_275;
  wire [5:0] _T_277 = _T_253 ? {{1'd0}, _T_274} : nextAddr;
  wire  _GEN_133 = 5'h0 == _T_277[4:0];
  wire  _GEN_0 = _GEN_133 | addresses_0_valid;
  wire  _GEN_134 = 5'h1 == _T_277[4:0];
  wire  _GEN_1 = _GEN_134 | addresses_1_valid;
  wire  _GEN_135 = 5'h2 == _T_277[4:0];
  wire  _GEN_2 = _GEN_135 | addresses_2_valid;
  wire  _GEN_136 = 5'h3 == _T_277[4:0];
  wire  _GEN_3 = _GEN_136 | addresses_3_valid;
  wire  _GEN_137 = 5'h4 == _T_277[4:0];
  wire  _GEN_4 = _GEN_137 | addresses_4_valid;
  wire  _GEN_138 = 5'h5 == _T_277[4:0];
  wire  _GEN_5 = _GEN_138 | addresses_5_valid;
  wire  _GEN_139 = 5'h6 == _T_277[4:0];
  wire  _GEN_6 = _GEN_139 | addresses_6_valid;
  wire  _GEN_140 = 5'h7 == _T_277[4:0];
  wire  _GEN_7 = _GEN_140 | addresses_7_valid;
  wire  _GEN_141 = 5'h8 == _T_277[4:0];
  wire  _GEN_8 = _GEN_141 | addresses_8_valid;
  wire  _GEN_142 = 5'h9 == _T_277[4:0];
  wire  _GEN_9 = _GEN_142 | addresses_9_valid;
  wire  _GEN_143 = 5'ha == _T_277[4:0];
  wire  _GEN_10 = _GEN_143 | addresses_10_valid;
  wire  _GEN_144 = 5'hb == _T_277[4:0];
  wire  _GEN_11 = _GEN_144 | addresses_11_valid;
  wire  _GEN_145 = 5'hc == _T_277[4:0];
  wire  _GEN_12 = _GEN_145 | addresses_12_valid;
  wire  _GEN_146 = 5'hd == _T_277[4:0];
  wire  _GEN_13 = _GEN_146 | addresses_13_valid;
  wire  _GEN_147 = 5'he == _T_277[4:0];
  wire  _GEN_14 = _GEN_147 | addresses_14_valid;
  wire  _GEN_148 = 5'hf == _T_277[4:0];
  wire  _GEN_15 = _GEN_148 | addresses_15_valid;
  wire  _GEN_149 = 5'h10 == _T_277[4:0];
  wire  _GEN_16 = _GEN_149 | addresses_16_valid;
  wire  _GEN_150 = 5'h11 == _T_277[4:0];
  wire  _GEN_17 = _GEN_150 | addresses_17_valid;
  wire  _GEN_151 = 5'h12 == _T_277[4:0];
  wire  _GEN_18 = _GEN_151 | addresses_18_valid;
  wire  _GEN_152 = 5'h13 == _T_277[4:0];
  wire  _GEN_19 = _GEN_152 | addresses_19_valid;
  wire  _GEN_153 = 5'h14 == _T_277[4:0];
  wire  _GEN_20 = _GEN_153 | addresses_20_valid;
  wire  _GEN_154 = 5'h15 == _T_277[4:0];
  wire  _GEN_21 = _GEN_154 | addresses_21_valid;
  wire  _GEN_155 = 5'h16 == _T_277[4:0];
  wire  _GEN_22 = _GEN_155 | addresses_22_valid;
  wire  _GEN_156 = 5'h17 == _T_277[4:0];
  wire  _GEN_23 = _GEN_156 | addresses_23_valid;
  wire  _GEN_157 = 5'h18 == _T_277[4:0];
  wire  _GEN_24 = _GEN_157 | addresses_24_valid;
  wire  _GEN_158 = 5'h19 == _T_277[4:0];
  wire  _GEN_25 = _GEN_158 | addresses_25_valid;
  wire  _GEN_159 = 5'h1a == _T_277[4:0];
  wire  _GEN_26 = _GEN_159 | addresses_26_valid;
  wire  _GEN_160 = 5'h1b == _T_277[4:0];
  wire  _GEN_27 = _GEN_160 | addresses_27_valid;
  wire  _GEN_161 = 5'h1c == _T_277[4:0];
  wire  _GEN_28 = _GEN_161 | addresses_28_valid;
  wire  _GEN_162 = 5'h1d == _T_277[4:0];
  wire  _GEN_29 = _GEN_162 | addresses_29_valid;
  wire  _GEN_163 = 5'h1e == _T_277[4:0];
  wire  _GEN_30 = _GEN_163 | addresses_30_valid;
  wire  _GEN_164 = 5'h1f == _T_277[4:0];
  wire  _GEN_31 = _GEN_164 | addresses_31_valid;
  wire [5:0] nextAddrUpdate = _T_276 ? _T_156 : nextAddr;
  wire  _T_284 = nextAddrUpdate <= 6'h20;
  wire  _T_286 = _T_284 | reset;
  wire  _T_287 = ~_T_286;
  assign mem__T_152_addr = {_T_132,_T_149};
  assign mem__T_152_data = mem[mem__T_152_addr];
  assign mem__T_281_data = io_w_0_data;
  assign mem__T_281_addr = _T_277[4:0];
  assign mem__T_281_mask = 1'h1;
  assign mem__T_281_en = io_w_0_en;
  assign io_r_0_data = _T_151 ? mem__T_152_data : 32'h0;
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addresses_0_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  addresses_0_bits = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  addresses_1_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addresses_1_bits = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  addresses_2_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  addresses_2_bits = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  addresses_3_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  addresses_3_bits = _RAND_8[8:0];
  _RAND_9 = {1{`RANDOM}};
  addresses_4_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  addresses_4_bits = _RAND_10[8:0];
  _RAND_11 = {1{`RANDOM}};
  addresses_5_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  addresses_5_bits = _RAND_12[8:0];
  _RAND_13 = {1{`RANDOM}};
  addresses_6_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  addresses_6_bits = _RAND_14[8:0];
  _RAND_15 = {1{`RANDOM}};
  addresses_7_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  addresses_7_bits = _RAND_16[8:0];
  _RAND_17 = {1{`RANDOM}};
  addresses_8_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  addresses_8_bits = _RAND_18[8:0];
  _RAND_19 = {1{`RANDOM}};
  addresses_9_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  addresses_9_bits = _RAND_20[8:0];
  _RAND_21 = {1{`RANDOM}};
  addresses_10_valid = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  addresses_10_bits = _RAND_22[8:0];
  _RAND_23 = {1{`RANDOM}};
  addresses_11_valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  addresses_11_bits = _RAND_24[8:0];
  _RAND_25 = {1{`RANDOM}};
  addresses_12_valid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  addresses_12_bits = _RAND_26[8:0];
  _RAND_27 = {1{`RANDOM}};
  addresses_13_valid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  addresses_13_bits = _RAND_28[8:0];
  _RAND_29 = {1{`RANDOM}};
  addresses_14_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  addresses_14_bits = _RAND_30[8:0];
  _RAND_31 = {1{`RANDOM}};
  addresses_15_valid = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  addresses_15_bits = _RAND_32[8:0];
  _RAND_33 = {1{`RANDOM}};
  addresses_16_valid = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  addresses_16_bits = _RAND_34[8:0];
  _RAND_35 = {1{`RANDOM}};
  addresses_17_valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  addresses_17_bits = _RAND_36[8:0];
  _RAND_37 = {1{`RANDOM}};
  addresses_18_valid = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  addresses_18_bits = _RAND_38[8:0];
  _RAND_39 = {1{`RANDOM}};
  addresses_19_valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  addresses_19_bits = _RAND_40[8:0];
  _RAND_41 = {1{`RANDOM}};
  addresses_20_valid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  addresses_20_bits = _RAND_42[8:0];
  _RAND_43 = {1{`RANDOM}};
  addresses_21_valid = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  addresses_21_bits = _RAND_44[8:0];
  _RAND_45 = {1{`RANDOM}};
  addresses_22_valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  addresses_22_bits = _RAND_46[8:0];
  _RAND_47 = {1{`RANDOM}};
  addresses_23_valid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  addresses_23_bits = _RAND_48[8:0];
  _RAND_49 = {1{`RANDOM}};
  addresses_24_valid = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  addresses_24_bits = _RAND_50[8:0];
  _RAND_51 = {1{`RANDOM}};
  addresses_25_valid = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  addresses_25_bits = _RAND_52[8:0];
  _RAND_53 = {1{`RANDOM}};
  addresses_26_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  addresses_26_bits = _RAND_54[8:0];
  _RAND_55 = {1{`RANDOM}};
  addresses_27_valid = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  addresses_27_bits = _RAND_56[8:0];
  _RAND_57 = {1{`RANDOM}};
  addresses_28_valid = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  addresses_28_bits = _RAND_58[8:0];
  _RAND_59 = {1{`RANDOM}};
  addresses_29_valid = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  addresses_29_bits = _RAND_60[8:0];
  _RAND_61 = {1{`RANDOM}};
  addresses_30_valid = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  addresses_30_bits = _RAND_62[8:0];
  _RAND_63 = {1{`RANDOM}};
  addresses_31_valid = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  addresses_31_bits = _RAND_64[8:0];
  _RAND_65 = {1{`RANDOM}};
  nextAddr = _RAND_65[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem__T_281_en & mem__T_281_mask) begin
      mem[mem__T_281_addr] <= mem__T_281_data;
    end
    if (metaReset) begin
      addresses_0_valid <= 1'h0;
    end else if (reset) begin
      addresses_0_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_0_valid <= _GEN_0;
    end
    if (metaReset) begin
      addresses_0_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h0 == _T_277[4:0]) begin
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
      addresses_1_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1 == _T_277[4:0]) begin
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
      addresses_2_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h2 == _T_277[4:0]) begin
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
      addresses_3_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h3 == _T_277[4:0]) begin
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
      addresses_4_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h4 == _T_277[4:0]) begin
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
      addresses_5_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h5 == _T_277[4:0]) begin
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
      addresses_6_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h6 == _T_277[4:0]) begin
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
      addresses_7_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h7 == _T_277[4:0]) begin
        addresses_7_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_8_valid <= 1'h0;
    end else if (reset) begin
      addresses_8_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_8_valid <= _GEN_8;
    end
    if (metaReset) begin
      addresses_8_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h8 == _T_277[4:0]) begin
        addresses_8_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_9_valid <= 1'h0;
    end else if (reset) begin
      addresses_9_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_9_valid <= _GEN_9;
    end
    if (metaReset) begin
      addresses_9_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h9 == _T_277[4:0]) begin
        addresses_9_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_10_valid <= 1'h0;
    end else if (reset) begin
      addresses_10_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_10_valid <= _GEN_10;
    end
    if (metaReset) begin
      addresses_10_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'ha == _T_277[4:0]) begin
        addresses_10_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_11_valid <= 1'h0;
    end else if (reset) begin
      addresses_11_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_11_valid <= _GEN_11;
    end
    if (metaReset) begin
      addresses_11_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'hb == _T_277[4:0]) begin
        addresses_11_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_12_valid <= 1'h0;
    end else if (reset) begin
      addresses_12_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_12_valid <= _GEN_12;
    end
    if (metaReset) begin
      addresses_12_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'hc == _T_277[4:0]) begin
        addresses_12_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_13_valid <= 1'h0;
    end else if (reset) begin
      addresses_13_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_13_valid <= _GEN_13;
    end
    if (metaReset) begin
      addresses_13_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'hd == _T_277[4:0]) begin
        addresses_13_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_14_valid <= 1'h0;
    end else if (reset) begin
      addresses_14_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_14_valid <= _GEN_14;
    end
    if (metaReset) begin
      addresses_14_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'he == _T_277[4:0]) begin
        addresses_14_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_15_valid <= 1'h0;
    end else if (reset) begin
      addresses_15_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_15_valid <= _GEN_15;
    end
    if (metaReset) begin
      addresses_15_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'hf == _T_277[4:0]) begin
        addresses_15_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_16_valid <= 1'h0;
    end else if (reset) begin
      addresses_16_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_16_valid <= _GEN_16;
    end
    if (metaReset) begin
      addresses_16_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h10 == _T_277[4:0]) begin
        addresses_16_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_17_valid <= 1'h0;
    end else if (reset) begin
      addresses_17_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_17_valid <= _GEN_17;
    end
    if (metaReset) begin
      addresses_17_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h11 == _T_277[4:0]) begin
        addresses_17_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_18_valid <= 1'h0;
    end else if (reset) begin
      addresses_18_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_18_valid <= _GEN_18;
    end
    if (metaReset) begin
      addresses_18_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h12 == _T_277[4:0]) begin
        addresses_18_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_19_valid <= 1'h0;
    end else if (reset) begin
      addresses_19_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_19_valid <= _GEN_19;
    end
    if (metaReset) begin
      addresses_19_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h13 == _T_277[4:0]) begin
        addresses_19_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_20_valid <= 1'h0;
    end else if (reset) begin
      addresses_20_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_20_valid <= _GEN_20;
    end
    if (metaReset) begin
      addresses_20_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h14 == _T_277[4:0]) begin
        addresses_20_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_21_valid <= 1'h0;
    end else if (reset) begin
      addresses_21_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_21_valid <= _GEN_21;
    end
    if (metaReset) begin
      addresses_21_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h15 == _T_277[4:0]) begin
        addresses_21_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_22_valid <= 1'h0;
    end else if (reset) begin
      addresses_22_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_22_valid <= _GEN_22;
    end
    if (metaReset) begin
      addresses_22_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h16 == _T_277[4:0]) begin
        addresses_22_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_23_valid <= 1'h0;
    end else if (reset) begin
      addresses_23_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_23_valid <= _GEN_23;
    end
    if (metaReset) begin
      addresses_23_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h17 == _T_277[4:0]) begin
        addresses_23_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_24_valid <= 1'h0;
    end else if (reset) begin
      addresses_24_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_24_valid <= _GEN_24;
    end
    if (metaReset) begin
      addresses_24_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h18 == _T_277[4:0]) begin
        addresses_24_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_25_valid <= 1'h0;
    end else if (reset) begin
      addresses_25_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_25_valid <= _GEN_25;
    end
    if (metaReset) begin
      addresses_25_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h19 == _T_277[4:0]) begin
        addresses_25_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_26_valid <= 1'h0;
    end else if (reset) begin
      addresses_26_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_26_valid <= _GEN_26;
    end
    if (metaReset) begin
      addresses_26_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1a == _T_277[4:0]) begin
        addresses_26_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_27_valid <= 1'h0;
    end else if (reset) begin
      addresses_27_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_27_valid <= _GEN_27;
    end
    if (metaReset) begin
      addresses_27_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1b == _T_277[4:0]) begin
        addresses_27_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_28_valid <= 1'h0;
    end else if (reset) begin
      addresses_28_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_28_valid <= _GEN_28;
    end
    if (metaReset) begin
      addresses_28_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1c == _T_277[4:0]) begin
        addresses_28_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_29_valid <= 1'h0;
    end else if (reset) begin
      addresses_29_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_29_valid <= _GEN_29;
    end
    if (metaReset) begin
      addresses_29_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1d == _T_277[4:0]) begin
        addresses_29_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_30_valid <= 1'h0;
    end else if (reset) begin
      addresses_30_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_30_valid <= _GEN_30;
    end
    if (metaReset) begin
      addresses_30_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1e == _T_277[4:0]) begin
        addresses_30_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      addresses_31_valid <= 1'h0;
    end else if (reset) begin
      addresses_31_valid <= 1'h0;
    end else if (io_w_0_en) begin
      addresses_31_valid <= _GEN_31;
    end
    if (metaReset) begin
      addresses_31_bits <= 9'h0;
    end else if (io_w_0_en) begin
      if (5'h1f == _T_277[4:0]) begin
        addresses_31_bits <= io_w_0_addr;
      end
    end
    if (metaReset) begin
      nextAddr <= 6'h0;
    end else if (reset) begin
      nextAddr <= 6'h0;
    end else if (_T_276) begin
      nextAddr <= _T_156;
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
