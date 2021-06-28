`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/15 22:53:49
// Design Name:
// Module Name: ALUMSB
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



module ALUMSB(
  ALUctl,a,b,c_in,slt,ALUout,set,overflow
  );
  input [0:3] ALUctl;
  input a,b,c_in,slt;
  output ALUout,set,overflow;

  wire c_out;

    function [2:0]out;
        input a,b,c_in,slt;
        input [3:0]ALUctl;
        begin
            case(ALUctl[3:0])
                0:out={a&b,1'b0,1'b0};
                1:out={a|b,1'b0,1'b0};
                2:out={a^b^c_in,
                      1'b0,
                      c_in^((a&b)|(b&c_in)|(c_in&a))};
                6:out={a^(~b)^c_in,
                      1'b0,
                      c_in^((a&(~b))|((~b)&c_in)|(c_in&a))};
                7:out={1'b0,
                      (a^(~b)^c_in)^(c_in^((a&(~b))|((~b)&c_in)|(c_in&a))),
                      c_in^((a&(~b))|((~b)&c_in)|(c_in&a))};
                12:out={~(a|b),1'b0,1'b0};
                default:out={1'b0,1'b0,1'b0};
            endcase
        end
    endfunction
    assign {ALUout,set,overflow}=out(a,b,c_in,slt,ALUctl);

endmodule
