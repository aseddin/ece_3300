`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 02:17:39 PM
// Design Name: 
// Module Name: timer_input
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


module timer_input
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input [BITS - 1:0] FINAL_VALUE,
//    output [BITS - 1:0] Q,
    output done
    );
    
    reg [BITS - 1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;
    end
    
    // Next state logic
    assign done = Q_reg == FINAL_VALUE;

    always @(*)
        Q_next = done? 'b0: Q_reg + 1;
    
    
endmodule
