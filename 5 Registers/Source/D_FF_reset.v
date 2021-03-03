`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 03:25:42 AM
// Design Name: 
// Module Name: D_FF_reset
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


module D_FF_reset(
    input clk,
    input D,
    input reset_n, // asynchronous
    input clear_n, // synchronous
    output Q
    );
    
    reg Q_reg, Q_next;
    
    // Asynchronous reset
    always @(negedge clk, negedge reset_n) 
    begin
        if (!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    // Next state logic
//    always @(D)
//    begin
//        Q_next = D;
//    end
    //-----------------------------------------------
    
    // Adding Synchronous clear
    
    // Next state logic
    always @(D, clear_n)
    begin
        Q_next = Q_reg;
        if(!clear_n)
            Q_next = 1'b0;
        else
            Q_next = D;
    end
    
    
    //-----------------------------------------------

    // Output logic
    assign Q = Q_reg;
endmodule
