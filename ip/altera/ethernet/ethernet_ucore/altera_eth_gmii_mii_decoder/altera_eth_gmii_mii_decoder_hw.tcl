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
# Mon Dec 03 13:50:19 MYT 2012
# DO NOT MODIFY


# 
# altera_eth_gmii_mii_decoder "altera_eth_gmii_mii_decoder" v100.99.98.97
# null 2012.12.03.13:50:19
# 
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module altera_eth_gmii_mii_decoder
# 
set_module_property NAME altera_eth_gmii_mii_decoder
set_module_property VERSION 13.1
set_module_property INTERNAL true
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Interface Protocols/Ethernet/Submodules"
set_module_property DISPLAY_NAME altera_eth_gmii_mii_decoder
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property ELABORATION_CALLBACK elaborate
set_module_property EDITABLE true
set_module_property ANALYZE_HDL false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH q_synth ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL altera_eth_gmii_mii_decoder
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false

proc q_synth {name} {
    set enable_timestamping [ get_parameter_value ENABLE_TIMESTAMPING ]
    
    add_fileset_file altera_eth_gmii_mii_decoder.v VERILOG PATH altera_eth_gmii_mii_decoder.v
    add_fileset_file altera_eth_gmii_mii_decoder_rx_if.v VERILOG PATH altera_eth_gmii_mii_decoder_rx_if.v
    add_fileset_file altera_eth_gmii_decoder_dfa.v VERILOG PATH altera_eth_gmii_decoder_dfa.v
    add_fileset_file altera_eth_gmii_decoder.v VERILOG PATH altera_eth_gmii_decoder.v
    add_fileset_file altera_avalon_dc_fifo.v VERILOG PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/sopc_builder_ip/altera_avalon_dc_fifo/altera_avalon_dc_fifo.v"
    add_fileset_file altera_dcfifo_synchronizer_bundle.v VERILOG PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/sopc_builder_ip/altera_avalon_dc_fifo/altera_dcfifo_synchronizer_bundle.v"
    if {$enable_timestamping} {
        add_fileset_file altera_tse_gmii_to_avst_if.v VERILOG PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii2avst_converter/altera_tse_gmii_to_avst_if.v"
        add_fileset_file altera_tse_tsu.v VERILOG PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii_tsu/altera_tse_tsu.v"
        add_fileset_file altera_tse_tsu.ocp OTHER PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii_tsu/altera_tse_tsu.ocp"
    }
}

# -----------------------------------
# IEEE encryption
# ----------------------------------- 
set HDL_LIB_DIR "../lib"

add_fileset simulation_verilog SIM_VERILOG sim_ver ""
set_fileset_property simulation_verilog TOP_LEVEL altera_eth_gmii_mii_decoder
set_fileset_property simulation_verilog ENABLE_RELATIVE_INCLUDE_PATHS false

add_fileset simulation_vhdl SIM_VHDL sim_ver ""
set_fileset_property simulation_vhdl TOP_LEVEL altera_eth_gmii_mii_decoder
set_fileset_property simulation_vhdl ENABLE_RELATIVE_INCLUDE_PATHS false



