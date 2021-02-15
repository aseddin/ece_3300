`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 02:12:34 PM
// Design Name: 
// Module Name: mux_4x1_nbit
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


module mux_4x1_nbit
    #(parameter N = 3) (
    input [N - 1: 0] w0, w1, w2, w3,
    input [1:0] s,
    output reg [N - 1: 0] f
    );
    
    // Dataflow modeling 
    //-------------------------------------------------------------------
    
    // This works but it's not elegant and hard to understand
//    assign f =  ~s[1] & ~s[0]? w0:
//                ~s[1] & s[0]?  w1:
//                s[1] & ~s[0]?  w2:
//                s[1] & s[0]? w3: 'bx;
                
    // another way to write the above continous assignment
//    assign f = s[1]? (s[0]? w3: w2):(s[0]? w1: w0);   
             
    // Behavioral modeling                
    //-------------------------------------------------------------------
    
    // if, else-if, else (Priority Routing Networks)
//    always @(w0, w1, w2, w3, s)
//    begin
//        if (s == 2'b00)
//            f = w0;
//        else if (s == 2'b01) // this can be s == 1 (decimal)
//            f = w1;
//        else if (s == 2'b10)
//            f = w2;
//        else if (s == 2'b11)
//            f = w3; 
//        else
//            f = 'bx;               
//    end

    // w3 has highest priority below
//    always @(w0, w1, w2, w3, s)
//    begin
//        if (s == 2'b11)
//            f = w3;
//        else if (s == 2'b10) // this can be s == 1 (decimal)
//            f = w2;
//        else if (s == 2'b11)
//            f = w1;
//        else if (s == 2'b00)
//            f = w0; 
//        else
//            f = 'bx;               
//    end    
    
    // case (Multiplexing Networks)
    always @(w0, w1, w2, w3, s)
    begin
        case(s)
            2'b00: f = w0;
            2'b01: f = w1;
            2'b10: f = w2;
            2'b11: f = w3;
            default: f = 'bx;
        endcase
    end
    
endmodule
