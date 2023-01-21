`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 02:19:37 PM
// Design Name: 
// Module Name: arithmetic_operators
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


module arithmetic_operators
    #(parameter n = 4)
    (
        input [n - 1:0] x,
        input [n - 1:0] y,
        output [n - 1:0] s,
        output cout, overflow
    );
    
    // Simple addition 
    
    // Uncomment what you want to test
    
    // ---------Unsigned numbers------------
    //--------------------------------------
    //assign s = x + y;
    
    // adding carry out
    // many ways to computer the carry out
    
    // concatenating 0 to x and y
    //--------------------------------------
    //wire [n:0] sum;
    //assign sum = {1'b0, x} + {1'b0, y};
    //assign s = sum[n - 1:0];
    //assign cout = sum[n];
    
    // no need to concatenate x and y
    // the operator expands the vector size
    // to the maximum in the statement
    //--------------------------------------
    //wire [n:0] sum;
    //assign sum = x + y;
    //assign s = sum[n - 1:0];
    //assign cout = sum[n];
    
    
    // better yet, we can concatenate on the left-hand side
    //assign {cout, s} = x + y;
    
    
    // ---------Signed numbers------------
    //--------------------------------------
    // We are just interpreting the numbers as signed numbers
    // the circuits and binary patterns are not changed
    //assign s = x + y;
    
    // adding overflow
    //assign overflow = (x[n - 1] & y[n - 1] & ~s[n - 1]) | (~x[n - 1] & ~y[n - 1] & s[n - 1]) ;
                      
    
    // ---------Complete adder/subtractor------------
    //--------------------------------------
    // This implementation computes the carrysyout and overflow, 
    // the interpretation is left to the user
    assign {cout, s} = x + y; // The expansion performed, is signed expansion
    assign overflow = (x[n - 1] & y[n - 1] & ~s[n - 1]) | (~x[n - 1] & ~y[n - 1] & s[n - 1]) ;
    
endmodule