proc sim_ver {name} {
    set enable_timestamping [ get_parameter_value ENABLE_TIMESTAMPING ]
    
    if {1} {
        add_fileset_file mentor/altera_eth_gmii_mii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "mentor/altera_eth_gmii_mii_decoder.v" {MENTOR_SPECIFIC}
        add_fileset_file mentor/altera_eth_gmii_mii_decoder_rx_if.v SYSTEM_VERILOG_ENCRYPT PATH "mentor/altera_eth_gmii_mii_decoder_rx_if.v" {MENTOR_SPECIFIC}
        add_fileset_file mentor/altera_eth_gmii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "mentor/altera_eth_gmii_decoder.v" {MENTOR_SPECIFIC}
        add_fileset_file mentor/altera_eth_gmii_decoder_dfa.v VERILOG_ENCRYPT PATH "mentor/altera_eth_gmii_decoder_dfa.v" {MENTOR_SPECIFIC}
        if {$enable_timestamping} {
            add_fileset_file mentor/altera_tse_gmii_to_avst_if.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii2avst_converter/mentor/altera_tse_gmii_to_avst_if.v" {MENTOR_SPECIFIC}
            add_fileset_file mentor/altera_tse_tsu.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii_tsu/mentor/altera_tse_tsu.v" {MENTOR_SPECIFIC}
        }
    }
    if {1} {
        add_fileset_file aldec/altera_eth_gmii_mii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "aldec/altera_eth_gmii_mii_decoder.v" {ALDEC_SPECIFIC}
        add_fileset_file aldec/altera_eth_gmii_mii_decoder_rx_if.v SYSTEM_VERILOG_ENCRYPT PATH "aldec/altera_eth_gmii_mii_decoder_rx_if.v" {ALDEC_SPECIFIC}
        add_fileset_file aldec/altera_eth_gmii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "aldec/altera_eth_gmii_decoder.v" {ALDEC_SPECIFIC}
        add_fileset_file aldec/altera_eth_gmii_decoder_dfa.v VERILOG_ENCRYPT PATH "aldec/altera_eth_gmii_decoder_dfa.v" {ALDEC_SPECIFIC}
        if {$enable_timestamping} {
            add_fileset_file aldec/altera_tse_gmii_to_avst_if.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii2avst_converter/aldec/altera_tse_gmii_to_avst_if.v" {ALDEC_SPECIFIC}
            add_fileset_file aldec/altera_tse_tsu.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii_tsu/aldec/altera_tse_tsu.v" {ALDEC_SPECIFIC}
        }
    }
    if {0} {
        add_fileset_file cadence/altera_eth_gmii_mii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "cadence/altera_eth_gmii_mii_decoder.v" {CADENCE_SPECIFIC}
        add_fileset_file cadence/altera_eth_gmii_mii_decoder_rx_if.v SYSTEM_VERILOG_ENCRYPT PATH "cadence/altera_eth_gmii_mii_decoder_rx_if.v" {CADENCE_SPECIFIC}
        add_fileset_file cadence/altera_eth_gmii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "cadence/altera_eth_gmii_decoder.v" {CADENCE_SPECIFIC}
        add_fileset_file cadence/altera_eth_gmii_decoder_dfa.v VERILOG_ENCRYPT PATH "cadence/altera_eth_gmii_decoder_dfa.v" {CADENCE_SPECIFIC}
        if {$enable_timestamping} {
            add_fileset_file cadence/altera_tse_gmii_to_avst_if.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii2avst_converter/cadence/altera_tse_gmii_to_avst_if.v" {CADENCE_SPECIFIC}
            add_fileset_file cadence/altera_tse_tsu.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii_tsu/cadence/altera_tse_tsu.v" {CADENCE_SPECIFIC}
        }
    }
    if {0} {
        add_fileset_file synopsys/altera_eth_gmii_mii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "synopsys/altera_eth_gmii_mii_decoder.v" {SYNOPSYS_SPECIFIC}
        add_fileset_file synopsys/altera_eth_gmii_mii_decoder_rx_if.v SYSTEM_VERILOG_ENCRYPT PATH "synopsys/altera_eth_gmii_mii_decoder_rx_if.v" {SYNOPSYS_SPECIFIC}
        add_fileset_file synopsys/altera_eth_gmii_decoder.v SYSTEM_VERILOG_ENCRYPT PATH "synopsys/altera_eth_gmii_decoder.v" {SYNOPSYS_SPECIFIC}
        add_fileset_file synopsys/altera_eth_gmii_decoder_dfa.v VERILOG_ENCRYPT PATH "synopsys/altera_eth_gmii_decoder_dfa.v" {SYNOPSYS_SPECIFIC}
        if {$enable_timestamping} {
            add_fileset_file synopsys/altera_tse_gmii_to_avst_if.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii2avst_converter/synopsys/altera_tse_gmii_to_avst_if.v" {SYNOPSYS_SPECIFIC}
            add_fileset_file synopsys/altera_tse_tsu.v VERILOG_ENCRYPT PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/ethernet/ethernet_ucore/altera_eth_gmii_tsu/synopsys/altera_tse_tsu.v" {SYNOPSYS_SPECIFIC}
        }
    }
    add_fileset_file altera_avalon_dc_fifo.v VERILOG PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/sopc_builder_ip/altera_avalon_dc_fifo/altera_avalon_dc_fifo.v"
    add_fileset_file altera_dcfifo_synchronizer_bundle.v VERILOG PATH "$::env(QUARTUS_ROOTDIR)/../ip/altera/sopc_builder_ip/altera_avalon_dc_fifo/altera_dcfifo_synchronizer_bundle.v"

    
}

