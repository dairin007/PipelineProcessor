`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/06 12:56:46
// Design Name:
// Module Name: register
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


module Register(clk,RegRead1,RegRead2,RegWrite,WriteData,RegWriteFlag,Data1,Data2);
  input clk,RegWriteFlag;
  input [4:0] RegRead1,RegRead2,RegWrite;
  input [31:0] WriteData;
  output [31:0] Data1,Data2;

  reg [31:0] RegFile [32:0];
  wire [4:0] RegWrite;
  reg clock;
  integer i;
  initial begin
    for(i=0;i<=32;i=i+1)begin
      RegFile[i]=0;
    end
  end

  assign Data1=RegFile[RegRead1];
  assign Data2=RegFile[RegRead2];

  always @(posedge clk)begin
    #1;
    if(RegWriteFlag==1'b1)
      RegFile[RegWrite]<=WriteData;
    end
endmodule
