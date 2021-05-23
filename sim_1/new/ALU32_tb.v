`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/04 22:57:13
// Design Name: 
// Module Name: ALU32_tb
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


module ALU32_tb();
    reg [3:0] ALUctl;
    reg [31:0] a,b;
    wire [31:0] ALUout;
    wire Zero;
    ALU32 alu32(ALUctl,a,b,ALUout,Zero);
    
    initial begin     
        //AND
       ALUctl=0;
       a<=32'h00000000;
       b<=32'h00000000;
       #20
       a<=32'h0f0f0f0f;
       b<=32'hf0f0f0f0;
       #20  
       a<=32'hf0f0f0f0;
       b<=32'h0f0f0f0f;
       #20  
       a<=32'hffffffff;
       b<=32'hffff0000;
       #20  
       a<=32'hD8A3B8D3 ;
       b<=32'h63B9D6F2;
       #20 
       //OR
       ALUctl=1;
       a<=32'h00000000;
       b<=32'h00000000;
       #20
       a<=32'h0f0f0f0f;
       b<=32'hf0f0f0f0;
       #20  
       a<=32'hf0f0f0f0;
       b<=32'h0f0f0f0f;
       #20  
       a<=32'hffffffff;
       b<=32'hffff0000;
       #20  
       a<=32'hD8A3B8D3 ;
       b<=32'h63B9D6F2;
       #20       
        //ADD
       ALUctl=2;
       a<=32'h00000000;
       b<=32'h00000000;
       #20
       a<=32'h0f0f0f0f;
       b<=32'hf0f0f0f0;
       #20  
       a<=32'h4fffffff;
       b<=32'h00000001;
       #20  
       a<=32'hffffffff;
       b<=32'h00000001;
       #20          
       a<=32'hD8A3B8D3 ;
       b<=32'h63B9D6F2;
       #20    
        //SUB
        ALUctl<=6;
        a<=32'h00000000;
        b<=32'h00000001;
        #20  
        a<=32'h00000000;
        b<=32'h00000000;
        #20
        a<=32'h00000001;
        b<=32'h30000001;
        #20  
        a<=32'h00000001;
        b<=32'h00000001;
        #20          
        a<=32'hD8A3B8D3 ;
        b<=32'h63B9D6F2;
        #20   
        //SLT  
        ALUctl=7;
        a<=32'h00000000;
        b<=32'h00000000;
        #20
        a<=32'h00000000;
        b<=32'h00000001;
        #20  
        a<=32'h00000001;
        b<=32'h30000001;
        #20  
        a<=32'h00000001;
        b<=32'h00000001;
        #20          
        a<=32'h0000ffff ;
        b<=32'h03B9D6F2;
        #20        
        b<=32'h0000ffff ;
        a<=32'h03B9D6F2;
        #20    
        $finish;
    end
    
    always @(ALUctl) begin
        $display("%d",ALUctl[2]);
    end
endmodule
