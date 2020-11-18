`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 17:41:49
// Design Name: 
// Module Name: CLA32
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


module CLA32(ALUctl, a, b, c_in, s);
    input [31:0]a,b;
    input c_in;
    input [1:0]ALUctl;
    output [31:0]s;
    wire c_out;
    wire set;
    assign set=s[31];
    CLA16 cla1(ALUctl,a[15:0], b[15:0], c_in,set,s[15:0], c_out);
    CLA16 cla2(ALUctl,a[31:16], b[31:16], c_out,1'b0,s[31:16],);
endmodule
