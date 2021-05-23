`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 17:55:09
// Design Name: 
// Module Name: MAINCTR_tb
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


module MAINCTR_tb();
    reg [5:0] Inst31_26;
    wire RegDst,Jump,ALUsrc,Memto_Reg,RegWrite,RegRead,MemWrite,Branch;
    wire [1:0] ALUop;
    MAINCTL mainctr(Inst31_26, RegDst,Jump,ALUsrc,Memto_Reg,RegWrite,RegRead,MemWrite,Branch,ALUop);
    
    initial begin
        #50
        Inst31_26=6'b000000;
        #100
        Inst31_26=6'b100011;
        #100
        Inst31_26=6'b101011;
        #100
        Inst31_26=6'b000100;
        #100
        Inst31_26=6'b000010;
        #100       
    $finish;
    end
endmodule