# 
# parameters
# 
add_parameter W_GMII_WIDTH INTEGER 8
set_parameter_property W_GMII_WIDTH DEFAULT_VALUE 8
set_parameter_property W_GMII_WIDTH DISPLAY_NAME W_GMII_WIDTH
set_parameter_property W_GMII_WIDTH TYPE INTEGER
set_parameter_property W_GMII_WIDTH UNITS None
set_parameter_property W_GMII_WIDTH ALLOWED_RANGES 1:256
set_parameter_property W_GMII_WIDTH HDL_PARAMETER true
add_parameter BITSPERSYMBOL INTEGER 8 ""
set_parameter_property BITSPERSYMBOL DEFAULT_VALUE 8
set_parameter_property BITSPERSYMBOL DISPLAY_NAME BITSPERSYMBOL
set_parameter_property BITSPERSYMBOL WIDTH ""
set_parameter_property BITSPERSYMBOL TYPE INTEGER
set_parameter_property BITSPERSYMBOL ENABLED true
set_parameter_property BITSPERSYMBOL UNITS None
set_parameter_property BITSPERSYMBOL ALLOWED_RANGES 1:256
set_parameter_property BITSPERSYMBOL DESCRIPTION ""
set_parameter_property BITSPERSYMBOL AFFECTS_GENERATION false
set_parameter_property BITSPERSYMBOL HDL_PARAMETER true
add_parameter SYMBOLSPERBEAT INTEGER 8 ""
set_parameter_property SYMBOLSPERBEAT DEFAULT_VALUE 8
set_parameter_property SYMBOLSPERBEAT DISPLAY_NAME SYMBOLSPERBEAT
set_parameter_property SYMBOLSPERBEAT WIDTH ""
set_parameter_property SYMBOLSPERBEAT TYPE INTEGER
set_parameter_property SYMBOLSPERBEAT ENABLED true
set_parameter_property SYMBOLSPERBEAT UNITS None
set_parameter_property SYMBOLSPERBEAT ALLOWED_RANGES 1:256
set_parameter_property SYMBOLSPERBEAT DESCRIPTION ""
set_parameter_property SYMBOLSPERBEAT AFFECTS_GENERATION false
set_parameter_property SYMBOLSPERBEAT HDL_PARAMETER true
add_parameter SYNCHRONIZER_DEPTH INTEGER 3
set_parameter_property SYNCHRONIZER_DEPTH DEFAULT_VALUE 3
set_parameter_property SYNCHRONIZER_DEPTH DISPLAY_NAME SYNCHRONIZER_DEPTH
set_parameter_property SYNCHRONIZER_DEPTH TYPE INTEGER
set_parameter_property SYNCHRONIZER_DEPTH UNITS None
set_parameter_property SYNCHRONIZER_DEPTH ALLOWED_RANGES 1:256
set_parameter_property SYNCHRONIZER_DEPTH HDL_PARAMETER true
add_parameter QUAD_SPEED_ENA INTEGER 0
set_parameter_property QUAD_SPEED_ENA DEFAULT_VALUE 0
set_parameter_property QUAD_SPEED_ENA DISPLAY_NAME QUAD_SPEED_ENA
set_parameter_property QUAD_SPEED_ENA TYPE INTEGER
set_parameter_property QUAD_SPEED_ENA UNITS None
set_parameter_property QUAD_SPEED_ENA ALLOWED_RANGES 0:1
set_parameter_property QUAD_SPEED_ENA HDL_PARAMETER true

add_parameter ENABLE_TIMESTAMPING INTEGER 0
set_parameter_property ENABLE_TIMESTAMPING DISPLAY_NAME "Enable time stamping"
set_parameter_property ENABLE_TIMESTAMPING DISPLAY_HINT boolean
set_parameter_property ENABLE_TIMESTAMPING DESCRIPTION "Instantiate time stamping component"
set_parameter_property ENABLE_TIMESTAMPING IS_HDL_PARAMETER true
set_parameter_property ENABLE_TIMESTAMPING VISIBLE true

add_parameter INTERNAL_PATH_DELAY_CYCLE_1000 INTEGER 0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_1000 DISPLAY_NAME INTERNAL_PATH_DELAY_CYCLE_1000
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_1000 UNITS None
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_1000 DISPLAY_HINT ""
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_1000 AFFECTS_GENERATION false
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_1000 IS_HDL_PARAMETER true
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_1000 ALLOWED_RANGES 0:31

