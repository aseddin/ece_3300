`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 03:25:33 PM
// Design Name: 
// Module Name: swap_reg_file_tb
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


module swap_reg_file_tb(

    );
    
    localparam ADDR_WIDTH = 7;
    localparam DATA_WIDTH = 8;
    reg clk, reset_n;
    reg we;
    reg [ADDR_WIDTH - 1: 0] address_w, address_r;
    reg [DATA_WIDTH - 1: 0] data_w;
    wire [DATA_WIDTH - 1: 0] data_r;    
    reg [ADDR_WIDTH - 1: 0] address_A, address_B;
    reg swap;
    integer i;
    
    // Instantiate unit under test
    swap_reg_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) uut(
        .clk(clk),
        .reset_n(reset_n),
        .we(we),
        .address_w(address_w),
        .address_r(address_r),
        .data_w(data_w),
        .data_r(data_r),
        .address_A(address_A),
        .address_B(address_B),
        .swap(swap)
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
        swap = 1'b0;

    
        // fill locations 20 to 30 with some numbers
        for (i = 20; i < 30; i = i + 1)
        begin
            @(negedge clk);
            address_w = i;
            data_w = i;
            we = 1'b1;            
        end
        
        we = 1'b0;
        
        // Swap 2 locations several times
        @(negedge clk)
        address_A = 'd22;
        address_B = 'd28;
        swap = 1'b1;
        repeat(3) @(negedge clk);
        swap = 1'b0;
        
        #25 $stop;
        
        
    end    
    
endmodule
