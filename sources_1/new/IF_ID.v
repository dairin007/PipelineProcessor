`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/09 19:53:31
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


module IF_ID(clk,IF_IDFlash,PCIn,OrderIn,Hazard,PCOut,OrderOut);
  input clk,IF_IDFlash,Hazard;
  input [31:0] PCIn,OrderIn;
  output reg [31:0] PCOut,OrderOut;

  initial begin
    PCOut=32'b0;
    OrderOut=32'b0;
  end

  always @(posedge clk)begin
    if(Hazard==1'b0)begin
      PCOut   <=(IF_IDFlash==1'b1)?32'b0:PCIn;
      OrderOut<=(IF_IDFlash==1'b1)?32'b0:OrderIn;
    end
  end
endmodule
