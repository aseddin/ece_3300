`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 03:14:42 PM
// Design Name: 
// Module Name: decoder_2x4_en
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


module decoder_2x4(
    input [1:0] w,
    output reg [0:3] y //the lsb has index 3, following the table in slides
    );
    
    // if, else-if, else (Priority Routing Networks)
    // the priority can be flipped by rearranging the if statements
//    always @(w)
//    begin
//        y = 4'b0000;
//        if (w == 2'b00)
//            y[0] = 1'b1; // or y = 4'b1000
//        else if (w == 2'b01)
//            y[1] = 1'b1;
//        else if (w == 2'b10)
//            y[2] = 1'b1;
//        else if (w == 2'b11)
//            y[3] = 1'b1;
//        else
//            y = 4'b0000;                    
//    end


    // case (Multiplexing Networks)
//    always @(w)
//    begin
//        y = 4'b0000;
//        case(w)
//            0: y = 4'b1000; // or y = 4'h8;
//            1: y = 4'b0100;
//            2: y = 4'b0010;
//            3: y = 4'b0001;
//            default: y = 4'b0000;
//        endcase
//    end    

    // procedural assignment
    always @(w)
    begin
        y = 4'b0000;
        y[w] = 1'b1;
    end
endmodule
