`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 03:33:06 PM
// Design Name: 
// Module Name: adder_subtractor_tb
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


module adder_subtractor_tb(

    );
    
    // 1) Declare local reg and wire identifiers
    parameter n = 4;
    reg signed [n - 1: 0]  x, y;
    reg add_n;
    wire signed [n - 1:0] s;
    wire c_out;
    wire overflow;
    
    // 2) Instantiate the module under test
    adder_subtractor #(.n(n)) uut (
        .x(x),
        .y(y),
        .add_n(add_n),
        .s(s),
        .c_out(c_out),
        .overflow(overflow)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial
        #40 $finish;
        
    // 4) Generate stimuli, using initial and always
    // Basically the test vector generator
    initial
    begin
        // add 2 numbers
        add_n = 1'b0;
        x = 4'd5;
        y = 4'd6;
        
        // subtract numbers
        #10
        add_n = 1'b1;
        
        #10
        x = 4'd6;
        y = -4'd3;
        
        #10
        add_n = 1'b0;
        x = -4'd4;
        y = -4'd5;
        
        #10;
        
    end
    
    
    // 5) Display the output response (text or graphics (or both))
    initial
    begin
        $monitor("time = %3d: x = %d \t y = %d \t add_n = %1b \t result = %3d \t cout = %1b \t overflow = %1b",
                 $time, x, y, add_n, s, c_out, overflow);
    end
endmodule
