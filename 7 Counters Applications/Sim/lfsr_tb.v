`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:33:35 PM
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb(

    );
    
    localparam N = 3;
    reg clk, reset_n;
    wire [1:N] Q;
    
    // Instantuate unit under test
    lfsr #(.N(N)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );
    

    
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
        #2  
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        wait (Q == 1);
        
        #20 $stop;
    end
    
endmodule
