`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 02:55:26 PM
// Design Name: 
// Module Name: swap_reg_file
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


module swap_reg_file
    #(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)(
    input clk, reset_n,
    input we,
    input [ADDR_WIDTH - 1: 0] address_w, address_r,
    input [DATA_WIDTH - 1: 0] data_w,
    output [DATA_WIDTH - 1: 0] data_r,    
    // inputs for swap functionality 
    input [ADDR_WIDTH - 1: 0] address_A, address_B,
    input swap
    );
    
    wire [1:0] sel;
    wire w;
    wire [ADDR_WIDTH - 1:0] MUX_READ_f, MUX_WRITE_f;
    
    reg_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) REG_FILE(
        .clk(clk),
        .we(w? 1'b1: we),
        .address_w(MUX_WRITE_f),
        .address_r(MUX_READ_f),
        .data_w(w? data_r: data_w),
        .data_r(data_r)
    );
    
    swap_fsm FSM0(
        .clk(clk),
        .reset_n(reset_n),
        .swap(swap),
        .w(w),
        .sel(sel)
    );
    
    mux_4x1_nbit #(.N(ADDR_WIDTH)) MUX_READ(
        .w0(address_r),
        .w1(address_A),
        .w2(address_B),
        .w3('b0),
        .s(sel),
        .f(MUX_READ_f)
    );

    mux_4x1_nbit #(.N(ADDR_WIDTH)) MUX_WRITE(
        .w0(address_w),
        .w1('b0),
        .w2(address_A),
        .w3(address_B),
        .s(sel),
        .f(MUX_WRITE_f)
    );
endmodule
