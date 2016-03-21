// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat Oct 17 22:06:44 2015
// Host        : XSHJOSHUAL21 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jialij/workspace/work/2015_10/sobel_v_1_0/sobel_v_1_0.srcs/sources_1/ip/c_addsub_1/c_addsub_1_funcsim.v
// Design      : c_addsub_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_1,c_addsub_v12_0,{}" *) (* core_generation_info = "c_addsub_1,c_addsub_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=zynq,C_IMPLEMENTATION=0,C_A_WIDTH=24,C_B_WIDTH=24,C_OUT_WIDTH=25,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=1,C_B_TYPE=1,C_LATENCY=1,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=000000000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module c_addsub_1
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [23:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [23:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [24:0]S;

  wire [23:0]A;
  wire [23:0]B;
  wire CLK;
  wire [24:0]S;
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
  (* c_a_width = "24" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "000000000000000000000000" *) 
  (* c_b_width = "24" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "25" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_1_c_addsub_v12_0 U0
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
(* C_A_WIDTH = "24" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "000000000000000000000000" *) 
(* C_B_WIDTH = "24" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "25" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_1_c_addsub_v12_0
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
  input [23:0]A;
  input [23:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [24:0]S;

  wire [23:0]A;
  wire ADD;
  wire [23:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [24:0]S;
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
  (* c_a_width = "24" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "000000000000000000000000" *) 
  (* c_b_width = "24" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "25" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_1_c_addsub_v12_0_viv xst_addsub
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
imW5BUph26vJO6nbqFQb1UlNghyUhMn0FNX928sFkj43SkX+6xaS84psP42EtYNJnIKqsIGRpYrJ
IS2oPB3I4OX7KrpJM+Wujui4zdTJJ5ZdLuBnErSsBrTul2WlN1MjhDutE+B06+4wp3WwcTbVeECU
A28tNG0V18yFNe6gnjU3pY+8uTHvQuK58kpEpHadpDGkRCDgVHNSCawI6opXsCLXQ0xdWRsuCkYP
0eItDMepTLaydR80dY4dLd80zfTeUF+FXiX4tOrcyiDiA7ld5Gb++FqC+4WtaKLhWADz9NH1nWwO
CyDhETzbhxNrdJhBE4qWVy6w2i+OQqapKNEhEA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OMwI6fEfCdGPXR3atBWot0g5qdOP3QkV8VWdEOhz791sEWWvmcLxcV9G+89F/Gz4fhKcRL9s9gvW
0IG05z2Cp98IHStHY6ElIK1G5nBRUb0txLsjK8lA3xpoaPPLjkwGTyxcOV4gPTgcQhHVu+F8HEtb
jEakEvAu+VQIWTTYr5b8eVxJUZWbLF/r2gZOKZ+BdOC2kP+TxkBkd+Qen9UnGXhjAIjkN97UbMXY
PNv88O379qXBG13+nS6dmc8ulUyhAAvYm6NDwDsFVEzSvqT+72kjyom8tVwMZKmqFZ6n/qEGZzgV
HX3LmGEkoCTe6ZKPPYvRYYc5HQ5NQ31nUzMpcQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15488)
`pragma protect data_block
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
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
imW5BUph26vJO6nbqFQb1UlNghyUhMn0FNX928sFkj43SkX+6xaS84psP42EtYNJnIKqsIGRpYrJ
IS2oPB3I4OX7KrpJM+Wujui4zdTJJ5ZdLuBnErSsBrTul2WlN1MjhDutE+B06+4wp3WwcTbVeECU
A28tNG0V18yFNe6gnjU3pY+8uTHvQuK58kpEpHadpDGkRCDgVHNSCawI6opXsCLXQ0xdWRsuCkYP
0eItDMepTLaydR80dY4dLd80zfTeUF+FXiX4tOrcyiDiA7ld5Gb++FqC+4WtaKLhWADz9NH1nWwO
CyDhETzbhxNrdJhBE4qWVy6w2i+OQqapKNEhEA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OMwI6fEfCdGPXR3atBWot0g5qdOP3QkV8VWdEOhz791sEWWvmcLxcV9G+89F/Gz4fhKcRL9s9gvW
0IG05z2Cp98IHStHY6ElIK1G5nBRUb0txLsjK8lA3xpoaPPLjkwGTyxcOV4gPTgcQhHVu+F8HEtb
jEakEvAu+VQIWTTYr5b8eVxJUZWbLF/r2gZOKZ+BdOC2kP+TxkBkd+Qen9UnGXhjAIjkN97UbMXY
PNv88O379qXBG13+nS6dmc8ulUyhAAvYm6NDwDsFVEzSvqT+72kjyom8tVwMZKmqFZ6n/qEGZzgV
HX3LmGEkoCTe6ZKPPYvRYYc5HQ5NQ31nUzMpcQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4256)
`pragma protect data_block
cExTNLCPBHY84jpUlyaAFJrOr5wqvye+AqD0OEaEHeMYJjzXwj5jbGdD0XILKkslEbQzlfgeKKxX
uSk9lyIX10yCgOS6HkOI9cZpU+jjjpfrsmBdC664dOxnFSf44GA92dooE7bFayoY97aEzceoOCdu
+JQjBV3bksBMhqwfxdUIAP/Ctn20xnX7un+8AfQ4RzOOTQen4mgq6H2Rtr0n3D71rxoPp/tO21s+
yuNuUy2BSkdASA/D/xTEmygEiiG2FWfU7pWDFehcCih+Z9Gli1cF8It9YAuUduK2Pn5yHR4x9zPt
pcfPQe5ZkNs9BbMIQDc5S18XEKo6BO3t98ZIORVxOeVkRgQJcImoka+2BknqPKIa+crSM1q5FtAG
MJZW6tl6mOqlSDjsQ3d99oMGTpbETmm17v7lRPFYtpdK2m3tipDpTSXoHGKuCiaV3UOR+Gp9kUvk
GIJcQGVA3T1EShZjzudZy5q0oPy1dPJihifRAz2EaxVC8yg0qYJE5977dtcdsrujP4nJ7s/pGkr9
ES823cD5IP40J03r8IR/H9aN8DdMs6nmRa+ZvrdjAXPbQNmYjNFI9YlI+NogW7+f3oSrj1A4AJym
9GcyH1646CWQ/amlTkUU6nQVdcN5YzZKHXw6Y3snwiSUE0WmyBd0gbTMsweSTUYZk7IRaifD8Jz/
ZiowymDIwOQ+pFG2ecpdnA96aO1bn36KgC8z/ojhXID1WletABnmSJQco2OmO4QTVdwjrw0eD5nI
+t2jDfiwnhFlJE5S1SPvgKsx4XN5mwK2qtTpmwk/SowJgjuqhwcieEDOEOurk59P5SgLBSZCoJCm
Xvz9JspsColTMwCzpCfMiQvVi7bicPh5YYGVpQfLoJ7Xr9YNZ70Zg1QDai0YSOuOm8lUEUDB1GkA
vYBe/ceGACcZV40gkDlGkmJ98dwbImGyKmTkjSHpFXzqOmq7z/Aq5oWfsMCHVwk35mEKw3vPLRg1
HkrEqMgRjWJ8tDt1fD0gyn1cLyXuyqiuLPmPdgeZVt91dP4zlO+HJHD0GFTDBb5J6lDm3RfHP/gN
exlyTEgTLs9sDF3d+UEHJ5w4Sf/CWEnAnWqLfxjG/B5LKdtETZAFxcbqMjY0XqZ14JiSVp6nq7dQ
VcQTNMOMu0XxcyU4ptXPUA3QEKUVNJSBapHHftc9L6tD6LXrH64X3aTAeK6jRFTWTwjyjaNIQrnH
a4N1oROVZtEwb5WOvNEYUzUU0/KSrrULp4sQSY42vY+/EPWowGkYZsmG6rrUTeQCKW2Ny1yLBHi7
4Fx+IlSgzKofGqcRGnK79gOK3h7txlcZPfkgDonuFxCDQokXppFntmNj1j7puC+cU9KBJ287+Fbn
5TO6ElN55OF7PAZ80IEaXXCCPw6UwNqFq4nti5An21M8uNudWgV23Q4ZaCl2dd3gdEd1bTvTD3Io
Pim4EElRCz/QBztvGhAKAP162tmrIiIXbYIEuKoh1M2oPgqrqYEFQDdgPTXcfFInIKQ9lCRCASEn
sqjH3ZaTYHrgHYBRWXG74Iqtu+PdGowbU/BiA4Su1kuV1aRBuQ6DiMx7FKbErwArBMbZoj5aWldJ
qIxnojwAp1G8py8cUEye2XlbQd8lTaotD7x1iqQ3vua6emSRJaDgRSk6M9BWKp4xaGjh1HNwyL+8
Uz5fFNZm/ayTqJxHLDtrhu1/wGAAJa5HRg7FLGvb0VuO8kb6x5xDZbzp3dGtZvZhKIMpngO400bK
PSPnHKrWsobuuYdHfUG43vpebDGaAws9FBdsostjN7vHy0iVnjo+2JQg8YSjVbz/Dvmxpfmtz20G
JhfpdKjK5EVtyNoeyAPzD63z4UrfqcJcXIpZQPGPxNnedVelWDA6xwtQdHWGqD8yAUdQ6H8L6owE
my5fwqdDsp9AF8l/EOvmVTXyDCg/9TqmwhZCdYpQw/pHuE9WZdXu4TWcLkDEb3wXQpee0mqPlbU6
IuQMYXoYSTHi2mM5L6n7FpxNEOSd30ufw3xFgUtzSt2AMHu21AXJmQY9/hpWJdmsJiI53iEDB4BU
qSLEbI6zrlYkZPBK9QxWKqZXe7OREe5m8WJ8Ee1OMYB7ltwFfZA+o7+9/0y4BadounMM29tETxAv
jfeBbPCU2BSwsyvmDfVMFEdli2dkhDbN0kZshg+p2AwXVu4OykHbLfn99QAsk+lzgcbxAPvfd7My
8w8+abSWFs7nGR0E8L2FhH9NprU0387/hK6iP76SUWIqUWHDdhtE4rDYrEmJAK9rAYrdE+ZescBN
ZzcKtJ4ELGvQCZgsaTOHdZ3dT92rUxuahlP6BM9LT+BH1jmbEP0nUqUG8y8kEIj3CnOb67Z4qM88
QXrTSVL8AEmdleLmrTN+BsG3nu/HDbR16GoLkCATdxils1Wcyp66I2TbQfrrqRUwkTSTN9rgfupV
HTWD9RBe41RPgno9B9wjTBBsBr/xakjzGGQXbQOjaTzH2d8kHykz7UcCvMCdYC7c/M5lvkCxT94e
i3d800djFnr+ouXP8IRCuhTSS6q2JbY6ZT9+1aa9O9H2CjufcqQdE70imDs3prECYYqNNslEBLYp
20k7BuyfWb4pZ8vzaFBeDzFy8RgbjADUL8lv8Az+MwccX+wMm8uYTz5hh0sGMGWh5suFZ96BsCSA
ctBP4IV21MuIFrt0893yxkZV5PMa1mwQF2MT5hNcjjYyLOA+wgxKwbchRy8T96rvKwHRx7jkjJHR
nRwEdoV4cDZYybJybLUZbgFXoLlj9dMZtr11TrzA7/fZ5XgI3+RupsvskXWy7xYYPTPAEwBM4znU
CYJek4OsdfmaJJWgZiIFTnFEcYpaGvD5CunFpS5hZyTlUUjZz2POG+1fvS9BRW+IRaTG39mjC8Q6
tmcJQK5Gu1xz6W41ae7k6DRyfa2O667c6uMpe58XojmlhhCU2L+n0PEkzI2bLrqdBrlHdbWZdaPt
KPagxqRxukglWk+j1e8EqZxBTsWmDp5ztKdFwvMTIPI2XI1NsQpINkHYkwwipJdicdOa/ZnJduCR
+GA+63inevQaNEpj0n9GDr1h3amUfIVRr7u4zi+qVzdSaLjnXNR5MmU6Z8KMrmlShobZvpymKbM0
qghzSNZTMk+9bWbsof5wKhhjIPALWIe5z7ChuC5g9PL42N3evYuQxiSrRTiOR8IOvDhDk70UenJV
QS/L5CLtdx2RD52QyvRWry10tXX8YPx2jrmKGKD8XZtNRUdD0CkscpfMaDZ9wbvXJEz/5Yj99xNe
CCKlXWTLPkIaM2H/Z0WxdxWwIdWI5JGsdWQZTBSj9yDsaQoTY4CUvJkadOr59JXcqgD7bqsjdqbx
QMYjUp8Th7fBCK86u3lVp7qY0OSzVlS7B3Lp+mNhKx9oR2F4g5S6p1v+X8Jez4VEkMFI1wt96xvT
qwUGfhF6il42D8vc2fevezynWkCe9TAityB1CwPj9YTMpjdGSx7NA3VKLhY5Ww5HUpzZPrK4CMZd
sH2u9iCALPgYbHNiJ3qdoiW/BAefUsE8j5UWvNewyHAo59wu0zNdbmVrlf30oNfv34jf9Ogsk2wp
9NUKvii1Qv9L5KBbnAfIPHtjVGMXWuKlf+PDsB+uWspDVsTcui9f+1DsymZmMc9V1pEK/ZjuccCL
uyRcXY/3Sl3MWr28ZSCjwCHGLw1/kBOnvCyLB/0VSruUQZwoUdsiL7fcor6OaSm3xMIlSz8z/iGF
QFRVNvG2S2tWhOlV+AyU4oUUC2AML04p5VDqBNts+pR/2JAI+hs/8wqk4NDaxUFxCznkLWlsNvYP
5t0kEEMFQY4Rq8rYEPyysVOyXYwqkoWbOTwRRVZpFPNMtqBMnC41wIG486azcDhUrYsOGKisPRC4
f+i80/aUaZGdQvGEKEbMrEMlac/DeA1iXCfGNVamqSZzMTIYJnSGmnhXYpX6m+IWB5oaBjdnAYzt
bU/vzzRZ29mrCHbh94srxEMgHOqhNNhf1mC0hk3KOdEdCIkRxEqTj0dabVlKUt8ga4F2jg0fhpt0
hpJcF4CGQcCbFXCZgiLDs5KwLymCNbSg5bdIipx4jNV3Seij6pE96clyUM0cFABVy2PfsMMUICxg
gdmeIFqG71M7M7BH3+tWZ+RkCcpgMSGOEPOv3lt26fc7tqfIc/0ZwHcRZLf/8rlqWl43ytQbs8s9
ekr7EgYPg/cQfMvv7ib2stQg3xuNX0LV3fBsXHrrJK9FAQq990E44j3idoX5IXvwlLJ+ELF78Stl
eYRKy4bMafeTAW9gi1biYH1SnpnuB5p2dw8UR5faEr69sWz6Z83Wq26ilFFEOcF7NZDAIm2pgD7r
dj9QcDEuIFUKyZ/WfXsP2YmsFHtz0Yu8sYzBQE9I+yXmsOOjcXYJjWJ9Wuyc2m2ZW9VvR6d0YIOy
V//YYxQs9qt3YaCbiuSC9DRKQrX829nTYInPKsU1FKjz5aNUhKxQPw301OoOM7YXmJafQXt9UTqr
auEqz+am8EasLJV9W1vlqZ6n5NdubRUYWk5gYOw/FuVRPoFc0QDVKNLhR4pcwWsN21AUJmS/j2fN
4Wo/xD802v6rcDWdxnsWdIMsyKotKWt2rXvem02Amvj3I49+Pv3FYO2jDyZ70n/vu+l/uPoTjucL
L1Y+rLWmb66LIg3HSyXgXBAIhkWOwpXFYwVOj/HzP9A+J0KolmfbrH9JJCb7zgAtpsVDRpm86Wfz
FzL48Kjliy0ECCtgg2pAAN9UN0z9BlAK0hQ+xQubxre8aSkIWyShDO4NHnEnXuYorbfVxJZ6vNan
q9Vhh5qZqS3pRjXLqJt96fCv3bbmeHbFyBALZCOyEEm+vbHMEgNupaPg4UtvVyeEnmYaJpCv/iVe
Mq5+bvTXtDRU9vAtYNGENRGi1NHjeEDq3/nhPDi5wzC3PjiVRRiOwjMNLj7zoM66t6gu7KDKpw2d
pU+1DDmTPw1Xyx8niR3PJiYObSLLaeh7ffULtDZRU/1OIUX7PlXTI1HXevNDRKsCrHgtlhI2BrKK
I4+MGSgm6xj07AdIjuYLmkIVMDNBYxceM0Qgi1rRFdZiZp7EsZ2AndfAnWlMtOxgDPdC9UClk8d4
VcfMkFtm2FgDCOUNr/XQDP1UEsyU+L6dk6ju4Sd1MwHcorAD2rgQ5WREo23zkndfyj98/ddTnPb1
XY8uzMFnlfSRmtr+b5g1+/EsShxrwhb8vcPtQBrQQ2rPMVeR42f06uwWDIkMJSQVnR3x0IH4bPRV
YZ58VIGdxedcyEI3qjAJOX5+dOdNpJ7qTayg+dGDOKTcrYlnuko/bKk5Ui+dVyKOeaNlCSk6FXwn
kUZQEmNJziVVfFsWmWg7eWSvM4SDl0vHgHU504hrzZXGWHgKLwfa6jgG2z0sJD4XFEgSxtLXou/M
ajLCEE94rf60nSTvVZwby/GOq7okXTbkcVkZHsr4JsXi/1Rr18HPM7sWnTSujp2paS82rjWTlZpn
L4bKAfr3atiAD2sAMWEOKo/WPvGN084x6AOasUP5dlR5nRU5CkxAJHm/p3mbJT5NfjSBGWsmXUsJ
7n79BebSkAHCx/uARD5QO4B7bJsfw9dn8ik+CDZMF/woYUfaRC6c+wB5DVjFhXKwyqA1m/IA5b1f
9gQO/0SDNTrcKOHvQBw/PXHHI8IL1obqaU7y8L2nd88E894RsnU=
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
