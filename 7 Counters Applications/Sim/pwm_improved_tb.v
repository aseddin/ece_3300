`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 12:27:58 PM
// Design Name: 
// Module Name: pwm_improved_tb
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


module pwm_improved_tb(

    );
    localparam R = 8;
    localparam TIMER_BITS = 8;
    
    reg clk, reset_n;
    reg [R:0] duty;
    reg [TIMER_BITS - 1:0] FINAL_VALUE;
    wire pwm_out;

    // Instantiate module under test    
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .duty(duty),
        .FINAL_VALUE(FINAL_VALUE),
        .pwm_out(pwm_out)
    );
    
    // timer
    initial
        #(7 * 2**R * T * 200) $stop;
    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2  
        reset_n = 1'b1;
        duty = 0.25 * (2**R);
        FINAL_VALUE = 8'd194;
        
        repeat(2 * 2**R * FINAL_VALUE) @(negedge clk);
        duty = 0.50 * (2**R);

        repeat(2 * 2**R * FINAL_VALUE) @(negedge clk);
        duty = 0.75 * (2**R);
            
    end    
    
    
endmodule