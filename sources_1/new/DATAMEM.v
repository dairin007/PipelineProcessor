`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/06 13:17:45
// Design Name:
// Module Name: DATAMEM
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



module DATAMEM(clk,MemWrite,MemRead,Address,WriteData,Data );

  input clk,MemWrite,MemRead;
  input [31:0] Address,WriteData;
  output [31:0] Data;

  reg [31:0] Mem [31:0];

  integer i;
  initial begin
    for(i=0;i<=31;i=i+1) begin
      Mem[i]<= 32'b00000000000000000000000000000000;
    end
      Mem[1]<=32'b00000000000000000000000000000001;
      Mem[2]<=32'd11;
  end

  always @(posedge clk) begin
    if(MemWrite==1) begin
      Mem[Address]<=WriteData;
    end
  end

  assign Data=(MemRead==1)?Mem[Address]:0;


endmodule
