`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 04:06:12 PM
// Design Name: 
// Module Name: mux_4x1_nbit_tb
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


module mux_4x1_nbit_tb(

    );
    
    // 1) Declare local reg and wire identifiers
    parameter N = 4;
    reg [N - 1: 0] w0, w1, w2, w3;
    reg [1:0] s;
    wire [N - 1: 0] f;
    
    // 2) Instantiate the unit under test
    mux_4x1_nbit #(.N(N))uut0(
        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .s(s),
        .f(f)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial #55 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial
    begin
            w0 = 4'd3;
            w1 = 4'd5;
            w2 = 4'd7;
            w3 = 4'd11;
            
            s = 2'b00;
        #5  s = 2'b01;
        #5  s = 2'b10;
        #5  s = 2'b11;
        #5;
        #5  w0 = 4'd2;
        #5  w1 = 4'd4;
        #5  w2 = 4'd6;
        #5  w3 = 4'd10;
                
    end
    // 5) Display the output response (text or graphics (or both))
endmodule
