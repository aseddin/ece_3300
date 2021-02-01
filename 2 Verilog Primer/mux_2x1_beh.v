`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2021 09:56:45 PM
// Design Name: 
// Module Name: mux_2x1_beh
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


module mux_2x1_beh(
    input x1,
    input x2,
    input s,
    output reg f
    );
        
    
    always @(x1, x2, s)
    begin
    
        /*
        if (s)
        begin
            f = x2;
        end
        else
        begin
            f = x1;
        end
        */
        
        case(s)
            1: f = x2;
            0: f = x1;
        endcase
    end
    

    
endmodule
