`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/07 16:12:09
// Design Name: 
// Module Name: alu32_tb
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


module alu32_tb;
    reg [31:0]a,b;
    wire[31:0]s;
    wire zero_flag;
    Alu32 alu(4'b0010,a,b,s,zero_flag);
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
        $display("%d, %d, %d, %d",a,b,s,zero_flag);
    end
endmodule
