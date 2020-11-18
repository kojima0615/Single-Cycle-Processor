`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 12:56:46
// Design Name: 
// Module Name: register
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


module Register(clk,rst,read_reg1,read_reg2,write_reg,write_data,RegWrite,read_data1,read_data2);
    input [4:0]read_reg1,read_reg2,write_reg;
    input [31:0]write_data;
    input RegWrite,clk,rst;//書き込みのトリガーにクロックを使う
    output [31:0]read_data1,read_data2;
    reg [31:0] reg_file[31:0];
    wire [4:0]write_reg;
    assign read_data1=reg_file[read_reg1];
    assign read_data2=reg_file[read_reg2];
    integer i;
    initial begin
            for(i=0;i<=31;i=i+1)begin
                reg_file[i]=0;
            end
    end
    always @(posedge clk)begin
        if(RegWrite==1'b1)
            reg_file[write_reg]=write_data;
        end
endmodule