`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 12:08:11 PM
// Design Name: 
// Module Name: ram_3ports
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


module ram_3ports
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)
    (
        input clk,
        input we,
        input [ADDR_WIDTH - 1: 0] r_addr0, r_addr1, // reading addresses
        input [ADDR_WIDTH - 1: 0] w_addr, // writing address
        input [DATA_WIDTH - 1: 0] w_data, // writing data
        output [DATA_WIDTH - 1: 0] r_data0, r_data1 // reading data
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0: 2 ** ADDR_WIDTH - 1];
    
    // write operation
    always @(posedge clk)
    begin
        if (we)
            memory[w_addr] <= w_data;
    end
    
    assign r_data0 = memory[r_addr0];
    assign r_data1 = memory[r_addr1];
    
endmodule
