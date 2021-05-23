`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:36:35
// Design Name: 
// Module Name: ALUCTR_tb
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


module ALUCTR_tb();
    reg [1:0] ALUop;
    reg [5:0] funccode;
    wire [3:0] ALUctl;
    ALUCTL aluctr(ALUop,funccode,ALUctl);
    
    initial begin
        ALUop<=2'b00;
        funccode<=6'b000000;
        #50
        ALUop<=2'b00;
        funccode<=6'b111111;
        #50  
          
        ALUop<=2'b01;
        funccode<=6'b111111;
        #50 
        
        ALUop<=2'b10;
        funccode<=6'b100000;
        #50
        funccode<=6'b100010;
        #50   
        
        funccode<=6'b100100;
        #50
        funccode<=6'b100101;
        #50
        
        funccode<=6'b101010;
        #50                            
    $finish;
    end
endmodule
