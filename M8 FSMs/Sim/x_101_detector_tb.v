`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2021 03:01:20 PM
// Design Name: 
// Module Name: x_101_detector_tb
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


module x_101_detector_tb(

    );
    
    reg clk, reset_n, x;
    wire y_moore, y_mealy;
    
    // Instantiate modules under test
    
    moore_101_detector uut0(
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .y(y_moore)
    );
    
    mealy_101_detector uut1(
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .y(y_mealy)
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
        reset_n = 1'b0;
        x = 1'b0;
        @(negedge clk);
        reset_n = 1'b1;
        
            x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #2  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;        
        #T  $finish;
    end
    
endmodule

