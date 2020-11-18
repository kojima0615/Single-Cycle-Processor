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
    Scp_pipe scp(clk,rst);
    initial begin
        #50
        rst<=1;
        #5000
        $finish;
    end
    always #50 begin
        clk<=~clk;
    end
    always @(scp.pc_ctrl.pc)begin
        $display("pc=%d,reg1=%d,reg2=%d,reg3=%d",scp.pc_ctrl.pc,scp.register.reg_file[0],scp.register.reg_file[1],scp.register.reg_file[2]);
    end
endmodule
