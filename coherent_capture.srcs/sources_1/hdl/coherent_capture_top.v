`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
 module coherent_capture_top(
//CLK Input
    input clk,
//Push Button Inputs
    input btnC,
    input btnU,
    input btnD,
    input btnR,
    input btnL,
//Switch Inputs
    input [15:0] sw, 
// LED Outputs
    output [15:0] led,
     
//ADC Control Lines
    output sdo_1_p,
    output sdo_1_n,
    output sdo_2_p,
    output sdo_2_n,
    output sck_p,
    output sck_n,
    input clk_out_p,
    input clk_out_n,
    output cnv,
    //Stimulus output
    output stimulus
 );

    wire master_clk;
//    wire sdo_1;
//    wire sdo_2;
//    wire sck;
//    wire clk_out;

    assign led[15:0] = sw[15:0];
    assign sdo_1 = 0;
    assign sdo_2 = 0;
    assign sck = clk_out;
    assign stimulus = master_clk;

     OBUFDS #(
    .IOSTANDARD("DEFAULT")
    ) OBUFDS_inst_sdo_1 (
    .O(sdo_1_p),
    .OB(sdo_1_n),
    .I(sdo_1));

     OBUFDS #(
    .IOSTANDARD("DEFAULT")
    ) OBUFDS_inst_sdo_2 (
    .O(sdo_2_p),
    .OB(sdo_2_n),
    .I(sdo_2));

     OBUFDS #(
    .IOSTANDARD("DEFAULT")
    ) OBUFDS_inst_sck (
    .O(sck_p),
    .OB(sck_n),
    .I(sck));

    IBUFDS #(
    .CAPACITANCE("DONT_CARE"),
    .DIFF_TERM("FALSE"),
    .IBUF_DELAY_VALUE("0"),
    .IFD_DELAY_VALUE("AUTO"),
    .IOSTANDARD("DEFAULT")
    ) IBUFDS_inst_sdo_1 (
    .O(clk_out),
    .I(clk_out_p),
    .IB(clk_out_n));


    design_1_wrapper design_1_wrapper_i
    (.input_clock(clk),
    .internal_clock(master_clk));

always @(*) 
begin


end


endmodule
