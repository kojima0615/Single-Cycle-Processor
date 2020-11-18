`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 19:41:54
// Design Name: 
// Module Name: CLA16_tb
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


module CLA16_tb;
     reg [15:0]a,b;
    reg c_in;
    wire [15:0]s, c;
    CLA16 cla(a,b,c_in,s,c);
    initial begin
        a<=1423;
        b<=1234;
        c_in<=0;
        #100
        a<=1;
        b<=10;
        c_in<=1;
        #100
        a<=123122;
        b<=123123;
        c_in<=0;
        #100
        $finish;
    end
endmodule
