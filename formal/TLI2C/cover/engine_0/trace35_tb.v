`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [0:0] PI_auto_in_e_valid;
  reg [0:0] PI_auto_in_a_valid;
  reg [0:0] PI_auto_in_e_bits_sink;
  reg [0:0] PI_auto_in_d_ready;
  reg [0:0] PI_io_port_scl_in;
  reg [0:0] PI_auto_in_b_ready;
  reg [28:0] PI_auto_in_c_bits_address;
  reg [0:0] PI_io_port_sda_in;
  reg [2:0] PI_auto_in_a_bits_param;
  reg [31:0] PI_auto_in_c_bits_data;
  reg [2:0] PI_auto_in_a_bits_opcode;
  reg [28:0] PI_auto_in_a_bits_address;
  reg [0:0] PI_auto_in_c_bits_error;
  reg [1:0] PI_auto_in_c_bits_size;
  reg [0:0] PI_auto_in_c_valid;
  wire [0:0] PI_clock = clock;
  reg [2:0] PI_auto_in_c_bits_opcode;
  reg [2:0] PI_auto_in_c_bits_param;
  reg [6:0] PI_auto_in_a_bits_source;
  reg [3:0] PI_auto_in_a_bits_mask;
  reg [6:0] PI_auto_in_c_bits_source;
  reg [1:0] PI_auto_in_a_bits_size;
  reg [31:0] PI_auto_in_a_bits_data;
  TLI2CTop UUT (
    .auto_in_e_valid(PI_auto_in_e_valid),
    .auto_in_a_valid(PI_auto_in_a_valid),
    .auto_in_e_bits_sink(PI_auto_in_e_bits_sink),
    .auto_in_d_ready(PI_auto_in_d_ready),
    .io_port_scl_in(PI_io_port_scl_in),
    .auto_in_b_ready(PI_auto_in_b_ready),
    .auto_in_c_bits_address(PI_auto_in_c_bits_address),
    .io_port_sda_in(PI_io_port_sda_in),
    .auto_in_a_bits_param(PI_auto_in_a_bits_param),
    .auto_in_c_bits_data(PI_auto_in_c_bits_data),
    .auto_in_a_bits_opcode(PI_auto_in_a_bits_opcode),
    .auto_in_a_bits_address(PI_auto_in_a_bits_address),
    .auto_in_c_bits_error(PI_auto_in_c_bits_error),
    .auto_in_c_bits_size(PI_auto_in_c_bits_size),
    .auto_in_c_valid(PI_auto_in_c_valid),
    .clock(PI_clock),
    .auto_in_c_bits_opcode(PI_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(PI_auto_in_c_bits_param),
    .auto_in_a_bits_source(PI_auto_in_a_bits_source),
    .auto_in_a_bits_mask(PI_auto_in_a_bits_mask),
    .auto_in_c_bits_source(PI_auto_in_c_bits_source),
    .auto_in_a_bits_size(PI_auto_in_a_bits_size),
    .auto_in_a_bits_data(PI_auto_in_a_bits_data)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$formal$TLI2C_formal.\sv:199$1_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:200$2_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:201$3_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:202$4_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:203$5_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:204$6_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:205$7_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:206$8_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:207$9_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:208$10_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:209$11_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:210$12_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:211$13_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:212$14_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:213$15_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:214$16_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:215$17_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:216$18_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:217$19_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:218$20_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:219$21_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:220$22_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:221$23_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:222$24_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:223$25_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:224$26_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:225$27_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:226$28_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:227$29_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:228$30_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:229$31_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:230$32_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:231$33_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:232$34_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:233$35_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:234$36_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:235$37_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:236$38_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:237$39_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:238$40_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:239$41_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:240$42_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:241$43_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:242$44_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:243$45_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:244$46_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:245$47_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:246$48_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:247$49_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:248$50_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:249$51_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:250$52_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:251$53_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:252$54_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:253$55_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:254$56_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:255$57_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:256$58_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:257$59_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:258$60_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:259$61_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:260$62_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:261$63_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:262$64_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:263$65_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:264$66_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:265$67_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:266$68_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:267$69_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:268$70_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:269$71_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:270$72_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:271$73_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:272$74_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:273$75_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:274$76_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:275$77_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:276$78_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:277$79_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:278$80_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:279$81_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:280$82_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:281$83_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:282$84_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:283$85_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:284$86_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:285$87_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:286$88_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:287$89_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:288$90_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:289$91_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:290$92_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:291$93_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:292$94_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:293$95_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:294$96_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:295$97_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:296$98_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:297$99_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:298$100_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:299$101_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:300$102_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:301$103_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:302$104_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:303$105_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:304$106_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:305$107_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:306$108_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:307$109_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:308$110_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:309$111_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:310$112_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:311$113_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:312$114_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:313$115_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:314$116_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:315$117_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:316$118_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:317$119_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:318$120_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:319$121_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:320$122_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:321$123_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:322$124_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:323$125_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:324$126_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:325$127_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:326$128_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:327$129_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:328$130_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:329$131_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:330$132_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:331$133_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:332$134_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:333$135_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:334$136_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:335$137_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:336$138_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:337$139_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:338$140_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:339$141_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:340$142_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:341$143_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:342$144_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:343$145_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:344$146_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:345$147_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:346$148_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:347$149_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:348$150_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:349$151_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:350$152_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:358$153_EN  = 1'b0;
    // UUT.bb.$auto$wreduce.\cc:454:run$3173  = 4'b0000;
    UUT.bb.TLMonitor._T_613 = 1'b0;
    UUT.bb.TLMonitor._T_630 = 3'b000;
    UUT.bb.TLMonitor._T_632 = 3'b000;
    UUT.bb.TLMonitor._T_634 = 2'b00;
    UUT.bb.TLMonitor._T_636 = 7'b0000000;
    UUT.bb.TLMonitor._T_638 = 29'b00000000000000000000000000000;
    UUT.bb.TLMonitor._T_681 = 1'b0;
    UUT.bb.TLMonitor._T_698 = 3'b000;
    UUT.bb.TLMonitor._T_702 = 2'b00;
    UUT.bb.TLMonitor._T_704 = 7'b0000000;
    UUT.bb.TLMonitor._T_749 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    UUT.bb.TLMonitor._T_764 = 1'b0;
    UUT.bb.TLMonitor._T_792 = 1'b0;
    UUT.bb._T_255 = 2'b00;
    UUT.bb.arbLost = 1'b0;
    UUT.bb.bitCmd = 4'b0000;
    UUT.bb.bitCmdAck = 1'b0;
    UUT.bb.bitCmdStop = 1'b0;
    UUT.bb.bitCnt = 3'b000;
    UUT.bb.bitState = 5'b00000;
    UUT.bb.byteState = 3'b000;
    UUT.bb.clkEn = 1'b0;
    UUT.bb.cmdAck = 1'b0;
    UUT.bb.cmd_ack = 1'b0;
    UUT.bb.cmd_irqAck = 1'b0;
    UUT.bb.cmd_read = 1'b0;
    UUT.bb.cmd_start = 1'b0;
    UUT.bb.cmd_stop = 1'b0;
    UUT.bb.cmd_write = 1'b0;
    UUT.bb.cnt = 16'b0000000000000000;
    UUT.bb.control_coreEn = 1'b0;
    UUT.bb.control_intEn = 1'b0;
    UUT.bb.dSCL = 1'b0;
    UUT.bb.dSCLOen = 1'b0;
    UUT.bb.dSDA = 1'b0;
    UUT.bb.fSCL = 3'b000;
    UUT.bb.filterCnt = 14'b00000000000000;
    UUT.bb.load = 1'b0;
    UUT.bb.prescaler_hi = 8'b00000000;
    UUT.bb.prescaler_lo = 8'b00000000;
    UUT.bb.receivedAck = 1'b0;
    UUT.bb.receivedBit = 1'b0;
    UUT.bb.receivedData = 8'b00000000;
    UUT.bb.sSCL = 1'b0;
    UUT.bb.sSDA = 1'b0;
    UUT.bb.sclOen = 1'b0;
    UUT.bb.sdaChk = 1'b0;
    UUT.bb.sdaOen = 1'b0;
    UUT.bb.shift = 1'b0;
    UUT.bb.slaveWait = 1'b0;
    UUT.bb.startCond = 1'b0;
    UUT.bb.statusReadReady = 1'b0;
    UUT.bb.status_arbLost = 1'b0;
    UUT.bb.status_busy = 1'b0;
    UUT.bb.status_irqFlag = 1'b0;
    UUT.bb.status_receivedAck = 1'b0;
    UUT.bb.status_transferInProgress = 1'b0;
    UUT.bb.stopCond = 1'b0;
    UUT.bb.transmitBit = 1'b0;
    UUT.bb.transmitData = 8'b00000000;
    UUT.is_meta_reset_phase = 1'b1;
    UUT.is_reset_phase = 1'b0;

    // state 0
    PI_auto_in_e_valid = 1'b0;
    PI_auto_in_a_valid = 1'b0;
    PI_auto_in_e_bits_sink = 1'b0;
    PI_auto_in_d_ready = 1'b0;
    PI_io_port_scl_in = 1'b0;
    PI_auto_in_b_ready = 1'b0;
    PI_auto_in_c_bits_address = 29'b00000000000000000000000000000;
    PI_io_port_sda_in = 1'b0;
    PI_auto_in_a_bits_param = 3'b000;
    PI_auto_in_c_bits_data = 32'b00000000000000000000000000000000;
    PI_auto_in_a_bits_opcode = 3'b000;
    PI_auto_in_a_bits_address = 29'b00000000000000000000000000000;
    PI_auto_in_c_bits_error = 1'b0;
    PI_auto_in_c_bits_size = 2'b00;
    PI_auto_in_c_valid = 1'b0;
    PI_auto_in_c_bits_opcode = 3'b000;
    PI_auto_in_c_bits_param = 3'b000;
    PI_auto_in_a_bits_source = 7'b0000000;
    PI_auto_in_a_bits_mask = 4'b0000;
    PI_auto_in_c_bits_source = 7'b0000000;
    PI_auto_in_a_bits_size = 2'b00;
    PI_auto_in_a_bits_data = 32'b00000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b0;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b0;
      PI_io_port_scl_in <= 1'b0;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b000;
      PI_auto_in_a_bits_address <= 29'b00000000000000000000000000000;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_mask <= 4'b0000;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b00;
      PI_auto_in_a_bits_data <= 32'b00000000000000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b1;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b1;
      PI_io_port_scl_in <= 1'b1;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b001;
      PI_auto_in_a_bits_address <= 29'b10000000000010110000000010000;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b1111110;
      PI_auto_in_a_bits_mask <= 4'b0001;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b10;
      PI_auto_in_a_bits_data <= 32'b11111111111111111111111101100000;
    end

    // state 3
    if (cycle == 2) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b1;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b1;
      PI_io_port_scl_in <= 1'b0;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b000;
      PI_auto_in_a_bits_address <= 29'b10000000000010110000000010000;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b1110101;
      PI_auto_in_a_bits_mask <= 4'b0001;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b00;
      PI_auto_in_a_bits_data <= 32'b11111111111111111111111111001111;
    end

    // state 4
    if (cycle == 3) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b1;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b1;
      PI_io_port_scl_in <= 1'b1;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b100;
      PI_auto_in_a_bits_address <= 29'b10000000000010110000000010000;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b1111110;
      PI_auto_in_a_bits_mask <= 4'b0001;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b00;
      PI_auto_in_a_bits_data <= 32'b11111111111111111111111100000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b0;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b1;
      PI_io_port_scl_in <= 1'b0;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b110;
      PI_auto_in_a_bits_address <= 29'b10000000000010110000000010011;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b1110111;
      PI_auto_in_a_bits_mask <= 4'b1000;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b00;
      PI_auto_in_a_bits_data <= 32'b11111111111111111111111111111111;
    end

    // state 6
    if (cycle == 5) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b1;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b1;
      PI_io_port_scl_in <= 1'b0;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b000;
      PI_auto_in_a_bits_address <= 29'b10000000000010110000000010000;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b1110111;
      PI_auto_in_a_bits_mask <= 4'b1111;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b10;
      PI_auto_in_a_bits_data <= 32'b00000000000000000000000000000000;
    end

    // state 7
    if (cycle == 6) begin
      PI_auto_in_e_valid <= 1'b0;
      PI_auto_in_a_valid <= 1'b1;
      PI_auto_in_e_bits_sink <= 1'b0;
      PI_auto_in_d_ready <= 1'b1;
      PI_io_port_scl_in <= 1'b0;
      PI_auto_in_b_ready <= 1'b0;
      PI_auto_in_c_bits_address <= 29'b00000000000000000000000000000;
      PI_io_port_sda_in <= 1'b0;
      PI_auto_in_a_bits_param <= 3'b000;
      PI_auto_in_c_bits_data <= 32'b00000000000000000000000000000000;
      PI_auto_in_a_bits_opcode <= 3'b000;
      PI_auto_in_a_bits_address <= 29'b10000000000010110000000011111;
      PI_auto_in_c_bits_error <= 1'b0;
      PI_auto_in_c_bits_size <= 2'b00;
      PI_auto_in_c_valid <= 1'b0;
      PI_auto_in_c_bits_opcode <= 3'b000;
      PI_auto_in_c_bits_param <= 3'b000;
      PI_auto_in_a_bits_source <= 7'b1110111;
      PI_auto_in_a_bits_mask <= 4'b1000;
      PI_auto_in_c_bits_source <= 7'b0000000;
      PI_auto_in_a_bits_size <= 2'b00;
      PI_auto_in_a_bits_data <= 32'b00000000000000000000000000000000;
    end

    genclock <= cycle < 7;
    cycle <= cycle + 1;
  end
endmodule
