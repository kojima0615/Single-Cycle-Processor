`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 16:50:40
// Design Name: 
// Module Name: CLA4_tb
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


module CLA4_tb;
    reg [3:0]a,b;
    reg c_in;
    wire c_out;
    wire [3:0]s;
    CLA4 cla(a,b,c_in,s,c_out);
    initial begin
        a<=3;
        b<=2;
        c_in<=0;
        #100
        a<=1;
        b<=10;
        c_in<=1;
        #100
        a<=15;
        b<=12;
        c_in<=0;
        #100
        $finish;
    end
endmodule
