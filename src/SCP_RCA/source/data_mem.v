`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/07 11:51:28
// Design Name: 
// Module Name: data_mem
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


module Data_mem(clk,rst,address,write_data,MemWrite,MemRead,read_data);
    input[31:0]address,write_data;
    input MemWrite,MemRead,clk,rst;
    output [31:0]read_data;
    reg [31:0]mem[255:0];//size‚Í‚ ‚Æ‚Å•Ï‚¦‚Ü‚·
    integer i;
    initial begin
            for(i=0;i<=255;i=i+1)begin
                mem[i]=0;
            end
            mem[1]=1;
            mem[2]=1001;
    end
    always @(posedge clk)begin
        if(MemWrite)
            mem[address]<=write_data;
    end
    assign read_data=(MemRead==1'b1)?mem[address]:0;
endmodule
