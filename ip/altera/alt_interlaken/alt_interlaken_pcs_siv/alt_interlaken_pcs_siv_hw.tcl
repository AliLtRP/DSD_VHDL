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


# TCL File Generated by Component Editor 9.1
# Tue May 19 15:05:02 PDT 2009
# DO NOT MODIFY


# +-----------------------------------
# | 
# | alt_interlaken "ALT_Interlaken_PCS" v1.0
# | null 2009.05.19.15:05:02
# | 
# | 
# | D:/ip/alt_interlaken/alt_interlaken_pcs_siv/alt_interlaken_pcs_siv.v
# | 
# | D:/ip/alt_interlaken/alt_interlaken_pcs_siv/alt_interlaken_pcs_siv.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 9.1
# | 
package require -exact sopc 9.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module alt_interlaken
# | 
set_module_property NAME alt_interlaken_pcs_siv
set_module_property VERSION 13.1
set_module_property AUTHOR "Altera Corporation"
set_module_property INTERNAL true
set_module_property GROUP "Interfaces|Interlaken"
set_module_property DISPLAY_NAME ALT_Interlaken_PCS_SIV
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ELABORATION_CALLBACK alt_interlaken_pcs_siv_elaborate
set_module_property COMPOSE_CALLBACK alt_interlaken_pcs_siv_compose
set_module_property SIMULATION_MODEL_IN_VERILOG 1

#sopc::preview_add_transform name preview_avalon_mm_transform

# | 
# +-----------------------------------


add_display_item "" "General" GROUP tab
add_display_item "" "Analog Options" GROUP tab

# +-----------------------------------
# | parameters
# | 
add_parameter PLEX STRING "DUPLEX"
set_parameter_property PLEX DISPLAY_NAME "Datapath mode"
set_parameter_property PLEX DISPLAY_HINT ""
set_parameter_property PLEX ALLOWED_RANGES {"RX" "TX" "DUPLEX"}
set_parameter_property PLEX AFFECTS_ELABORATION true
set_parameter_property PLEX AFFECTS_GENERATION true
set_parameter_property PLEX IS_HDL_PARAMETER false
add_display_item "General" PLEX PARAMETER

add_parameter LANERATE STRING "6250 Mbps"
set_parameter_property LANERATE DISPLAY_NAME "Lane rate"
set_parameter_property LANERATE UNITS None
set_parameter_property LANERATE ALLOWED_RANGES {"3125 Mbps" "5000 Mbps" "6250 Mbps" "6375 Mbps"}
set_parameter_property LANERATE DISPLAY_HINT ""
set_parameter_property LANERATE AFFECTS_GENERATION true
set_parameter_property LANERATE IS_HDL_PARAMETER false
add_display_item "General" LANERATE PARAMETER

add_parameter LINKWIDTH INTEGER 4
set_parameter_property LINKWIDTH DISPLAY_NAME "Link width"
set_parameter_property LINKWIDTH UNITS Bits
set_parameter_property LINKWIDTH ALLOWED_RANGES 4:20
set_parameter_property LINKWIDTH DISPLAY_HINT ""
set_parameter_property LINKWIDTH AFFECTS_GENERATION true
set_parameter_property LINKWIDTH IS_HDL_PARAMETER false
add_display_item "General" LINKWIDTH PARAMETER

add_parameter METALEN INTEGER 10
set_parameter_property METALEN DISPLAY_NAME "Metaframe length"
set_parameter_property METALEN ALLOWED_RANGES 1:8191
set_parameter_property METALEN DISPLAY_HINT ""
set_parameter_property METALEN AFFECTS_GENERATION true
set_parameter_property METALEN IS_HDL_PARAMETER false
add_display_item "General" METALEN PARAMETER

add_parameter EXTRA_SIGS INTEGER 1
set_parameter_property EXTRA_SIGS DISPLAY_NAME "Extra signals"
set_parameter_property EXTRA_SIGS ALLOWED_RANGES 0:1
set_parameter_property EXTRA_SIGS DISPLAY_HINT ""
set_parameter_property EXTRA_SIGS AFFECTS_ELABORATION true
set_parameter_property EXTRA_SIGS AFFECTS_GENERATION true
set_parameter_property EXTRA_SIGS IS_HDL_PARAMETER false

# | 
# +-----------------------------------

