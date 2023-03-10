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
# | altera_instrumentation_fabric "altera_instrumentation_fabric" v1.0
# | null 2009.10.09.14:05:29
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 12.1
# | 
package require -exact qsys 12.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module altera_instrumentation_fabric
# | 
set_module_property name altera_instrumentation_fabric
set_module_property version 13.1
set_module_property author "Altera Corporation"
set_module_property internal true
set_module_property group "Verification/Debug & Performance"
set_module_property DISPLAY_NAME "Top level generated instrumentation fabric"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property REPORT_TO_TALKBACK true
set_module_property OPAQUE_ADDRESS_MAP false
set_module_property composition_callback compose
set_module_property helper_jar com.altera.superfabric.jar
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter DESIGN_HASH string  0 "Design hash for the system"
add_parameter NODE_COUNT  integer 0 "Number of nodes connected to the fabric"
set_parameter_property NODE_COUNT hdl_parameter true
add_parameter MAX_WIDTH   integer 0 "Maximum width of send/receive port"
set_parameter_property MAX_WIDTH hdl_parameter true
add_parameter SETTINGS    string "" "Settings from the nodes"
set_parameter_property SETTINGS DISPLAY_HINT "rows:8 columns:100"
add_parameter CLOCKS      string "" "Information about clock domains"
set_parameter_property CLOCKS DISPLAY_HINT "rows:4 columns:100"
add_parameter MIRROR      integer 0 "Internal mirror debug mode - this is a user debug fabric"
set_parameter_property MIRROR DISPLAY_HINT "boolean"
set_parameter_property MIRROR NEW_INSTANCE_VALUE 1

add_parameter DEVICE_FAMILY string ""
set_parameter_property DEVICE_FAMILY system_info { device_family }

# | 
# +-----------------------------------

proc compose {} {
    set hash      [get_parameter_value DESIGN_HASH]
    set count     [get_parameter_value NODE_COUNT]
    set max_width [get_parameter_value MAX_WIDTH]
    regsub -all "\}" [get_parameter_value SETTINGS] "\} " settings
    regsub -all "\}" [get_parameter_value CLOCKS] "\} " clocks    
    set mirror    [get_parameter_value MIRROR]

	if {$mirror == 0} {
		# Connection to the SLD hub is not included in the parameters passed
		# down, though it is included in the ports
		incr count
		if {$max_width < 9} {
			set max_width 9
		}
		set settings "{fabric ident width 4 latency 0 psig 59142e7f} $settings"
		if {$clocks != ""} {
			set clocks "{} $clocks"
		}
	}

	set tcl [call_helper getComposeCommands [list hash $hash count $count max_width $max_width settings $settings clocks $clocks mirror $mirror]]
#	send_message {text info} $tcl
	eval $tcl
}

proc log2ceil x "expr {int(ceil(log(\$x)/[expr log(2)]))}"
