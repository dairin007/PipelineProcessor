`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/13 14:07:55
// Design Name:
// Module Name: IF_ID
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


module IF_ID(clk,IF_IDFlash,Hazard,PCIn,InstIn,PCOut,InstOut);

  input clk,IF_IDFlash,Hazard;
  input [31:0] PCIn,InstIn;
  output reg [31:0] PCOut,InstOut;

  always @(posedge clk) begin
    if(Hazard==0) begin
      PCOut  <=(IF_IDFlash==1'b1)?32'b0:PCIn;
      InstOut<=(IF_IDFlash==1'b1)?32'b0:InstIn;
    end
  end

endmodule
