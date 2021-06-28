`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/10 15:44:58
// Design Name:
// Module Name: Forwarding_Unit
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


module ForwardingUnit(ID_EXRegisterRs,ID_EXRegisterRt,
EX_MEMRegWrite,MEM_WBRegWrite,EX_MEMRegisterRd,MEM_WBRegisterRd,
EXForwardOut1,EXForwardOut2);

  input EX_MEMRegWrite,MEM_WBRegWrite;
  input [4:0] ID_EXRegisterRs,ID_EXRegisterRt,EX_MEMRegisterRd,MEM_WBRegisterRd;
  output [1:0] EXForwardOut1,EXForwardOut2;

  function [1:0]out1;
    input [4:0] ID_EXRegisterRs,ID_EXRegisterRt,EX_MEMRegisterRd,MEM_WBRegisterRd;
    input EX_MEMRegWrite,MEM_WBRegWrite;
    begin
      if (
        MEM_WBRegWrite &
        (MEM_WBRegisterRd!=0) &
        !(EX_MEMRegWrite & (EX_MEMRegisterRd!=0) & (EX_MEMRegisterRd==ID_EXRegisterRs)) &
        (MEM_WBRegisterRd==ID_EXRegisterRs) )
        out1=2'b01;
      else if (EX_MEMRegWrite & (EX_MEMRegisterRd!=0) &(EX_MEMRegisterRd==ID_EXRegisterRs))
        out1=2'b10;
      else
        out1=2'b00;
    end
  endfunction

  function [1:0]out2;
    input [4:0] ID_EXRegisterRs,ID_EXRegisterRt,EX_MEMRegisterRd,MEM_WBRegisterRd;
    input EX_MEMRegWrite,MEM_WBRegWrite;
    begin
      if (
        MEM_WBRegWrite &
        (MEM_WBRegisterRd!=0) &
        !(EX_MEMRegWrite&(EX_MEMRegisterRd!=0) & (EX_MEMRegisterRd==ID_EXRegisterRt) ) &
        (MEM_WBRegisterRd==ID_EXRegisterRt) )
        out2=2'b01;
      else if (EX_MEMRegWrite & (EX_MEMRegisterRd!=0) &(EX_MEMRegisterRd==ID_EXRegisterRt))
        out2=2'b10;
      else
        out2=2'b00;
    end
  endfunction

  assign EXForwardOut1=out1(ID_EXRegisterRs,ID_EXRegisterRt,EX_MEMRegisterRd,MEM_WBRegisterRd,EX_MEMRegWrite,MEM_WBRegWrite);
  assign EXForwardOut2=out2(ID_EXRegisterRs,ID_EXRegisterRt,EX_MEMRegisterRd,MEM_WBRegisterRd,EX_MEMRegWrite,MEM_WBRegWrite);
endmodule
