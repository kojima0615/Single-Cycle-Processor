`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 19:53:31
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(clk,res,pc_in,order_in,flag,pc_out,order_out);
    input clk,res,flag;
    input [31:0]pc_in,order_in;
    output reg[31:0]pc_out,order_out;
    always @(posedge clk)begin
        if(flag==1'b0)begin
            pc_out<=(res==1'b0)?0:pc_in;
            order_out<=(res==1'b0)?0:order_in;
        end
    end
endmodule
