`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/13 14:39:33
// Design Name:
// Module Name: PipeP
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


module PipeP(clk,rst);
  input clk,rst;

  //IF stage
  //hazard信号１つだけにする
  IF IFStage(clk,rst,PCSrc,PCWrite,IFMux0,IF_IDIn);         //IF(clk,rst,PCSrc,Hazard,IFMux0,IF_IDIn)
  IF_ID IF_IDReg(clk,IF_IDWrite,IF_IDFlash,PCIn,InstIn,PCOut,InstOut);         //IF_ID(clk,IF_IDFlash,Hazard,PCIn,InstIn,PCOut,InstOut)

  //ID stage
  ID IDStage;
  ID_EX ID_EXReg;

endmodule
