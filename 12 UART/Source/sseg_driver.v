`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 11:27:03 AM
// Design Name: 
// Module Name: sseg_driver
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


module sseg_driver(
    input clk, reset_n,
    input [5:0] I0, I1, I2, I3, I4, I5, I6, I7,
    output [7:0] AN,
    output [6:0] sseg,
    output DP
    );
    
    wire timer_tick;
    wire [2:0] sel;
    wire [5:0] D_out;
    wire [7:0] AN_n;
    
    udl_counter #(.BITS(3)) UP_COUNTER0(
        .clk(clk),
        .reset_n(reset_n),
        .enable(timer_tick),
        .up(1'b1),
        .load(1'b0),
        .D(),
        .Q(sel)        
    );
    
    timer_parameter #(.FINAL_VALUE(104_165)) TIMER0(
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .done(timer_tick)        
    );
    
    decoder_generic #(.N(3))DECODER0(
        .w(sel),
        .en(D_out[5]),
        .y(AN_n)
    );
    
    assign AN = ~AN_n;
    
    mux_8x1_nbit #(.N(6)) MUX8X1(
        .w0(I0),
        .w1(I1),
        .w2(I2),
        .w3(I3),
        .w4(I4),
        .w5(I5),
        .w6(I6),
        .w7(I7),
        .s(sel),
        .f(D_out)        
    );
    
    hex2sseg HEXDECODER(
        .hex(D_out[4:1]),
        .sseg(sseg)
    );
    
    assign DP = ~D_out[0];
endmodule
