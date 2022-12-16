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


####################################################################################
#
# SerialLite III Streaming Demo Timing Constraints
#
####################################################################################


#
# Clock constraints
#

# Reference clock to transceivers.
create_clock -period "644.53125 MHz" -name pll_ref_clk [get_ports pll_ref_clk]

# Management clock driving the Nios demo_ctrl module.
create_clock -period "100 MHz" -name mgmt_clk [get_ports mgmt_clk]

# Clocks generated by the PLL.
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty


#
# Timing exceptions
#
set_false_path -from {seriallite_iii_streaming:seriallite_iii_streaming|interlaken_phy_ip_duplex:interlaken_phy_ip_duplex|altera_xcvr_interlaken:interlaken_phy_ip_duplex_inst|sv_xcvr_interlaken_nr:sv_ilk_inst|altera_xcvr_reset_control:reset_controller|alt_xcvr_reset_counter:g_tx.g_tx[0].g_tx.counter_tx_digitalreset|r_reset} 
set_false_path -from {seriallite_iii_streaming:seriallite_iii_streaming|interlaken_phy_ip_duplex:interlaken_phy_ip_duplex|altera_xcvr_interlaken:interlaken_phy_ip_duplex_inst|sv_xcvr_interlaken_nr:sv_ilk_inst|altera_xcvr_reset_control:reset_controller|alt_xcvr_reset_counter:g_rx.g_rx[0].g_rx.counter_rx_ready|r_reset}

# Only Applicable in ACS demo design - asynchronous clocking between internal clocks and source user clock
set_clock_groups -asynchronous -group [get_clocks *clk90b] -group [get_clocks *src_user_clock_pll|general[0].gpll~PLL_OUTPUT_COUNTER|divclk]
set_clock_groups -asynchronous -group [get_clocks *txclkout] -group [get_clocks *src_user_clock_pll|general[0].gpll~PLL_OUTPUT_COUNTER|divclk]
set_clock_groups -asynchronous -group [get_clocks *tx_pma_ch.tx_cgb|pclk*] -group [get_clocks *src_user_clock_pll|general[0].gpll~PLL_OUTPUT_COUNTER|divclk]

# Only applicable in ACS - false path in source ppm absorption fifo
set_false_path -from {*source_absorber:source_ppm_absorption|dcfifo:lane_fifo|dcfifo*rdaclr|dffe*} -to {*source_absorber:source_ppm_absorption|dcfifo*}


# Only Applicable in SCS
set_clock_groups -asynchronous -group [get_clocks *clk90b] -group [get_clocks *altera_pll_i|general*.gpll~PLL_OUTPUT_COUNTER|divclk]

#set_false_path -to [get_keepers *sld_signaltap*]
set_false_path -from [get_registers {*tx_from_fifo*}] -through {*txbursten*} -to {*10g_tx_pcs*SYNC_DATA_REG*}

# False path from CPU address to sink capture register
set_false_path -from {demo_control:demo_control|demo_control_nios2_qsys_0:nios2_qsys_0|W_alu_result*} -to {demo_mgmt:demo_mgmt|sink_csr_capture*}

# False path from sink capture register to read data register
set_false_path -from {demo_mgmt:demo_mgmt|sink_csr_capture*} -to {demo_mgmt:demo_mgmt|demo_mgmt_readdata*}

# False path from CPU address to source capture register
set_false_path -from {demo_control:demo_control|demo_control_nios2_qsys_0:nios2_qsys_0|W_alu_result*} -to {demo_mgmt:demo_mgmt|source_csr_capture*}

# False path from source capture register to read data register
set_false_path -from {demo_mgmt:demo_mgmt|source_csr_capture*} -to {demo_mgmt:demo_mgmt|demo_mgmt_readdata*}

# False path from demo_mgmt demo_ctrl_stat_csr bit 0, which drives core_reset on the transmit side
set_false_path -from {demo_mgmt:demo_mgmt|demo_ctrl_stat_csr[0]}

