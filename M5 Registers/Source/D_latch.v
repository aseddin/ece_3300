`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2021 07:58:54 PM
// Design Name: 
// Module Name: D_latch
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


module D_latch(
    input D,
    input clk,
    output reg Q,
    output Q_b
    );
    
    // The Q bar is usually included when necessary
    // It will be excluding it from further code unless necessary
    assign Q_b = ~Q;
    
    always @(clk, D)
    begin
        Q <= Q;
        if (clk)
            Q <= D;
        else
            Q <= Q;        
    end
    
endmodule
