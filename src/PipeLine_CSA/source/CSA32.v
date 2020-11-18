`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 16:45:46
// Design Name: 
// Module Name: CSA32
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


module CSA32(a, b, c_in, s, c);
    input [31:0]a, b;
    input c_in;
    output [31:0]s, c;
    wire [1:0]s2_t, s2_f, c2_t, c2_f;
    wire [2:0]s3_t, s3_f, c3_t, c3_f;
    wire [3:0]s41_t, s41_f, c41_t, c41_f;
    wire [3:0]s42_t, s42_f, c42_t, c42_f;
    wire [4:0]s5_t, s5_f, c5_t, c5_f;
    wire [5:0]s6_t, s6_f, c6_t, c6_f;
    wire [5:0]s6_t, s6_f, c6_t, c6_f;
       
    assign s[2:1]=(c[0]) ? s2_t : s2_f;
    assign c[2:1] =(c[0]) ? c2_t : c2_f;
    assign s[5:3]=(c[2]) ? s3_t : s3_f;
    assign c[5:3] =(c[2]) ? c3_t : c3_f;
    assign s[9:6]=(c[5]) ? s41_t : s41_f;
    assign c[9:6] =(c[5]) ? c41_t : c41_f;
    assign s[13:10]=(c[9]) ? s42_t : s42_f;
    assign c[13:10] =(c[9]) ? c42_t : c42_f;
    assign s[18:14]=(c[13]) ? s5_t : s5_f;
    assign c[18:14] =(c[13]) ? c5_t : c5_f;
    assign s[24:19]=(c[18]) ? s6_t : s6_f;
    assign c[24:19] =(c[18]) ? c6_t : c6_f;
    assign s[31:25]=(c[24]) ? s7_t : s7_f;
    assign c[31:25] =(c[24]) ? c7_t : c7_f;
    
    
    //1 bit
    Full_Adder fa(a[0], b[0], c_in, s[0],c[0]);
    
    //2 bit
    FA2 fa2_1(a[2:1], b[2:1], 1'b1, s2_t, c2_t);
    FA2 fa2_2(a[2:1], b[2:1], 1'b0, s2_f, c2_f);
    
    //3 bit
    FA3 fa3_1(a[5:3], b[5:3], 1'b1, s3_t, c3_t);
    FA3 fa3_2(a[5:3], b[5:3], 1'b0, s3_f, c3_f);
    
    //4 bit
    FA4 fa4_1(a[9:6], b[9:6], 1'b1, s41_t, c41_t);
    FA4 fa4_2(a[9:6], b[9:6], 1'b0, s41_f, c41_f);
   
    
    FA4 fa4_3(a[13:10], b[13:10], 1'b1, s42_t, c42_t);
    FA4 fa4_4(a[13:10], b[13:10], 1'b0, s42_f, c42_f);
    
    //5 bit
    FA5 fa5_1(a[18:14], b[18:14], 1'b1, s5_t, c5_t);
    FA5 fa5_2(a[18:14], b[18:14], 1'b0, s5_f, c5_f);
    
    //6 bit
    FA6 fa6_1(a[24:19], b[24:19], 1'b1, s6_t, c6_t);
    FA6 fa6_2(a[24:19], b[24:19], 1'b0, s6_f, c6_f);
    
    //7 bit
    FA7 fa7_1(a[31:25], b[31:25], 1'b1, s7_t, c7_t);
    FA7 fa7_2(a[31:25], b[31:25], 1'b0, s7_f, c7_f);
endmodule
