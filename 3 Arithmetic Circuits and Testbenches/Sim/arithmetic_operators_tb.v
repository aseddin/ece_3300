`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 02:25:00 PM
// Design Name: 
// Module Name: arithmetic_operators_tb
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


module arithmetic_operators_tb(

    );
    // 1) Declare local reg and wire identifiers
    parameter n = 4;
    reg [n - 1:0] x, y;
    wire [n - 1:0] s;
    wire cout, overflow;
   
    // 2) Instantiate the unit under test
    arithmetic_operators uut0 (
        .x(x),
        .y(y),
        .s(s),
        .cout(cout),
        .overflow(overflow)
    );
   
    // 3) Specify a stopwatch to stop the simulation
    initial #40 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial
    begin
        x = 4'd6;
        y = 4'd3;
        
        #10
        
        x = -4'd6;
        y = 4'd3;
        
        #10
        
        x = 4'd6;
        y = -4'd3;
        
        #10
        
        x = -4'd6;
        y = -4'd3;
        
        #10 ;
                
                
    end
    // 5) Display the output response (text or graphics (or both)) 

endmodule
