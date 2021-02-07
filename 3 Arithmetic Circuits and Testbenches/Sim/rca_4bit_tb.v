`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 10:44:25 AM
// Design Name: 
// Module Name: rca_4bit_tb
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


module rca_4bit_tb(

    ); 
    
    // 1) Declare local reg and wire identifiers
    reg [3:0] x, y;
    reg c_in;
    wire [3:0] s;
    wire c_out;
   
    // 2) Instantiate the unit under test
    rca_4bit uut0 (
        .x(x),
        .y(y),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );
   
    // 3) Specify a stopwatch to stop the simulation
    initial #30 $finish;
      
    // 4) Generate stimuli, using initial and always
    initial
    begin
        x = 4'b1110;
        y = 4'b1010;
        c_in = 1'b0;
        
        #10
        
        x = 4'b0111;
        y = 4'b0011;
        c_in = 1'b0;
        
        #10
        
        x = 4'b0111;
        y = 4'b0011;
        c_in = 1'b1;
        
                
    end
    // 5) Display the output response (text or graphics (or both)) 
endmodule