add_parameter INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 INTEGER 0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 DISPLAY_NAME INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 UNITS None
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 DISPLAY_HINT ""
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 AFFECTS_GENERATION false
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 IS_HDL_PARAMETER true
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_0 ALLOWED_RANGES 0:512

add_parameter INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 INTEGER 0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 DISPLAY_NAME INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 UNITS None
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 DISPLAY_HINT ""
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 AFFECTS_GENERATION false
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 IS_HDL_PARAMETER true
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_100_ALIGN_1 ALLOWED_RANGES 0:512

add_parameter INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 INTEGER 0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 DISPLAY_NAME INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 UNITS None
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 DISPLAY_HINT ""
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 AFFECTS_GENERATION false
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 IS_HDL_PARAMETER true
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_0 ALLOWED_RANGES 0:512

add_parameter INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 INTEGER 0
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 DISPLAY_NAME INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 UNITS None
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 DISPLAY_HINT ""
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 AFFECTS_GENERATION false
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 IS_HDL_PARAMETER true
set_parameter_property INTERNAL_PATH_DELAY_CYCLE_10_ALIGN_1 ALLOWED_RANGES 0:512

# 
# display items
# 


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clk_mac
set_interface_property avalon_streaming_source associatedReset reset_mac
set_interface_property avalon_streaming_source dataBitsPerSymbol 8
set_interface_property avalon_streaming_source symbolsPerBeat 8
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true

add_interface_port avalon_streaming_source rxdata_src_eop endofpacket Output 1
add_interface_port avalon_streaming_source rxdata_src_valid valid Output 1
add_interface_port avalon_streaming_source rxdata_src_data data Output 64
add_interface_port avalon_streaming_source rxdata_src_error error Output 1
add_interface_port avalon_streaming_source rxdata_src_empty empty Output 3
add_interface_port avalon_streaming_source rxdata_src_sop startofpacket Output 1


# 
# connection point clk_gmii
# 
add_interface clk_gmii clock end
set_interface_property clk_gmii clockRate 0
set_interface_property clk_gmii ENABLED true

add_interface_port clk_gmii clk_gmii clk Input 1


# 
# connection point clk_mac
# 
add_interface clk_mac clock end
set_interface_property clk_mac clockRate 0
set_interface_property clk_mac ENABLED true

add_interface_port clk_mac clk_mac clk Input 1


# 
# connection point speed_mii_gmii_bar
# 
add_interface speed_sel conduit end
set_interface_property speed_sel associatedClock ""
set_interface_property speed_sel associatedReset ""
set_interface_property speed_sel ENABLED true

add_interface_port speed_sel speed_sel export Input 2


# 
# connection point rx_clkena
# 
add_interface rx_clkena conduit end
set_interface_property rx_clkena associatedClock ""
set_interface_property rx_clkena associatedReset ""
set_interface_property rx_clkena ENABLED true

add_interface_port rx_clkena rx_clkena export Input 1


# 
# connection point rx_clkena_half_rate
# 
add_interface rx_clkena_half_rate conduit end
set_interface_property rx_clkena_half_rate associatedClock ""
set_interface_property rx_clkena_half_rate associatedReset ""
set_interface_property rx_clkena_half_rate ENABLED true

add_interface_port rx_clkena_half_rate rx_clkena_half_rate export Input 1


# 
# connection point gmii_sink_data
# 
add_interface gmii_sink_data conduit end
set_interface_property gmii_sink_data associatedClock ""
set_interface_property gmii_sink_data associatedReset ""
set_interface_property gmii_sink_data ENABLED true

add_interface_port gmii_sink_data gmii_sink_data export Input 8


# 
# connection point gmii_sink_control
# 
add_interface gmii_sink_control conduit end
set_interface_property gmii_sink_control associatedClock ""
set_interface_property gmii_sink_control associatedReset ""
set_interface_property gmii_sink_control ENABLED true

add_interface_port gmii_sink_control gmii_sink_control export Input 1


# 
# connection point gmii_sink_error
# 
add_interface gmii_sink_error conduit end
set_interface_property gmii_sink_error associatedClock ""
set_interface_property gmii_sink_error associatedReset ""
set_interface_property gmii_sink_error ENABLED true

add_interface_port gmii_sink_error gmii_sink_error export Input 1


# 
# connection point mii_sink_data
# 
add_interface mii_sink_data conduit end
set_interface_property mii_sink_data associatedClock ""
set_interface_property mii_sink_data associatedReset ""
set_interface_property mii_sink_data ENABLED true

