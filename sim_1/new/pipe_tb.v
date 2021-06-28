`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/15 18:02:28
// Design Name:
// Module Name: pipe_tb
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


module pipe_tb();
    reg clk=0,rst=1;
    Pipeline Pipeline(clk,rst);
    initial begin
        #50
        rst<=0;
        #7000
        $finish;
    end
    always #50 begin
       clk<=~clk;
    end
endmodule