# clock sources!
add_instance mgmt_clk clock_source
set_instance_parameter mgmt_clk clockFrequency "50000000"
set_instance_parameter mgmt_clk clockFrequencyKnown "true"
add_interface mgmt_clk clock end
set_interface_property mgmt_clk export_of mgmt_clk.clk_in
add_interface mgmt_clk_reset reset end
set_interface_property mgmt_clk_reset export_of mgmt_clk.clk_in_reset



add_instance pll_ref_clk clock_source
set_instance_parameter pll_ref_clk clockFrequency "312500000"
set_instance_parameter pll_ref_clk clockFrequencyKnown "true"
add_interface pll_ref_clk clock end
set_interface_property pll_ref_clk export_of pll_ref_clk.clk_in
add_interface pll_ref_clk_reset reset end
set_interface_property pll_ref_clk_reset export_of pll_ref_clk.clk_in_reset


# avalon-mm bridge
add_instance pma_bridge amm_bridge
set_instance_parameter pma_bridge NUM_MASTERS 1
set_instance_parameter pma_bridge ADDR_W 6
set_instance_parameter pma_bridge ADDR_B 3
set_instance_parameter pma_bridge DATA_W 32
set_instance_parameter pma_bridge INDIRECT_ADDRESSING "TRUE"
add_interface pma_mgmt avalon end
set_interface_property pma_mgmt export_of pma_bridge.avalon_slave

add_instance pcs_bridge amm_bridge
set_instance_parameter pcs_bridge NUM_MASTERS 4
set_instance_parameter pcs_bridge ADDR_W 5
set_instance_parameter pcs_bridge ADDR_B 2
set_instance_parameter pcs_bridge DATA_W 32
set_instance_parameter pcs_bridge INDIRECT_ADDRESSING "TRUE"
add_interface pcs_mgmt avalon end
set_interface_property pcs_mgmt export_of pcs_bridge.avalon_slave

# avalon-st join/split


# conduit join/split
add_instance serial_sj ac_sj
set_instance_parameter serial_sj NUM_OUTPUTS 2

# pma controller
add_instance all_pma_controllers alt_pma_controller
set_instance_parameter all_pma_controllers number_of_plls 1
set_instance_parameter all_pma_controllers sync_depth 3

add_interface pma_ctrl avalon end
set_interface_property pma_ctrl export_of all_pma_controllers.pma_mgmt

add_instance gx_pdn_splitter astac_op
set_instance_parameter gx_pdn_splitter N_TERM 1
set_instance_parameter gx_pdn_splitter N_TYPE "avalon_streaming"
set_instance_parameter gx_pdn_splitter N_OP "split"
add_connection all_pma_controllers.gx_pdn/gx_pdn_splitter.sink0
add_connection mgmt_clk.clk/gx_pdn_splitter.clock

add_instance cal_blk_pdn_splitter astac_op
set_instance_parameter cal_blk_pdn_splitter N_TERM 1
set_instance_parameter cal_blk_pdn_splitter N_TYPE "avalon_streaming"
set_instance_parameter cal_blk_pdn_splitter N_OP "split"
add_connection all_pma_controllers.cal_blk_pdn/cal_blk_pdn_splitter.sink0
add_connection mgmt_clk.clk/cal_blk_pdn_splitter.clock

# reconfig module
add_instance all_reconfig_basics alt_xcvr_reconfig_basic
set_instance_parameter all_reconfig_basics number_of_reconfig_interfaces 1
add_interface reconfig_basic avalon end
set_interface_property reconfig_basic ENABLED true
set_interface_property reconfig_basic EXPORT_OF all_reconfig_basics.avalon_slave_0
add_interface reconfig_int interrupt end
set_interface_property reconfig_int ENABLED true
set_interface_property reconfig_int EXPORT_OF all_reconfig_basics.interrupt_sender

add_instance togxb_splitter astac_op
set_instance_parameter togxb_splitter N_TERM 1
set_instance_parameter togxb_splitter N_TYPE "avalon_streaming"
set_instance_parameter togxb_splitter N_OP "split"
set_instance_parameter togxb_splitter dataBitsPerSymbol 4
add_connection all_reconfig_basics.reconfig_togxb_data/togxb_splitter.sink0
add_connection mgmt_clk.clk/togxb_splitter.clock


proc add_connection_log { conn } {
	add_connection $conn
	#send_message 1 $conn
}

