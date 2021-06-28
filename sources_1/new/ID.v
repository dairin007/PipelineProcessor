`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/18 23:18:13
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


module ID(
  ID_Order,ID_PC4,ToMux1,ID_ExtendOrder,ID_Flag
    );
  input [31:0] ID_Order,ID_PC4;
  output [31:0] ToMux1,ID_ExtendOrder;
  output [9:0] ID_Flag;
  wire ID_RegDst,Jump,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite;
  wire [31:0] ShiftOrder;
  assign ID_Flag={ID_RegDst,Jump,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite};
  assign ShiftOrder={ID_Order[25:0],2'b00};
  assign ToMux1={ID_PC4[31:28],ShiftOrder[27:0]};
  Controller controller(ID_Order[31:26],ID_RegDst,Jump,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite);
  Extend extend(ID_Order[15:0],ID_ExtendOrder);

endmodule
