`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2021 08:17:49 PM
// Design Name: 
// Module Name: compare_storage_elements_tb
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


module compare_storage_elements_tb(

    );
    
    // Declare local reg and wire
    reg clk, D;
    wire Q_latch, Q_ff_pos, Q_ff_neg;
    
    // Instantiate unit under test
    compare_storage_elements uut(
        .D(D),
        .clk(clk),
        .Qa(Q_latch),
        .Qb(Q_ff_pos),
        .Qc(Q_ff_neg)
    );
    
    // Generate stimuli, using initial and always
    
    // Generating a clk signal
    // Clock period is T nano seconds
    localparam T = 20; //local parameter, is a parameter not visible outside the module
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    // Generating different D value at different times
    initial
    begin
        D = 1'b1;
        
        # (2 * T) //wait for 2T time units 
        D = 1'b0;
        
        @(posedge clk);
        D = 1'b1;
        
        #2 D = 1'b0;       
        #3 D = 1'b1;
        #4 D = 1'b0;
        
        repeat(2) @(negedge clk);
        D = 1'b1;
        
        #20 $stop;
    end
    
    
    
    
endmodule
