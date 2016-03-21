set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cap_in_cap_data[0]}]
#set_property PACKAGE_PIN W19 [get_ports {CMOS_DATA[7]}]
#set_property PACKAGE_PIN V15 [get_ports {CMOS_DATA[6]}]
#set_property PACKAGE_PIN W14 [get_ports {CMOS_DATA[5]}]
#set_property PACKAGE_PIN Y14 [get_ports {CMOS_DATA[4]}]
#set_property PACKAGE_PIN T12 [get_ports {CMOS_DATA[3]}]
#set_property PACKAGE_PIN U12 [get_ports {CMOS_DATA[2]}]
#set_property PACKAGE_PIN T10 [get_ports {CMOS_DATA[1]}]
#set_property PACKAGE_PIN T11 [get_ports {CMOS_DATA[0]}]
set_property PACKAGE_PIN W19 [get_ports {cap_in_cap_data[7]}]
set_property PACKAGE_PIN W14 [get_ports {cap_in_cap_data[6]}]
set_property PACKAGE_PIN V15 [get_ports {cap_in_cap_data[5]}]
set_property PACKAGE_PIN W15 [get_ports {cap_in_cap_data[4]}]
set_property PACKAGE_PIN T11 [get_ports {cap_in_cap_data[3]}]
set_property PACKAGE_PIN T10 [get_ports {cap_in_cap_data[2]}]
set_property PACKAGE_PIN U12 [get_ports {cap_in_cap_data[1]}]
set_property PACKAGE_PIN T12 [get_ports {cap_in_cap_data[0]}]



set_property PACKAGE_PIN V20 [get_ports cap_in_cap_hsync]
set_property PACKAGE_PIN Y14 [get_ports CMOS_PIXCLK]
set_property PACKAGE_PIN U20 [get_ports cap_in_cap_active]
set_property PACKAGE_PIN Y19 [get_ports cap_in_cap_vsync]
set_property PACKAGE_PIN W20 [get_ports cap_in_cap_xclk]
set_property IOSTANDARD LVCMOS33 [get_ports cap_in_cap_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports CMOS_PIXCLK]
set_property IOSTANDARD LVCMOS33 [get_ports cap_in_cap_active]
set_property IOSTANDARD LVCMOS33 [get_ports cap_in_cap_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports cap_in_cap_xclk]

set_property SLEW FAST [get_ports cap_in_cap_xclk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CMOS_PIXCLK]

#IIC
set_property PACKAGE_PIN Y18 [get_ports iic_1_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_1_scl_io]
set_property PACKAGE_PIN T20 [get_ports iic_1_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_1_sda_io]

#IIC EEPROM
set_property PACKAGE_PIN N18 [get_ports iic_0_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_0_scl_io]
set_property PACKAGE_PIN N17 [get_ports iic_0_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_0_sda_io]


#set_property PACKAGE_PIN Y19 [get_ports {sck_tri_io[0]}]
#set_property PACKAGE_PIN U20 [get_ports {sda_tri_io[0]}]
#set_property PACKAGE_PIN Y18 [get_ports {sck_tri_io[0]}]
#set_property PACKAGE_PIN T20 [get_ports {sda_tri_io[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sck_tri_io[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sda_tri_io[0]}]

set_property PACKAGE_PIN L16 [get_ports clk125]
set_property IOSTANDARD LVCMOS33 [get_ports clk125]


set_property PACKAGE_PIN R18 [get_ports RST]
set_property IOSTANDARD LVCMOS33 [get_ports RST]

#set_property PACKAGE_PIN P19 [get_ports hsync_o]
#set_property PACKAGE_PIN R19 [get_ports vsync_o]
#set_property IOSTANDARD LVCMOS33 [get_ports hsync_o]
#set_property IOSTANDARD LVCMOS33 [get_ports vsync_o]
#
#set_property PACKAGE_PIN F19 [get_ports {r[4]}]
#set_property PACKAGE_PIN G20 [get_ports {r[3]}]
#set_property PACKAGE_PIN J20 [get_ports {r[2]}]
#set_property PACKAGE_PIN L20 [get_ports {r[1]}]
#set_property PACKAGE_PIN M19 [get_ports {r[0]}]
#set_property PACKAGE_PIN F20 [get_ports {g[5]}]
#set_property PACKAGE_PIN H20 [get_ports {g[4]}]
#set_property PACKAGE_PIN J19 [get_ports {g[3]}]
#set_property PACKAGE_PIN L19 [get_ports {g[2]}]
#set_property PACKAGE_PIN N20 [get_ports {g[1]}]
#set_property PACKAGE_PIN H18 [get_ports {g[0]}]
#
#set_property PACKAGE_PIN G19 [get_ports {b[4]}]
#set_property PACKAGE_PIN J18 [get_ports {b[3]}]
#set_property PACKAGE_PIN K19 [get_ports {b[2]}]
#set_property PACKAGE_PIN M20 [get_ports {b[1]}]
#set_property PACKAGE_PIN P20 [get_ports {b[0]}]
#
#set_property IOSTANDARD LVCMOS33 [get_ports {r[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {r[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {r[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {r[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {r[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
#
#


