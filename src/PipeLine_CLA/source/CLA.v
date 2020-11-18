`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/15 20:19:05
// Design Name: 
// Module Name: CLA
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

(* DONT_TOUCH = "yes" *)module CLA(ALUctl,a,b,c_in,set,s,g,t);
    input a, b, c_in, set;
    input [1:0]ALUctl;
    output s, g, t;
    assign g=a & b;
    assign t=a | b;
    assign ss = a ^ b ^ c_in;
    function out;
        input [1:0]ALUctl;
        input g,t,ss,set;
            case(ALUctl)
                2'b00:out=g;
                2'b01:out=t;
                2'b10:out=ss;
                2'b11:out=set;
                default:out=0;
            endcase
    endfunction
   //assign c_out=(a&b)|(a&c_in)|((b&c_in));
   assign s=out(ALUctl,g,t,ss,set);
endmodule
