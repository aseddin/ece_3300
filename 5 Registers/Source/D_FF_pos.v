`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2021 07:58:54 PM
// Design Name: 
// Module Name: D_FF_pos
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


module D_FF_pos(
    input D,
    input clk,
    output reg Q
    );
    
    always @(posedge clk)
    begin
        Q <= D;
    end
endmodule
