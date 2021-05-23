`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/07 17:45:15
// Design Name:
// Module Name: MUX2
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


module MUX32b(ctl,a,b,out);

  input ctl;
  input [31:0] a,b;
  output [31:0] out;

  assign out=(ctl)?b:a;

endmodule
