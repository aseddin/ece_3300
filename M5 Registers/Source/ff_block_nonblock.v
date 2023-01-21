`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 12:01:50 PM
// Design Name: 
// Module Name: ff_block_nonblock
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


module ff_block_nonblock(
    input D, clk,
    output reg Q1, Q2
    );
    
    // Blocking assignment
//    always @(posedge clk)
//    begin
//        Q1 = D;
//        Q2 = Q1;
//    end
    
    // Change the order of blocking assignment
    // to get the cascading flip-flops
//    always @(posedge clk)
//    begin
//        Q2 = Q1;
//        Q1 = D;
//    end

    // Nonblocking assignment
//    always @(posedge clk)
//    begin
//        Q1 <= D;
//        Q2 <= Q1;
//    end
    
    // Change the order of nonblocking assignment
    // doesn't have any effect now
    always @(posedge clk)
    begin
        Q2 <= Q1;
        Q1 <= D;
    end
endmodule
