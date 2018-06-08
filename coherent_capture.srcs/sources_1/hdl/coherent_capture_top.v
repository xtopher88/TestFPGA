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
    input sdo_1_p,
    input sdo_1_n,
    input sdo_2_p,
    input sdo_2_n,
    output sck_p,
    output sck_n,
    input clk_out_p,
    input clk_out_n,
    output cnv,
    //Stimulus output
    output stimulus
 );

    wire master_clk;
    wire enable = sw[0];
    
    assign led[15:0] = sw[15:0];

    IBUFDS #(
    .CAPACITANCE("DONT_CARE"),
    .DIFF_TERM("FALSE"),
    .IBUF_DELAY_VALUE("0"),
    .IFD_DELAY_VALUE("AUTO"),
    .IOSTANDARD("DEFAULT")
    ) IBUFDS_inst_sdo_1 (
    .O(sdo_1),
    .I(sdo_1_p),
    .IB(sdo_1_n));


    IBUFDS #(
    .CAPACITANCE("DONT_CARE"),
    .DIFF_TERM("FALSE"),
    .IBUF_DELAY_VALUE("0"),
    .IFD_DELAY_VALUE("AUTO"),
    .IOSTANDARD("DEFAULT")
    ) IBUFDS_inst_sdo_2 (
    .O(sdo_2),
    .I(sdo_2_p),
    .IB(sdo_2_n));

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
    ) IBUFDS_inst_clk_out (
    .O(clk_out),
    .I(clk_out_p),
    .IB(clk_out_n));

// ADC interface
    ltc2323 adc_inst(
    .sys_clock(master_clk),
    .enable(enable),
    .clkout(clk_out),
    .sdo1(sdo_1),
    .sdo2(sdo_2),
    .cnv(cnv),
    .sck(sck),
    .data_out()
    //output reg [12:0] data_address,
    );
    
// the ADC conversion signal is running at 5MHz, this is the signal that the stimulus will be synchronized to
    stimulus stimulus_signal(
    .clk(cnv),
    .enable(enable),
    .stimulus(stimulus)
    );

// the GUI design will have the clock and memory interface
    design_1_wrapper design_1_wrapper_i
    (.input_clock(clk),
    .internal_clock(master_clk));
    
    

always @(*) 
begin


end


endmodule
