`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 18:00:44
// Design Name: 
// Module Name: scp_pipeline_tb
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


module scp_pipeline_tb;
    reg clk=1,rst=0;
    Scp_pipe scp(clk,rst);
    initial begin
        #50
        rst<=1;
        #7000
        $finish;
    end
    always #1 begin
        clk<=~clk;
    end
endmodule
