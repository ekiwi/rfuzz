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
  reg [164:0] PI_io_inputs;
  wire [0:0] PI_clock = clock;
  TLI2CTop UUT (
    .io_inputs(PI_io_inputs),
    .clock(PI_clock)
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
    // UUT.$formal$TLI2C_formal.\sv:177$1_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:178$2_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:179$3_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:180$4_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:181$5_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:182$6_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:183$7_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:184$8_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:185$9_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:186$10_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:187$11_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:188$12_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:189$13_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:190$14_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:191$15_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:192$16_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:193$17_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:194$18_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:195$19_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:196$20_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:197$21_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:198$22_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:199$23_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:200$24_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:201$25_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:202$26_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:203$27_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:204$28_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:205$29_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:206$30_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:207$31_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:208$32_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:209$33_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:210$34_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:211$35_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:212$36_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:213$37_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:214$38_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:215$39_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:216$40_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:217$41_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:218$42_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:219$43_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:220$44_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:221$45_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:222$46_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:223$47_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:224$48_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:225$49_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:226$50_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:227$51_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:228$52_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:229$53_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:230$54_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:231$55_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:232$56_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:233$57_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:234$58_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:235$59_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:236$60_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:237$61_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:238$62_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:239$63_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:240$64_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:241$65_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:242$66_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:243$67_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:244$68_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:245$69_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:246$70_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:247$71_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:248$72_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:249$73_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:250$74_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:251$75_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:252$76_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:253$77_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:254$78_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:255$79_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:256$80_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:257$81_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:258$82_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:259$83_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:260$84_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:261$85_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:262$86_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:263$87_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:264$88_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:265$89_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:266$90_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:267$91_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:268$92_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:269$93_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:270$94_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:271$95_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:272$96_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:273$97_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:274$98_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:275$99_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:276$100_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:277$101_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:278$102_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:279$103_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:280$104_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:281$105_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:282$106_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:283$107_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:284$108_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:285$109_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:286$110_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:287$111_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:288$112_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:289$113_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:290$114_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:291$115_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:292$116_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:293$117_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:294$118_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:295$119_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:296$120_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:297$121_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:298$122_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:299$123_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:300$124_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:301$125_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:302$126_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:303$127_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:304$128_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:305$129_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:306$130_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:307$131_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:308$132_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:309$133_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:310$134_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:311$135_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:312$136_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:313$137_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:314$138_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:315$139_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:316$140_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:317$141_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:318$142_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:319$143_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:320$144_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:321$145_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:322$146_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:323$147_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:324$148_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:325$149_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:326$150_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:327$151_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:328$152_CHECK  = 1'b0;
    // UUT.$formal$TLI2C_formal.\sv:336$153_EN  = 1'b0;
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
    PI_io_inputs = 165'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_io_inputs <= 165'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_io_inputs <= 165'b000000000000000000000000000000000000000000000000000000000000000010000000000010110000000000100000000000000000000000000000001111110000000011110000000000001000100010000;
    end

    // state 3
    if (cycle == 2) begin
      PI_io_inputs <= 165'b000000000000000000000000000000000000000000000000000000000000000010000000000010110000000011111000000000000000000000000000001000110000000010000000000000000000100010000;
    end

    genclock <= cycle < 3;
    cycle <= cycle + 1;
  end
endmodule
