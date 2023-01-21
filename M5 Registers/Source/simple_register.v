`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 08:35:58 PM
// Design Name: 
// Module Name: simple_register
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


module simple_register
    #(parameter N = 4)(
        input clk,
        input [N - 1:0] I,
        output [N - 1:0] Q        
    );
    
    // Structurall description
//    genvar k;
    
//    generate
//        for (k = 0; k < N; k = k + 1)
//        begin: FF
//            D_FF_reset(
//                .clk(clk),
//                .D(I[k]),
//                .reset_n(),
//                .clear_n(),
//                .Q(Q[k])
//            );
//        end
//    endgenerate
    
    // Behavioral description
    reg [N - 1:0] Q_reg, Q_next;
    
    always @(posedge clk)
    begin
        // asynch reset can go here
        Q_reg <= Q_next;
    end
    
    always @(I)
    begin
        Q_next = I;
    end
    
    assign Q = Q_reg;
    
endmodule
