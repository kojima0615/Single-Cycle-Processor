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
    integer i;
    initial begin
        i<=0;
        #50
        rst<=1;
        #1000000
        $finish;
    end
    always #50 begin
        clk<=~clk;
        i<=i+1;
    end
    always @(scp.data_mem.mem[3])begin
        $display("i=%d",i);
    end
endmodule
