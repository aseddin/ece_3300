`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 01:05:11 PM
// Design Name: 
// Module Name: adder_subtractor
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


module adder_subtractor
    #(parameter n = 4) (
    input [n - 1:0] x, y,
    input add_n,
    output [n - 1:0] s,
    output c_out,
    output overflow
    );
    
    // declare different signals
    wire [n - 1: 0] xored_y;
    
    // generate several XOR gates
    generate
        genvar k;
        
        for (k = 0; k < n; k = k + 1)
        begin: bit
            assign xored_y[k] = y[k] ^ add_n;
        end
    endgenerate
    
    // Instantiate an n-bit adder
    rca_nbit #(.n(n)) adder0 (
        .x(x),
        .y(xored_y),
        .c_in(add_n),
        .s(s),
        .c_out(c_out)
    );
    
    // generate an overflow flog by looking the the signes
    // of x, xored_y, s
    // we look at the xored_y because we only care about the adder portion of the circuit
    assign overflow = (x[n - 1] & xored_y[n - 1] & ~s[n - 1]) |
                      (~x[n - 1] & ~xored_y[n - 1] & s[n - 1]);
    
endmodule
