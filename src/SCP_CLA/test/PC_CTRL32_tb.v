`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 12:16:36
// Design Name: 
// Module Name: PC_CTRL32_tb
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


module PC_CTRL32_tb;
    reg clk=1,rst=0;
    wire [31:0]order;
    PC_CTRL32 pc_ctrl32(clk,rst,1'b0,0,1'b0,order);
    initial begin
        #100
        rst<=1;
        #500
        $finish;
    end
    always #50 begin
        clk<=~clk;
    end
endmodule
