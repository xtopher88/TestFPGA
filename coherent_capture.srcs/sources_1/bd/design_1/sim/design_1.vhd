--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
--Date        : Thu May  3 23:49:09 2018
--Host        : kevin-OMEN running 64-bit Ubuntu 16.04.4 LTS
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    input_clock : in STD_LOGIC;
    internal_clock : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal input_clock_1 : STD_LOGIC;
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of input_clock : signal is "xilinx.com:signal:clock:1.0 CLK.INPUT_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of input_clock : signal is "XIL_INTERFACENAME CLK.INPUT_CLOCK, CLK_DOMAIN design_1_input_clock, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of internal_clock : signal is "xilinx.com:signal:clock:1.0 CLK.INTERNAL_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of internal_clock : signal is "XIL_INTERFACENAME CLK.INTERNAL_CLOCK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 210000000, PHASE 0.0";
begin
  input_clock_1 <= input_clock;
  internal_clock <= clk_wiz_0_clk_out1;
clk_wiz_0: component design_1_clk_wiz_0_0
     port map (
      clk_in1 => input_clock_1,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      reset => '0'
    );
end STRUCTURE;
