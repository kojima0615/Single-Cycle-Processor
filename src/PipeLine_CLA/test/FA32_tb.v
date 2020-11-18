`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/05 20:51:23
// Design Name: 
// Module Name: FA32_tb
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


module FA32_tb;
    reg [31:0]a,b;
    wire[31:0]s;
    Full_Adder32 fa32(a,b,s);
    initial begin
        a<=1200;
        b<=9999;
        #100
        a<=1000000;
        b<=1231233;
        #50;
        $finish;
    end
    always @(s)begin
        $display("%d, %d, %d",a,b,s);
    end
endmodule
