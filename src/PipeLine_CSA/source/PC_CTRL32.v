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


module PC_CTRL32(clk,rst,to_mux1,alu_out,zero_flag,Jump,hazard,order,fa_out);
    input clk,rst,Jump,zero_flag,hazard;
    input [31:0]alu_out,to_mux1;
    output [31:0]order,fa_out;
    reg [31:0]pc=0;//プログラムカウンタ
    wire [31:0]pc_out;
    wire [31:0]fa_out;//4足したもの
    wire [31:0]to_mux2,to_pc;
    wire [27:0]shift_order;
    assign pc_out=pc;
    //Full_Adder32 fa(pc_out,4,fa_out);
    CSA32 csa(pc_out,4,fa_out,);
    INST_MEM inst_mem(pc_out,order);
    Mux mux1(alu_out,fa_out,zero_flag,to_mux2);
    Mux mux2(to_mux1,to_mux2,Jump,to_pc);
    always @(posedge clk)begin
        if(rst==0)
            pc<=32'b0;
        else
            if (hazard==1'b0)begin
                pc<=to_pc;    
            end
    end

endmodule
