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
# | altera_usb_debug_link_internal "altera_usb_debug_link_internal" v1.0
# | null 2009.10.09.14:05:29
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 13.0
# | 
package require -exact qsys 13.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module altera_usb_debug_link_internal
# | 
set_module_property NAME altera_usb_debug_link_internal
set_module_property VERSION 13.1
set_module_property AUTHOR "Altera Corporation"
set_module_property INTERNAL true
set_module_property GROUP "Verification/Debug & Performance"
set_module_property DISPLAY_NAME "USB Debug Link (internal module)"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property composition_callback compose
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# |
add_parameter DUAL_CLOCK INTEGER 1
set_parameter_property DUAL_CLOCK DISPLAY_NAME "Dual Clocks"
set_parameter_property DUAL_CLOCK ALLOWED_RANGES {"0:No" "1:Yes"}

add_parameter FIFO_DEPTH INTEGER 256
set_parameter_property FIFO_DEPTH DISPLAY_NAME "FIFO Depth"
set_parameter_property FIFO_DEPTH ALLOWED_RANGES {"4:4" "8:8" "16:16" "32:32" "64:64" "128:128" "256:256" "512:512" "1024:1K (1xM9K)" "2048:2K"}

add_parameter CHANNEL_WIDTH INTEGER 8
set_parameter_property CHANNEL_WIDTH DISPLAY_NAME "Channel Width"
set_parameter_property CHANNEL_WIDTH ALLOWED_RANGES {"4:21"}
# |
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point usb_if
# |
add_interface usb_if conduit end
set_interface_assignment usb_if qsys.ui.export usb
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point debug_clk_in
# | 
add_interface debug_clk_in clock end
set_interface_property debug_clk_in enabled false
# |
# +-----------------------------------

# +-----------------------------------
# | connection point debug_clk
# | 
add_interface debug_clk clock start
# |
# +-----------------------------------

# +-----------------------------------
# | connection point debug_reset
# | 
add_interface debug_reset reset start
# |
# +-----------------------------------

# +-----------------------------------
# | connection point h2t (downstream)
# |
add_interface h2t avalon_streaming start

set_interface_assignment h2t debug.providesServices packet
set_interface_assignment h2t debug.interfaceGroup {associatedT2h t2h associatedMgmt mgmt}
set_interface_assignment h2t debug.hostConnection {type usb purpose 2}
# |
# +-----------------------------------

# +-----------------------------------
# | connection point t2h (upstream)
# | 
add_interface t2h avalon_streaming end
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point mgmt (management)
# |
add_interface mgmt avalon_streaming start
# |
# +-----------------------------------

# +-----------------------------------
# | child instances
# | 
add_instance fifos altera_usb_debug_fifos
set_instance_parameter_value fifos PURPOSE 2
set_interface_property usb_if export_of fifos.usb_if
set_interface_property mgmt export_of fifos.mgmt_if
set clk fifos.av_clk_out
set reset fifos.av_reset_out

add_instance clock altera_clock_bridge
set_interface_property debug_clk export_of clock.out_clk
add_connection $clk clock.in_clk

add_instance reset altera_reset_bridge
add_connection $reset reset.in_reset
set_interface_property debug_reset export_of reset.out_reset
add_connection $clk reset.clk

add_instance b2p altera_avalon_st_bytes_to_packets
set_instance_parameter_value b2p ENCODING 1
add_connection $clk b2p.clk
add_connection $reset b2p.clk_reset
add_connection fifos.avst_src b2p.in_bytes_stream

add_instance h2t_pipeline altera_avalon_st_pipeline_stage
set_instance_parameter_value h2t_pipeline USE_PACKETS 1
add_connection $clk h2t_pipeline.cr0
add_connection $reset h2t_pipeline.cr0_reset
add_connection b2p.out_packets_stream h2t_pipeline.sink0
set_interface_property h2t export_of h2t_pipeline.source0

add_instance p2b altera_avalon_st_packets_to_bytes
set_instance_parameter_value p2b ENCODING 1
add_connection $clk p2b.clk
add_connection $reset p2b.clk_reset
add_connection p2b.out_bytes_stream fifos.avst_sink

add_instance t2h_pipeline altera_avalon_st_pipeline_stage
set_instance_parameter_value t2h_pipeline USE_PACKETS 1
add_connection $clk t2h_pipeline.cr0
add_connection $reset t2h_pipeline.cr0_reset
set_interface_property t2h export_of t2h_pipeline.sink0
add_connection t2h_pipeline.source0 p2b.in_packets_stream

# | 
# +-----------------------------------

proc compose {} {
	set dual_clock [get_parameter_value DUAL_CLOCK]
	set fifo_depth [get_parameter_value FIFO_DEPTH]
	set channel_width [get_parameter_value CHANNEL_WIDTH]

	# Connect clock input if necessary
    if {$dual_clock} {
		set_interface_property debug_clk_in enabled true
    	set_interface_property debug_clk_in export_of fifos.av_clk
	}

	set_instance_parameter_value fifos USE_DCFIFO $dual_clock
	set_instance_parameter_value fifos FIFO_DEPTH $fifo_depth
	
	set_instance_parameter_value fifos NUM_MGMT_CHANNELBITS $channel_width

    set max_channel [expr (1 << $channel_width) - 1]

	set_instance_parameter_value b2p CHANNEL_WIDTH $channel_width
	set_instance_parameter_value p2b CHANNEL_WIDTH $channel_width

	set_instance_parameter_value h2t_pipeline CHANNEL_WIDTH $channel_width
	set_instance_parameter_value h2t_pipeline MAX_CHANNEL   $max_channel
	set_instance_parameter_value t2h_pipeline CHANNEL_WIDTH $channel_width
	set_instance_parameter_value t2h_pipeline MAX_CHANNEL   $max_channel
}
