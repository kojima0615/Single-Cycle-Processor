`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 15:30:57
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(clk, rst, EX_MemtoReg, EX_MemRead, EX_MemWrite, EX_Branch, EX_RegWrite,EX_write_reg, EX_alu_result, EX_alu_result_pc,EX_read_data2, EX_zero_flag,
MEM_MemtoReg, MEM_MemRead, MEM_MemWrite, MEM_Branch, MEM_RegWrite,MEM_write_reg, MEM_alu_result, MEM_alu_result_pc, MEM_read_data2,MEM_zero_flag);
    input clk, rst, EX_MemtoReg, EX_MemRead, EX_MemWrite, EX_Branch,EX_zero_flag,EX_RegWrite;
    output reg MEM_MemtoReg, MEM_MemRead, MEM_MemWrite, MEM_Branch,MEM_zero_flag,MEM_RegWrite;
    input  [4:0]EX_write_reg;
    output reg [4:0]MEM_write_reg;
    input  [31:0]EX_alu_result, EX_alu_result_pc,EX_read_data2;
    output reg [31:0]MEM_alu_result, MEM_alu_result_pc, MEM_read_data2;
    always @(posedge clk)begin
        MEM_MemtoReg<=(rst==1'b0)?0:EX_MemtoReg;
        MEM_MemRead<=(rst==1'b0)?0:EX_MemRead;
        MEM_MemWrite<=(rst==1'b0)?0:EX_MemWrite;
        MEM_Branch<=(rst==1'b0)?0:EX_Branch;
        MEM_zero_flag<=(rst==1'b0)?0:EX_zero_flag;
        MEM_write_reg<=(rst==1'b0)?0:EX_write_reg;
        MEM_alu_result<=(rst==1'b0)?0:EX_alu_result;
        MEM_alu_result_pc<=(rst==1'b0)?0:EX_alu_result_pc;
        MEM_read_data2<=(rst==1'b0)?0:EX_read_data2;
        MEM_RegWrite<=(rst==1'b0)?0:EX_RegWrite;
    end
endmodule
