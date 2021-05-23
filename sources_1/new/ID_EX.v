`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/14 01:09:08
// Design Name:
// Module Name: ID_EX
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


module ID_EX(clk,Hazard,WBFlagIn,MEMFlagIn,EXFlagIn,Data1In,Data2In,ExtendSignIn,InstIn,WBFlagOut,MEMFlagOut,EXFlagOut,Data1Out,Data2Out,ExtendSignOut,InstOut);
  input clk,Hazard;
  input [3:0] EXFlagIn;
  input [2:0] MEMFlagIn;
  input [1:0] WBFlagIn;
  input [31:0] Data1In,Data2In,ExtendSignIn,InstIn;
  output reg [3:0] EXFlagOut;
  output reg [2:0] MEMFlagOut;
  output reg [1:0] WBFlagOut;
  output reg [31:0] Data1Out,Data2Out,ExtendSignOut,InstOut;

  always @(posedge clk) begin
    if(Hazard==0) begin
      WBFlagOut<=WBFlagIn;
      MEMFlagOu<=MEMFlagIn;
      EXFlagOut<=EXFlagIn;
      Data1Out<=Data1In;
      Data2Out<=Data2In;
      ExtendSignOut<=ExtendSignIn;
      InstOut<=InstIn;
    end else begin
      WBFlagOut<=4'b0;
      MEMFlagOu<=3'b0;
      EXFlagOut<=2'b00;
      Data1Out<=32'b0;
      Data2Out<=32'b0;
      ExtendSignOut<=32'b0;
      InstOut<=32'b0;
    end
  end

endmodule
