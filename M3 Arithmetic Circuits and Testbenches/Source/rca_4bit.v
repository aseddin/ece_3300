`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 10:37:47 AM
// Design Name: 
// Module Name: rca_4bit
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


module rca_4bit(
    input [3:0] x, y,
    input c_in,
    output [3:0] s,
    output c_out
    );
    
    // declare different signals
    wire [3:1] c;
    
    // Instantiate 4 full adders
    full_adder FA0 (
        .x(x[0]),
        .y(y[0]),
        .c_in(c_in),
        .s(s[0]),
        .c_out(c[1])
    );
    full_adder FA1 (
        .x(x[1]),
        .y(y[1]),
        .c_in(c[1]),
        .s(s[1]),
        .c_out(c[2])
    );
    full_adder FA2 (
        .x(x[2]),
        .y(y[2]),
        .c_in(c[2]),
        .s(s[2]),
        .c_out(c[3])
    );
    full_adder FA3 (
        .x(x[3]),
        .y(y[3]),
        .c_in(c[3]),
        .s(s[3]),
        .c_out(c_out)
    );            
endmodule
