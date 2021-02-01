`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2021 08:04:09 PM
// Design Name: 
// Module Name: mux_2x1_dataflow
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


module mux_2x1_dataflow(
    input x1, x2, s,
    output f
    );
    
    assign f = ~s & x1 | s & x2;
endmodule
