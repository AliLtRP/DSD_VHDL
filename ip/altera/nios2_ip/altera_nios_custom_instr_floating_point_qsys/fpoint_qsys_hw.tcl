# TCL File Generated by Component Editor 10.1
# Tue Aug 17 16:32:25 MYT 2010
# DO NOT MODIFY


# +-----------------------------------
# | 
# |    ./fpoint_wrapper.v syn, sim
# |    ./fpoint_qsys.v syn, sim
# |    ./fpoint_hw_qsys.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 10.1
# | 
package require -exact sopc 10.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module fpoint
# | 
set_module_property NAME altera_nios_custom_instr_floating_point
set_module_property VERSION "13.1"
set_module_property INTERNAL false
set_module_property GROUP "Custom Instruction Modules"
set_module_property AUTHOR "Altera Corporation"
set_module_property DISPLAY_NAME "Floating Point Hardware"
set_module_property HIDE_FROM_SOPC true
set_module_property TOP_LEVEL_HDL_FILE fpoint_wrapper.v
set_module_property TOP_LEVEL_HDL_MODULE fpoint_wrapper
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property SIMULATION_MODEL_IN_VHDL true
set_module_property EDITABLE false
set_module_property ANALYZE_HDL FALSE
set_module_property VALIDATION_CALLBACK validate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file fpoint_wrapper.v {SYNTHESIS SIMULATION}
add_file fpoint_qsys.v {SYNTHESIS SIMULATION}
add_file fpoint_hw_qsys.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_display_item "" 0 text "<html>This component creates hardware for floating point<br>single precision add, subtract, multiply and optionally divide.<br><br></html>"
add_parameter useDivider INTEGER 0 ""
set_parameter_property useDivider DEFAULT_VALUE 0
set_parameter_property useDivider DISPLAY_NAME "Use floating point division hardware"
set_parameter_property useDivider WIDTH ""
set_parameter_property useDivider TYPE INTEGER
set_parameter_property useDivider UNITS None
set_parameter_property useDivider DESCRIPTION ""
set_parameter_property useDivider AFFECTS_GENERATION false
set_parameter_property useDivider HDL_PARAMETER true
set_parameter_property useDivider "DISPLAY_HINT" "boolean"
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point s1
# | 
add_interface s1 nios_custom_instruction end
set_interface_property s1 clockCycle 1
set_interface_property s1 operands 2
set_interface_property s1 opcodeExtensionLocked true
set_interface_property s1 opcodeExtensionLockedValue 0xfc

set_interface_property s1 ENABLED true

add_interface_port s1 clk clk Input 1
add_interface_port s1 clk_en clk_en Input 1
add_interface_port s1 dataa dataa Input 32
add_interface_port s1 datab datab Input 32
add_interface_port s1 n n Input 2
add_interface_port s1 reset reset Input 1
add_interface_port s1 start start Input 1
add_interface_port s1 done done Output 1
add_interface_port s1 result result Output 32
# | 
# +-----------------------------------

# +-----------------------------------
# | set embeddedsw.configuration
# | 
proc validate {} {
  set_module_assignment "embeddedsw.configuration.useDivider" [ get_parameter_value useDivider ]
}
# | 
# +-----------------------------------