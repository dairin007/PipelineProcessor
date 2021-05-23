`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/05 17:13:10
// Design Name:
// Module Name: MAINCTR
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


module MAINCTL(Inst31_26,Jump,EXFlag,MEMFlag,WBFlag);

  input [5:0] Inst31_26;
  output Jump;
  output [3:0] EXFlag;        //RegDst,ALUop1,ALUop2,ALUSrc
  output [2:0] MEMFlag;       //Branch,MemRead,MemWrite
  output [1:0] WBFlag;        //RegWrite,MemToReg

  function [8:0]out;
      input [5:0]Inst31_26;
      begin
          case(Inst31_26)
              6'b000000:out=10'b0_1001_000_10;
              6'b100011:out=10'b0_0111_100_00;
              6'b101011:out=10'b0_0100_010_00;
              6'b000100:out=10'b0_0000_001_01;
              6'b000010:out=10'b1_0000_000_00;
              default:  out=10'b0_0000_000_00;
          endcase
      end
  endfunction
  assign {Jump,EXFlag,MEMFlag,WBFlag}=out(Inst31_26);
endmodule
