`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2021 10:30:28 PM
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
    input x0, x1, x2, x3,
    input s0, s1,
    output f
    );
    
    wire g0, g1;
    
    mux_2x1_beh M3 (
        .x1(g0),
        .x2(g1),
        .s(s1),
        .f(f)
    );
    
    mux_2x1_gate M0 (x0, x1, s0, g0);
    
    mux_2x1_dataflow M1 (
        .f(g1),
        .x1(x2),
        .s(s0),
        .x2(x3)
    );
    

    
endmodule
