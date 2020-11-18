`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 21:47:01
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(clk, rst, ID_RegDst, ID_Branch, ID_MemRead, ID_MemtoReg, ID_ALUOp0, ID_ALUOp1, ID_MemWrite, ID_ALUSrc, ID_RegWrite,
EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite,
ID_read_data1,ID_read_data2,ID_extend_order,ID_pc4,ID_order,EX_read_data1,EX_read_data2,EX_extend_order,EX_pc4,EX_order);

input clk,rst,ID_RegDst,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite;
output reg EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite;
input [31:0]ID_read_data1,ID_read_data2,ID_extend_order,ID_pc4,ID_order;
output reg [31:0]EX_read_data1,EX_read_data2,EX_extend_order,EX_pc4,EX_order;

    always @(posedge clk)begin
       //1bitsignal
        EX_RegDst<=(rst==1'b0)?0:ID_RegDst;
        EX_Branch<=(rst==1'b0)?0:ID_Branch;
        EX_MemRead<=(rst==1'b0)?0:ID_MemRead;
        EX_MemtoReg<=(rst==1'b0)?0:ID_MemtoReg;
        EX_ALUOp0<=(rst==1'b0)?0:ID_ALUOp0;
        EX_ALUOp1<=(rst==1'b0)?0:ID_ALUOp1;
        EX_MemWrite<=(rst==1'b0)?0:ID_MemWrite;
        EX_ALUSrc<=(rst==1'b0)?0:ID_ALUSrc;
        EX_RegWrite<=(rst==1'b0)?0:ID_RegWrite;
        //31bitdata
        EX_read_data1<=(rst==1'b0)?0:ID_read_data1;
        EX_read_data2<=(rst==1'b0)?0:ID_read_data2;
        EX_extend_order<=(rst==1'b0)?0:ID_extend_order;
        EX_pc4<=(rst==1'b0)?0:ID_pc4;
        EX_order<=(rst==1'b0)?0:ID_order;
    end
endmodule