#set_property SLEW FAST [get_ports {sck_tri_io[0]}]
#set_property SLEW FAST [get_ports {sda_tri_io[0]}]
set_property SLEW FAST [get_ports {g[5]}]
set_property SLEW FAST [get_ports {g[4]}]
set_property SLEW FAST [get_ports {g[3]}]
set_property SLEW FAST [get_ports {g[2]}]
set_property SLEW FAST [get_ports {g[1]}]
set_property SLEW FAST [get_ports {g[0]}]
set_property SLEW FAST [get_ports {r[4]}]
set_property SLEW FAST [get_ports {r[3]}]
set_property SLEW FAST [get_ports {r[2]}]
set_property SLEW FAST [get_ports {r[1]}]
set_property SLEW FAST [get_ports {r[0]}]
set_property SLEW FAST [get_ports {b[4]}]
set_property SLEW FAST [get_ports {b[3]}]
set_property SLEW FAST [get_ports {b[2]}]
set_property SLEW FAST [get_ports {b[1]}]
set_property SLEW FAST [get_ports {b[0]}]
#set_property PULLUP true [get_ports {sck_tri_io[0]}]
set_property PACKAGE_PIN M19 [get_ports {vga_r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[0]}]

#IO_L9N_T1_DQS_AD3N_35
set_property PACKAGE_PIN L20 [get_ports {vga_r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[1]}]

##IO_L17P_T2_AD5P_35
set_property PACKAGE_PIN J20 [get_ports {vga_r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[2]}]

##IO_L18N_T2_AD13N_35
set_property PACKAGE_PIN G20 [get_ports {vga_r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[3]}]

##IO_L15P_T2_DQS_AD12P_35
set_property PACKAGE_PIN F19 [get_ports {vga_r[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[4]}]
##IO_L14N_T2_AD4N_SRCC_35
set_property PACKAGE_PIN H18 [get_ports {vga_g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[0]}]

##IO_L14P_T2_SRCC_34
set_property PACKAGE_PIN N20 [get_ports {vga_g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[1]}]


set_property PACKAGE_PIN L19 [get_ports {vga_g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[2]}]

##IO_L10N_T1_AD11N_35
set_property PACKAGE_PIN J19 [get_ports {vga_g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[3]}]

##IO_L17N_T2_AD5N_35
set_property PACKAGE_PIN H20 [get_ports {vga_g[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[4]}]

##IO_L15N_T2_DQS_AD12N_35
set_property PACKAGE_PIN F20 [get_ports {vga_g[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[5]}]

##IO_L14N_T2_SRCC_34
set_property PACKAGE_PIN P20 [get_ports {vga_b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[0]}]

##IO_L7N_T1_AD2N_35
set_property PACKAGE_PIN M20 [get_ports {vga_b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[1]}]

##IO_L10P_T1_AD11P_35
set_property PACKAGE_PIN K19 [get_ports {vga_b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[2]}]

##IO_L14P_T2_AD4P_SRCC_35
set_property PACKAGE_PIN J18 [get_ports {vga_b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[3]}]

##IO_L18P_T2_AD13P_35
set_property PACKAGE_PIN G19 [get_ports {vga_b[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[4]}]

##IO_L13N_T2_MRCC_34
set_property PACKAGE_PIN P19 [get_ports vga_hs]
set_property IOSTANDARD LVCMOS33 [get_ports vga_hs]

##IO_0_34
set_property PACKAGE_PIN R19 [get_ports vga_vs]
set_property IOSTANDARD LVCMOS33 [get_ports vga_vs]


#connect_debug_port u_ila_0/probe0 [get_nets [list design_1_i/ov5640_0_out_hsync]]
#connect_debug_port u_ila_0/probe1 [get_nets [list design_1_i/ov5640_0_out_vsync]]

