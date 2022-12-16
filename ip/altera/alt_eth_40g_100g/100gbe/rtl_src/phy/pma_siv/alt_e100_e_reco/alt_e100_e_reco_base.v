// megafunction wizard: %ALTGX_RECONFIG%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt2gxb_reconfig 

// ============================================================
// File Name: alt_e100_e_reco.v
// Megafunction Name(s):
// 			alt2gxb_reconfig
//
// Simulation Library Files(s):
// 			altera_mf;lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.0 Build 178 05/31/2012 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADCE NUMERIC "0"
// Retrieval info: PRIVATE: CMU_PLL NUMERIC "0"
// Retrieval info: PRIVATE: DATA_RATE NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: PRIVATE: PMA NUMERIC "1"
// Retrieval info: PRIVATE: PROTO_SWITCH NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: CONSTANT: BASE_PORT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: CBX_BLACKBOX_LIST STRING "-lpm_mux"
// Retrieval info: CONSTANT: CHANNEL_ADDRESS_WIDTH NUMERIC "4"
// Retrieval info: CONSTANT: ENABLE_CHL_ADDR_FOR_ANALOG_CTRL STRING "TRUE"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "10"
// Retrieval info: CONSTANT: NUMBER_OF_RECONFIG_PORTS NUMERIC "3"
// Retrieval info: CONSTANT: READ_BASE_PORT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: RX_EQDCGAIN_PORT_WIDTH NUMERIC "3"
// Retrieval info: CONSTANT: TX_PREEMP_PORT_WIDTH NUMERIC "5"
// Retrieval info: CONSTANT: enable_buf_cal STRING "true"
// Retrieval info: CONSTANT: reconfig_fromgxb_width NUMERIC "51"
// Retrieval info: CONSTANT: reconfig_togxb_width NUMERIC "4"
// Retrieval info: USED_PORT: busy 0 0 0 0 OUTPUT NODEFVAL "busy"
// Retrieval info: USED_PORT: data_valid 0 0 0 0 OUTPUT NODEFVAL "data_valid"
// Retrieval info: USED_PORT: logical_channel_address 0 0 4 0 INPUT NODEFVAL "logical_channel_address[3..0]"
// Retrieval info: USED_PORT: read 0 0 0 0 INPUT NODEFVAL "read"
// Retrieval info: USED_PORT: reconfig_clk 0 0 0 0 INPUT NODEFVAL "reconfig_clk"
// Retrieval info: USED_PORT: reconfig_fromgxb 0 0 51 0 INPUT NODEFVAL "reconfig_fromgxb[50..0]"
// Retrieval info: USED_PORT: reconfig_togxb 0 0 4 0 OUTPUT NODEFVAL "reconfig_togxb[3..0]"
// Retrieval info: USED_PORT: rx_eqctrl 0 0 4 0 INPUT NODEFVAL "rx_eqctrl[3..0]"
// Retrieval info: USED_PORT: rx_eqctrl_out 0 0 4 0 OUTPUT NODEFVAL "rx_eqctrl_out[3..0]"
// Retrieval info: USED_PORT: rx_eqdcgain 0 0 3 0 INPUT NODEFVAL "rx_eqdcgain[2..0]"
// Retrieval info: USED_PORT: rx_eqdcgain_out 0 0 3 0 OUTPUT NODEFVAL "rx_eqdcgain_out[2..0]"
// Retrieval info: USED_PORT: tx_preemp_0t 0 0 5 0 INPUT NODEFVAL "tx_preemp_0t[4..0]"
// Retrieval info: USED_PORT: tx_preemp_0t_out 0 0 5 0 OUTPUT NODEFVAL "tx_preemp_0t_out[4..0]"
// Retrieval info: USED_PORT: tx_preemp_1t 0 0 5 0 INPUT NODEFVAL "tx_preemp_1t[4..0]"
// Retrieval info: USED_PORT: tx_preemp_1t_out 0 0 5 0 OUTPUT NODEFVAL "tx_preemp_1t_out[4..0]"
// Retrieval info: USED_PORT: tx_preemp_2t 0 0 5 0 INPUT NODEFVAL "tx_preemp_2t[4..0]"
// Retrieval info: USED_PORT: tx_preemp_2t_out 0 0 5 0 OUTPUT NODEFVAL "tx_preemp_2t_out[4..0]"
// Retrieval info: USED_PORT: tx_vodctrl 0 0 3 0 INPUT NODEFVAL "tx_vodctrl[2..0]"
// Retrieval info: USED_PORT: tx_vodctrl_out 0 0 3 0 OUTPUT NODEFVAL "tx_vodctrl_out[2..0]"
// Retrieval info: USED_PORT: write_all 0 0 0 0 INPUT NODEFVAL "write_all"
// Retrieval info: CONNECT: @logical_channel_address 0 0 4 0 logical_channel_address 0 0 4 0
// Retrieval info: CONNECT: @read 0 0 0 0 read 0 0 0 0
// Retrieval info: CONNECT: @reconfig_clk 0 0 0 0 reconfig_clk 0 0 0 0
// Retrieval info: CONNECT: @reconfig_fromgxb 0 0 51 0 reconfig_fromgxb 0 0 51 0
// Retrieval info: CONNECT: @reconfig_mode_sel 0 0 3 0 GND 0 0 3 0
// Retrieval info: CONNECT: @rx_eqctrl 0 0 4 0 rx_eqctrl 0 0 4 0
// Retrieval info: CONNECT: @rx_eqdcgain 0 0 3 0 rx_eqdcgain 0 0 3 0
// Retrieval info: CONNECT: @tx_preemp_0t 0 0 5 0 tx_preemp_0t 0 0 5 0
// Retrieval info: CONNECT: @tx_preemp_1t 0 0 5 0 tx_preemp_1t 0 0 5 0
// Retrieval info: CONNECT: @tx_preemp_2t 0 0 5 0 tx_preemp_2t 0 0 5 0
// Retrieval info: CONNECT: @tx_vodctrl 0 0 3 0 tx_vodctrl 0 0 3 0
// Retrieval info: CONNECT: @write_all 0 0 0 0 write_all 0 0 0 0
// Retrieval info: CONNECT: busy 0 0 0 0 @busy 0 0 0 0
// Retrieval info: CONNECT: data_valid 0 0 0 0 @data_valid 0 0 0 0
// Retrieval info: CONNECT: reconfig_togxb 0 0 4 0 @reconfig_togxb 0 0 4 0
// Retrieval info: CONNECT: rx_eqctrl_out 0 0 4 0 @rx_eqctrl_out 0 0 4 0
// Retrieval info: CONNECT: rx_eqdcgain_out 0 0 3 0 @rx_eqdcgain_out 0 0 3 0
// Retrieval info: CONNECT: tx_preemp_0t_out 0 0 5 0 @tx_preemp_0t_out 0 0 5 0
// Retrieval info: CONNECT: tx_preemp_1t_out 0 0 5 0 @tx_preemp_1t_out 0 0 5 0
// Retrieval info: CONNECT: tx_preemp_2t_out 0 0 5 0 @tx_preemp_2t_out 0 0 5 0
// Retrieval info: CONNECT: tx_vodctrl_out 0 0 3 0 @tx_vodctrl_out 0 0 3 0
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e100_e_reco.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e100_e_reco.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e100_e_reco.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e100_e_reco.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e100_e_reco_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e100_e_reco_bb.v FALSE
// Retrieval info: LIB_FILE: altera_mf
// Retrieval info: LIB_FILE: lpm
