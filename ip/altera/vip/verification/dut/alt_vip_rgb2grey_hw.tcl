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


# TCL File Generated by Component Editor 11.1
# Tue Sep 06 16:35:18 BST 2011
# DO NOT MODIFY


# +-----------------------------------
# | 
# | alt_vip_rgb2grey "RGB2GREY" v1.0
# | Altera 2011.09.06.16:35:18
# | RGB to Greyscale converter
# | 
# | /data/jharris/P4Vip_main/acds/main/ip/vip/verification/dut/alt_vip_rgb2grey.v
# | 
# |    ./alt_vip_common_control_packet_decoder.v syn, sim
# |    ./alt_vip_common_control_packet_encoder.v syn, sim
# |    ./alt_vip_common_flow_control_wrapper.v syn, sim
# |    ./alt_vip_common_stream_input.v syn, sim
# |    ./alt_vip_common_stream_output.v syn, sim
# |    ./alt_vip_rgb2grey.v syn, sim
# |    ./alt_vip_rgb2grey_core.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 11.0
# | 
package require -exact sopc 11.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module alt_vip_rgb2grey
# | 
set_module_property DESCRIPTION "RGB to Greyscale converter"
set_module_property NAME alt_vip_rgb2grey
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR Altera
set_module_property DISPLAY_NAME RGBtogreyscaleconvertor
set_module_property TOP_LEVEL_HDL_FILE alt_vip_rgb2grey.v
set_module_property TOP_LEVEL_HDL_MODULE alt_vip_rgb2grey
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property HIDE_FROM_QSYS true
set_module_property ANALYZE_HDL TRUE
set_module_property STATIC_TOP_LEVEL_MODULE_NAME alt_vip_rgb2grey
set_module_property FIX_110_VIP_PATH false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file alt_vip_common_control_packet_decoder.v {SYNTHESIS SIMULATION}
add_file alt_vip_common_control_packet_encoder.v {SYNTHESIS SIMULATION}
add_file alt_vip_common_flow_control_wrapper.v {SYNTHESIS SIMULATION}
add_file alt_vip_common_stream_input.v {SYNTHESIS SIMULATION}
add_file alt_vip_common_stream_output.v {SYNTHESIS SIMULATION}
add_file alt_vip_rgb2grey.v {SYNTHESIS SIMULATION}
add_file alt_vip_rgb2grey_core.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter BITS_PER_SYMBOL INTEGER 8
set_parameter_property BITS_PER_SYMBOL DEFAULT_VALUE 8
set_parameter_property BITS_PER_SYMBOL DISPLAY_NAME BITS_PER_SYMBOL
set_parameter_property BITS_PER_SYMBOL TYPE INTEGER
set_parameter_property BITS_PER_SYMBOL UNITS None
set_parameter_property BITS_PER_SYMBOL ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_PER_SYMBOL AFFECTS_GENERATION false
set_parameter_property BITS_PER_SYMBOL HDL_PARAMETER true
add_parameter SYMBOLS_PER_BEAT INTEGER 3
set_parameter_property SYMBOLS_PER_BEAT DEFAULT_VALUE 3
set_parameter_property SYMBOLS_PER_BEAT DISPLAY_NAME SYMBOLS_PER_BEAT
set_parameter_property SYMBOLS_PER_BEAT TYPE INTEGER
set_parameter_property SYMBOLS_PER_BEAT UNITS None
set_parameter_property SYMBOLS_PER_BEAT ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SYMBOLS_PER_BEAT AFFECTS_GENERATION false
set_parameter_property SYMBOLS_PER_BEAT HDL_PARAMETER true
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point din
# | 
add_interface din avalon_streaming end
set_interface_property din associatedClock clock
set_interface_property din associatedReset reset
set_interface_property din dataBitsPerSymbol 8
set_interface_property din errorDescriptor ""
set_interface_property din firstSymbolInHighOrderBits true
set_interface_property din maxChannel 0
set_interface_property din readyLatency 1

set_interface_property din ENABLED true

add_interface_port din din_ready ready Output 1
add_interface_port din din_valid valid Input 1
add_interface_port din din_sop startofpacket Input 1
add_interface_port din din_eop endofpacket Input 1
add_interface_port din din_data data Input BITS_PER_SYMBOL*SYMBOLS_PER_BEAT
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point dout
# | 
add_interface dout avalon_streaming start
set_interface_property dout associatedClock clock
set_interface_property dout associatedReset reset
set_interface_property dout dataBitsPerSymbol 8
set_interface_property dout errorDescriptor ""
set_interface_property dout firstSymbolInHighOrderBits true
set_interface_property dout maxChannel 0
set_interface_property dout readyLatency 1

set_interface_property dout ENABLED true

add_interface_port dout dout_ready ready Input 1
add_interface_port dout dout_valid valid Output 1
add_interface_port dout dout_data data Output BITS_PER_SYMBOL*SYMBOLS_PER_BEAT
add_interface_port dout dout_sop startofpacket Output 1
add_interface_port dout dout_eop endofpacket Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT

set_interface_property reset ENABLED true

add_interface_port reset rst reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock
# | 
add_interface clock clock end
set_interface_property clock clockRate 0

set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1
# | 
# +-----------------------------------