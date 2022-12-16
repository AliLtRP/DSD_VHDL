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


# TCL File Generated by Component Editor 12.1
# Fri Jul 20 09:28:25 PDT 2012
# DO NOT MODIFY


# 
# altera_connection_identification_rom_wrapper "altera_connection_identification_rom_wrapper" v1.0
# null 2012.07.20.09:28:25
# 
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module altera_connection_identification_rom_wrapper
# 
set_module_property NAME altera_connection_identification_rom_wrapper
set_module_property AUTHOR "Altera Corporation"
set_module_property GROUP "Verification/Debug & Performance"
set_module_property VERSION 13.1
set_module_property INTERNAL true
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME altera_connection_identification_rom_wrapper
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property elaboration_callback elaborate

add_parameter LATENCY INTEGER 2 "Fixed read latency"
set_parameter_property LATENCY DEFAULT_VALUE 2
set_parameter_property LATENCY DISPLAY_NAME LATENCY
set_parameter_property LATENCY TYPE INTEGER
set_parameter_property LATENCY UNITS None
set_parameter_property LATENCY ALLOWED_RANGES {2}
set_parameter_property LATENCY AFFECTS_ELABORATION true
set_parameter_property LATENCY HDL_PARAMETER true
set_parameter_property LATENCY VISIBLE false

# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL altera_connection_identification_rom_wrapper
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file altera_connection_identification_rom_wrapper.v VERILOG PATH altera_connection_identification_rom_wrapper.v

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL altera_connection_identification_rom_wrapper
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file altera_connection_identification_rom_wrapper.v VERILOG PATH altera_connection_identification_rom_wrapper.v


# 
# parameters
# 


# 
# display items
# 


proc elaborate {} {
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
  # connection point s0
  # 
  add_interface s0 avalon end
  set_interface_property s0 addressUnits WORDS
  set_interface_property s0 associatedClock clock
  set_interface_property s0 associatedReset reset
  set_interface_property s0 bitsPerSymbol 8
  set_interface_property s0 burstOnBurstBoundariesOnly false
  set_interface_property s0 burstcountUnits WORDS
  set_interface_property s0 explicitAddressSpan 0
  set_interface_property s0 holdTime 0
  set_interface_property s0 linewrapBursts false
  set_interface_property s0 maximumPendingReadTransactions 0
  set_interface_property s0 readLatency [ get_parameter_value LATENCY ]
  set_interface_property s0 readWaitTime 0
  set_interface_property s0 setupTime 0
  set_interface_property s0 timingUnits Cycles
  set_interface_property s0 writeWaitTime 0
  set_interface_property s0 ENABLED true

  add_interface_port s0 read read Input 1
  add_interface_port s0 write write Input 1
  add_interface_port s0 writedata writedata Input 32
  add_interface_port s0 readdata readdata Output 32
  add_interface_port s0 address address Input 2
  set_interface_assignment s0 embeddedsw.configuration.isFlash 0
  set_interface_assignment s0 embeddedsw.configuration.isMemoryDevice 0
  set_interface_assignment s0 embeddedsw.configuration.isNonVolatileStorage 0
  set_interface_assignment s0 embeddedsw.configuration.isPrintableDevice 0

}