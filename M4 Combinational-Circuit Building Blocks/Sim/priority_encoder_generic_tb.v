`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 05:45:29 PM
// Design Name: 
// Module Name: priority_encoder_generic_tb
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


module priority_encoder_generic_tb(

    );
    // 1) Declare local reg and wire identifiers
    parameter N = 6;
    reg [N - 1:0] w;
    wire z;
    wire [$clog2(N) - 1:0] y;
    integer k;
    
    // 2) Instantiate the unit under test
    priority_encoder_generic #(.N(N))uut0(
        .w(w),
        .z(z),
        .y(y)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial #(10 * 2**N + 10) $finish;
      
    // 4) Generate stimuli, using initial and always
    initial 
    begin
        w = 0;
        for (k = 0; k < 2**N * 2; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule
