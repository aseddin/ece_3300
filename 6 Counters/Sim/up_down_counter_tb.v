`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 11:32:09 AM
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb(

    );
    localparam BITS = 4;
    reg clk, reset_n, enable, up;
    wire [BITS - 1:0] Q;
    
    // Instantiate module under test
    up_down_counter uut (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .up(up),
        .Q(Q)
    );
    
    // timer
    initial
        #400 $stop;
    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        enable = 1'b0;
        up = 1'b1;            
        #2  reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        enable = 1'b1;
        
        wait(Q == 15);
        enable = 1'b0;
        
        repeat(2) @(negedge clk);
        up = 1'b0;
        enable = 1'b1;
        
        
    end
    
endmodule