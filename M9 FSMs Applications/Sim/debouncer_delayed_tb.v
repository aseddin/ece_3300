`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 06:09:07 PM
// Design Name: 
// Module Name: debouncer_delayed_tb
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


module debouncer_delayed_tb(

    );    
    reg clk, reset_n;
    reg noisy;
    wire debounced;
    integer i;
    
    // Instantiate unit under test
    debouncer_delayed uut(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .debounced(debounced)
    );

    
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
    
    localparam DELAY = 50_000_000;
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        noisy = 1'b0;
        #2  
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        noisy = 1'b1;
        
        #(DELAY);
        noisy = 1'b0;
        
        #(DELAY);
        
        repeat(20) @(negedge clk);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2);
        noisy = ~noisy;
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
                    
        #(DELAY/2);
        noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 6; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2) noisy = 1'b0;                                                
        #(DELAY) $stop;
        
    end        
    
    
endmodule
