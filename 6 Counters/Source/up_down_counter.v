`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 11:06:29 AM
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input up, //when asserted the counter is up counter; otherwise, it is a down counter
    output [BITS - 1:0] Q
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
    always @(Q_reg, up)
    begin
        Q_next = Q_reg;
        if (up)
            Q_next = Q_reg + 1;
        else
            Q_next = Q_reg - 1;
    end
    
    // Output logic
    assign Q = Q_reg;
endmodule
