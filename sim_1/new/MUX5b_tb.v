`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 11:16:07
// Design Name: 
// Module Name: MUX5b_tb
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


module MUX5b_tb();
    reg [4:0] a,b;
    reg ctl;
    wire [4:0] out;
    MUX5b mux5b(ctl,a,b,out);
    
    initial begin
        a<=5'b01001;
        b<=5'b00000;

        ctl<=0;
        #50
        ctl<=1;
        #50
        ctl<=0;
        #50
        $finish;
    end
endmodule
