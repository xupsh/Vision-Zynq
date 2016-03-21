//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Oct 18 18:37:01 2015
//Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target rgb2gray_wrapper.bd
//Design      : rgb2gray_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rgb2gray_wrapper
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

  wire CLK;
  wire [0:0]vid_in_active;
  wire [0:0]vid_in_hsync;
  wire [23:0]vid_in_rgb;
  wire [0:0]vid_in_vsync;
  wire [0:0]vid_out_active;
  wire [7:0]vid_out_gray;
  wire [0:0]vid_out_hsync;
  wire [0:0]vid_out_vsync;

  rgb2gray rgb2gray_i
       (.CLK(CLK),
        .vid_in_active(vid_in_active),
        .vid_in_hsync(vid_in_hsync),
        .vid_in_rgb(vid_in_rgb),
        .vid_in_vsync(vid_in_vsync),
        .vid_out_active(vid_out_active),
        .vid_out_gray(vid_out_gray),
        .vid_out_hsync(vid_out_hsync),
        .vid_out_vsync(vid_out_vsync));
endmodule
