`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/07 13:24:26
// Design Name: 
// Module Name: scp_tb
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


module scp_tb;
    reg clk=1,rst=0;
    wire Jump;
    Scp scp(clk,rst,Jump);
    integer i;
    initial begin
        i<=0;
        #50
        rst<=1;
        #200000
        $finish;
    end
    always #10 begin
        clk<=~clk;
        i<=i+1;
    end
     always @(scp.data_mem.mem[3])begin
        $display("i=%d",i);
    end
endmodule
