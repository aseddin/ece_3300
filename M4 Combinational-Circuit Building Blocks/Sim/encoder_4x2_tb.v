`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 05:12:09 PM
// Design Name: 
// Module Name: encoder_4x2_tb
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


module encoder_4x2_tb(

    );
    // 1) Declare local reg and wire identifiers
    reg [3:0] w;
    wire [1:0] y;
    integer k;
    
    // 2) Instantiate the unit under test
    encoder_4x2 uut0(
        .w(w),
        .y(y)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial #170 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial 
    begin
        w = 0;
        for (k = 0; k < 32; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule