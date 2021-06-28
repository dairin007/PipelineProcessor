`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/09 21:47:01
// Design Name:
// Module Name: ID_EX
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


module ID_EX(clk,rst,ID_Flag,EX_Flag,
ID_ReadData1,ID_ReadData2,ID_ExtendOrder,ID_PC4,ID_Order,      //data in
EX_ReadData1,EX_ReadData2,EX_ExtendOrder,EX_PC4,EX_Order);     //data out

  input clk,rst;
  input [9:0] ID_Flag;
  input [31:0] ID_ReadData1,ID_ReadData2,ID_ExtendOrder,ID_PC4,ID_Order;
  reg EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite;
  wire ID_RegDst,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite;
  output reg [31:0] EX_ReadData1,EX_ReadData2,EX_ExtendOrder,EX_PC4,EX_Order;
  output [8:0] EX_Flag;

  assign {ID_RegDst,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite}=
          {ID_Flag[9],ID_Flag[7],ID_Flag[6],ID_Flag[5],ID_Flag[4],ID_Flag[3],ID_Flag[2],ID_Flag[1],ID_Flag[0]};
  assign EX_Flag={EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite};
  initial begin
    EX_RegDst=0;
    EX_Branch=0;
    EX_MemRead=0;
    EX_MemtoReg=0;
    EX_ALUOp0=0;
    EX_ALUOp1=0;
    EX_MemWrite=0;
    EX_ALUSrc=0;
    EX_RegWrite=0;
    EX_ReadData1=32'b0;
    EX_ReadData2=32'b0;
    EX_ExtendOrder=32'b0;
    EX_PC4=32'b0;
    EX_Order=32'b0;
  end

  always @(posedge clk)begin
    EX_RegDst     <=(rst==1'b1)?0:ID_RegDst;
    EX_Branch     <=(rst==1'b1)?0:ID_Branch;
    EX_MemRead    <=(rst==1'b1)?0:ID_MemRead;
    EX_MemtoReg   <=(rst==1'b1)?0:ID_MemtoReg;
    EX_ALUOp0     <=(rst==1'b1)?0:ID_ALUOp0;
    EX_ALUOp1     <=(rst==1'b1)?0:ID_ALUOp1;
    EX_MemWrite   <=(rst==1'b1)?0:ID_MemWrite;
    EX_ALUSrc     <=(rst==1'b1)?0:ID_ALUSrc;
    EX_RegWrite   <=(rst==1'b1)?0:ID_RegWrite;
    EX_ReadData1  <=(rst==1'b1)?32'b0:ID_ReadData1;
    EX_ReadData2  <=(rst==1'b1)?32'b0:ID_ReadData2;
    EX_ExtendOrder<=(rst==1'b1)?32'b0:ID_ExtendOrder;
    EX_PC4        <=(rst==1'b1)?32'b0:ID_PC4;
    EX_Order      <=(rst==1'b1)?32'b0:ID_Order;
  end
endmodule
