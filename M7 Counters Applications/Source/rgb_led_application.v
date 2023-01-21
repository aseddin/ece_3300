`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 01:42:49 PM
// Design Name: 
// Module Name: rgb_led_application
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


module rgb_led_application
    #(parameter R = 8)
    (
    input clk,
    input reset_n,
    input change_color,
    input [R:0] color_intensity,
    input [1:0] color_selector,
    output red_LED, green_LED, blue_LED,
    output red_JA
    );
    
    reg [R:0] R_reg, R_next, G_reg, G_next, B_reg, B_next;
    
    // Color intensity registers
    // to store the values of the RGB intensities
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
        begin
            R_reg <= 'b0;
            G_reg <= 'b0;
            B_reg <= 'b0;
        end
        else if (change_color)
        begin
            R_reg <= R_next;
            G_reg <= G_next;
            B_reg <= B_next;           
        end
        else
        begin
            R_reg <= R_reg;
            G_reg <= G_reg;
            B_reg <= B_reg;   
        end
    end
    
    // Next state logic
    always @(*)
    begin
        R_next = R_reg;
        G_next = G_reg;
        B_next = B_reg;
        case(color_selector)
            2'b00: R_next = color_intensity;
            2'b01: G_next = color_intensity;
            2'b10: B_next = color_intensity;               
            default:
            begin
                R_next = R_reg;
                G_next = G_reg;
                B_next = B_reg;
            end                                               
        endcase
    end
    
    // RGB driver to generate appropriate PWM signals
    rgb_driver #(.R(R)) LED16 (
        .clk(clk),
        .reset_n(reset_n),
        .red_duty(R_reg),
        .green_duty(G_reg),
        .blue_duty(B_reg),
        .red_LED(red_LED),
        .green_LED(green_LED),
        .blue_LED(blue_LED)
    );
    
    // Output the RED PWM signal to JA1
    assign red_JA = red_LED;
    
endmodule
