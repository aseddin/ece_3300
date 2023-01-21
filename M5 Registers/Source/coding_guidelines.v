`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 01:50:02 AM
// Design Name: 
// Module Name: coding_guidelines
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


module coding_guidelines(
    input a, b, c,
    input clk,
    output reg f, g
    );
    // Style 1
    // Separate memory components (registers) into individual code segments 
//    reg f_reg, f_next, g_reg, g_next;
//    // Registers
//    always @(posedge clk)
//    begin
//        f_reg <= f_next;
//        g_reg <= g_next;
//    end
    
//    // Next state logic (combinational)
//    always @(a, b, c)
//    begin
//        f_next = a & (~g_reg);
//        g_next = b | c;
//    end
    
//    // Output Logic (combinational)
//    assign f = f_reg;
//    assign g = g_reg;
    
    //---------------------------------------------------------
    // Style 2
    // Combine all components into a single always statement
//    always @(posedge clk)
//    begin
//        f <= a & ~g;
//        g <= b | c;
//    end
    
    //---------------------------------------------------------
    // some problems with combining the parts
    
    // Extra registers
//    reg ag, bc;
//    always @(posedge clk)
//    begin
//        ag <= a & ~g;
//        f <= ag;
        
//        bc <= b | c;
//        g <= bc;
//    end
    
    // Fine but ordering matters
//    reg ag, bc;
//    always @(posedge clk)
//    begin
//        ag = a & ~g;
//        f <= ag;
        
//        bc = b | c;
//        g <= bc;
//    end
    
    // Switching the order gives the extra registers again
//    reg ag, bc;
//    always @(posedge clk)
//    begin
//        f <= ag;
//        ag = a & ~g;

//        g <= bc;        
//        bc = b | c;
//    end
endmodule
