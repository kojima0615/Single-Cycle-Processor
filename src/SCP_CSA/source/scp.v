`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 10:41:05
// Design Name: 
// Module Name: scp
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


module Scp(clk,rst,Jump);
    input clk,rst;
    output Jump;
    wire [31:0]order,write_data,read_data1,read_data2,extend_order,alu_result,read_data_mem,read_data_mux,extend_order_left;
    wire [3:0]ALUctl;
    wire RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp0,ALUOp1,MemWrite,ALUSrc,RegWrite;
    wire PCsrc;
    wire [31:0]fa_out;
    assign PCsrc=zero_flag&Branch;
    PC_CTRL32 pc_ctrl(clk,rst, PCsrc,alu_out,Jump,fa_out,order);
    Controller controller(order[31:26],RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp0,ALUOp1,MemWrite,ALUSrc,RegWrite);
    Register register(clk,rst,order[25:21],order[20:16],order[15:11],write_data,RegDst,RegWrite,read_data1,read_data2);
    assign extend_order={16'b0000000000000000,order[15:0]};
     Left_Shift left_shift1(extend_order,extend_order_left);
    Alu32 alu(4'b0010,extend_order_left,fa_out,alu_out,);
    Alu_Controller alu_controller({ALUOp0,ALUOp1},order[5:0],ALUctl);
    Mux mux_regi(extend_order,read_data2,ALUSrc,read_data_mux);
    Alu32 alu32(ALUctl,read_data1,read_data_mux,alu_result,zero_flag);
    Data_mem data_mem(clk,rst,alu_result,read_data2,MemWrite,MemRead,read_data_mem);
    Mux mux_mem(read_data_mem,alu_result,MemtoReg,write_data);
endmodule
