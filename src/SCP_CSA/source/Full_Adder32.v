`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/05 20:29:40
// Design Name: 
// Module Name: Full_Adder32
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


module Full_Adder32(a,b,s);
    input [31:0]a,b;
    output [31:0]s;
    wire [31:0] c;
    Half_Adder ha(a[0],b[0],s[0],c[0]);
    generate genvar i;
    for(i=0;i<=30;i=i+1)
        Full_Adder fa(a[i+1],b[i+1],c[i],s[i+1],c[i+1]);
    endgenerate
endmodule
