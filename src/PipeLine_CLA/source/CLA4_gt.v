`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 18:45:13
// Design Name: 
// Module Name: CLA4_gt
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


module CLA4_gt(ALUctl,a, b, c_in, set,s, g_out, t_out);
    input [3:0]a,b;
    input c_in,set;
    input [1:0]ALUctl;
    output [3:0]s;
    output g_out, t_out;
    wire [3:0]c;
    wire c1,c2,c3,c4;
    wire [3:0]g,t;
     CLA cla1(ALUctl,a[0],b[0],c_in,set,s[0], g[0], t[0]);
     CLA cla2(ALUctl,a[1],b[1],c1,1'b0,s[1], g[1], t[1]);
     CLA cla3(ALUctl,a[2],b[2],c2,1'b0,s[2], g[2], t[2]);
     CLA cla4(ALUctl,a[3],b[3],c3,1'b0,s[3], g[3], t[3]);
     look_ahead la(g[0], t[0],g[1], t[1], g[2], t[2], g[3], t[3], c_in, c1, c2, c3,,g_out, t_out);
endmodule
 /*assign c[0]=g[0] | t[0] & c_in;
    assign c[1]=g[1] | t[1] & (g[0] | t[0] & c_in);
    assign c[2]=g[2] | t[2] & (g[1] | t[1] & (g[0] | t[0] & c_in));
    assign c[3]=g[3] | t[3] & (g[2] | t[2] & (g[1] | t[1] & (g[0] | t[0] & c_in)));
    */