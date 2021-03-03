`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 03:04:55 AM
// Design Name: 
// Module Name: D_FF_set_reset_tb
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


module D_FF_set_reset_tb(

    );
    
    reg clk, D, reset_n, set_n;
    wire Q;
    
    // Instantiate unit under test
    D_FF_set_reset FF0(
        .clk(clk),
        .D(D),
        .reset_n(reset_n),
        .set_n(set_n),
        .Q(Q)
    );
    
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
        reset_n = 1'b1;
        set_n = 1'b1;
        
        @(posedge clk);
        D = 1'b0;
        
        #2 D = 1'b1;       
        #3 D = 1'b0;
        #4 D = 1'b1;
        
        @(negedge clk);
        #3 reset_n = 1'b0;
        #5 reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        #(T / 4)
        reset_n = 1'b0;
        #(T / 2)
        reset_n = 1'b1;
                
        repeat(2) @(negedge clk);
        D = 1'b0;
        @(posedge clk);
        reset_n = 1'b1;
        set_n = 1'b1;
               
        @(negedge clk);
        #3 set_n = 1'b0;
           
        #5 set_n = 1'b1;
        
        repeat(2) @(posedge clk);
        #(T / 4)
        set_n = 1'b0;
        #(T / 2)
        set_n = 1'b1;
        #20 $stop;
    end
endmodule
