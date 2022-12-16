// megafunction wizard: %ALTGX%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt4gxb 

// ============================================================
// File Name: alt_e40_rx_e4x10.v
// Megafunction Name(s):
// 			alt4gxb
//
// Simulation Library Files(s):
// 			stratixiv_hssi
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.0 Build 172 04/25/2012 SJ Full Version
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
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: PRIVATE: NUM_KEYS NUMERIC "0"
// Retrieval info: PRIVATE: RECONFIG_PROTOCOL STRING "BASIC"
// Retrieval info: PRIVATE: RECONFIG_SUBPROTOCOL STRING "none"
// Retrieval info: PRIVATE: RX_ENABLE_DC_COUPLING STRING "false"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIZ_BASE_DATA_RATE_ENABLE STRING "0"
// Retrieval info: PRIVATE: WIZ_DPRIO_INCLK_FREQ_ARRAY STRING "100"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A STRING "2000"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B STRING "100"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK0_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK1_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK1_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK2_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK2_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK3_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK3_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK4_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK4_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK5_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK5_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK6_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK6_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_ENABLE_EQUALIZER_CTRL NUMERIC "1"
// Retrieval info: PRIVATE: WIZ_EQUALIZER_CTRL_SETTING NUMERIC "3"
// Retrieval info: PRIVATE: WIZ_FORCE_DEFAULT_SETTINGS NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_SUBPROTOCOL STRING "None"
// Retrieval info: PRIVATE: WIZ_WORD_ALIGN_FLIP_PATTERN STRING "0"
// Retrieval info: PARAMETER: STARTING_CHANNEL_NUMBER NUMERIC "0"
// Retrieval info: CONSTANT: EFFECTIVE_DATA_RATE STRING "10312.5 Mbps"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_A_SETTING NUMERIC "7"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_B_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_C_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_D_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_V_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_DCGAIN_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: GEN_RECONFIG_PLL STRING "false"
// Retrieval info: CONSTANT: GXB_ANALOG_POWER STRING "AUTO"
// Retrieval info: CONSTANT: GX_CHANNEL_TYPE STRING "GT"
// Retrieval info: CONSTANT: INPUT_CLOCK_FREQUENCY STRING "644.53125 MHz"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: CONSTANT: INTENDED_DEVICE_SPEED_GRADE STRING "2"
// Retrieval info: CONSTANT: INTENDED_DEVICE_VARIANT STRING "GT"
// Retrieval info: CONSTANT: LOOPBACK_MODE STRING "none"
// Retrieval info: CONSTANT: LPM_TYPE STRING "alt4gxb"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "4"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "rx"
// Retrieval info: CONSTANT: PLL_CONTROL_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RECEIVER_TERMINATION STRING "oct_100_ohms"
// Retrieval info: CONSTANT: RECONFIG_DPRIO_MODE NUMERIC "1"
// Retrieval info: CONSTANT: RX_8B_10B_MODE STRING "none"
// Retrieval info: CONSTANT: RX_ALLOW_ALIGN_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_ALLOW_PIPE_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_BITSLIP_ENABLE STRING "true"
// Retrieval info: CONSTANT: RX_BYTE_ORDERING_MODE STRING "NONE"
// Retrieval info: CONSTANT: RX_CHANNEL_WIDTH NUMERIC "40"
// Retrieval info: CONSTANT: RX_COMMON_MODE STRING "0.82v"
// Retrieval info: CONSTANT: RX_CRU_BANDWIDTH_TYPE STRING "Auto"
// Retrieval info: CONSTANT: RX_CRU_INCLOCK0_PERIOD NUMERIC "1552"
// Retrieval info: CONSTANT: RX_DATAPATH_LOW_LATENCY_MODE STRING "true"
// Retrieval info: CONSTANT: RX_DATAPATH_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RX_DATA_RATE NUMERIC "10312"
// Retrieval info: CONSTANT: RX_DATA_RATE_REMAINDER NUMERIC "500000"
// Retrieval info: CONSTANT: RX_DIGITALRESET_PORT_WIDTH NUMERIC "4"
// Retrieval info: CONSTANT: RX_ENABLE_BIT_REVERSAL STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_DEEP_ALIGN_BYTE_SWAP STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_DATA_SIG STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_REFCLK_SIG STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_SELF_TEST_MODE STRING "false"
// Retrieval info: CONSTANT: RX_FLIP_RX_OUT STRING "false"
// Retrieval info: CONSTANT: RX_FORCE_SIGNAL_DETECT STRING "true"
// Retrieval info: CONSTANT: RX_PHFIFOREGMODE STRING "false"
// Retrieval info: CONSTANT: RX_PPMSELECT NUMERIC "32"
// Retrieval info: CONSTANT: RX_RATE_MATCH_FIFO_MODE STRING "none"
// Retrieval info: CONSTANT: RX_RUN_LENGTH NUMERIC "40"
// Retrieval info: CONSTANT: RX_RUN_LENGTH_ENABLE STRING "true"
// Retrieval info: CONSTANT: RX_SIGNAL_DETECT_THRESHOLD NUMERIC "2"
// Retrieval info: CONSTANT: RX_USE_ALIGN_STATE_MACHINE STRING "true"
// Retrieval info: CONSTANT: RX_USE_CLKOUT STRING "true"
// Retrieval info: CONSTANT: RX_USE_CORECLK STRING "true"
// Retrieval info: CONSTANT: RX_USE_CRUCLK STRING "true"
// Retrieval info: CONSTANT: RX_USE_DESERIALIZER_DOUBLE_DATA_MODE STRING "true"
// Retrieval info: CONSTANT: RX_USE_DESKEW_FIFO STRING "false"
// Retrieval info: CONSTANT: RX_USE_DOUBLE_DATA_MODE STRING "true"
// Retrieval info: CONSTANT: USE_CALIBRATION_BLOCK STRING "true"
// Retrieval info: CONSTANT: gxb_powerdown_width NUMERIC "1"
// Retrieval info: CONSTANT: number_of_quads NUMERIC "1"
// Retrieval info: CONSTANT: reconfig_calibration STRING "true"
// Retrieval info: CONSTANT: reconfig_fromgxb_port_width NUMERIC "17"
// Retrieval info: CONSTANT: reconfig_togxb_port_width NUMERIC "4"
// Retrieval info: CONSTANT: rx_cru_m_divider NUMERIC "16"
// Retrieval info: CONSTANT: rx_cru_n_divider NUMERIC "2"
// Retrieval info: CONSTANT: rx_cru_vco_post_scale_divider NUMERIC "1"
// Retrieval info: CONSTANT: rx_dwidth_factor NUMERIC "4"
// Retrieval info: CONSTANT: rx_signal_detect_loss_threshold STRING "1"
// Retrieval info: CONSTANT: rx_signal_detect_valid_threshold STRING "1"
// Retrieval info: CONSTANT: rx_use_external_termination STRING "false"
// Retrieval info: CONSTANT: rx_word_aligner_num_byte NUMERIC "2"
// Retrieval info: USED_PORT: cal_blk_clk 0 0 0 0 INPUT NODEFVAL "cal_blk_clk"
// Retrieval info: USED_PORT: reconfig_clk 0 0 0 0 INPUT NODEFVAL "reconfig_clk"
// Retrieval info: USED_PORT: reconfig_fromgxb 0 0 17 0 OUTPUT NODEFVAL "reconfig_fromgxb[16..0]"
// Retrieval info: USED_PORT: reconfig_togxb 0 0 4 0 INPUT NODEFVAL "reconfig_togxb[3..0]"
// Retrieval info: USED_PORT: rx_analogreset 0 0 4 0 INPUT NODEFVAL "rx_analogreset[3..0]"
// Retrieval info: USED_PORT: rx_clkout 0 0 4 0 OUTPUT NODEFVAL "rx_clkout[3..0]"
// Retrieval info: USED_PORT: rx_coreclk 0 0 4 0 INPUT NODEFVAL "rx_coreclk[3..0]"
// Retrieval info: USED_PORT: rx_cruclk 0 0 4 0 INPUT GND "rx_cruclk[3..0]"
// Retrieval info: USED_PORT: rx_datain 0 0 4 0 INPUT NODEFVAL "rx_datain[3..0]"
// Retrieval info: USED_PORT: rx_dataout 0 0 160 0 OUTPUT NODEFVAL "rx_dataout[159..0]"
// Retrieval info: USED_PORT: rx_digitalreset 0 0 4 0 INPUT NODEFVAL "rx_digitalreset[3..0]"
// Retrieval info: USED_PORT: rx_freqlocked 0 0 4 0 OUTPUT NODEFVAL "rx_freqlocked[3..0]"
// Retrieval info: USED_PORT: rx_phase_comp_fifo_error 0 0 4 0 OUTPUT NODEFVAL "rx_phase_comp_fifo_error[3..0]"
// Retrieval info: CONNECT: @cal_blk_clk 0 0 0 0 cal_blk_clk 0 0 0 0
// Retrieval info: CONNECT: @reconfig_clk 0 0 0 0 reconfig_clk 0 0 0 0
// Retrieval info: CONNECT: @reconfig_togxb 0 0 4 0 reconfig_togxb 0 0 4 0
// Retrieval info: CONNECT: @rx_analogreset 0 0 4 0 rx_analogreset 0 0 4 0
// Retrieval info: CONNECT: @rx_coreclk 0 0 4 0 rx_coreclk 0 0 4 0
// Retrieval info: CONNECT: @rx_cruclk 0 0 4 0 rx_cruclk 0 0 4 0
// Retrieval info: CONNECT: @rx_datain 0 0 4 0 rx_datain 0 0 4 0
// Retrieval info: CONNECT: @rx_digitalreset 0 0 4 0 rx_digitalreset 0 0 4 0
// Retrieval info: CONNECT: reconfig_fromgxb 0 0 17 0 @reconfig_fromgxb 0 0 17 0
// Retrieval info: CONNECT: rx_clkout 0 0 4 0 @rx_clkout 0 0 4 0
// Retrieval info: CONNECT: rx_dataout 0 0 160 0 @rx_dataout 0 0 160 0
// Retrieval info: CONNECT: rx_freqlocked 0 0 4 0 @rx_freqlocked 0 0 4 0
// Retrieval info: CONNECT: rx_phase_comp_fifo_error 0 0 4 0 @rx_phase_comp_fifo_error 0 0 4 0
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10.ppf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_e40_rx_e4x10_bb.v FALSE
// Retrieval info: LIB_FILE: stratixiv_hssi
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CONSTANT: rx_0ppm_core_clock STRING "true"
// Retrieval info: CONSTANT: tx_0ppm_core_clock STRING "true"