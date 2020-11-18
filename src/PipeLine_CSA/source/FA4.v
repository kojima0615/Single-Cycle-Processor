`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 16:59:18
// Design Name: 
// Module Name: FA4
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


module FA4(a, b, c_in, s,c);
    input [3:0]a,b;
    input c_in;
    output[3:0]s;
    output [3:0]c;
    Full_Adder fa1(a[0],b[0],c_in,s[0],c[0]);
    Full_Adder fa2(a[1],b[1],c[0],s[1],c[1]);
    Full_Adder fa3(a[2],b[2],c[1],s[2],c[2]);
    Full_Adder fa4(a[3],b[3],c[2],s[3],c[3]);
endmodule
