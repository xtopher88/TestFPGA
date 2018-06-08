`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2018 11:27:24 PM
// Design Name: 
// Module Name: stimulus
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


module stimulus(
    input clk,
    input enable,
    output stimulus
    );
// clock input is at 5 MHz    
// divide this by 2048
// output 0 if enable is set
    reg [11:0] counter;
    wire [11:0] counter_next;
    
    assign stimulus = counter[11];
    assign counter_next = counter + 1;

    always @(posedge clk)
    begin
    if (enable == 1)
        counter <= counter_next;
    else
        counter <= 12'b0;
    end
    
endmodule
