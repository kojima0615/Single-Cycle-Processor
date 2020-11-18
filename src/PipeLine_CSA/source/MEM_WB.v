`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 17:40:14
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk, rst, MEM_MemtoReg, MEM_RegWrite, MEM_read_data_mem, MEM_alu_result, MEM_write_reg,
     WB_MemtoReg, WB_RegWrite, WB_read_data_mem, WB_alu_result, WB_write_reg);
     input MEM_MemtoReg, MEM_RegWrite, clk, rst;
     output  reg WB_MemtoReg, WB_RegWrite;
     input [4:0]MEM_write_reg;
     output reg [4:0]WB_write_reg;
     input [31:0]MEM_read_data_mem, MEM_alu_result;
     output reg [31:0]WB_read_data_mem, WB_alu_result;
     always @(posedge clk)begin
        WB_MemtoReg<=(rst==1'b0)?0:MEM_MemtoReg;
        WB_RegWrite<=(rst==1'b0)?0:MEM_RegWrite;
        WB_write_reg<=(rst==1'b0)?0:MEM_write_reg;
        WB_read_data_mem<=(rst==1'b0)?0:MEM_read_data_mem;
        WB_alu_result<=(rst==1'b0)?0:MEM_alu_result;
     end
endmodule
