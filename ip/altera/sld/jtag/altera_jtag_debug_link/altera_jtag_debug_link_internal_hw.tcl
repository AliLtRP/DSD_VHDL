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
# | altera_jtag_debug_link_internal "altera_jtag_debug_link_internal" v1.0
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
# | module altera_jtag_debug_link_internal
# | 
set_module_property NAME altera_jtag_debug_link_internal
set_module_property VERSION 13.1
set_module_property AUTHOR "Altera Corporation"
set_module_property INTERNAL true
set_module_property GROUP "Verification/Debug & Performance"
set_module_property DISPLAY_NAME "JTAG Debug Link (internal module)"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property compose_callback compose
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

set_interface_assignment h2t debug.providesServices packet
set_interface_assignment h2t debug.interfaceGroup {associatedT2h t2h associatedMgmt mgmt}

set_module_assignment debug.virtualInterface.jtag {debug.hostConnection {type jtag id 110:132} debug.providesServices sld debug.controlledBy h2t}
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point sink (upstream)
# | 
add_interface t2h avalon_streaming end
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point mgmt (downstream)
# |
add_interface mgmt avalon_streaming start
# |
# +-----------------------------------

# +-----------------------------------
# | child instances
# | 
add_instance clock altera_clock_bridge
set_interface_property clk export_of clock.in_clk

add_instance reset altera_reset_bridge
add_connection clock.out_clk reset.clk

add_instance reset1 altera_reset_bridge
set_interface_property debug_reset export_of reset1.out_reset
add_connection clock.out_clk reset1.clk
add_connection reset.out_reset reset1.in_reset

add_instance jtag altera_jtag_dc_streaming
set_instance_parameter_value jtag PURPOSE 2
set_instance_parameter_value jtag UPSTREAM_FIFO_SIZE 0
set_instance_parameter_value jtag DOWNSTREAM_FIFO_SIZE 6
# Note that 6 is the encoded version of 64
set_instance_parameter_value jtag MGMT_CHANNEL_WIDTH 8
add_connection clock.out_clk jtag.clock
set_interface_property mgmt export_of jtag.mgmt

add_connection jtag.debug_reset reset.in_reset
add_connection reset.out_reset jtag.clock_reset

add_instance h2t_timing timing_adapter
set_instance_parameter_value h2t_timing inUseReady 0
add_connection clock.out_clk h2t_timing.clk
add_connection reset.out_reset h2t_timing.reset
add_connection jtag.src h2t_timing.in

add_instance h2t_fifo altera_avalon_sc_fifo
set_instance_parameter_value h2t_fifo SYMBOLS_PER_BEAT 1
set_instance_parameter_value h2t_fifo BITS_PER_SYMBOL 8
set_instance_parameter_value h2t_fifo FIFO_DEPTH 64
set_instance_parameter_value h2t_fifo CHANNEL_WIDTH 0
set_instance_parameter_value h2t_fifo ERROR_WIDTH 0
set_instance_parameter_value h2t_fifo USE_PACKETS 0
set_instance_parameter_value h2t_fifo USE_FILL_LEVEL 0
set_instance_parameter_value h2t_fifo EMPTY_LATENCY 3
set_instance_parameter_value h2t_fifo USE_MEMORY_BLOCKS 1
add_connection clock.out_clk h2t_fifo.clk
add_connection reset.out_reset h2t_fifo.clk_reset
add_connection h2t_timing.out h2t_fifo.in

add_instance b2p altera_avalon_st_bytes_to_packets
set_instance_parameter_value b2p ENCODING 1
add_connection clock.out_clk b2p.clk
add_connection reset.out_reset b2p.clk_reset
add_connection h2t_fifo.out b2p.in_bytes_stream
set_interface_property h2t export_of b2p.out_packets_stream

add_instance p2b altera_avalon_st_packets_to_bytes
set_instance_parameter_value p2b ENCODING 1
add_connection clock.out_clk p2b.clk
add_connection reset.out_reset p2b.clk_reset
set_interface_property t2h export_of p2b.in_packets_stream

add_instance t2h_fifo altera_avalon_sc_fifo
set_instance_parameter_value t2h_fifo SYMBOLS_PER_BEAT 1
set_instance_parameter_value t2h_fifo BITS_PER_SYMBOL 8
set_instance_parameter_value t2h_fifo FIFO_DEPTH 64
set_instance_parameter_value t2h_fifo CHANNEL_WIDTH 0
set_instance_parameter_value t2h_fifo ERROR_WIDTH 0
set_instance_parameter_value t2h_fifo USE_PACKETS 0
set_instance_parameter_value t2h_fifo USE_FILL_LEVEL 0
set_instance_parameter_value t2h_fifo EMPTY_LATENCY 3
set_instance_parameter_value t2h_fifo USE_MEMORY_BLOCKS 1
add_connection clock.out_clk t2h_fifo.clk
add_connection reset.out_reset t2h_fifo.clk_reset
add_connection p2b.out_bytes_stream t2h_fifo.in

add_connection t2h_fifo.out jtag.sink

# | 
# +-----------------------------------

proc compose {} {
	set channel_width [get_parameter_value CHANNEL_WIDTH]

	set_instance_parameter_value jtag USE_PLI [get_parameter_value USE_PLI]
	set_instance_parameter_value jtag PLI_PORT [get_parameter_value PLI_PORT]
	set_instance_parameter_value jtag MGMT_CHANNEL_WIDTH $channel_width

	set_instance_parameter_value b2p CHANNEL_WIDTH $channel_width
	set_instance_parameter_value p2b CHANNEL_WIDTH $channel_width
}