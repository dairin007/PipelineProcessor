`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/06 14:31:05
// Design Name:
// Module Name: alu
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


module ALU(
  ALUctl,a,b,c_in,slt,ALUout,c_out
  );
    input a,b,c_in,slt;
    input [3:0]ALUctl;
    output c_out,ALUout;

    function [1:0]out;
        input a,b,c_in,slt;
        input [3:0]ALUctl;
        begin
            case(ALUctl[3:0])
                0:out={a&b,1'b0};
                1:out={a|b,1'b0};
                2:out={a^b^c_in,(a&b)|(b&c_in)|(c_in&a)};
                6:out={a^(~b)^c_in,(a&(~b))|((~b)&c_in)|(c_in&a)};
                7:out={slt,(a&(~b))|((~b)&c_in)|(c_in&a)};
                12:out={~(a|b),1'b0};
                default:out={1'b0,1'b0};
            endcase
        end
    endfunction
    assign {ALUout,c_out}=out(a,b,c_in,slt,ALUctl);

endmodule
