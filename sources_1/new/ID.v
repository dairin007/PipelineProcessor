`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/14 14:27:00
// Design Name:
// Module Name: ID
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


module ID(clk,PC,Inst);
  input clk;
  //IF_IDからの入力
  input [31:0] PC,Inst;

  //ID_EXへの出力
  output [3:0] EXFlagIn;
  output [2:0] MEMFlagIn;
  output [1:0] WBFlagIn;
  output [31:0] Data1In,Data2In,ExtendSignIn,InstIn;

  //その他
  input MEM_WBRegisterRd,WBData,RegWrite;
  output InstOut;

  MAINCTL mianctl(Inst[31;26],Jump,EXFlag,MEMFlag,WBFlag);    //MAINCTL(Inst31_26,Jump,EXFlag,MEMFlag,WBFlag)
  REGISTER reg():

endmodule
