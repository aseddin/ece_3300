`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 04:15:27 PM
// Design Name: 
// Module Name: mux_generic_1bit_tb
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


module mux_generic_1bit_tb(

    );
    // 1) Declare local reg and wire identifiers
    parameter N = 4;
    reg [N - 1: 0] w;
    reg [$clog2(N) - 1:0] s;
    wire f;
    
    // 2) Instantiate the unit under test
    mux_generic_1bit #(.N(N))uut0(
        .w(w),
        .s(s),
        .f(f)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial #55 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial
    begin
            w = 4'd10;
            
            s = 2'b00;
        #5  s = 2'b01;
        #5  s = 2'b10;
        #5  s = 2'b11;
        #5;
        #5  w = 4'd2;
        #5  w = 4'd4;
        #5  w = 4'd6;
        #5  w = 4'd10;
                
    end
    // 5) Display the output response (text or graphics (or both))
endmodule
