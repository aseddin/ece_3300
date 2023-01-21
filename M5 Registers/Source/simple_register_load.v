`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 08:49:46 PM
// Design Name: 
// Module Name: simple_register_load
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


module simple_register_load
    #(parameter N = 4)(
        input clk,
        input load,
        input [N - 1:0] I,
        output [N - 1:0] Q        
    );
    
    reg [N - 1:0] Q_reg, Q_next;
    
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // Next State logic
    always @(load, I, Q_reg)
    begin
        if (load)
            Q_next = I;
        else
            Q_next = Q_reg;
    end
    
    // Output logic
    assign Q = Q_reg;
endmodule
