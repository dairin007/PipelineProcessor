`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/07 11:51:28
// Design Name:
// Module Name: data_Mem
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


module Memory(clk,Address,WriteData,MemWrite,MemRead,Data);
  input MemWrite,MemRead,clk;
  input[31:0] Address,WriteData;
  output [31:0] Data;

  reg [31:0] Mem [3:0];

  integer i;
  initial begin
    for(i=0;i<=31;i=i+1)begin
        Mem[i]=32'b0;
    end
    Mem[1]=32'b1;
    Mem[2]=32'd11;
  end

  always @(posedge clk)begin
      if(MemWrite==1)
      Mem[Address]<=WriteData;
  end
  assign Data=(MemRead==1'b1)?Mem[Address]:32'b0;
endmodule
