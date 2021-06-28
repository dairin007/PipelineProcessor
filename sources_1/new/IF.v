`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/06 11:32:41
// Design Name:
// Module Name: PC_CTRL32
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



module IF(clk,rst,to_mux1,ALUOut,Flag,Jump,Hazard,Order,FAOut);
  input clk,rst,Jump,Flag,Hazard;
  input [31:0] ALUOut,to_mux1;
  output [31:0] Order,FAOut;

  reg [31:0]PC=0;
  wire [31:0] PCOut;
  wire [31:0] FAOut;
  wire [31:0] to_mux2,ToPC;


  FA32 fa(PCOut,4,FAOut);
  INST_MEM inst_mem(PCOut,Order);
  MUX mux1(Flag,FAOut,ALUOut,to_mux2);
  MUX mux2(Jump,to_mux2,to_mux1,ToPC);


  assign PCOut=PC;
  always @(posedge clk)begin
      if(rst==1'b1)
          PC<=32'b0;
      else
        PC<=(Hazard==1'b0)?ToPC:PC;
  end

endmodule
