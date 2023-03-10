# (C) 2001-2013 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# TCL File Generated by Component Editor __VERSION__
# Fri Oct 09 14:05:33 BST 2009
# DO NOT MODIFY


# +-----------------------------------
# | 
# | altera_jtag_debug_link "altera_jtag_debug_link" v1.0
# | null 2009.10.09.14:05:29
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 9.1
# | 
package require -exact sopc 9.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module altera_jtag_debug_link
# | 
set_module_property NAME altera_jtag_debug_link
set_module_property VERSION 13.1
set_module_property AUTHOR "Altera Corporation"
set_module_property INTERNAL false
set_module_property GROUP "Verification/Debug & Performance"
set_module_property DISPLAY_NAME "JTAG Debug Link"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property compose_callback compose
set_module_property opaque_address_map false
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter USE_PLI INTEGER 0
set_parameter_property USE_PLI DISPLAY_NAME "Use PLI Simulation Mode" 
set_parameter_property USE_PLI UNITS None
set_parameter_property USE_PLI DISPLAY_HINT ""
set_parameter_property USE_PLI AFFECTS_GENERATION true
set_parameter_property USE_PLI HDL_PARAMETER false
set_parameter_property USE_PLI STATUS experimental

add_parameter PLI_PORT INTEGER 50000
set_parameter_property PLI_PORT DISPLAY_NAME PLI_PORT
set_parameter_property PLI_PORT UNITS None
set_parameter_property PLI_PORT DISPLAY_HINT ""
set_parameter_property PLI_PORT AFFECTS_GENERATION true
set_parameter_property PLI_PORT HDL_PARAMETER false
set_parameter_property PLI_PORT STATUS experimental

add_parameter CHANNEL_WIDTH INTEGER 8
set_parameter_property CHANNEL_WIDTH DISPLAY_NAME "Channel Width"
set_parameter_property CHANNEL_WIDTH ALLOWED_RANGES {"4:21"}
set_parameter_property CHANNEL_WIDTH STATUS experimental

add_parameter MANUAL_DEBUG_FABRIC INTEGER 0
set_parameter_property MANUAL_DEBUG_FABRIC DISPLAY_NAME "Export interfaces for connection to manual debug fabric"
set_parameter_property MANUAL_DEBUG_FABRIC ALLOWED_RANGES {"0:No" "1:Yes"}
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection points
# | 
add_interface clk clock end

add_interface debug_reset reset start

add_interface h2t avalon_streaming start
set_interface_property h2t enabled false
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point sink (upstream)
# | 
add_interface t2h avalon_streaming end
set_interface_property t2h enabled false
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point mgmt (downstream)
# |
add_interface mgmt avalon_streaming start
set_interface_property mgmt enabled false
# |
# +-----------------------------------

# +-----------------------------------
# | child instances
# | 
add_instance clock altera_clock_bridge
set_interface_property clk export_of clock.in_clk

add_instance reset altera_reset_bridge
add_connection clock.out_clk reset.clk
set_interface_property debug_reset export_of reset.out_reset

add_instance link altera_jtag_debug_link_internal
add_connection clock.out_clk link.clk
add_connection link.debug_reset reset.in_reset
# | 
# +-----------------------------------

proc compose {} {
	set channel_width [get_parameter_value CHANNEL_WIDTH]
	set manual [get_parameter_value MANUAL_DEBUG_FABRIC]

	set_instance_parameter_value link USE_PLI [get_parameter_value USE_PLI]
	set_instance_parameter_value link PLI_PORT [get_parameter_value PLI_PORT]
	set_instance_parameter_value link CHANNEL_WIDTH $channel_width
	
	if {$manual} {
		set_interface_property h2t enabled true
		set_interface_property h2t export_of link.h2t
		set_interface_property t2h enabled true
		set_interface_property t2h export_of link.t2h
		set_interface_property mgmt enabled true
		set_interface_property mgmt export_of link.mgmt
	} else {
		add_instance endpoint altera_avalon_st_debug_host_endpoint
		set_instance_parameter_value endpoint CHANNEL_WIDTH $channel_width
		set_instance_parameter_value endpoint NAME "JTAG"
		set_instance_parameter_value endpoint HOST_PRIORITY 100
		
		add_connection clock.out_clk endpoint.clk
		add_connection link.debug_reset endpoint.reset
		add_connection link.h2t endpoint.h2t
		add_connection endpoint.t2h link.t2h
		add_connection link.mgmt endpoint.mgmt
	}
	
}
