`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/15 23:31:35
// Design Name:
// Module Name: Hazard_unit
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


module Hazard_unit(
    EX_MemRead,EX_order,ID_order,hazard
    );
input EX_MemRead;
input [31:0] EX_order,ID_order;
output hazard;
  assign hazard=EX_MemRead&((EX_order[20:16]==ID_order[25:21])|(EX_order[20:16]==ID_order[20:16]));
endmodule
