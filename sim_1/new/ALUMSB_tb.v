`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/04 21:17:15
// Design Name: 
// Module Name: ALUMSB_tb
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


module ALUMSB_tb();
    reg [3:0] ALUctl;
    reg a,b,c_in,slt;
    wire ALUout,set,overflow;
    ALUMSB alumsb(ALUctl,a,b,c_in,slt,ALUout,set,overflow);
    
    initial begin
          ALUctl<=6;
          slt<=0;
        a <=1'b1;
        b <=1'b0;
        c_in<=1'b1;
        #50
        a <=1'b1;
        b <=1'b1;
        c_in<=1'b1;
        #50
        a <=1'b0;
        b <=1'b1;
        c_in<=1'b1;
        #50
        $finish;
     end
endmodule
