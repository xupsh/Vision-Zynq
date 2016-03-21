// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat Oct 17 21:59:37 2015
// Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jialij/workspace/work/2015_10/sobel_v_1_0/sobel_v_1_0.srcs/sources_1/ip/mult_gen_0/mult_gen_0_funcsim.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) (* core_generation_info = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=1,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=12,C_B_TYPE=1,C_OUT_HIGH=23,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [11:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [23:0]P;

  wire [11:0]A;
  wire [11:0]B;
  wire CLK;
  wire [23:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "12" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "23" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "12" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "12" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "23" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [11:0]A;
  input [11:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [23:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [11:0]B;
  wire CE;
  wire CLK;
  wire [23:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "12" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "23" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
arnh+KKoDgsw4/tPEYwnnPGDRbVikesong6+Q2OyHujI0sMs8SCxocYLiXw5FQrlRM68qU6J4fD5
u2TxpWpRVQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
Yq/vnjZLCL1QwIH7cUbwc5FvSHLhapSL6t8LSQJUEHtxWu+KSjh1dhPJmktrgDFaXac705ujvztl
+YNsaRHfN24YRZgfmuNNkTYC/UuSjXT5p/OoHt34ja5+sL1swpkd0kS4KoUu1L5VgNu5PzU1KlJu
xNTTz0V55se0kA3xWGQ=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
eoHGlvGv7vY3KM2pS9QmvseVWbTY70mMUJ3dA0VjqlsHyDJxtnekm0x4ES3HnmtT6I31arKf6/ET
ILLvECnH2OOJH68Mcf4J7JFoX45Zwa7B7KIjwEYTSxi92dQiphR/l29FqZuSejHT7E7bMi4sclKz
j+vGrH1SqUduR0rwKN9CPHaVuDw/oVW2lWa9c3BvcGgxPZYlQfuBzMSoT7ADN6SHXTy8LugMRN19
ZeoXElJXwG4eJoi81sjzUnliKzvxYAUg5fobuuhqHUtJVxrVPTQmR3/xJ4qtPwhElOZ3/puQnm50
9DRgrlf21WXL7TGNp7fuSABNGeZz8AwBEp0Vrg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
TeLIf/zkpCY4yQD/TbVP7xhsSq6QqpAxE+H0wAcGmKjkx1YJ+YQD83Gi50v2Dxag9LF0iTX0QwAQ
/QvIx7YohUWqQvk+r2+0yK1URFJmBCNFEEivz+FDjQlbO1RDN1XaKdHoCL25pyeg1dtt9P7mQ33V
nqRohJY9ZYEdwnXPBdY=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
fOxmOBbj/YQDvu07VmpBaNFeLYg0SbTKg02Kj6lBe0YdruMt8S7cfJlbx82jKhkR/NlBv2HbJo+e
TUO8AOppQbnS+cHMa8q6CqMi4aTf38ur9dGrsWfXdqtFgwbHnesqIWvZJGaoWSctLiHT6GsQM0GG
Tru90EZL56azfqnVDZxXIapp7tYbdgZBFhdsrGDFzAx7l+LUsYAqJ0L8llIw9IWY+8q/E3Gy9rpS
YPICwHReFMwy12AIuCLjzneQvBv1J7TzX7xOGO9D6usPWzR3Ig03iZPhbgu4HfeKyk4x8fM5TrTw
4E17UpHtFJ/o6MADz00WRJLpGrki4atbYJ7OPg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
SSutd08MY9XKVAcIWJ6zV/N2Y1efD3njXZSNPAupIw3Jlp/hpXMP9O2ElMDsb4tBu6V5heT4cXSm
BawGzEqUWk4IluNo5ZthaUnhK0ahC796lQrovZmDBBxFtMj5JoWTblufd/Y2mGpllqCFm1d0u8eZ
jCOTCtCrH/l6V+dhuQ+5r18PnqW2eU7jrx4k0SiVv+0Mfgyhsfh7kCQIpnrMPpQmMws5tRyc91QJ
2BGlzikZbEnJRtQPNypKZw1TDNevbB3NuCJD62r7Ffor6D505qaKhY8kxP2jNWd84aSLNtQYZPIv
df3TlKLGtmYpAHULm0UCWQWhfHHWXIbGYReDMQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
gv4gR3VpkZDPDflM3jugxHQjKGR+8vWfJ1rNIv45G8PSiXD/vFriQametD1RznXzA76Df4NAL7+s
qZLcsUXmenaxG1JIxAX4lgGY5RlNdAUXTCG0nngZR/M9M7gEb8FSbrJCILpBwzSAVKVCsUSYMYBA
L/pSWUyjBL8fCc2trJSHuhhMnPOzCCESG0/K8OzdN0UjrcmJP0vCXXHjiOng/um/k4uFvRtxMilz
aUBHshVuoA264INn415jqUET55Z1tmFf4WBLXiheyQOBfiuMo3xVVYWLa7maBfH54jD+76msW1R8
HTGpcNVJ5/AJCSsbBHfoo/w7wrS3oyq+h2/ZTA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7184)
`pragma protect data_block
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
Log=
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
