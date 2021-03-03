`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 09:07:56 PM
// Design Name: 
// Module Name: shift_register_load
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


module shift_register_load
    #(parameter N = 4)(
        input clk,
        input  SI,
        input [N - 1:0] I,
        input load,
        input reset_n,
        output [N - 1:0] Q, //If we care about the content
        output SO        
    );
    
    reg [N - 1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (!reset_n)
            Q_reg <= 0;
        else        
            Q_reg <= Q_next;
    end
    
    // Next state logic
    always @(Q_reg, SI, I)
    begin
        Q_next = Q_reg;
        if (load)
            Q_next = I;
        else
            // Right shift
            Q_next = {SI, Q_reg[N - 1: 1]};
    end
    
    // output logic
    assign SO = Q_reg[0];
    assign Q = Q_reg;
    
endmodule
