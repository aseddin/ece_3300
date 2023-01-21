`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 04:27:06 PM
// Design Name: 
// Module Name: decoder_generic_tb
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


module decoder_generic_tb(

    );
    // 1) Declare local reg and wire identifiers
    parameter N = 4;
    reg [N - 1:0] w;
    reg en;
    wire [0:2 ** N - 1] y;
    integer k;
    
    // 2) Instantiate the unit under test
    decoder_generic #(.N(N)) uut0(
        .w(w),
        .en(en),
        .y(y)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    initial #155 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial
    begin
        en = 1'b0;
    end    
    
    always 
    begin
        #5 en = ~en;
        w = 0;
        for (k = 0; k < 2 ** N; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule
