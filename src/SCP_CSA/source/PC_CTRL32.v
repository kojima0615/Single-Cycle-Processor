`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 11:32:41
// Design Name: 
// Module Name: PC_CTRL32
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


module PC_CTRL32(clk,rst,zero_flag,alu_out,Jump,fa_out,order);
    input clk,rst,Jump,zero_flag;
    input [31:0]alu_out;
    output [31:0]order,fa_out;
    reg [31:0]pc=0;//プログラムカウンタ
    wire [31:0]pc_out;
    //wire [31:0]fa_out,alu_out;//4足したもの,aluの出力
    wire [31:0]to_mux1,to_mux2,to_pc;
    wire [27:0]shift_order;
    wire [31:0]extend_order_left;
    assign pc_out=pc;
    //Full_Adder32 fa(pc_out,4,fa_out);
    CSA32 csa(pc_out,4,1'b0,fa_out,);
    INST_MEM inst_mem(pc_out,order);
    assign shift_order={order[25:0],2'b00};
    assign to_mux1={fa_out[31:28],shift_order[27:0]};
    Mux mux1(alu_out,fa_out,zero_flag,to_mux2);
    Mux mux2(to_mux1,to_mux2,Jump,to_pc);
    always @(posedge clk)begin
        pc<=(rst==1'b0)?32'b0:to_pc;   
    end

endmodule
