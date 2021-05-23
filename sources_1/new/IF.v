`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/09 11:06:11
// Design Name:
// Module Name: PC
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


module IF(clk,rst,PCSrc,Hazard,IFMux0,IF_IDIn);

  input clk,rst,PCWrite,PCSrc;
  input [31:0] IFMux0;
  output [31:0] IF_IDIn;

  reg [31:0] PC=32'b0;
  wire [31:0] PCOut;
  wire [31:0] FAOut;
  wire [31:0] ToPC;
  assign PCOut=PC;

  MUX32b mux(PCSrc,InMux0,FAOut,ToPC);
  FA32 fa1(PCOut,32'd4,FAOut);
  INST_MEM inst_mem(PCOut,IF_IDIn);

  always @(posedge clk) begin
    if(rst==1) begin
      PCOut<=32'b0;
    end else begin
      PC<=(Hazard==0)?ToPC:PC;
    end
  end


endmodule
