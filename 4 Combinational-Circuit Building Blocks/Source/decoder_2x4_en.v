`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 03:14:42 PM
// Design Name: 
// Module Name: decoder_2x4_en
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


module decoder_2x4_en(
    input [1:0] w,
    input en,
    output reg [0:3] y //the lsb has index 3, following the table in slides
    );
    
    always @(w, en)
    begin
        y = 4'b0000;
        if(en) // will implement a 2x1 MUX
            y[w] = 1'b1;
        else
            y = 4'b0000;
            
              
    end
endmodule
