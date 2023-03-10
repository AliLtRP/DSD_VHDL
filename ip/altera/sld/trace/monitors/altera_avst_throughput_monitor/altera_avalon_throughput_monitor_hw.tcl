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


# TCL File Generated by Component Editor 13.1
# Thu Jul 11 08:26:50 PDT 2013
# DO NOT MODIFY


# 
# altera_avst_throughput_monitor "Avalon throughput monitor" v1.0
# bduckwal 2013.07.11.08:26:50
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module altera_avst_throughput_monitor
# 
set_module_property DESCRIPTION ""
set_module_property NAME altera_avalon_throughput_monitor
set_module_property VERSION 13.1
set_module_property GROUP "Verification/Debug & Performance"
set_module_property INTERNAL true
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Altera Corporation"
set_module_property DISPLAY_NAME "Avalon Throughput Monitor"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property NATIVE_INTERPRETER true


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL altera_avalon_throughput_monitor
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file altera_avalon_throughput_monitor.v VERILOG PATH altera_avalon_throughput_monitor.v TOP_LEVEL_FILE
add_fileset_file altera_pmon_count_csr.v VERILOG PATH altera_pmon_count_csr.v
add_fileset_file altera_pmon_counters.v VERILOG PATH altera_pmon_counters.v

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL altera_avalon_throughput_monitor
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file altera_avalon_throughput_monitor.v VERILOG PATH altera_avalon_throughput_monitor.v
add_fileset_file altera_pmon_count_csr.v VERILOG PATH altera_pmon_count_csr.v
add_fileset_file altera_pmon_counters.v VERILOG PATH altera_pmon_counters.v


# 
# parameters
# 
add_parameter BC_W INTEGER 5
set_parameter_property BC_W DEFAULT_VALUE 5
set_parameter_property BC_W DISPLAY_NAME BC_W
set_parameter_property BC_W DESCRIPTION "Width of burstcount signal"
set_parameter_property BC_W TYPE INTEGER
set_parameter_property BC_W UNITS bits
set_parameter_property BC_W HDL_PARAMETER true
set_parameter_property BC_W GROUP  "Port Widths"

# 
# display items
# 

# 
# connection point avs_clock
# 
add_interface avs_clock clock end
set_interface_property avs_clock clockRate 0
set_interface_property avs_clock ENABLED true
set_interface_property avs_clock EXPORT_OF ""
set_interface_property avs_clock PORT_NAME_MAP ""
set_interface_property avs_clock SVD_ADDRESS_GROUP ""

add_interface_port avs_clock avs_clock clk Input 1


# 
# connection point if_clock
# 
add_interface if_clock clock end
set_interface_property if_clock clockRate 0
set_interface_property if_clock ENABLED true
set_interface_property if_clock EXPORT_OF ""
set_interface_property if_clock PORT_NAME_MAP ""
set_interface_property if_clock SVD_ADDRESS_GROUP ""

add_interface_port if_clock if_clock clk Input 1


# 
# connection point avs_reset
# 
add_interface avs_reset reset end
set_interface_property avs_reset associatedClock avs_clock
set_interface_property avs_reset synchronousEdges DEASSERT
set_interface_property avs_reset ENABLED true
set_interface_property avs_reset EXPORT_OF ""
set_interface_property avs_reset PORT_NAME_MAP ""
set_interface_property avs_reset SVD_ADDRESS_GROUP ""

add_interface_port avs_reset avs_reset reset Input 1


# 
# connection point if_reset
# 
add_interface if_reset reset end
set_interface_property if_reset associatedClock if_clock
set_interface_property if_reset synchronousEdges DEASSERT
set_interface_property if_reset ENABLED true
set_interface_property if_reset EXPORT_OF ""
set_interface_property if_reset PORT_NAME_MAP ""
set_interface_property if_reset SVD_ADDRESS_GROUP ""

add_interface_port if_reset if_reset reset Input 1

# 
# connection point if
# 
add_interface if conduit end
set_interface_property if associatedClock if_clock
set_interface_property if associatedReset if_reset
set_interface_property if ENABLED true
set_interface_property if EXPORT_OF ""
set_interface_property if PORT_NAME_MAP ""
set_interface_property if CMSIS_SVD_VARIABLES ""
set_interface_property if SVD_ADDRESS_GROUP ""

add_interface_port if if_read read Input 1
add_interface_port if if_write write Input 1
add_interface_port if if_burstcount burstcount Input BC_W
add_interface_port if if_waitrequest waitrequest Input 1
add_interface_port if if_readdatavalid readdatavalid Input 1

set_interface_assignment if debug.visible true


# 
# connection point data
# 
add_interface          data avalon end
set_interface_property data addressUnits WORDS
set_interface_property data associatedClock avs_clock
set_interface_property data associatedReset avs_reset
set_interface_property data bitsPerSymbol 8
set_interface_property data burstOnBurstBoundariesOnly false
set_interface_property data burstcountUnits WORDS
set_interface_property data explicitAddressSpan 0
set_interface_property data holdTime 0
set_interface_property data linewrapBursts false
set_interface_property data maximumPendingReadTransactions 0
set_interface_property data readLatency 0
set_interface_property data readWaitTime 0
set_interface_property data setupTime 0
set_interface_property data timingUnits Cycles
set_interface_property data writeWaitTime 0
set_interface_property data ENABLED true
set_interface_property data EXPORT_OF ""
set_interface_property data PORT_NAME_MAP ""
set_interface_property data CMSIS_SVD_VARIABLES ""
set_interface_property data SVD_ADDRESS_GROUP ""

add_interface_port       data avs_address address Input 2
add_interface_port       data avs_read read Input 1
add_interface_port       data avs_readdata readdata Output 32
add_interface_port       data avs_waitrequest waitrequest Output 1
set_interface_assignment data embeddedsw.configuration.isFlash 0
set_interface_assignment data embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment data embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment data embeddedsw.configuration.isPrintableDevice 0
set_interface_assignment data debug.interfaceGroup {associatedConfig config}
set_interface_assignment data debug.monitoredInterfaces if


# 
# connection point config
# 
add_interface          config avalon end
set_interface_property config addressUnits WORDS
set_interface_property config associatedClock avs_clock
set_interface_property config associatedReset avs_reset
set_interface_property config bitsPerSymbol 8
set_interface_property config burstOnBurstBoundariesOnly false
set_interface_property config burstcountUnits WORDS
set_interface_property config explicitAddressSpan 0
set_interface_property config holdTime 0
set_interface_property config linewrapBursts false
set_interface_property config maximumPendingReadTransactions 0
set_interface_property config readLatency 0
set_interface_property config readWaitTime 0
set_interface_property config setupTime 0
set_interface_property config timingUnits Cycles
set_interface_property config writeWaitTime 0
set_interface_property config ENABLED true
set_interface_property config EXPORT_OF ""
set_interface_property config PORT_NAME_MAP ""
set_interface_property config CMSIS_SVD_VARIABLES ""
set_interface_property config SVD_ADDRESS_GROUP ""

add_interface_port       config ctl_address address Input 2
add_interface_port       config ctl_readdata readdata Output 32
set_interface_assignment config embeddedsw.configuration.isFlash 0
set_interface_assignment config embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment config embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment config embeddedsw.configuration.isPrintableDevice 0

