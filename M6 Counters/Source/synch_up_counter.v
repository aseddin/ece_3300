`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 06:01:16 AM
// Design Name: 
// Module Name: synch_up_counter
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


module synch_up_counter(
    input clk,
    input reset_n,
    output [3:0] Q
    );
    
    wire Q0_next, Q1_next, Q2_next, Q3_next;
    
    assign Q0_next = 1'b1;
    T_FF FF0(
        .clk(clk),
        .T(Q0_next),
        .reset_n(reset_n),
        .Q(Q[0])
    );
    
    assign Q1_next = Q0_next & Q[0];
    T_FF FF1(
        .clk(clk),
        .T(Q1_next),
        .reset_n(reset_n),
        .Q(Q[1])
    );
    
    assign Q2_next = Q1_next & Q[1];
    T_FF FF2(
        .clk(clk),
        .T(Q2_next),
        .reset_n(reset_n),
        .Q(Q[2])
    );
    
    assign Q3_next = Q2_next & Q[2];
    T_FF FF4(
        .clk(clk),
        .T(Q3_next),
        .reset_n(reset_n),
        .Q(Q[3])
    );    
endmodule
