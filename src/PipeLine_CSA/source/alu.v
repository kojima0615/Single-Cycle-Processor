`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 14:31:05
// Design Name: 
// Module Name: alu
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


module Alu(ALUctl,a,b,slt,c_in,c_out,s);
    input a,b,c_in,slt;
    input [3:0]ALUctl;
    output c_out,s;
    function [1:0]out;
        input a,b,c_in,slt;
        input [3:0]ALUctl;
        begin
            case(ALUctl[1:0])
                2'b00:out={a&b,1'b0};
                2'b01:out={a|b,1'b0};
                2'b10:out={a^b^c_in,(a&b)|(b&c_in)|(c_in&a)};
                2'b11:out={slt,1'b0};
                default:out={1'b0,1'b0};
            endcase
        end
    endfunction
    assign {s,c_out}=out(a,b,c_in,slt,ALUctl);
endmodule
