`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/19 00:28:42
// Design Name:
// Module Name: EX_ALU
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


module EX_ALU(
  EX_Forwarding1,
  EX_Forwarding2,
  EX_ReadData1,WB_WriteRegData,MEM_ALUResult,
  EX_ReadDataMux,
  EX_ALUctl,
  EX_ALUResult,EX_ZeroFlag
    );
  input [1:0] EX_Forwarding1,EX_Forwarding2;
  input [31:0] EX_ReadData1,WB_WriteRegData,MEM_ALUResult,EX_ReadDataMux;
  input [3:0] EX_ALUctl;
  output [31:0] EX_ALUResult;
  output EX_ZeroFlag;

  wire [31:0] EX_ALUIn1,EX_ALUIn2;
  MUX3 mux3_1(EX_Forwarding1,EX_ReadData1,WB_WriteRegData,MEM_ALUResult,EX_ALUIn1);
  MUX3 mux3_2(EX_Forwarding2,EX_ReadDataMux,WB_WriteRegData,MEM_ALUResult,EX_ALUIn2);
  ALU32 alu32(EX_ALUctl,EX_ALUIn1,EX_ALUIn2,EX_ALUResult,EX_ZeroFlag);


endmodule
