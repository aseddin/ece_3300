`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 12:01:56 PM
// Design Name: 
// Module Name: button_test_circuit
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


module button_test_circuit(
    input clk,
    input reset_n,
    input button_in,
    output [7:0] AN,
    output [6:0] sseg,
    output DP
    );
        
    // Button with debouncer and positive edge detector
    wire debounced_tick;
    wire [3:0] Q_debounced;
    
    button DEBOUNCED_BUTTON (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(button_in),
        .debounced(),
        .p_edge(debounced_tick),
        .n_edge(),
        ._edge()
    );
    
    udl_counter #(.BITS(4)) DEBOUNCED_BUTTON_COUNTER (
        .clk(clk),
        .reset_n(reset_n),
        .enable(debounced_tick),
        .up(1'b1),
        .load(),
        .D(),
        .Q(Q_debounced)
    );
    
    // Button without debouncer (noisy) and with positive edge detector
    wire noisy_tick;
    wire [3:0] Q_noisy;

    edge_detector NOISY_EDGE(
        .clk(clk),
        .reset_n(reset_n),
        .level(button_in),
        .p_edge(noisy_tick),
        .n_edge(),
        ._edge()
    );
    udl_counter #(.BITS(4)) NOISY_BUTTON_COUNTER (
        .clk(clk),
        .reset_n(reset_n),
        .enable(noisy_tick),
        .up(1'b1),
        .load(),
        .D(),
        .Q(Q_noisy)
    );
    
    // Seven-Segment Display of both counters
    sseg_driver DRIVER(
        .clk(clk),
        .reset_n(reset_n),
        .I0({1'b1, Q_noisy, 1'b0}),
        .I1(6'b000_000),
        .I2(6'b000_000),
        .I3(6'b000_000),
        .I4({1'b1, Q_debounced, 1'b0}),
        .I5(6'b000_000),
        .I6(6'b000_000),
        .I7(6'b000_000),
        .AN(AN),
        .sseg(sseg),
        .DP(DP)

    );
endmodule
