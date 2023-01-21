`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 02:12:34 PM
// Design Name: 
// Module Name: mux_2x1_nbit
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


module mux_2x1_nbit
    #(parameter N = 3)(
    input [N - 1: 0] w0, w1,
    input s,
    output [N - 1: 0] f
    );
    
    assign f = s ? w0 : w1;
endmodule
