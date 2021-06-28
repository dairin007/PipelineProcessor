`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/10 17:40:14
// Design Name:
// Module Name: MEM_WB
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


module MEM_WB(clk,MEM_Flag,
              MEM_ReadDataMem,MEM_ALUResult,MEM_WriteReg,
              WB_Flag,
              WB_ReadDataMem,WB_ALUResult,WB_WriteReg);
  input clk;
  input [4:0] MEM_Flag;
  input [4:0] MEM_WriteReg;
  input [31:0] MEM_ReadDataMem,MEM_ALUResult;
  reg WB_MemtoReg,WB_RegWrite;
  output [1:0] WB_Flag;
  output reg [4:0] WB_WriteReg;
  output reg [31:0] WB_ReadDataMem,WB_ALUResult;
  wire MEM_MemtoReg,MEM_RegWrite;

  assign WB_Flag={WB_MemtoReg,WB_RegWrite};
  assign {MEM_MemtoReg,MEM_RegWrite}={MEM_Flag[4],MEM_Flag[0]};
  initial begin
    WB_MemtoReg=0;
    WB_RegWrite=0;
    WB_WriteReg=5'b0;
    WB_ReadDataMem=32'b0;
    WB_ALUResult=32'b0;
  end

  always @(posedge clk)begin
    WB_MemtoReg   <=MEM_MemtoReg;
    WB_RegWrite   <=MEM_RegWrite;
    WB_WriteReg   <=MEM_WriteReg;
    WB_ReadDataMem<=MEM_ReadDataMem;
    WB_ALUResult  <=MEM_ALUResult;
  end

endmodule
