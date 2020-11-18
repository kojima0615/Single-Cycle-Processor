`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 13:15:16
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    reg a,b;
    wire c_out,s;
    Alu alu(4'b0010,a,b,0,0,c_out,s);
    initial begin
        a<=1'b0;
        b<=1'b0;
        #50
        a<=1'b0;
        b<=1'b1;
        #50
        a<=1'b1;
        b<=1'b0;
        #50
        a<=1'b1;
        b<=1'b1;
        #50
        $finish;
    end
endmodule
