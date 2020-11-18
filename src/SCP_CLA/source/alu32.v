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
    wire [31:0] a_inv,b_inv;
    assign a_inv=(ALUctl[3])?~a:a;
    assign b_inv=(ALUctl[2])?~b:b;
    CLA32 cla(ALUctl[1:0],a_inv,b_inv,ALUctl[2],s);
    assign zero_flag=~|s;
endmodule
