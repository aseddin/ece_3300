`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 02:17:56 PM
// Design Name: 
// Module Name: timer_input_tb
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


module timer_input_tb(

    );
    localparam BITS = 16;

    reg clk, reset_n, enable;
    reg [BITS - 1:0] FINAL_VALUE;
    wire done;
    
    // Instantiate module under test
    timer_input #(.BITS(BITS)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .FINAL_VALUE(FINAL_VALUE),
        .done(done)
    );
    
    
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
        enable = 1'b1;
        FINAL_VALUE = 255;
        
        #(FINAL_VALUE * T * 3);
        FINAL_VALUE = 49_999;
        
        #(FINAL_VALUE * T * 2);
        $stop;
        
            
    end
    
endmodule