# False path from demo_mgmt demo_ctrl_stat_csr bit 1, which drives core_reset on the recieve side
set_false_path -from {demo_mgmt:demo_mgmt|demo_ctrl_stat_csr[1]}

# False path from demo_mgmt reset stretching signals, that drive resets on the source/sink modules
set_false_path -from {demo_mgmt:demo_mgmt|count_stretch_snk_reset*}
set_false_path -from {demo_mgmt:demo_mgmt|count_stretch_src_reset*}


# False path from reset state machine in sink clock generator to async reset on user_clock reset synchronizer - Applicable in SCS
set_false_path -from {*sink_clock_gen:sink_clock_gen|presync_user_clock_reset} -to {*sink_clock_gen:sink_clock_gen|dp_sync:user_clock_reset_sync|dp_sync_regstage:dp_sync_stage_2|o[0]}

# False path from reset state machine in source clock generator to async reset on user_clock reset synchronizer - Applicable in SCS
set_false_path -from {*source_clock_gen:source_clock_gen|presync_user_clock_reset} -to {*source_clock_gen:source_clock_gen|dp_sync:user_clock_reset_sync|dp_sync_regstage:dp_sync_stage_2|o[0]}

# Applicable in SCS only
set_false_path -from {seriallite_iii_streaming:seriallite_iii_streaming|source_clock_gen:source_clock_gen|dp_sync:user_clock_reset_sync|dp_sync_regstage:dp_sync_stage_2|o[0]}

# False paths for altera reset controller
set_false_path -to [get_pins -compatibility_mode -nocase *|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn]
set_false_path -to {seriallite_iii_streaming:seriallite_iii_streaming|interlaken_phy_ip_duplex:interlaken_phy_ip_duplex|altera_xcvr_interlaken:interlaken_phy_ip_duplex_inst|sv_xcvr_interlaken_nr:sv_ilk_inst|sv_xcvr_interlaken_native:bonded_lane_inst|altera_std_synchronizer:ctrlsync[0].stdsync_txpempty|dreg[0]}

# False Paths from Sink Lane Alignment logic
set_false_path -from {*sink_alignment:sink_alignment|rx_purge}

# Disable timing checks for LED outputs
set_false_path -to [get_ports tx_activity_n]
set_false_path -to [get_ports rx_activity_n]
set_false_path -to [get_ports src_core_reset_n]
set_false_path -to [get_ports snk_core_reset_n]
set_false_path -to [get_ports src_link_up_n]
set_false_path -to [get_ports snk_link_up_n]

# False path to synchronizer inputs
set_false_path -to [get_cells -compatibility *dp_sync_stage_1|o[*]]
set_false_path -to {*inst_reset_sync|resync_chains[0].sync_r*}
set_false_path -to {*inst_reconfig_reset_sync|resync_chains[0].sync_r*}

# Only applicable in SCS - False paths for reset synchronizer (from user clock to core clock) 
set_false_path -from {*sink_clock_gen|dp_sync:user_clock_reset_sync|dp_sync_regstage:dp_sync_stage*} -to {*sink_adaptation_module_lane_logic:lane_logic_inst*.lane_logic|dp_sync:iclk_reset_sync|dp_sync_regstage*}
set_false_path -from {*sink_adaptation_module_lane_logic:lane_logic_inst*.lane_logic|dp_sync:iclk_reset_sync|dp_sync_regstage*}

# Only applicable in ACS
set_false_path -from {*altera_xcvr_reset_control:reset_controller|alt_xcvr_reset_counter:g_rx.g_rx[0].g_rx.counter_rx_ready|r_reset} -to {*interface_clk_reset_sync|dp_sync_regstage:dp_sync_stage_2*}

# Demo Control Reset
set_false_path -from {demo_control:demo_control|altera_reset_controller:rst_controller|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out}
