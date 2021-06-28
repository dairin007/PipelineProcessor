`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/18 23:46:00
// Design Name:
// Module Name: EX
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


module EX(
EX_PC4,EX_ALUResult_PC,EX_ALUSrc,EX_ReadData2,EX_RegDst,EX_Order,EX_ExtendOrder,EX_ExtendOrder,EX_WriteReg,EX_ALUOp,
EX_Forwarding1,EX_Forwarding2,EX_ReadData1,WB_WriteRegData,MEM_ALUResult,EX_ALUResult,EX_ZeroFlag);
  input EX_RegDst,EX_ALUSrc;
  input [1:0] EX_ALUOp;
  input [31:0] EX_Order,EX_ExtendOrder,EX_ReadData2,EX_PC4;
  input [1:0] EX_Forwarding1,EX_Forwarding2;
input [31:0] EX_ReadData1,WB_WriteRegData,MEM_ALUResult;
output [31:0] EX_ALUResult;
output EX_ZeroFlag;
  output [4:0] EX_WriteReg;
  output [31:0] EX_ALUResult_PC;
  wire [31:0] EX_ExtendOrder_Leftshift;
  wire [3:0] EX_ALUctl;
  wire [31:0] EX_ReadDataMux;

  assign EX_WriteReg=(EX_RegDst)?EX_Order[15:11]:EX_Order[20:16];
  assign EX_ExtendOrder_Leftshift=({EX_ExtendOrder[29:0],2'b00});
  ALUController alu_controller(EX_ALUOp,EX_Order[5:0],EX_ALUctl);
  MUX mux_reg(EX_ALUSrc,EX_ReadData2,EX_ExtendOrder,EX_ReadDataMux);
  ALU32 alu32_PC(4'b0010,EX_PC4,EX_ExtendOrder_Leftshift,EX_ALUResult_PC,);
  EX_ALU alue(EX_Forwarding1,EX_Forwarding2,EX_ReadData1,WB_WriteRegData,MEM_ALUResult,EX_ReadDataMux,EX_ALUctl,EX_ALUResult,EX_ZeroFlag);

endmodule