add_interface_port mii_sink_data mii_sink_data export Input 4


# 
# connection point mii_sink_control
# 
add_interface mii_sink_control conduit end
set_interface_property mii_sink_control associatedClock ""
set_interface_property mii_sink_control associatedReset ""
set_interface_property mii_sink_control ENABLED true

add_interface_port mii_sink_control mii_sink_control export Input 1


# 
# connection point mii_sink_error
# 
add_interface mii_sink_error conduit end
set_interface_property mii_sink_error associatedClock ""
set_interface_property mii_sink_error associatedReset ""
set_interface_property mii_sink_error ENABLED true

add_interface_port mii_sink_error mii_sink_error export Input 1


# 
# connection point reset_mac
# 
add_interface reset_mac reset end
set_interface_property reset_mac associatedClock clk_mac
set_interface_property reset_mac synchronousEdges DEASSERT
set_interface_property reset_mac ENABLED true

add_interface_port reset_mac reset_mac reset Input 1


# 
# connection point reset_gmii
# 
add_interface reset_gmii reset end
set_interface_property reset_gmii associatedClock clk_gmii
set_interface_property reset_gmii synchronousEdges DEASSERT
set_interface_property reset_gmii ENABLED true

add_interface_port reset_gmii reset_gmii reset Input 1

# +-----------------------------------
# | connection point path_delay
# | 
add_interface path_delay conduit end
set_interface_assignment path_delay "ui.blockdiagram.direction" Input
# set_interface_property path_delay dataBitsPerSymbol 12
# set_interface_property path_delay errorDescriptor ""
# set_interface_property path_delay maxChannel 0
# set_interface_property path_delay readyLatency 0
# set_interface_property path_delay symbolsPerBeat 1

set_interface_property path_delay ENABLED true

add_interface_port path_delay path_delay_data data Input 22
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point time_of_day_96b
# | role: time_of_day_96b
add_interface time_of_day_96b conduit end
set_interface_assignment time_of_day_96b "ui.blockdiagram.direction" Input
# set_interface_property time_of_day_96b dataBitsPerSymbol 96
# set_interface_property time_of_day_96b errorDescriptor ""
# set_interface_property time_of_day_96b maxChannel 0
# set_interface_property time_of_day_96b readyLatency 0
# set_interface_property time_of_day_96b symbolsPerBeat 1

set_interface_property time_of_day_96b ENABLED true

add_interface_port time_of_day_96b time_of_day_96b_data data Input 96
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point time_of_day_64b
# | role: time_of_day_64b
add_interface time_of_day_64b conduit end
set_interface_assignment time_of_day_64b "ui.blockdiagram.direction" Input
# set_interface_property time_of_day_64b dataBitsPerSymbol 64
# set_interface_property time_of_day_64b errorDescriptor ""
# set_interface_property time_of_day_64b maxChannel 0
# set_interface_property time_of_day_64b readyLatency 0
# set_interface_property time_of_day_64b symbolsPerBeat 1

set_interface_property time_of_day_64b ENABLED true

add_interface_port time_of_day_64b time_of_day_64b_data data Input 64
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point timestamp_96b
# | 
add_interface timestamp_96b avalon_streaming start
set_interface_property timestamp_96b dataBitsPerSymbol 96
set_interface_property timestamp_96b errorDescriptor ""
set_interface_property timestamp_96b maxChannel 0
set_interface_property timestamp_96b readyLatency 0
set_interface_property timestamp_96b symbolsPerBeat 1

set_interface_property timestamp_96b associatedClock clk_gmii
set_interface_property timestamp_96b associatedReset reset_gmii
set_interface_property timestamp_96b ENABLED true

add_interface_port timestamp_96b timestamp_96b_valid valid Output 1
add_interface_port timestamp_96b timestamp_96b_data data Output 96
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point timestamp_64b
# | 
add_interface timestamp_64b avalon_streaming start
set_interface_property timestamp_64b dataBitsPerSymbol 64
set_interface_property timestamp_64b errorDescriptor ""
set_interface_property timestamp_64b maxChannel 0
set_interface_property timestamp_64b readyLatency 0
set_interface_property timestamp_64b symbolsPerBeat 1

set_interface_property timestamp_64b associatedClock clk_gmii
set_interface_property timestamp_64b associatedReset reset_gmii
set_interface_property timestamp_64b ENABLED true

