`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/13 16:07:58
// Design Name:
// Module Name: HAZARD_UNIT
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


module HAZARD_UNIT(ID_EXMemRead,ID_EXRegisterRt,Inst,Hazard);
  input ID_EXMemRead;
  input [31:0] Inst;
  input [4:0] ID_EXRegisterRt;
  output Hazard;

  assign Hazard=(ID_EXMemRead&((ID_EXRegisterRt==Inst[25:21])|(ID_EXRegisterRt==Inst[20:16])))?1:0;
endmodule
