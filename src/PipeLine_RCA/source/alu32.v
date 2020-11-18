`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 16:33:06
// Design Name: 
// Module Name: alu32
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


module Alu32(ALUctl,a,b,s,zero_flag);
    input [31:0]a,b;
    input [3:0]ALUctl;
    output zero_flag;
    output [31:0]s;
    wire [31:0]c,a_inv,b_inv;
    assign a_inv=(ALUctl[3])?~a:a;
    assign b_inv=(ALUctl[2])?~b:b;
    wire set;
    wire overflow;
    Alu alu0(ALUctl,a_inv[0],b_inv[0],set,ALUctl[2],c[0],s[0]);
    generate genvar i;
        for(i=1;i<=31;i=i+1)begin
         Alu alu(ALUctl,a_inv[i],b_inv[i],1'b0,c[i-1],c[i],s[i]);
        end
    endgenerate
    assign overflow=(c[30]!=c[31])?1:0;
    assign set=(overflow)?~s[31]:s[31];
    assign zero_flag=~|s;
endmodule
