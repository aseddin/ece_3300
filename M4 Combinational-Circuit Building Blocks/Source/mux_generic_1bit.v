`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 02:14:59 PM
// Design Name: 
// Module Name: mux_generic_1bit
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


module mux_generic_1bit
    #(parameter N = 4)(
        input [N - 1: 0] w,
        input [$clog2(N) - 1:0] s,
        output reg f
    );
    
    integer k;

    always @(w, s)
    begin
        f = 'bx;
        for (k = 0; k < N ; k = k + 1)
            if (k == s)
                f = w[k];
    end
    
endmodule
