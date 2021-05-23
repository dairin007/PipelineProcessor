`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/06 11:04:19
// Design Name:
// Module Name: Reg
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


module REGISTER(clk,RegWrite,RegDst,RegRead1,RegRead2,WriteRegTemp,WriteData,Data1,Data2);

    input clk,RegWrite,RegDst;

    input [4:0] RegRead1,RegRead2,WriteRegTemp;
    input [31:0] WriteData;
    output [31:0] Data1,Data2;

    reg [31:0] RegFile [31:0];
    wire [4:0] WriteReg;

    integer i;
    initial begin
        for(i=0;i<=31;i=i+1) begin
            RegFile[i]<= 32'b00000000000000000000000000000000;
        end
    end

    assign Data1=RegFile[RegRead1];
    assign Data2=RegFile[RegRead2];

    MUX5b mux5b(RegDst,RegRead2,WriteRegTemp,WriteReg);

    always @(posedge clk) begin
        if(RegWrite==1) begin
            RegFile[WriteReg]<=WriteData;
        end
    end



endmodule
