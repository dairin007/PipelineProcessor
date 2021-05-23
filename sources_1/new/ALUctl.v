`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/05 16:23:45
// Design Name:
// Module Name: ALUctl
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


module ALUCTL(ALUOp,FuncCode,ALUCtl);

  input [1:0]ALUOp;
  input [5:0]FuncCode;
  output [3:0]ALUCtl;


  function [3:0]out;
    input[7:0] in;
    begin
      casex(in)
      8'b00xxxxxx:out=4'b0010;
      8'b01xxxxxx:out=4'b0110;
      8'b10100000:out=4'b0010;
      8'b10100010:out=4'b0110;
      8'b10100100:out=4'b0000;
      8'b10100101:out=4'b0001;
      8'b10101010:out=4'b0111;
      default:out=4'b0000;
      endcase
    end
  endfunction
  assign ALUCtl=out({ALUOp,FuncCode});

endmodule
