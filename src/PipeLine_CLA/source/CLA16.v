`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 19:13:04
// Design Name: 
// Module Name: CLA16
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


module CLA16(ALUctl,a, b, c_in,set, s, c_out);
    input [15:0]a,b;
    input [1:0]ALUctl;
    input c_in;
    input set;
    output [15:0]s;
    output c_out;
    wire [3:0]c;
    wire c1,c2,c3,c4;
    wire [3:0]g,t;
    /*
    assign c[0]=g[0] | t[0] & c_in;
    assign c[1]=g[1] | t[1] & c[0];
    assign c[2]=g[2] | t[2] & c[1];
    assign c[3]=g[3] | t[3] & c[2];
    */
     CLA4_gt cla1(ALUctl,a[3:0],b[3:0],c_in,set,s[3:0], g[0], t[0]);
     CLA4_gt cla2(ALUctl,a[7:4],b[7:4],c1,1'b0,s[7:4], g[1], t[1]);
     CLA4_gt cla3(ALUctl,a[11:8],b[11:8],c2,1'b0,s[11:8], g[2], t[2]);
     CLA4_gt cla4(ALUctl,a[15:12],b[15:12],c3,1'b0,s[15:12], g[3], t[3]);
     look_ahead la(g[0], t[0],g[1], t[1], g[2], t[2], g[3], t[3], c_in, c1, c2, c3,c_out,g_out, t_out);
endmodule
/*
 input [15:0]a,b;
    input c_in;
    output [15:0]s;
    output c_out;
    wire [15:0]c;
    wire [15:0]g, t;
    wire [3:0]g1, t1;
    assign g = a & b;
    assign t = a | b;
    wire c1,c2,c3;
    //ˆê’i–Ú
    CLA4_gt cla1(g[3:0], t[3:0], c_in, c[3:0], g1[0], t1[0]);
    CLA4_gt cla2(g[7:4], t[7:4], c1, c[7:4], g1[1], t1[1]);
    CLA4_gt cla3(g[11:8], t[11:8], c2, c[11:8], g1[2], t1[2]);
    CLA4_gt cla4(g[15:12], t[15:12], c3, c[15:12], g1[3], t1[3]);
    //“ñ’i–Ú
    CLA4_gt cla11(g1, t1 , c_in, {c3, c2,c1},,);
    assign c_out=c[15];
    assign s = a ^ b ^ {c[14:0],c_in};
*/
