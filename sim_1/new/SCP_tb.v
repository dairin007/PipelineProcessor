`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 15:42:09
// Design Name: 
// Module Name: SCP_tb
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


module SCP_tb();
    reg clk=1,rst=1;
    SCP scp(clk,rst);
    initial begin
        #50
        rst<=0;
        #5000
        $finish;
    end
    always #10 begin
        clk<=~clk;
    end
endmodule