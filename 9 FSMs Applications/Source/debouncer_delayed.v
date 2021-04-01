`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 05:53:30 PM
// Design Name: 
// Module Name: debouncer_delayed
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


module debouncer_delayed(
    input clk, reset_n,
    input noisy,
    output debounced
    );
    
    wire timer_done, timer_reset;
    
    debouncer_delayed_fsm FSM0(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .timer_done(timer_done),
        .timer_reset(timer_reset),
        .debounced(debounced)
    );
    
    // 20 ms timer
    timer_parameter #(.FINAL_VALUE(1_999_999)) T0(
        .clk(clk),
        .reset_n(~timer_reset),
        .enable(~timer_reset),
        .done(timer_done)
    );
endmodule
