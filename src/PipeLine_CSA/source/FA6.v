`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 17:01:52
// Design Name: 
// Module Name: FA6
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


module FA6(a, b, c_in, s,c);
    input [5:0]a,b;
    input c_in;
    output[5:0]s;
    output [5:0]c;
    Full_Adder fa1(a[0],b[0],c_in,s[0],c[0]);
    Full_Adder fa2(a[1],b[1],c[0],s[1],c[1]);
    Full_Adder fa3(a[2],b[2],c[1],s[2],c[2]);
    Full_Adder fa4(a[3],b[3],c[2],s[3],c[3]);
    Full_Adder fa5(a[4],b[4],c[3],s[4],c[4]);
    Full_Adder fa6(a[5],b[5],c[4],s[5],c[5]);
endmodule
