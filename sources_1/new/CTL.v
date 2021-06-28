`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/06 13:26:51
// Design Name:
// Module Name: controller
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


module Controller(in,RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp0,ALUOp1,MemWrite,ALUSrc,RegWrite);
    input [5:0] in;
    output RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp0,ALUOp1,MemWrite,ALUSrc,RegWrite;

    function [9:0] out;
        input [5:0] in;
        begin
            case(in)
                6'b000000:out=10'b1_0000_100_01;  //addsub
                6'b100011:out=10'b0_0011_000_11;  //lw
                6'b101011:out=10'b0_0000_001_10;  //sw
                6'b000100:out=10'b0_0100_010_00;  //if
                6'b000010:out=10'b0_1000_000_00;  //jump
                default  :out=10'b0_0000_000_00;
            endcase
        end
    endfunction
    assign {RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp0,ALUOp1,MemWrite,ALUSrc,RegWrite}=out(in);
endmodule
