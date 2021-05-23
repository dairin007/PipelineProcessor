`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/08 10:59:52
// Design Name:
// Module Name: Mux5b
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


module MUX5b(ctl,a,b,out);

  input ctl;
  input [4:0] a,b;
  output [4:0] out;

  assign out=(ctl)?b:a;
endmodule