# clock connections for the common modules
add_connection_log mgmt_clk.clk/all_pma_controllers.cal_clk
add_connection_log mgmt_clk.clk/all_reconfig_basics.clock_reset
add_connection_log mgmt_clk.clk/all_pma_controllers.mgmt_clk
add_connection_log mgmt_clk.clk/pcs_bridge.clock
add_connection_log mgmt_clk.clk/pma_bridge.clock

#add_connection_log mgmt_clk.clk_reset/all_pma_controllers.mgmt_clk_reset
#add_connection_log mgmt_clk.clk_reset/all_reconfig_basics.clock_reset_reset



add_instance alt_pma_0 alt_pma
set props { DISPLAY_NAME WIDTH VISIBLE ENABLED UNITS DISPLAY_HINT DESCRIPTION ALLOWED_RANGES }
set pma_params [get_instance_parameters alt_pma_0]
foreach param $pma_params {
	set param_group [get_instance_parameter_property alt_pma_0 $param GROUP]
	set param_type [get_instance_parameter_property alt_pma_0 $param TYPE]
	set param_default [get_instance_parameter_property alt_pma_0 $param DEFAULT_VALUE]
	if { [string equal $param_group "Analog Options"] == 1 } {
		add_parameter $param $param_type $param_default
		set_parameter_property $param AFFECTS_GENERATION true
		set_parameter_property $param HDL_PARAMETER false
		foreach prop $props {
			if { [string equal $param_type "BOOLEAN"] != 1 || [string equal $prop "ALLOWED_RANGES"] != 1 } {
				set_parameter_property $param $prop [get_instance_parameter_property alt_pma_0 $param $prop]
			}
		}
		add_display_item "Analog Options" $param PARAMETER
	}
}



