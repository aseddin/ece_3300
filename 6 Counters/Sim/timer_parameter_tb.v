`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 01:48:02 PM
// Design Name: 
// Module Name: timer_parameter_tb
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


module timer_parameter_tb(

    );
    localparam FINAL_VALUE = 49_999;
    localparam BITS = $clog2(FINAL_VALUE);

    reg clk, reset_n, enable;
    wire done;
    
    // Instantiate module under test
    timer_parameter #(.FINAL_VALUE(FINAL_VALUE)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .done(done)
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
    
    initial #(FINAL_VALUE * T * 3) $stop;
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2
        reset_n = 1'b1;
        enable = 1'b1;
        
            
    end
    
endmodule