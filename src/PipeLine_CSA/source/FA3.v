`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 16:57:11
// Design Name: 
// Module Name: FA3
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


module FA3(a, b, c_in, s,c);
    input [2:0]a,b;
    input c_in;
    output[2:0]s;
    output [2:0]c;
    Full_Adder fa1(a[0],b[0],c_in,s[0],c[0]);
    Full_Adder fa2(a[1],b[1],c[0],s[1],c[1]);
    Full_Adder fa3(a[2],b[2],c[1],s[2],c[2]);
endmodule
