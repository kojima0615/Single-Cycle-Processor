`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 13:21:48
// Design Name: 
// Module Name: mux4
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


module Mux4(a,b,flag,res);
    input [4:0]a,b;
    input flag;
    output [4:0]res;
    assign res=(flag)?a:b;
endmodule
