`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 05:57:28 PM
// Design Name: 
// Module Name: multi_decade_counter_tb
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


module multi_decade_counter_tb(

    );
    
    reg clk, reset_n, enable;
    wire done;
    wire [3:0] ones, tens, hundreds;
    
    // Instantiate module under test
    multi_decade_counter uut(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .done(done),
        .ones(ones),
        .tens(tens),
        .hundreds(hundreds)
    );
    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 4;
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
        #2
        enable = 1'b1;
        
        repeat(115) @(negedge clk);
        #20 $stop;
            
    end
    
endmodule
