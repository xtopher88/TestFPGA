`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2018 11:30:54 PM
// Design Name: 
// Module Name: ltc2323
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


module ltc2323(
    input sys_clock,
    input enable,
    input clkout,
    input sdo1,
    input sdo2,
    output cnv,
    output reg sck,
    output [31:0] data_out
    );
    
    // data output shift registers
    reg [15:0] data1_out;
    reg [15:0] data2_out;
    
    // next shift register values to load
    wire [15:0] next_data1_out;
    wire [15:0] next_data2_out;
    
    // counter to control each cycle max value = 42 (6 bits)
    reg [5:0] counter;
    wire [5:0] next_counter;
    
    // next clock value
    wire sck_next;
    
    // shift the data in the shift registers
    assign next_data1_out[15:1] = data1_out[14:0];
    assign next_data2_out[15:1] = data2_out[14:0];
    
    // shift in the new data bit
    assign next_data1_out[0] = sdo1;
    assign next_data2_out[0] = sdo2;
    
    // assign the data output to be a concatination of the two input shift register
    assign data_out = {data2_out, data1_out};
    
    // use a counter to run each cycle for the CNV, Data Shifting, and output signals, need to count to 0 to 41
    assign next_counter = (counter < 41) ? (counter + 1) : 6'b0;
    
    // if the counter is between 1 and 8 the conversion output is high
    assign cnv = (counter >= 1) && (counter <= 8) ? 1'b1 : 1'b0; 
    
    // run the spi transfer from cycles 10 to 42, 
    assign sck_next = (counter >= 10) ? ~sck : 1'b1; 
    
    // generate the internal counter and SPI clock
    always @(posedge sys_clock)
    begin
    if (enable == 1)
        begin
        counter <= next_counter;
        sck = sck_next;
        end
    else
        begin
        // reset the status of this module when not enabled
        counter <= 1'b0;
        sck <= 1'b1;
        end
    end
    
    // run the spi input shift register
    always @(negedge clkout)
    begin
        data1_out <= next_data1_out;
        data2_out <= next_data2_out;
    end
    
    // need to set the data ready should not be on the first cycle, but should be at the same time as cnv signal
        
endmodule
