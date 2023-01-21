`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 04:02:32 PM
// Design Name: 
// Module Name: decoder_2x4_tb
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


module decoder_2x4_tb(

    );
    
    // 1) Declare local reg and wire identifiers
    reg [1:0] w;
    wire [0:3] y;
    
    // 2) Instantiate the unit under test
    decoder_2x4 uut0(
        .w(w),
        .y(y)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial #30 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial
    begin
        #5 w = 2'b00;
        #5 w = 2'b01;
        #5 w = 2'b10;
        #5 w = 2'b11;
        #5;
    end
    // 5) Display the output response (text or graphics (or both))
endmodule
