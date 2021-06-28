`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/19 00:05:12
// Design Name:
// Module Name: MUX3
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


module MUX3(
  flag,data0,data1,data2,out
    );
    input [1:0] flag;
    input [31:0] data0,data1,data2;
    output [31:0] out;

  assign out=(flag==2'b00)?data0:
              (flag==2'b01)?data1:
              (flag==2'b10)?data2:0;
endmodule
