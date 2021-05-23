`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/08 14:57:19
// Design Name:
// Module Name: HA
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


module HA(a,b,s,c);

  input a,b;
  output s,c;

  assign s=a^b;
  assign c=a&b;
endmodule
