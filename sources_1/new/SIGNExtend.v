`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/16 00:12:55
// Design Name:
// Module Name: SignExtend
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


module Extend(
    in,out
    );
    input [15:0] in;
    output [31:0] out;

    assign out={in[15],in[15],in[15],in[15],in[15],
                in[15],in[15],in[15],in[15],in[15],
                in[15],in[15],in[15],in[15],in[15],in[15],
                in[15:0]
    };

endmodule
