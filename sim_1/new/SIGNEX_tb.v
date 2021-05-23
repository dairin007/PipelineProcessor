`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 14:26:13
// Design Name: 
// Module Name: SIGNEX_tb
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


module SIGNEX_tb();
    reg clk=1;
    reg [15:0] in;
    wire [31:0] out;
    SIGNEX signex(clk,in,out);

    initial begin
        in<=16'b0000000000000001;
        #50
        in<=16'b1000000000000001;
        #50
        in<=16'b1001100100010011;
        #50
        in<=16'b1001100111111111;
        in<=16'b1001100111111111;
        #50        
        $finish;
    end
    
    always #1 begin
        clk=~clk;
    end
endmodule
