`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 11:11:43 AM
// Design Name: 
// Module Name: button
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


module button(
    input clk, reset_n,
    input noisy,
    output debounced,
    output p_edge, n_edge, _edge
    );
    
    synchronizer #(.STAGES(2))SYNCH0(
        .clk(clk),
        .reset_n(reset_n),
        .D(noisy),
        .Q(synch_noisy)
    );
    
    debouncer_delayed DD0(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(synch_noisy),
        .debounced(debounced)
    );
    
    edge_detector ED0(
        .clk(clk),
        .reset_n(reset_n),
        .level(debounced),
        .p_edge(p_edge),
        .n_edge(n_edge),
        ._edge(_edge)
    );
    
endmodule