proc add_channel { ch tot_ch tot_pma } {
	set mode [get_parameter_value PLEX]
	set xtras [get_parameter_value EXTRA_SIGS]
	set rx_width 66
	if { $xtras == 1 } {
		set rx_width 69
	}
	set pma_slave [expr "2 + 2 * $ch"]
	set pcs_slave [expr "2 + $tot_pma + $ch"]
		
	add_instance alt_interlaken_pcs_${ch} alt_interlaken_pcs_ae
	set_instance_parameter alt_interlaken_pcs_${ch} PLEX $mode
	set_instance_parameter alt_interlaken_pcs_${ch} PMADWIDTH 20
	set_instance_parameter alt_interlaken_pcs_${ch} CH_INDEX $ch
	set_instance_parameter alt_interlaken_pcs_${ch} EXTRA_SIGS $xtras
	add_connection mgmt_clk.clk alt_interlaken_pcs_${ch}.mgmt_clk clock
	add_connection pcs_bridge.avalon_master${ch} alt_interlaken_pcs_${ch}.pcs_mgmt avalon

	#add_connection_log mgmt_clk.clk_reset/alt_interlaken_pcs_${ch}.mgmt_clk_reset

	if { [expr {$mode != "RX"}] } {
		add_connection alt_interlaken_pcs_${ch}.tx_pcs_ready tx_pcs_resets.sink${ch} avalon_streaming
		add_connection tx_split.split_out${ch} alt_interlaken_pcs_${ch}.tx_datain avalon_streaming

		add_instance ast_pmareg_tx_$ch ast_pmareg
		set_instance_parameter ast_pmareg_tx_$ch DATA_W 20
		set_instance_parameter ast_pmareg_tx_$ch CLK_NEGEDGE 0
		set_instance_parameter ast_pmareg_tx_$ch ADD_TIMING 0

		add_instance ast_pmareg_tx2_$ch ast_pmareg
		set_instance_parameter ast_pmareg_tx2_$ch DATA_W 20
		set_instance_parameter ast_pmareg_tx2_$ch CLK_NEGEDGE 1

		add_instance ast_synchronizer_tx_$ch ast_synchronizer
		set_instance_parameter ast_synchronizer_tx_$ch DAT_WIDTH 20
		set_instance_parameter ast_synchronizer_tx_$ch ENABLE_WRITE_VALID 0
		set_instance_parameter ast_synchronizer_tx_$ch ENABLE_WRITE_READY 0
		set_instance_parameter ast_synchronizer_tx_$ch ENABLE_READ_VALID 0
		set_instance_parameter ast_synchronizer_tx_$ch ENABLE_READ_READY 0
	}

	if { [expr {$mode != "TX"}] } {
		add_connection alt_interlaken_pcs_${ch}.rx_pcs_ready rx_pcs_resets.sink${ch} avalon_streaming

		add_instance ast_pmareg_rx_$ch ast_pmareg
		set_instance_parameter ast_pmareg_rx_$ch DATA_W 20
		set_instance_parameter ast_pmareg_rx_$ch CLK_NEGEDGE 0

		add_instance ast_pmareg_rx2_$ch ast_pmareg
		set_instance_parameter ast_pmareg_rx2_$ch DATA_W 20
		set_instance_parameter ast_pmareg_rx2_$ch CLK_NEGEDGE 0
		set_instance_parameter ast_pmareg_rx2_$ch ADD_TIMING 0
		
		add_instance ast_synchronizer_rxpma_$ch ast_synchronizer
		set_instance_parameter ast_synchronizer_rxpma_$ch DAT_WIDTH 20 
		set_instance_parameter ast_synchronizer_rxpma_$ch ENABLE_WRITE_VALID 0
		set_instance_parameter ast_synchronizer_rxpma_$ch ENABLE_WRITE_READY 0
		set_instance_parameter ast_synchronizer_rxpma_$ch ENABLE_READ_VALID 0
		set_instance_parameter ast_synchronizer_rxpma_$ch ENABLE_READ_READY 0
		
		add_instance ast_synchronizer_rx_$ch ast_synchronizer
		set_instance_parameter ast_synchronizer_rx_$ch DAT_WIDTH $rx_width 
		set_instance_parameter ast_synchronizer_rx_$ch ENABLE_WRITE_VALID 1
		set_instance_parameter ast_synchronizer_rx_$ch ENABLE_WRITE_READY 0
		set_instance_parameter ast_synchronizer_rx_$ch ENABLE_READ_VALID 1
		set_instance_parameter ast_synchronizer_rx_$ch ENABLE_READ_READY [get_parameter_value EXTRA_SIGS]

		add_connection ast_synchronizer_rx_${ch}.rd_data rx_join.join_in${ch} avalon_streaming
	}


	set pma_ch [expr $ch/5]
	set min_ch $ch
	if { $min_ch == 0 } {
		set min_ch 1
	}
	set pma_sofar [expr int(ceil($min_ch/5.0))]
	set pma_slave [expr "2 + $pma_ch"]
	set num_pma 5
	set pcs_ch [expr $ch%5]
	if { ($tot_ch < [expr $pma_sofar*5]) } {
		set num_pma [expr $tot_ch-($pma_ch*5)]
	}
	if { $pcs_ch == 0 } {
		if { $pma_ch > 0 } {
			add_instance alt_pma_$pma_ch alt_pma
		}
		#set_instance_parameter alt_pma_$pma_ch device_family "Stratix IV"
		set_instance_parameter alt_pma_$pma_ch number_of_channels $num_pma
		set_instance_parameter alt_pma_$pma_ch operation_mode $mode
		set_instance_parameter alt_pma_$pma_ch bonded_mode "FALSE"
		set_instance_parameter alt_pma_$pma_ch gui_support_reconfig "true"
		#set_instance_parameter alt_pma_$pma_ch number_of_reconfig_interface 1
		set_instance_parameter alt_pma_$pma_ch serialization_factor 20
		set_instance_parameter alt_pma_$pma_ch data_rate "6250 Mbps"
		set_instance_parameter alt_pma_$pma_ch pll_input_frequency "312.5 Mhz"
		set_instance_parameter alt_pma_$pma_ch gui_add_pll_pdn "true"
		set_instance_parameter alt_pma_$pma_ch gui_add_pll_locked "true"
		set_instance_parameter alt_pma_$pma_ch gui_add_rx_is_lockedtoref "false"
		set_instance_parameter alt_pma_$pma_ch gui_add_rx_is_lockedtodata "false"
		set_instance_parameter alt_pma_$pma_ch number_pll_inclks 1
		set_instance_parameter alt_pma_$pma_ch rx_use_cruclk "TRUE"
		set_instance_parameter alt_pma_$pma_ch starting_channel_number [expr "24 * $pma_ch"]

		add_connection mgmt_clk.clk alt_pma_${pma_ch}.reconfig_clk clock
		add_connection mgmt_clk.clk alt_pma_${pma_ch}.cal_blk_clk clock
		add_connection alt_pma_${pma_ch}.pll_locked all_pma_controllers.pll_locked${pma_ch} avalon_streaming
		add_connection all_pma_controllers.pll_pdn${pma_ch} alt_pma_${pma_ch}.pll_pdn avalon_streaming
		add_connection gx_pdn_splitter.source${pma_ch} alt_pma_${pma_ch}.gx_pdn avalon_streaming
		add_connection cal_blk_pdn_splitter.source${pma_ch} alt_pma_${pma_ch}.cal_blk_pdn avalon_streaming
		add_connection mgmt_clk.clk alt_pma_${pma_ch}.mgmt_clk clock
		add_connection pma_bridge.avalon_master${pma_ch} alt_pma_${pma_ch}.ch_mgmt avalon
		add_connection togxb_splitter.source${pma_ch} alt_pma_${pma_ch}.reconfig_to_gxb avalon_streaming

		#add_connection_log mgmt_clk.clk_reset/alt_pma_${pma_ch}.mgmt_clk_reset

		if { [expr {$mode != "RX"}] } {
			add_connection pll_ref_clk.clk alt_pma_${pma_ch}.pll_ref_clk0 clock

			add_instance tx_pma_ready_splitter_${pma_ch} astac_op
			set_instance_parameter tx_pma_ready_splitter_${pma_ch} N_TERM $num_pma
			set_instance_parameter tx_pma_ready_splitter_${pma_ch} N_TYPE "avalon_streaming"
			set_instance_parameter tx_pma_ready_splitter_${pma_ch} N_OP "split"
			add_connection alt_pma_${pma_ch}.tx_pma_ready tx_pma_ready_splitter_${pma_ch}.sink0 avalon_streaming
			add_connection mgmt_clk.clk tx_pma_ready_splitter_${pma_ch}.clock clock
		}
		if { [expr {$mode != "TX"}] } {
			add_instance rx_pma_ready_splitter_${pma_ch} astac_op
			set_instance_parameter rx_pma_ready_splitter_${pma_ch} N_TERM $num_pma
			set_instance_parameter rx_pma_ready_splitter_${pma_ch} N_TYPE "avalon_streaming"
			set_instance_parameter rx_pma_ready_splitter_${pma_ch} N_OP "split"
			add_connection alt_pma_${pma_ch}.rx_pma_ready rx_pma_ready_splitter_${pma_ch}.sink0 avalon_streaming
			add_connection mgmt_clk.clk rx_pma_ready_splitter_${pma_ch}.clock clock
		}
	}
	add_connection alt_pma_${pma_ch}.reconfig_from_gxb${pcs_ch} all_reconfig_basics.reconfig_fromgxb${ch}_st avalon_streaming

	if { [expr {$mode != "RX"}] } {
		add_connection alt_pma_${pma_ch}.tx_serial_data${pcs_ch} serial_sj.conduit_sigin${ch} conduit
		add_connection alt_pma_${pma_ch}.tx_out_clk${pcs_ch} ast_synchronizer_tx_${ch}.rd_clk clock
		add_connection alt_pma_${pma_ch}.tx_out_clk${pcs_ch} ast_pmareg_tx_${ch}.clock clock
		add_connection alt_pma_${pma_ch}.tx_out_clk${pcs_ch} ast_pmareg_tx2_${ch}.clock clock

		add_connection alt_interlaken_pcs_${ch}.tx_pma_dataout ast_synchronizer_tx_${ch}.wr_data avalon_streaming
		add_connection ast_synchronizer_tx_${ch}.rd_data ast_pmareg_tx_${ch}.datain avalon_streaming
		add_connection ast_pmareg_tx_${ch}.dataout ast_pmareg_tx2_${ch}.datain avalon_streaming
		add_connection ast_pmareg_tx2_${ch}.dataout alt_pma_${pma_ch}.tx_parallel_data${pcs_ch} avalon_streaming

		add_connection tx_pma_ready_splitter_${pma_ch}.source${pcs_ch} alt_interlaken_pcs_${ch}.tx_pma_ready avalon_streaming
	}
	if { [expr {$mode != "TX"}] } {
		add_connection pll_ref_clk.clk alt_pma_${pma_ch}.rx_cdr_ref_clk${pcs_ch} clock
		add_connection serial_sj.conduit_sigout${ch} alt_pma_${pma_ch}.rx_serial_data${pcs_ch} conduit
		add_connection alt_pma_${pma_ch}.rx_recovered_clk${pcs_ch} ast_synchronizer_rxpma_${ch}.wr_clk clock
		add_connection alt_pma_${pma_ch}.rx_recovered_clk${pcs_ch} ast_pmareg_rx_${ch}.clock clock
		add_connection alt_pma_${pma_ch}.rx_recovered_clk${pcs_ch} ast_pmareg_rx2_${ch}.clock clock
		#add_connection_log alt_pma_${pma_ch}.rx_recovered_clk${pcs_ch}/alt_interlaken_pcs_${ch}.rx_pma_clk

		add_connection alt_pma_${pma_ch}.rx_parallel_data${pcs_ch} ast_pmareg_rx_${ch}.datain avalon_streaming
		add_connection ast_pmareg_rx_${ch}.dataout ast_pmareg_rx2_${ch}.datain avalon_streaming
		add_connection ast_pmareg_rx2_${ch}.dataout ast_synchronizer_rxpma_${ch}.wr_data avalon_streaming
		add_connection ast_synchronizer_rxpma_${ch}.rd_data alt_interlaken_pcs_${ch}.rx_pma_datain avalon_streaming
		add_connection alt_interlaken_pcs_${ch}.rx_dataout ast_synchronizer_rx_${ch}.wr_data avalon_streaming

		add_connection rx_pma_ready_splitter_${pma_ch}.source${pcs_ch} alt_interlaken_pcs_${ch}.rx_pma_ready avalon_streaming
	}
}

