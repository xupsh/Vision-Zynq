// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat Oct 17 21:22:21 2015
// Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jialij/workspace/work/2015_10/sobel_v_1_0/sobel_v_1_0.srcs/sources_1/ip/c_addsub_0/c_addsub_0_funcsim.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0,{}" *) (* core_generation_info = "c_addsub_0,c_addsub_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=zynq,C_IMPLEMENTATION=0,C_A_WIDTH=12,C_B_WIDTH=12,C_OUT_WIDTH=12,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=1,C_B_TYPE=1,C_LATENCY=1,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module c_addsub_0
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [11:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [11:0]S;

  wire [11:0]A;
  wire [11:0]B;
  wire CLK;
  wire [11:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* DONT_TOUCH *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "12" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "000000000000" *) 
  (* c_b_width = "12" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "12" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_0_c_addsub_v12_0 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "12" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "000000000000" *) 
(* C_B_WIDTH = "12" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "12" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_0_c_addsub_v12_0
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [11:0]A;
  input [11:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [11:0]S;

  wire [11:0]A;
  wire ADD;
  wire [11:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [11:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "12" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "000000000000" *) 
  (* c_b_width = "12" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "12" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_0_c_addsub_v12_0_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
cJBJWqQpFUIWbeBkF47oYiJo7L/Z8+sF+UwGDnQri8BgFOptIQLBgxVKMwLLhwJW1IfwwgXMduNO
54kvQVbxliAEsbeg17/n3QCKUkB+AhlEXgmsZy47ezll+LmnNaXwu4wYca2n0pXUIFhEH9uz7I69
qWkH9sgiOGUSBoGb3t7bCedJbh2hrZjqR2ag0oeGQcuHW+mVIR6XgXG0qJwkZT4m2sE9oXpEOual
wd0hj7F1Z//ffcFNut6xI+xpwqNXmF6UGC7TZ4za2qCYMHrD+kW2wUww8QY1EicGTDZdywA4fIGR
ffbtADEiS9pBNxmvw5AZDBXfGPIDDu0Pq9WE1Q==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
GhsbW1R6dnNcBmWShTBaTnDKp8iqVuYY2NlRnqHewD8bHO7+2jpFXk5durD3jy+HvlubU6nONUaJ
BliqpNSSCg1q/UN/v76Bxb39Gvg4/lAbgt7ebzBZrHfdgn+d11vbUWsu3b5GGm6GpxAz/Gc2cScp
D5ZAv+B1Y5WzVpTjq9j+DDFW4xTL9/2Z2uoVnUUzSM9sVby/TdQsevKYdGX9iT1Pt3oYBySW5Ue5
q1NfNYd6bN7VpX/gDiTUOI+bKp7mm+O4q8TnKN9QDtMyolsoLtQLtS1yfa+THSfrjVhqs58vao25
Z2IcthcatgCM24qbFt9wFz7TPnh43nOUbrGZGg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8272)
`pragma protect data_block
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
XWR4suu8Hw==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
cJBJWqQpFUIWbeBkF47oYiJo7L/Z8+sF+UwGDnQri8BgFOptIQLBgxVKMwLLhwJW1IfwwgXMduNO
54kvQVbxliAEsbeg17/n3QCKUkB+AhlEXgmsZy47ezll+LmnNaXwu4wYca2n0pXUIFhEH9uz7I69
qWkH9sgiOGUSBoGb3t7bCedJbh2hrZjqR2ag0oeGQcuHW+mVIR6XgXG0qJwkZT4m2sE9oXpEOual
wd0hj7F1Z//ffcFNut6xI+xpwqNXmF6UGC7TZ4za2qCYMHrD+kW2wUww8QY1EicGTDZdywA4fIGR
ffbtADEiS9pBNxmvw5AZDBXfGPIDDu0Pq9WE1Q==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
GhsbW1R6dnNcBmWShTBaTnDKp8iqVuYY2NlRnqHewD8bHO7+2jpFXk5durD3jy+HvlubU6nONUaJ
BliqpNSSCg1q/UN/v76Bxb39Gvg4/lAbgt7ebzBZrHfdgn+d11vbUWsu3b5GGm6GpxAz/Gc2cScp
D5ZAv+B1Y5WzVpTjq9j+DDFW4xTL9/2Z2uoVnUUzSM9sVby/TdQsevKYdGX9iT1Pt3oYBySW5Ue5
q1NfNYd6bN7VpX/gDiTUOI+bKp7mm+O4q8TnKN9QDtMyolsoLtQLtS1yfa+THSfrjVhqs58vao25
Z2IcthcatgCM24qbFt9wFz7TPnh43nOUbrGZGg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2144)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
