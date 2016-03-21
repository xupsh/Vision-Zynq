
################################################################
# This is a generated script based on design: rgb2gray
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source rgb2gray_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name rgb2gray

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set_property -dict [ list CONFIG.FREQ_HZ {10000000}  ] $CLK
  set vid_in_active [ create_bd_port -dir I -from 0 -to 0 vid_in_active ]
  set vid_in_hsync [ create_bd_port -dir I -from 0 -to 0 vid_in_hsync ]
  set vid_in_rgb [ create_bd_port -dir I -from 23 -to 0 vid_in_rgb ]
  set vid_in_vsync [ create_bd_port -dir I -from 0 -to 0 vid_in_vsync ]
  set vid_out_active [ create_bd_port -dir O -from 0 -to 0 vid_out_active ]
  set vid_out_gray [ create_bd_port -dir O -from 7 -to 0 vid_out_gray ]
  set vid_out_hsync [ create_bd_port -dir O -from 0 -to 0 vid_out_hsync ]
  set vid_out_vsync [ create_bd_port -dir O -from 0 -to 0 vid_out_vsync ]

  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list CONFIG.A_Type {Unsigned} CONFIG.A_Width {16} CONFIG.B_Type {Unsigned} CONFIG.B_Value {0000000000000000} CONFIG.B_Width {16} CONFIG.CE {false} CONFIG.Latency {1} CONFIG.Out_Width {16}  ] $c_addsub_0

  # Create instance: c_addsub_1, and set properties
  set c_addsub_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_1 ]
  set_property -dict [ list CONFIG.A_Type {Unsigned} CONFIG.A_Width {16} CONFIG.B_Type {Unsigned} CONFIG.B_Value {0000000000000000} CONFIG.B_Width {16} CONFIG.Bypass {false} CONFIG.CE {false} CONFIG.Latency {1} CONFIG.Latency_Configuration {Manual} CONFIG.Out_Width {16} CONFIG.SINIT {false} CONFIG.SSET {false}  ] $c_addsub_1

  # Create instance: c_shift_ram_0, and set properties
  set c_shift_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_0 ]
  set_property -dict [ list CONFIG.Depth {1}  ] $c_shift_ram_0

  # Create instance: c_shift_ram_1, and set properties
  set c_shift_ram_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_1 ]
  set_property -dict [ list CONFIG.AsyncInitVal {000} CONFIG.DefaultData {000} CONFIG.Depth {3} CONFIG.SyncInitVal {000} CONFIG.Width {3}  ] $c_shift_ram_1

  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list CONFIG.Multiplier_Construction {Use_LUTs} CONFIG.OptGoal {Speed} CONFIG.OutputWidthHigh {15} CONFIG.PortAType {Unsigned} CONFIG.PortAWidth {8} CONFIG.PortBType {Unsigned} CONFIG.PortBWidth {8} CONFIG.Use_Custom_Output_Width {true}  ] $mult_gen_0

  # Create instance: mult_gen_1, and set properties
  set mult_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_1 ]
  set_property -dict [ list CONFIG.Multiplier_Construction {Use_LUTs} CONFIG.OptGoal {Speed} CONFIG.OutputWidthHigh {15} CONFIG.PortAType {Unsigned} CONFIG.PortAWidth {8} CONFIG.PortBType {Unsigned} CONFIG.PortBWidth {8} CONFIG.Use_Custom_Output_Width {true}  ] $mult_gen_1

  # Create instance: mult_gen_2, and set properties
  set mult_gen_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_2 ]
  set_property -dict [ list CONFIG.Multiplier_Construction {Use_LUTs} CONFIG.OptGoal {Speed} CONFIG.OutputWidthHigh {15} CONFIG.PortAType {Unsigned} CONFIG.PortAWidth {8} CONFIG.PortBType {Unsigned} CONFIG.PortBWidth {8} CONFIG.Use_Custom_Output_Width {true}  ] $mult_gen_2

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list CONFIG.NUM_PORTS {3}  ] $xlconcat_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {77} CONFIG.CONST_WIDTH {8}  ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list CONFIG.CONST_VAL {150} CONFIG.CONST_WIDTH {8}  ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list CONFIG.CONST_VAL {29} CONFIG.CONST_WIDTH {8}  ] $xlconstant_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list CONFIG.DIN_FROM {23} CONFIG.DIN_TO {16} CONFIG.DIN_WIDTH {24} CONFIG.DOUT_WIDTH {8}  ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list CONFIG.DIN_FROM {15} CONFIG.DIN_TO {8} CONFIG.DIN_WIDTH {24} CONFIG.DOUT_WIDTH {8}  ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list CONFIG.DIN_FROM {7} CONFIG.DIN_TO {0} CONFIG.DIN_WIDTH {24} CONFIG.DOUT_WIDTH {8}  ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list CONFIG.DIN_FROM {15} CONFIG.DIN_TO {8} CONFIG.DIN_WIDTH {16} CONFIG.DOUT_WIDTH {8}  ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list CONFIG.DIN_FROM {2} CONFIG.DIN_TO {2} CONFIG.DIN_WIDTH {3} CONFIG.DOUT_WIDTH {1}  ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list CONFIG.DIN_FROM {1} CONFIG.DIN_TO {1} CONFIG.DIN_WIDTH {3} CONFIG.DOUT_WIDTH {1}  ] $xlslice_5

  # Create instance: xlslice_6, and set properties
  set xlslice_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_6 ]
  set_property -dict [ list CONFIG.DIN_FROM {0} CONFIG.DIN_TO {0} CONFIG.DIN_WIDTH {3} CONFIG.DOUT_WIDTH {1}  ] $xlslice_6

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins c_addsub_0/CLK] [get_bd_pins c_addsub_1/CLK] [get_bd_pins c_shift_ram_0/CLK] [get_bd_pins c_shift_ram_1/CLK] [get_bd_pins mult_gen_0/CLK] [get_bd_pins mult_gen_1/CLK] [get_bd_pins mult_gen_2/CLK]
  connect_bd_net -net Din_1 [get_bd_ports vid_in_rgb] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din]
  connect_bd_net -net In0_1 [get_bd_ports vid_in_hsync] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net In1_1 [get_bd_ports vid_in_vsync] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net In2_1 [get_bd_ports vid_in_active] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net c_addsub_0_S [get_bd_pins c_addsub_0/S] [get_bd_pins c_addsub_1/A]
  connect_bd_net -net c_addsub_1_S [get_bd_pins c_addsub_1/S] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net c_shift_ram_0_Q [get_bd_pins c_addsub_1/B] [get_bd_pins c_shift_ram_0/Q]
  connect_bd_net -net c_shift_ram_1_Q [get_bd_pins c_shift_ram_1/Q] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din] [get_bd_pins xlslice_6/Din]
  connect_bd_net -net mult_gen_0_P [get_bd_pins c_addsub_0/A] [get_bd_pins mult_gen_0/P]
  connect_bd_net -net mult_gen_1_P [get_bd_pins c_addsub_0/B] [get_bd_pins mult_gen_1/P]
  connect_bd_net -net mult_gen_2_P [get_bd_pins c_shift_ram_0/D] [get_bd_pins mult_gen_2/P]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins c_shift_ram_1/D] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mult_gen_0/B] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins mult_gen_1/B] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins mult_gen_2/B] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins mult_gen_0/A] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins mult_gen_1/A] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins mult_gen_2/A] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_ports vid_out_gray] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_ports vid_out_active] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_ports vid_out_vsync] [get_bd_pins xlslice_5/Dout]
  connect_bd_net -net xlslice_6_Dout [get_bd_ports vid_out_hsync] [get_bd_pins xlslice_6/Dout]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


