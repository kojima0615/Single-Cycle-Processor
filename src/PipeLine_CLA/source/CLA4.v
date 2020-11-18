`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 16:23:22
// Design Name: 
// Module Name: CLA4
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


module CLA4(a, b, c_in, s, c_out);
    input [3:0]a,b;
    input c_in;
    output [3:0]s;
    output c_out;
    //c[0]=(a[0]&b[0])|((a[0]^b[0])&c_in);
    //c[1]= (a[1] & b[1]) | ( ( a[1] ^ b[1] ) & ( ( a[0] & b[0]) | ( ( a[0] ^ b[0] ) & c_in ) ) ) ;
    //c[2]=( a[2] & b[2]) | ( ( a[2] ^ b[2] )& ((a[1] & b[1]) | ( ( a[1] ^ b[1] ) & ( ( a[0] & b[0]) | ( ( a[0] ^ b[0] ) & c_in ) ) ) ) ;
    assign s[0]=a[0]^b[0]^c_in;
    assign s[1]=a[1]^b[1]^((a[0]&b[0])|((a[0]^b[0])&c_in));
    assign s[2]=a[2]^b[2]^( (a[1] & b[1]) | ( ( a[1] ^ b[1] ) & ( ( a[0] & b[0]) | ( ( a[0] ^ b[0] ) & c_in ) ) ) );
    assign s[3]=a[3]^b[3]^( ( a[2] & b[2]) | ( ( a[2] ^ b[2] )& ((a[1] & b[1]) | ( ( a[1] ^ b[1] ) & ( ( a[0] & b[0]) | ( ( a[0] ^ b[0] ) & c_in ) ) ) ) ) );
    assign c_out=( a[3] & b[3] ) | ( ( a[3] ^ b[3] ) & ( ( a[2] & b[2]) | ( ( a[2] ^ b[2] )& ((a[1] & b[1]) | ( ( a[1] ^ b[1] ) & ( ( a[0] & b[0]) | ( ( a[0] ^ b[0] ) & c_in ) ) ) ) ) ) );
endmodule
