// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat Oct 17 21:22:21 2015
// Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/jialij/workspace/work/2015_10/sobel_v_1_0/sobel_v_1_0.srcs/sources_1/ip/c_addsub_0/c_addsub_0_stub.v
// Design      : c_addsub_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0,Vivado 2015.2" *)
module c_addsub_0(A, B, CLK, S)
/* synthesis syn_black_box black_box_pad_pin="A[11:0],B[11:0],CLK,S[11:0]" */;
  input [11:0]A;
  input [11:0]B;
  input CLK;
  output [11:0]S;
endmodule
