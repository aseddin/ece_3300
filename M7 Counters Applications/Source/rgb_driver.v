`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 01:41:45 PM
// Design Name: 
// Module Name: rgb_driver
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


module rgb_driver
    #(parameter R = 8) (
    input clk,
    input reset_n,
    input [R:0] red_duty, green_duty, blue_duty,
    output red_LED, green_LED, blue_LED
    
    );
    
    localparam TIMER_BITS = 8;
    localparam FINAL_VALUE = 195; // Controls PWM switching frequency
    
    // RED
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) RED (
        .clk(clk),
        .reset_n(reset_n),
        .duty(red_duty),
        .FINAL_VALUE(FINAL_VALUE),
        .pwm_out(red_LED)
    );
    
    // GREEN
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) GREEN (
        .clk(clk),
        .reset_n(reset_n),
        .duty(green_duty),
        .FINAL_VALUE(FINAL_VALUE),
        .pwm_out(green_LED)
    );
    
    // BLUE
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) BLUE (
        .clk(clk),
        .reset_n(reset_n),
        .duty(blue_duty),
        .FINAL_VALUE(FINAL_VALUE),
        .pwm_out(blue_LED)
    );
endmodule

