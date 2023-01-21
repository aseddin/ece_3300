`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 10:15:24 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input x, y, c_in,
    output s, c_out
    );
    
    wire c1, s1, c2;
    
    // Instantiate 2 half-adders
    half_adder HA0 (
        .x(x),
        .y(y),
        .c(c1),
        .s(s1)
    );
    
    half_adder HA1 (
        .x(c_in),
        .y(s1),
        .c(c2),
        .s(s)
    );
    
    // Generate the carry out signal
    assign c_out = c1 | c2;
    
endmodule
