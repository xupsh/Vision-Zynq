-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Sat Oct 17 22:06:44 2015
-- Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/jialij/workspace/work/2015_10/sobel_v_1_0/sobel_v_1_0.srcs/sources_1/ip/c_addsub_1/c_addsub_1_stub.vhdl
-- Design      : c_addsub_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c_addsub_1 is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 23 downto 0 );
    B : in STD_LOGIC_VECTOR ( 23 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 24 downto 0 )
  );

end c_addsub_1;

architecture stub of c_addsub_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[23:0],B[23:0],CLK,S[24:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_addsub_v12_0,Vivado 2015.2";
begin
end;
