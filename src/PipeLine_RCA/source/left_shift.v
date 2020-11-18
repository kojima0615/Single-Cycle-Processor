`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 11:13:50
// Design Name: 
// Module Name: left_shift
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


module Left_Shift(in,res);
    input [31:0]in;
    output [31:0]res;
    assign res={in[29:0],2'b00}; 
endmodule
