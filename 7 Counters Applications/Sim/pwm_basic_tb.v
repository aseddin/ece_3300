`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 02:45:57 PM
// Design Name: 
// Module Name: pwm_basic_tb
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


module pwm_basic_tb(

    );
    localparam R = 8;
    
    reg clk, reset_n;
    reg [R - 1:0] duty;
    wire pwm_out;

    // Instantiate module under test    
    pwm_basic #(.R(R)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .duty(duty),
        .pwm_out(pwm_out)
    );
    
    // timer
    initial
        #(7 * 2**R * T) $stop;
    
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
        
        repeat(2 * 2**R) @(negedge clk);
        duty = 0.50 * (2**R);

        repeat(2 * 2**R) @(negedge clk);
        duty = 0.75 * (2**R);
            
    end    
    
    
endmodule
