`timescale 1ns / 1ps


(* CORE_GENERATION_INFO = "Data_memory,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Data_memory,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "Data_memory.hwdef" *) 
module Fetch_stage
   (DataMemory_Address,
    DataMemory_inout,
    Data_Memory_rd_wr,
    IR_rd_wr,
    MAR_rd_wr,
    MDR_rd_wr,
    PC_rd_wr,
    PM_rd_wr,
    ProgramCounter_addressin,
    clk,
    fetch_output);
  input [4:0]DataMemory_Address;
  inout [31:0]DataMemory_inout;
  input Data_Memory_rd_wr;
  input IR_rd_wr;
  input MAR_rd_wr;
  input MDR_rd_wr;
  input PC_rd_wr;
  input PM_rd_wr;
  input [4:0]ProgramCounter_addressin;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN Data_memory_clk, FREQ_HZ 12000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FETCH_OUTPUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FETCH_OUTPUT, LAYERED_METADATA undef" *) output [66:0]fetch_output;

  wire [4:0]DataMemory_Address_1;
  wire Data_Memory_rd_wr_1;
  wire IR_0_PCenable;
  wire [66:0]IR_0_fetchout;
  wire IR_rd_wr_1;
  wire [4:0]MAR_0_addout;
  wire MAR_rd_wr_1;
  wire MDR_rd_wr_1;
  wire Net;
  wire [31:0]Net2;
  wire PC_rd_wr_1;
  wire PM_rd_wr_1;
  wire [4:0]ProgramCounter_addressin_1;
  wire [4:0]program_counter_0_addressout;

  assign DataMemory_Address_1 = DataMemory_Address[4:0];
  assign Data_Memory_rd_wr_1 = Data_Memory_rd_wr;
  assign IR_rd_wr_1 = IR_rd_wr;
  assign MAR_rd_wr_1 = MAR_rd_wr;
  assign MDR_rd_wr_1 = MDR_rd_wr;
  assign Net = clk;
  assign PC_rd_wr_1 = PC_rd_wr;
  assign PM_rd_wr_1 = PM_rd_wr;
  assign ProgramCounter_addressin_1 = ProgramCounter_addressin[4:0];
  assign fetch_output[66:0] = IR_0_fetchout;
  Data_memory_IR_0_0 IR_0
       (.IR_rd_wr(IR_rd_wr_1),
        .PCenable(IR_0_PCenable),
        .clk(Net),
        .fetchout(IR_0_fetchout));
  Data_memory_MAR_0_0 MAR_0
       (.MAR_rd_wr(MAR_rd_wr_1),
        .addin(program_counter_0_addressout),
        .addout(MAR_0_addout),
        .clk(Net));
  Data_memory_MDR_0_0 MDR_0
       (.MDR_rd_wr(MDR_rd_wr_1),
        .clk(Net));
  Data_memory_data_memory_0_0 data_memory_0
       (.DM_rd_wr(Data_Memory_rd_wr_1),
        .address(DataMemory_Address_1),
        .clk(Net),
        .data(DataMemory_inout[31:0]));
  Data_memory_program_counter_0_0 program_counter_0
       (.CE(IR_0_PCenable),
        .PC_rd_wr(PC_rd_wr_1),
        .addressin(ProgramCounter_addressin_1),
        .addressout(program_counter_0_addressout),
        .clk(Net));
  Data_memory_program_memory_0_0 program_memory_0
       (.PM_rd_wr(PM_rd_wr_1),
        .address(MAR_0_addout),
        .clk(Net));
endmodule
