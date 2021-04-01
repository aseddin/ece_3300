`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 05:54:56 PM
// Design Name: 
// Module Name: debouncer_delayed_fsm
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


module debouncer_delayed_fsm(
    input clk, reset_n,
    input noisy, timer_done,
    output timer_reset, debounced
    );
    
    reg [1:0] state_reg, state_next;
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    
    // Sequential state register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= 0;
        else
            state_reg <= state_next;
    end
    
    // Next state logic
    always @(*)
    begin
        state_next = state_reg;
        case(state_reg)
            s0: if (~noisy)
                    state_next = s0;
                else if (noisy)
                    state_next = s1;
            s1: if (~noisy)
                    state_next = s0;
                else if (noisy & ~timer_done)
                    state_next = s1;
                else if (noisy & timer_done)
                    state_next = s2;
            s2: if (~noisy)
                    state_next = s3;
                else if (noisy)
                    state_next = s2;
            s3: if (noisy)
                    state_next = s2;
                else if (~noisy & ~timer_done)
                    state_next = s3;
                else if (~noisy & timer_done)
                    state_next = s0;
            default: state_next = s0;                                             
        endcase
    end
    
    // output logic
    assign timer_reset = (state_reg == s0) | (state_reg == s2);
    assign debounced = (state_reg == s2) | (state_reg == s3);
    
endmodule
