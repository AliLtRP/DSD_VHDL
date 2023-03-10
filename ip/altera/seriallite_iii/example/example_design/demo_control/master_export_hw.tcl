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


# TCL File Generated by Component Editor 12.0sp1
# Mon Jul 23 22:12:20 PDT 2012
# DO NOT MODIFY


# 
# master_export "Master Export Pass-Through Component" v1.0
# null 2012.07.23.22:12:20
# 
# 

# 
# request TCL package from ACDS 12.0
# 
package require -exact qsys 12.0


# 
# module master_export
# 
set_module_property NAME master_export
set_module_property VERSION 1.0
set_module_property INTERNAL true
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME "Master Export Pass-Through Component"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property HIDE_FROM_QSYS true


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file master_export.v VERILOG PATH master_export.v
set_fileset_property QUARTUS_SYNTH TOP_LEVEL master_export

# 
# parameters
# 
add_parameter address_width INTEGER 9 ""
set_parameter_property address_width DEFAULT_VALUE 9
set_parameter_property address_width DISPLAY_NAME address_width
set_parameter_property address_width TYPE INTEGER
set_parameter_property address_width UNITS None
set_parameter_property address_width ALLOWED_RANGES -2147483648:2147483647
set_parameter_property address_width DESCRIPTION ""
set_parameter_property address_width AFFECTS_GENERATION false
add_parameter data_width INTEGER 32 ""
set_parameter_property data_width DEFAULT_VALUE 32
set_parameter_property data_width DISPLAY_NAME data_width
set_parameter_property data_width TYPE INTEGER
set_parameter_property data_width UNITS None
set_parameter_property data_width ALLOWED_RANGES -2147483648:2147483647
set_parameter_property data_width DESCRIPTION ""
set_parameter_property data_width AFFECTS_GENERATION false


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset reset Input 1


# 
# connection point master
# 
add_interface master avalon start
set_interface_property master addressUnits SYMBOLS
set_interface_property master associatedClock clock
set_interface_property master associatedReset reset
set_interface_property master burstOnBurstBoundariesOnly false
set_interface_property master doStreamReads false
set_interface_property master doStreamWrites false
set_interface_property master linewrapBursts false
set_interface_property master readLatency 0
set_interface_property master ENABLED true

add_interface_port master avm_address address Output 9
add_interface_port master avm_read read Output 1
add_interface_port master avm_waitrequest waitrequest Input 1
add_interface_port master avm_readdata readdata Input 32
add_interface_port master avm_write write Output 1
add_interface_port master avm_writedata writedata Output 32


# 
# connection point slave
# 
add_interface slave avalon end
set_interface_property slave addressAlignment DYNAMIC
set_interface_property slave addressUnits WORDS
set_interface_property slave associatedClock clock
set_interface_property slave associatedReset reset
set_interface_property slave burstOnBurstBoundariesOnly false
set_interface_property slave explicitAddressSpan 0
set_interface_property slave holdTime 0
set_interface_property slave isMemoryDevice false
set_interface_property slave isNonVolatileStorage false
set_interface_property slave linewrapBursts false
set_interface_property slave maximumPendingReadTransactions 0
set_interface_property slave printableDevice false
set_interface_property slave readLatency 0
set_interface_property slave readWaitTime 1
set_interface_property slave setupTime 0
set_interface_property slave timingUnits Cycles
set_interface_property slave writeWaitTime 0
set_interface_property slave ENABLED true

add_interface_port slave avs_address address Input 9
add_interface_port slave avs_read read Input 1
add_interface_port slave avs_readdata readdata Output 32
add_interface_port slave avs_write write Input 1
add_interface_port slave avs_waitrequest waitrequest Output 1
add_interface_port slave avs_writedata writedata Input 32

