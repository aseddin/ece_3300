`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 04:59:09 PM
// Design Name: 
// Module Name: mod_counter_input_tb
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


module mod_counter_input_tb(

    );
    localparam BITS = 4;
    reg clk, reset_n, enable;
    reg [BITS - 1:0] FINAL_VALUE;
    wire [BITS - 1:0] Q;
    
    // Instantiate module under test
    mod_counter_input #(.BITS(BITS))uut (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .FINAL_VALUE(FINAL_VALUE),
        .Q(Q)
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
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2
        reset_n = 1'b1;
        #2
        enable = 1'b1;
        FINAL_VALUE = 'd5;
        
        repeat(FINAL_VALUE + 3) @(negedge clk);
        FINAL_VALUE = 'd7;
        
        repeat(FINAL_VALUE + 3) @(negedge clk);
        FINAL_VALUE = 'd11;
        
        repeat(FINAL_VALUE + 3) @(negedge clk);
        #20 $stop;
            
    end
    
endmodule