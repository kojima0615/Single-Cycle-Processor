`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 15:44:58
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(Rs, Rt, MEM_RegWrite, WB_RegWrite, MEM_write_reg, WB_write_reg, EX_forward_out1, EX_forward_out2);
    input [4:0]Rs, Rt, MEM_write_reg, WB_write_reg;
    input  MEM_RegWrite, WB_RegWrite;
    output [1:0]EX_forward_out1,EX_forward_out2;
    
    function [1:0]out1;
        input [4:0]Rs, Rt, MEM_write_reg, WB_write_reg;
        input  MEM_RegWrite, WB_RegWrite;
        begin
            if (WB_RegWrite && (WB_write_reg!=0)&& !(MEM_RegWrite && (MEM_write_reg!=0) && (MEM_write_reg==Rs) ) && (WB_write_reg==Rs) )
                out1=2'b01;
            else if (MEM_RegWrite && (MEM_write_reg!=0) &&(MEM_write_reg==Rs))
                out1=2'b10;
            else
                out1=2'b00;
        end
    endfunction
     function [1:0]out2;
        input [4:0]Rs, Rt, MEM_write_reg, WB_write_reg;
        input  MEM_RegWrite, WB_RegWrite;
        begin
            if (WB_RegWrite && (WB_write_reg!=0)&& !(MEM_RegWrite && (MEM_write_reg!=0) && (MEM_write_reg==Rt) ) && (WB_write_reg==Rt) )
                out2=2'b01;
            else if (MEM_RegWrite && (MEM_write_reg!=0) &&(MEM_write_reg==Rt))
                out2=2'b10;
            else
                out2=2'b00;
        end
    endfunction
    assign EX_forward_out1=out1(Rs, Rt,  MEM_write_reg, WB_write_reg,MEM_RegWrite, WB_RegWrite);
    assign EX_forward_out2=out2(Rs, Rt,  MEM_write_reg, WB_write_reg,MEM_RegWrite, WB_RegWrite);
endmodule
