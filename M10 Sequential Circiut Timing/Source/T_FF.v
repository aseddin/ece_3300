`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2021 12:10:28 PM
// Design Name: 
// Module Name: T_FF
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


module T_FF(
    input clk,
    input T,
    input reset_n,
    output Q
    );
    
    localparam C2Q_DELAY = 2; // For simulation only 
//    localparam C2Q_DELAY = 6; // For simulation only 
    
    reg Q_reg;
    wire Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 1'b0;
        else
            #C2Q_DELAY Q_reg <= Q_next;
    end
    
    // Next State Logic
    assign Q_next = T ? ~Q_reg: Q_reg;
    
    // Output logic
    assign Q = Q_reg;
endmodule
