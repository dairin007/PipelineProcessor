`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 15:10:48
// Design Name: 
// Module Name: L2SHIFT_tb
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


module L2SHIFT_tb();
    reg [25:0] in;
    wire [27:0] out;
    L2SHIFT l2shift(in,out);
    
    initial begin
        in<=26'b10000000001101011101010001;
        #50
        in<=26'b11111111111111111111111111;
        #50       
        in<=26'b00000000000000000000000000;
        #50
        $finish;
    end
endmodule
