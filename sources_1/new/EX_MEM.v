`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/10 15:30:57
// Design Name:
// Module Name: EX_MEM
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


module EX_MEM(clk,rst,EX_Flag,EX_WriteReg,EX_ALUResult,EX_ALUResultPC,EX_ReadData2,EX_ZeroFlag,
MEM_Flag,MEM_WriteReg,MEM_ALUResult,MEM_ALUResultPC,MEM_ReaddData2,MEM_ZeroFlag);

  input clk,rst,EX_ZeroFlag;
  input [8:0] EX_Flag;
  input  [4:0] EX_WriteReg;
  input  [31:0] EX_ALUResult,EX_ALUResultPC,EX_ReadData2;
  output reg MEM_ZeroFlag;
  output reg [4:0] MEM_WriteReg;
  output reg [31:0] MEM_ALUResult,MEM_ALUResultPC,MEM_ReaddData2;
  output [4:0] MEM_Flag;
  reg MEM_MemtoReg,MEM_MemRead,MEM_MemWrite,MEM_Branch,MEM_RegWrite;
  wire EX_MemtoReg,EX_MemRead,EX_MemWrite,EX_Branch,EX_RegWrite;
  assign {EX_MemtoReg,EX_MemRead,EX_MemWrite,EX_Branch,EX_RegWrite}={EX_Flag[5],EX_Flag[6],EX_Flag[2],EX_Flag[7],EX_Flag[0]};
  assign MEM_Flag={MEM_MemtoReg,MEM_MemRead,MEM_MemWrite,MEM_Branch,MEM_RegWrite};

  initial begin
    MEM_MemtoReg=0;
    MEM_MemRead=0;
    MEM_MemWrite=0;
    MEM_Branch=0;
    MEM_ZeroFlag=0;
    MEM_RegWrite=0;
    MEM_WriteReg=5'b0;
    MEM_ALUResult=32'b0;
    MEM_ALUResultPC=32'b0;
    MEM_ReaddData2=32'b0;
  end


  always @(posedge clk)begin
    MEM_MemtoReg   <=(rst==1)?0:EX_MemtoReg;
    MEM_MemRead    <=(rst==1)?0:EX_MemRead;
    MEM_MemWrite   <=(rst==1)?0:EX_MemWrite;
    MEM_Branch     <=(rst==1)?0:EX_Branch;
    MEM_ZeroFlag   <=(rst==1)?0:EX_ZeroFlag;
    MEM_RegWrite   <=(rst==1)?0:EX_RegWrite;
    MEM_WriteReg   <=(rst==1)?4'b0:EX_WriteReg;
    MEM_ALUResult  <=(rst==1)?32'b0:EX_ALUResult;
    MEM_ALUResultPC<=(rst==1)?32'b0:EX_ALUResultPC;
    MEM_ReaddData2 <=(rst==1)?32'b0:EX_ReadData2;
  end
endmodule
