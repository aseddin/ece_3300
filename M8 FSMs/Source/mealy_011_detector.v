`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2021 02:42:54 PM
// Design Name: 
// Module Name: mealy_011_detector
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


module mealy_011_detector(
    input clk,
    input reset_n,
    input x,
    output y
    );
    
    reg [1:0] state_reg, state_next;
    
    // State register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= 'b0;
        else
            state_reg <= state_next;
    end
    
    // Next state logic
    always @(*)
    begin
        state_next[1] = ~state_reg[1] & state_reg[0] & x;
        state_next[0] = (~state_reg[1] & ~x) | (~state_reg[0] & ~x);
    end
    
    // Output logic
    assign y = state_reg[1] & ~state_reg[0] & x;
endmodule
