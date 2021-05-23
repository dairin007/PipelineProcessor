`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/09 10:59:03
// Design Name:
// Module Name: L2SHIFT2
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



module L2SHIFT(in,out);

  input wire [31:0] in;
  output wire [31:0] out;

  assign out={in[29:0],2'b00};
endmodule