add_interface_port timestamp_64b timestamp_64b_valid valid Output 1
add_interface_port timestamp_64b timestamp_64b_data data Output 64
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point period_ns_fns
# | 
add_interface period_ns_fns avalon_streaming end
set_interface_property period_ns_fns dataBitsPerSymbol 20
set_interface_property period_ns_fns errorDescriptor ""
set_interface_property period_ns_fns maxChannel 0
set_interface_property period_ns_fns readyLatency 0
set_interface_property period_ns_fns symbolsPerBeat 1

set_interface_property period_ns_fns associatedClock clk_gmii
set_interface_property period_ns_fns associatedReset reset_gmii
set_interface_property period_ns_fns ENABLED true

add_interface_port period_ns_fns csr_period data Input 20
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point adjust_ns_fns
# | 
add_interface adjust_ns_fns avalon_streaming end
set_interface_property adjust_ns_fns dataBitsPerSymbol 32
set_interface_property adjust_ns_fns errorDescriptor ""
set_interface_property adjust_ns_fns maxChannel 0
set_interface_property adjust_ns_fns readyLatency 0
set_interface_property adjust_ns_fns symbolsPerBeat 1

set_interface_property adjust_ns_fns associatedClock clk_gmii
set_interface_property adjust_ns_fns associatedReset reset_gmii
set_interface_property adjust_ns_fns ENABLED true

add_interface_port adjust_ns_fns csr_adjust data Input 32
# | 
# +-----------------------------------

proc elaborate {} {

  set symbols_per_beat [ get_parameter_value SYMBOLSPERBEAT ]
  set bits_per_symbol [ get_parameter_value BITSPERSYMBOL ]
  
  set_interface_property avalon_streaming_source dataBitsPerSymbol $bits_per_symbol
  set_interface_property avalon_streaming_source symbolsPerBeat $symbols_per_beat
  
  set data_width [ expr $symbols_per_beat * $bits_per_symbol ]
  set_port_property rxdata_src_data WIDTH_EXPR $data_width
  
  set empty_width [ expr int(ceil(log($symbols_per_beat) / log(2))) ]
  set_port_property rxdata_src_empty WIDTH_EXPR $empty_width
  
   set QUAD_SPEED_ENA 						    [ get_parameter_value QUAD_SPEED_ENA ]
  
  set enable_timestamping [ get_parameter_value ENABLE_TIMESTAMPING ]
  
  if {$QUAD_SPEED_ENA == 0} {
        # 
        # connection point sel
        # 

        set_port_property mii_sink_control TERMINATION true
        set_port_property mii_sink_control TERMINATION_VALUE 0 
        
        set_port_property mii_sink_error TERMINATION true
        set_port_property mii_sink_error TERMINATION_VALUE 0 
        
        set_port_property mii_sink_data TERMINATION true
        set_port_property mii_sink_data TERMINATION_VALUE 0 
                      
        set_port_property rx_clkena TERMINATION true
        set_port_property rx_clkena TERMINATION_VALUE 1 
        
        set_port_property rx_clkena_half_rate TERMINATION true
        set_port_property rx_clkena_half_rate TERMINATION_VALUE 1
        # 
    }
    
    if {$enable_timestamping == 0} {
        set_interface_property path_delay ENABLED false
        set_port_property path_delay_data TERMINATION true
        set_port_property path_delay_data TERMINATION_VALUE 0
        
        set_interface_property time_of_day_96b ENABLED false
        set_port_property time_of_day_96b_data TERMINATION true
        set_port_property time_of_day_96b_data TERMINATION_VALUE 0
        
        set_interface_property time_of_day_64b ENABLED false
        set_port_property time_of_day_64b_data TERMINATION true
        set_port_property time_of_day_64b_data TERMINATION_VALUE 0
        
        set_interface_property timestamp_96b ENABLED false
        set_port_property timestamp_96b_valid TERMINATION true
        set_port_property timestamp_96b_data TERMINATION true
        
        set_interface_property timestamp_64b ENABLED false
        set_port_property timestamp_64b_valid TERMINATION true
        set_port_property timestamp_64b_data TERMINATION true
        
        set_interface_property period_ns_fns ENABLED false
        set_port_property csr_period TERMINATION true
        set_port_property csr_period TERMINATION_VALUE 0
        
        set_interface_property adjust_ns_fns ENABLED false
        set_port_property csr_adjust TERMINATION true
        set_port_property csr_adjust TERMINATION_VALUE 0
    }
}
