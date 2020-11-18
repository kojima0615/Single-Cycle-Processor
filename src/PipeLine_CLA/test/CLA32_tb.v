`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 16:19:48
// Design Name: 
// Module Name: CLA32_tb
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


module CLA32_tb;
     reg [31:0]a,b;
     reg c_in;
    wire[31:0]s;
    CLA32 cla(a,b,c_in,s);
    initial begin
        a<=1200;
        b<=9999;
        c_in<=0;
        #100
        a<=1000000;
        b<=1231233;
        c_in<=1;
        #50;
        $finish;
    end
endmodule
