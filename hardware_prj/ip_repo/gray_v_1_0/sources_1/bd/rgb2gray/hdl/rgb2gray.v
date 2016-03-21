//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Oct 18 18:37:01 2015
//Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target rgb2gray.bd
//Design      : rgb2gray
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rgb2gray,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rgb2gray,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=18,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "rgb2gray.hwdef" *) 
module rgb2gray
   (CLK,
    vid_in_active,
    vid_in_hsync,
    vid_in_rgb,
    vid_in_vsync,
    vid_out_active,
    vid_out_gray,
    vid_out_hsync,
    vid_out_vsync);
  input CLK;
  input [0:0]vid_in_active;
  input [0:0]vid_in_hsync;
  input [23:0]vid_in_rgb;
  input [0:0]vid_in_vsync;
  output [0:0]vid_out_active;
  output [7:0]vid_out_gray;
  output [0:0]vid_out_hsync;
  output [0:0]vid_out_vsync;

  wire CLK_1;
  wire [23:0]Din_1;
  wire [0:0]In0_1;
  wire [0:0]In1_1;
  wire [0:0]In2_1;
  wire [15:0]c_addsub_0_S;
  wire [15:0]c_addsub_1_S;
  wire [15:0]c_shift_ram_0_Q;
  wire [2:0]c_shift_ram_1_Q;
  wire [15:0]mult_gen_0_P;
  wire [15:0]mult_gen_1_P;
  wire [15:0]mult_gen_2_P;
  wire [2:0]xlconcat_1_dout;
  wire [7:0]xlconstant_0_dout;
  wire [7:0]xlconstant_1_dout;
  wire [7:0]xlconstant_2_dout;
  wire [7:0]xlslice_0_Dout;
  wire [7:0]xlslice_1_Dout;
  wire [7:0]xlslice_2_Dout;
  wire [7:0]xlslice_3_Dout;
  wire [0:0]xlslice_4_Dout;
  wire [0:0]xlslice_5_Dout;
  wire [0:0]xlslice_6_Dout;

  assign CLK_1 = CLK;
  assign Din_1 = vid_in_rgb[23:0];
  assign In0_1 = vid_in_hsync[0];
  assign In1_1 = vid_in_vsync[0];
  assign In2_1 = vid_in_active[0];
  assign vid_out_active[0] = xlslice_4_Dout;
  assign vid_out_gray[7:0] = xlslice_3_Dout;
  assign vid_out_hsync[0] = xlslice_6_Dout;
  assign vid_out_vsync[0] = xlslice_5_Dout;
  rgb2gray_c_addsub_0_0 c_addsub_0
       (.A(mult_gen_0_P),
        .B(mult_gen_1_P),
        .CLK(CLK_1),
        .S(c_addsub_0_S));
  rgb2gray_c_addsub_1_0 c_addsub_1
       (.A(c_addsub_0_S),
        .B(c_shift_ram_0_Q),
        .CLK(CLK_1),
        .S(c_addsub_1_S));
  rgb2gray_c_shift_ram_0_0 c_shift_ram_0
       (.CLK(CLK_1),
        .D(mult_gen_2_P),
        .Q(c_shift_ram_0_Q));
  rgb2gray_c_shift_ram_1_0 c_shift_ram_1
       (.CLK(CLK_1),
        .D(xlconcat_1_dout),
        .Q(c_shift_ram_1_Q));
  rgb2gray_mult_gen_0_0 mult_gen_0
       (.A(xlslice_0_Dout),
        .B(xlconstant_0_dout),
        .CLK(CLK_1),
        .P(mult_gen_0_P));
  rgb2gray_mult_gen_1_0 mult_gen_1
       (.A(xlslice_1_Dout),
        .B(xlconstant_1_dout),
        .CLK(CLK_1),
        .P(mult_gen_1_P));
  rgb2gray_mult_gen_2_0 mult_gen_2
       (.A(xlslice_2_Dout),
        .B(xlconstant_2_dout),
        .CLK(CLK_1),
        .P(mult_gen_2_P));
  rgb2gray_xlconcat_1_0 xlconcat_1
       (.In0(In0_1),
        .In1(In1_1),
        .In2(In2_1),
        .dout(xlconcat_1_dout));
  rgb2gray_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  rgb2gray_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  rgb2gray_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  rgb2gray_xlslice_0_0 xlslice_0
       (.Din(Din_1),
        .Dout(xlslice_0_Dout));
  rgb2gray_xlslice_1_0 xlslice_1
       (.Din(Din_1),
        .Dout(xlslice_1_Dout));
  rgb2gray_xlslice_2_0 xlslice_2
       (.Din(Din_1),
        .Dout(xlslice_2_Dout));
  rgb2gray_xlslice_3_0 xlslice_3
       (.Din(c_addsub_1_S),
        .Dout(xlslice_3_Dout));
  rgb2gray_xlslice_4_0 xlslice_4
       (.Din(c_shift_ram_1_Q),
        .Dout(xlslice_4_Dout));
  rgb2gray_xlslice_5_0 xlslice_5
       (.Din(c_shift_ram_1_Q),
        .Dout(xlslice_5_Dout));
  rgb2gray_xlslice_6_0 xlslice_6
       (.Din(c_shift_ram_1_Q),
        .Dout(xlslice_6_Dout));
endmodule
