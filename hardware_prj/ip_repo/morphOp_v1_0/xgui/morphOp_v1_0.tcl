# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "VIDEO_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VIDEO_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OPERATOR_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OP_MODE" -parent ${Page_0} -widget comboBox


}

proc update_PARAM_VALUE.OPERATOR_SIZE { PARAM_VALUE.OPERATOR_SIZE } {
	# Procedure called to update OPERATOR_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OPERATOR_SIZE { PARAM_VALUE.OPERATOR_SIZE } {
	# Procedure called to validate OPERATOR_SIZE
	return true
}

proc update_PARAM_VALUE.OP_MODE { PARAM_VALUE.OP_MODE } {
	# Procedure called to update OP_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OP_MODE { PARAM_VALUE.OP_MODE } {
	# Procedure called to validate OP_MODE
	return true
}

proc update_PARAM_VALUE.VIDEO_DATA_WIDTH { PARAM_VALUE.VIDEO_DATA_WIDTH } {
	# Procedure called to update VIDEO_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_DATA_WIDTH { PARAM_VALUE.VIDEO_DATA_WIDTH } {
	# Procedure called to validate VIDEO_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.VIDEO_WIDTH { PARAM_VALUE.VIDEO_WIDTH } {
	# Procedure called to update VIDEO_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_WIDTH { PARAM_VALUE.VIDEO_WIDTH } {
	# Procedure called to validate VIDEO_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.OP_MODE { MODELPARAM_VALUE.OP_MODE PARAM_VALUE.OP_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OP_MODE}] ${MODELPARAM_VALUE.OP_MODE}
}

proc update_MODELPARAM_VALUE.VIDEO_WIDTH { MODELPARAM_VALUE.VIDEO_WIDTH PARAM_VALUE.VIDEO_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_WIDTH}] ${MODELPARAM_VALUE.VIDEO_WIDTH}
}

proc update_MODELPARAM_VALUE.OPERATOR_SIZE { MODELPARAM_VALUE.OPERATOR_SIZE PARAM_VALUE.OPERATOR_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OPERATOR_SIZE}] ${MODELPARAM_VALUE.OPERATOR_SIZE}
}

proc update_MODELPARAM_VALUE.VIDEO_DATA_WIDTH { MODELPARAM_VALUE.VIDEO_DATA_WIDTH PARAM_VALUE.VIDEO_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_DATA_WIDTH}] ${MODELPARAM_VALUE.VIDEO_DATA_WIDTH}
}

