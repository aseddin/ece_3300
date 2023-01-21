`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 05:02:56 PM
// Design Name: 
// Module Name: priority_encoder_4x2
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


module priority_encoder_4x2(
    input [3:0] w,
    output z,
    output reg [1:0] y
    );
    
    assign z = |w; // reduction or
    
    always @(w)
    begin
        // if, else-if, else
//        y = 2'bxx;
//        if(w[3])
//            y = 2'b11;
//        else if (w[2])
//            y = 2'b10;  
//        else if (w[1])
//            y = 2'b01;
//        else if (w[0])
//            y = 2'b00; 
//        else
//            y = 2'bxx;       

        casex(w) //case and casez don't work, you need to use casex 
            4'b1xxx: y = 2'b11;
            4'b01xx: y = 2'b10;
            4'b001x: y = 2'b01;
            4'b0001: y = 2'b00;
            default: y = 2'bxx;
        endcase      
    end
endmodule
