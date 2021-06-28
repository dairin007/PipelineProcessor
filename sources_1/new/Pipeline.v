`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/16 03:18:17
// Design Name:
// Module Name: Pipeline
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module Pipeline(clk,rst);
  input clk,rst;

  wire [31:0] IF_PC4,IF_Order,ToMux;
  wire PCSrc,IF_IDFlash,Hazard;
  wire [31:0] ID_PC4,ID_Order,ID_ReadData1,ID_ReadData2,ID_ExtendOrder;
  wire [9:0] ID_Flag;//ID_RegDst,Jump,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite
  wire Jump;
  wire [31:0] EX_ReadData1,EX_ReadData2,EX_ExtendOrder,EX_PC4,EX_Order;
  wire [8:0] EX_Flag;//EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite
  wire EX_ZeroFlag;
  wire [31:0] EX_ALUResult,EX_ALUResult_PC;
  wire [4:0] EX_WriteReg;
  wire [1:0] EX_Forwarding1,EX_Forwarding2,EX_ALUctl;
  wire [31:0] MEM_ALUResultPC,MEM_ALUResult,MEM_ReadData2,MEM_ReadDataMem,WB_WriteRegData,WB_ReadDataMem,WB_ALUResult;
  wire [4:0] MEM_WriteReg,WB_WriteReg;
  wire [4:0] MEM_Flag;// MEM_MemtoReg,MEM_MemRead,MEM_MemWrite,MEM_Branch,MEM_RegWrite
  wire [1:0] WB_Flag;//WB_MemtoReg,WB_RegWriteFlag
  wire MEM_ZeroFlag;
  assign Jump=ID_Flag[8];
  assign PCSrc=MEM_ZeroFlag&MEM_Flag[1];
  assign IF_IDFlash=Jump|PCSrc;
  assign EX_ALUctl={EX_Flag[4],EX_Flag[3]};

  //IF
  IF ifstage(clk,rst,ToMux,MEM_ALUResultPC,PCSrc,Jump,Hazard,IF_Order,IF_PC4);
  IF_ID if_id(clk,IF_IDFlash,IF_PC4,IF_Order,Hazard,ID_PC4,ID_Order);

  //ID
  Hazard_unit HazardUnit(EX_Flag[6],EX_Order,ID_Order,Hazard);
  ID_Register ireg(clk,ID_Order,WB_WriteReg,WB_WriteRegData,WB_Flag[0],ID_ReadData1,ID_ReadData2);
  ID idstage(ID_Order,ID_PC4,ToMux,ID_ExtendOrder,ID_Flag);
  ID_EX id_ex(clk,Hazard,ID_Flag,EX_Flag,
              ID_ReadData1,ID_ReadData2,ID_ExtendOrder,ID_PC4,ID_Order,
              EX_ReadData1,EX_ReadData2,EX_ExtendOrder,EX_PC4,EX_Order);

  //EX
  ForwardingUnit forwarding_unit(EX_Order[25:21],EX_Order[20:16],MEM_Flag[0],WB_Flag[0],MEM_WriteReg,WB_WriteReg,EX_Forwarding1,EX_Forwarding2);
  EX exstage(EX_PC4,EX_ALUResult_PC,EX_Flag[1],EX_ReadData2,EX_Flag[8],EX_Order,EX_ExtendOrder,EX_ExtendOrder,EX_WriteReg,EX_ALUctl,EX_Forwarding1,EX_Forwarding2,EX_ReadData1,WB_WriteRegData,MEM_ALUResult,EX_ALUResult,EX_ZeroFlag);
  EX_MEM ex_mem(clk,rst,EX_Flag,EX_WriteReg,EX_ALUResult,EX_ALUResult_PC,EX_ReadData2,EX_ZeroFlag,
                MEM_Flag,MEM_WriteReg,MEM_ALUResult,MEM_ALUResultPC,MEM_ReadData2,MEM_ZeroFlag);

  //MEM
  Memory memory(clk,MEM_ALUResult,MEM_ReadData2,MEM_Flag[2],MEM_Flag[3],MEM_ReadDataMem);
  MEM_WB mem_wb(clk,MEM_Flag,MEM_ReadDataMem,MEM_ALUResult,MEM_WriteReg,WB_Flag,WB_ReadDataMem,WB_ALUResult,WB_WriteReg);

  //WB
  MUX mux_mem(WB_Flag[1],WB_ALUResult,WB_ReadDataMem,WB_WriteRegData);

endmodule
