`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 02:12:34 PM
// Design Name: 
// Module Name: mux_4x1_nbit
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


module mux_4x1_nbit 
    #(parameter N = 3)(
    input [N - 1:0]w0, w1, w2, w3,
    input [1:0] s,
    output reg [N - 1:0] f
    );
    
    always @(w0, w1, w2, w3, s)
    begin
        // default values
        f = 'bx;                 
        case(s)
            2'b00: f = w0;
            2'b01: f = w1;
            2'b10: f = w2;
            2'b11: f = w3;           
            default: f = 'bx;
        endcase              
    end
endmodule