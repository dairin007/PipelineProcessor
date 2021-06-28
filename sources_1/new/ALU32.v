`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/06 16:33:06
// Design Name:
// Module Name: alu32
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


module ALU32(ALUctl,a,b,ALUout,Zero);
  input [3:0] ALUctl;
  input  [31:0] a,b;
  output  [31:0] ALUout;
  output Zero;

  wire [30:0] c_out;
  wire set,overflow;

  ALU alu0(ALUctl, a[0], b[0], ALUctl[2],set,ALUout[0] ,c_out[0]);
  generate
    genvar i;
    for(i=1;i<=30;i=i+1)begin
      ALU alu(ALUctl,a[i],b[i],c_out[i-1],1'b0,ALUout[i],c_out[i]);
    end
  endgenerate
  ALUMSB alumsb(ALUctl,a[31],b[31],c_out[30],1'b0,ALUout[31],set,overflow);
  assign Zero=~|ALUout;

endmodule
