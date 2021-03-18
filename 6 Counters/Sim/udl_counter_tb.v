`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 11:39:18 AM
// Design Name: 
// Module Name: udl_counter_tb
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


module udl_counter_tb(

    );
    localparam BITS = 4;
    reg clk, reset_n, enable, up, load;
    reg [BITS - 1:0] D;
    wire [BITS - 1:0] Q;
    
    // Instantiate module under test
    udl_counter #(.BITS(BITS)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .up(up),
        .load(load),
        .D(D),
        .Q(Q)
    );
    
    // timer
    initial
        #450 $stop;
    
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
        load = 1'b0;          
        #2  reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        enable = 1'b1;
        
        wait(Q == 15);
        enable = 1'b0;
        
        repeat(2) @(negedge clk);
        up = 1'b0;
        enable = 1'b1;
        
        repeat(2) @(negedge clk);
        D = 9;
        load = 1'b1;
        
        @(negedge clk);
        load = 1'b0;
        
        wait(Q == 2);
        D = 7;
        load = 1'b1;
        
        repeat(2) @(negedge clk);
        load = 1'b0;
        
        repeat(5) @(negedge clk);
        D = 11;
        up = 1'b1;
        load = 1'b1;
        
        repeat(2) @(negedge clk);
        load = 1'b0;
    end
    
endmodule