proc alt_interlaken_pcs_siv_compose {} {
	set lw [get_parameter_value LINKWIDTH]
	set num_pma [expr int(ceil($lw/5.0))]
	set mode [get_parameter_value PLEX]
	set xtras [get_parameter_value EXTRA_SIGS]
	set rx_width 66
	if { $xtras == 1 } {
		set rx_width 69
	}

	set_instance_parameter pcs_bridge NUM_MASTERS $lw
	set_instance_parameter pma_bridge NUM_MASTERS $num_pma
	set_instance_parameter serial_sj NUM_OUTPUTS $lw
	set_instance_parameter all_pma_controllers number_of_plls $num_pma
	set_instance_parameter gx_pdn_splitter N_TERM $num_pma
	set_instance_parameter cal_blk_pdn_splitter N_TERM $num_pma
	set_instance_parameter all_reconfig_basics number_of_reconfig_interfaces $lw


	for { set ch 0 } { $ch < $lw } { incr ch } {
		add_interface testbus$ch avalon_streaming start
		set_interface_property testbus$ch export_of all_reconfig_basics.testbus${ch}_st
	}

	if { [expr {$mode != "RX"}] } {
		add_interface tx_user_clk clock start
		set_interface_property tx_user_clk ENABLED true
		add_instance tx_clkout_src clock_source
		set_interface_property tx_user_clk export_of tx_clkout_src.clk

		add_instance tx_pcs_resets astac_op
		set_instance_parameter tx_pcs_resets N_TERM $lw
		set_instance_parameter tx_pcs_resets N_TYPE "avalon_streaming"
		set_instance_parameter tx_pcs_resets N_OP "and"
		add_connection mgmt_clk.clk/tx_pcs_resets.clock
		add_interface tx_pcs_ready avalon_streaming start
		set_interface_property tx_pcs_ready export_of tx_pcs_resets.source0

		add_instance tx_split ast_split
		set_instance_parameter tx_split NUM_OUTPUTS $lw
		set_instance_parameter tx_split DATA_W 65
		set_instance_parameter tx_split ENABLE_VALID 0
		set_instance_parameter tx_split ENABLE_READY 1

		add_interface tx_serial_data conduit start
		set_interface_property tx_serial_data export_of serial_sj.conduit_busout
	}
	if { [expr {$mode != "TX"}] } {
		add_interface rx_user_clk clock start
		set_interface_property rx_user_clk ENABLED true
		add_instance rx_clkout_src clock_source
		set_interface_property rx_user_clk export_of rx_clkout_src.clk

		add_instance rx_pcs_resets astac_op
		set_instance_parameter rx_pcs_resets N_TERM $lw
		set_instance_parameter rx_pcs_resets N_TYPE "avalon_streaming"
		set_instance_parameter rx_pcs_resets N_OP "and"
		add_connection mgmt_clk.clk/rx_pcs_resets.clock
		add_interface rx_pcs_ready avalon_streaming start
		set_interface_property rx_pcs_ready export_of rx_pcs_resets.source0

		add_instance rx_join ast_join
		set_instance_parameter rx_join NUM_OUTPUTS $lw
		set_instance_parameter rx_join DATA_W $rx_width
		set_instance_parameter rx_join ENABLE_VALID 1
		set_instance_parameter rx_join ENABLE_READY $xtras
		#add_interface rx_dataout avalon_streaming start
		#set_interface_property rx_dataout ENABLED true
		#set_interface_property rx_dataout export_of rx_join.metabus_out

		add_interface rx_serial_data conduit end
		set_interface_property rx_serial_data export_of serial_sj.conduit_busin
	}

	for { set ch 0 } { $ch < $lw } { incr ch } {
		add_channel $ch $lw $num_pma
	}

	set mid_ch [expr $lw/2]
	set mid_pma [expr $mid_ch/5]
	set mid_pma_ch [expr $mid_ch%5]

	if { [expr {$mode != "RX"}] } {
		add_connection alt_pma_${mid_pma}.tx_out_clk${mid_pma_ch} tx_split.clock clock
		add_connection alt_pma_${mid_pma}.tx_out_clk${mid_pma_ch} tx_clkout_src.clk_in clock
		#set_interface_property tx_user_clk export_of alt_pma_${mid_pma}.tx_out_clk${mid_pma_ch}

		add_interface tx_datain avalon_streaming end
		set_interface_property tx_datain ENABLED true
		set_interface_property tx_datain export_of tx_split.metabus_in
		add_interface tx_datain_bp avalon_streaming start
		set_interface_property tx_datain_bp ENABLED true
		set_interface_property tx_datain_bp export_of tx_split.metabus_back
	}
	if { [expr {$mode != "TX"}] } {
		add_connection alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch} rx_join.clock clock
		add_connection alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch} rx_clkout_src.clk_in clock
		#set_interface_property rx_user_clk export_of alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch}

		add_interface rx_dataout avalon_streaming start
		set_interface_property rx_dataout ENABLED true
		set_interface_property rx_dataout export_of rx_join.metabus_out
		if { $xtras == 1 } {
			add_interface rx_dataout_bp avalon_streaming end
			set_interface_property rx_dataout_bp ENABLED true
			set_interface_property rx_dataout_bp export_of rx_join.metabus_back
		}
	}

	for { set ch 0 } { $ch < $lw } { incr ch } {
		if { [expr {$mode != "RX"}] } {
			add_connection alt_pma_${mid_pma}.tx_out_clk${mid_pma_ch} alt_interlaken_pcs_${ch}.tx_pma_clk clock
			add_connection alt_pma_${mid_pma}.tx_out_clk${mid_pma_ch} ast_synchronizer_tx_${ch}.wr_clk clock
		}
		if { [expr {$mode != "TX"}] } {
			add_connection alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch} alt_interlaken_pcs_${ch}.rx_pma_clk clock
			add_connection alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch} ast_synchronizer_rxpma_${ch}.rd_clk clock
			add_connection alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch} ast_synchronizer_rx_${ch}.rd_clk clock
			add_connection alt_pma_${mid_pma}.rx_recovered_clk${mid_pma_ch} ast_synchronizer_rx_${ch}.wr_clk clock
		}
	}

	set lr [get_parameter_value LANERATE]
	set ilr [string range $lr 0 3]
	set true_freq [format "%f Mhz" [expr "$ilr / 20.0"]]
	for { set ch 0 } { $ch < $lw } { incr ch } {
		set pma_ch [expr $ch/5]
		set_instance_parameter alt_pma_${pma_ch} data_rate $lr
		set_instance_parameter alt_pma_${pma_ch} pll_input_frequency $true_freq
		set_instance_parameter alt_interlaken_pcs_${ch} METALEN [get_parameter_value METALEN]

		set this_params [get_parameters]
		foreach this_param $this_params {
			set param_group [get_parameter_property $this_param GROUP]
			if { [string equal $param_group "Analog Options"] == 1 } {
				set_instance_parameter alt_pma_$pma_ch $this_param [get_parameter_value $this_param]
			}
		}
	}
}

