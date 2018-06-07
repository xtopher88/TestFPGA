--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
--Date        : Thu May  3 23:49:09 2018
--Host        : kevin-OMEN running 64-bit Ubuntu 16.04.4 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    input_clock : in STD_LOGIC;
    internal_clock : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    internal_clock : out STD_LOGIC;
    input_clock : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      input_clock => input_clock,
      internal_clock => internal_clock
    );
end STRUCTURE;
