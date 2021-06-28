`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/20 01:31:57
// Design Name:
// Module Name: ID_Register
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


module ID_Register(clk,ID_Order,WB_WriteReg,WB_WriteRegData,WB_RegWriteFlag,ID_ReadData1,ID_ReadData2);
  input clk,WB_RegWriteFlag;
  input [4:0] WB_WriteReg;
  input [31:0] ID_Order,WB_WriteRegData;
  output [31:0] ID_ReadData1,ID_ReadData2;

  Register register(clk,ID_Order[25:21],ID_Order[20:16],WB_WriteReg,WB_WriteRegData,WB_RegWriteFlag,ID_ReadData1,ID_ReadData2);
endmodule
