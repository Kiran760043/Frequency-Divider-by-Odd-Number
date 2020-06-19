///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Clock Frequency Divider using Odd number with 50% duty cycle
// Engineer: kiran
// Note: The code is designed for clock frequency divide by 3.
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module Clk_Div_ODD(clk,rst,clk_out);

    parameter N = 3;       //frequency divider number

    input  wire clk;
    input  wire rst;
    output wire clk_out;
    
    wire [0 : $clog2(N)-1]state;
    reg  state_delay;
    
    mod_n COUNTER (.clk(clk), .rst(rst), .out(state));
    
    always@(negedge clk, posedge rst)
        begin
            if(rst)begin
                state_delay <= 0;
            end else begin
                state_delay <= state[0];
            end   
        end
    
    assign clk_out = state[0] || state_delay;

endmodule
