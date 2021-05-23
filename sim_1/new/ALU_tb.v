`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/04 18:06:42
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    reg [3:0] ALUctl;
    reg a,b,c_in,slt;
    wire ALUout,c_out;
    ALU alu(ALUctl,a,b,c_in,slt,ALUout,c_out);
    
    initial begin
        c_in<=1'b1;
        slt<=1'b0;
        ALUctl<=6;

        a <=1'b0;
        b <=1'b0;
        #50
        a <=1'b0;
        b <=1'b1;
        #50
        a <=1'b1;
        b <=1'b0;
        #50
        a <=1'b1;
        b <=1'b1;
        #50
        $finish;
     end
endmodule
