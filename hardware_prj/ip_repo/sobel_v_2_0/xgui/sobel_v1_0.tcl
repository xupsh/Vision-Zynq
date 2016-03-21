# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "VIDEO_HEIGHT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VIDEO_IN_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VIDEO_OUT_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VIDEO_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.VIDEO_HEIGHT { PARAM_VALUE.VIDEO_HEIGHT } {
	# Procedure called to update VIDEO_HEIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_HEIGHT { PARAM_VALUE.VIDEO_HEIGHT } {
	# Procedure called to validate VIDEO_HEIGHT
	return true
}

proc update_PARAM_VALUE.VIDEO_IN_DATA_WIDTH { PARAM_VALUE.VIDEO_IN_DATA_WIDTH } {
	# Procedure called to update VIDEO_IN_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_IN_DATA_WIDTH { PARAM_VALUE.VIDEO_IN_DATA_WIDTH } {
	# Procedure called to validate VIDEO_IN_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.VIDEO_OUT_DATA_WIDTH { PARAM_VALUE.VIDEO_OUT_DATA_WIDTH } {
	# Procedure called to update VIDEO_OUT_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_OUT_DATA_WIDTH { PARAM_VALUE.VIDEO_OUT_DATA_WIDTH } {
	# Procedure called to validate VIDEO_OUT_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.VIDEO_WIDTH { PARAM_VALUE.VIDEO_WIDTH } {
	# Procedure called to update VIDEO_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_WIDTH { PARAM_VALUE.VIDEO_WIDTH } {
	# Procedure called to validate VIDEO_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.VIDEO_WIDTH { MODELPARAM_VALUE.VIDEO_WIDTH PARAM_VALUE.VIDEO_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_WIDTH}] ${MODELPARAM_VALUE.VIDEO_WIDTH}
}

proc update_MODELPARAM_VALUE.VIDEO_HEIGHT { MODELPARAM_VALUE.VIDEO_HEIGHT PARAM_VALUE.VIDEO_HEIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_HEIGHT}] ${MODELPARAM_VALUE.VIDEO_HEIGHT}
}

proc update_MODELPARAM_VALUE.VIDEO_IN_DATA_WIDTH { MODELPARAM_VALUE.VIDEO_IN_DATA_WIDTH PARAM_VALUE.VIDEO_IN_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_IN_DATA_WIDTH}] ${MODELPARAM_VALUE.VIDEO_IN_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.VIDEO_OUT_DATA_WIDTH { MODELPARAM_VALUE.VIDEO_OUT_DATA_WIDTH PARAM_VALUE.VIDEO_OUT_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_OUT_DATA_WIDTH}] ${MODELPARAM_VALUE.VIDEO_OUT_DATA_WIDTH}
}

