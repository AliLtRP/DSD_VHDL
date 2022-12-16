// megafunction wizard: %ALTGXB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altgxb 

// ============================================================
// File Name: gxb_rx_1port_2970.v
// Megafunction Name(s):
// 			altgxb
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 6.0 Internal Build 162 03/19/2006 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2006 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module gxb_rx_1port_2970 (
	inclk,
	rx_bitslip,
	rx_coreclk,
	rx_cruclk,
	rx_in,
	rx_locktodata,
	rx_locktorefclk,
	coreclk_out,
	pll_locked,
	rx_clkout,
	rx_freqlocked,
	rx_locked,
	rx_out,
	rx_rlv);

	input	[0:0]  inclk;
	input	[0:0]  rx_bitslip;
	input	[0:0]  rx_coreclk;
	input	[0:0]  rx_cruclk;
	input	[0:0]  rx_in;
	input	[0:0]  rx_locktodata;
	input	[0:0]  rx_locktorefclk;
	output	[0:0]  coreclk_out;
	output	[0:0]  pll_locked;
	output	[0:0]  rx_clkout;
	output	[0:0]  rx_freqlocked;
	output	[0:0]  rx_locked;
	output	[19:0]  rx_out;
	output	[0:0]  rx_rlv;

	wire [0:0] sub_wire0;
	wire [19:0] sub_wire1;
	wire [0:0] sub_wire2;
	wire [0:0] sub_wire3;
	wire [0:0] sub_wire4;
	wire [0:0] sub_wire5;
	wire [0:0] sub_wire6;
	wire [0:0] rx_rlv = sub_wire0[0:0];
	wire [19:0] rx_out = sub_wire1[19:0];
	wire [0:0] coreclk_out = sub_wire2[0:0];
	wire [0:0] rx_locked = sub_wire3[0:0];
	wire [0:0] rx_freqlocked = sub_wire4[0:0];
	wire [0:0] rx_clkout = sub_wire5[0:0];
	wire [0:0] pll_locked = sub_wire6[0:0];

	altgxb	altgxb_component (
				.rx_coreclk (rx_coreclk),
				.rx_locktorefclk (rx_locktorefclk),
				.rx_cruclk (rx_cruclk),
				.inclk (inclk),
				.rx_locktodata (rx_locktodata),
				.rx_in (rx_in),
				.rx_bitslip (rx_bitslip),
				.rx_rlv (sub_wire0),
				.rx_out (sub_wire1),
				.coreclk_out (sub_wire2),
				.rx_locked (sub_wire3),
				.rx_freqlocked (sub_wire4),
				.rx_clkout (sub_wire5),
				.pll_locked (sub_wire6)
				// synopsys translate_off
				,
				.pll_areset (),
				.pllenable (),
				.rx_a1a2size (),
				.rx_a1a2sizeout (),
				.rx_aclr (),
				.rx_bistdone (),
				.rx_bisterr (),
				.rx_channelaligned (),
				.rx_ctrldetect (),
				.rx_disperr (),
				.rx_enacdet (),
				.rx_equalizerctrl (),
				.rx_errdetect (),
				.rx_fifoalmostempty (),
				.rx_fifoalmostfull (),
				.rx_patterndetect (),
				.rx_re (),
				.rx_signaldetect (),
				.rx_slpbk (),
				.rx_syncstatus (),
				.rx_we (),
				.rxanalogreset (),
				.rxdigitalreset (),
				.tx_aclr (),
				.tx_coreclk (),
				.tx_ctrlenable (),
				.tx_forcedisparity (),
				.tx_in (),
				.tx_out (),
				.tx_preemphasisctrl (),
				.tx_srlpbk (),
				.tx_vodctrl (),
				.txdigitalreset ()
				// synopsys translate_on
				);
	defparam
		altgxb_component.align_pattern = "P0101111100",
		altgxb_component.align_pattern_length = 10,
		altgxb_component.allow_gxb_merging = "ON",
		altgxb_component.channel_width = 20,
		altgxb_component.clk_out_mode_reference = "ON",
		altgxb_component.consider_instantiate_transmitter_pll_param = "ON",
		altgxb_component.cru_inclock_period = 6734,
		altgxb_component.disparity_mode = "ON",
		altgxb_component.dwidth_factor = 2,
		altgxb_component.equalizer_ctrl_setting = 0,
		altgxb_component.flip_rx_out = "OFF",
		altgxb_component.flip_tx_in = "OFF",
		altgxb_component.for_engineering_sample_device = "OFF",
		altgxb_component.instantiate_transmitter_pll = "ON",
		altgxb_component.intended_device_family = "Stratix GX",
		altgxb_component.lpm_type = "altgxb",
		altgxb_component.number_of_channels = 1,
		altgxb_component.number_of_quads = 1,
		altgxb_component.operation_mode = "RX",
		altgxb_component.pll_bandwidth_type = "HIGH",
		altgxb_component.pll_inclock_period = 6734,
		altgxb_component.protocol = "CUSTOM",
		altgxb_component.run_length = 100,
		altgxb_component.run_length_enable = "ON",
		altgxb_component.rx_bandwidth_type = "NEW_LOW",
		altgxb_component.rx_data_rate = 2970,
		altgxb_component.rx_data_rate_remainder = 0,
		altgxb_component.rx_enable_dc_coupling = "OFF",
		altgxb_component.rx_force_signal_detect = "ON",
		altgxb_component.rx_ppm_setting = 1000,
		altgxb_component.signal_threshold_select = 530,
		altgxb_component.use_8b_10b_mode = "OFF",
		altgxb_component.use_auto_bit_slip = "OFF",
		altgxb_component.use_channel_align = "OFF",
		altgxb_component.use_double_data_mode = "ON",
		altgxb_component.use_equalizer_ctrl_signal = "OFF",
		altgxb_component.use_generic_fifo = "OFF",
		altgxb_component.use_rate_match_fifo = "OFF",
		altgxb_component.use_rx_clkout = "ON",
		altgxb_component.use_rx_coreclk = "ON",
		altgxb_component.use_rx_cruclk = "ON",
		altgxb_component.use_self_test_mode = "OFF",
		altgxb_component.use_symbol_align = "ON";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADD_GENERIC_FIFO_WE_SYNCH_REGISTER STRING "0"
// Retrieval info: PRIVATE: ALIGN_PATTERN STRING "0101111100"
// Retrieval info: PRIVATE: ALIGN_PATTERN_LENGTH STRING "10"
// Retrieval info: PRIVATE: CHANNEL_WIDTH STRING "20"
// Retrieval info: PRIVATE: CLK_OUT_MODE_REFERENCE STRING "1"
// Retrieval info: PRIVATE: DEV_FAMILY STRING "Stratix GX"
// Retrieval info: PRIVATE: ENABLE_TX_8B_10B_I1I2_GENERATION STRING "0"
// Retrieval info: PRIVATE: EQU_SETTING STRING "0"
// Retrieval info: PRIVATE: FLIP_ALIGN_PATTERN STRING "0"
// Retrieval info: PRIVATE: FLIP_RX_OUT STRING "0"
// Retrieval info: PRIVATE: FLIP_TX_IN STRING "0"
// Retrieval info: PRIVATE: FOR_ENGINEERING_SAMPLE_DEVICE STRING "0"
// Retrieval info: PRIVATE: GXB_QUAD_MERGE STRING "1"
// Retrieval info: PRIVATE: INFINIBAND_INVALID_CODE STRING "0"
// Retrieval info: PRIVATE: INSTANTIATE_TRANSMITTER_PLL STRING "1"
// Retrieval info: PRIVATE: LOOPBACK_MODE NUMERIC "0"
// Retrieval info: PRIVATE: NUMBER_OF_CHANNELS STRING "1"
// Retrieval info: PRIVATE: OP_MODE STRING "Receiver"
// Retrieval info: PRIVATE: PLL_ACLR STRING "0"
// Retrieval info: PRIVATE: PLL_BANDWIDTH_TYPE STRING "HIGH"
// Retrieval info: PRIVATE: PLL_DC_COUPLING STRING "0"
// Retrieval info: PRIVATE: PLL_ENABLE STRING "0"
// Retrieval info: PRIVATE: PLL_LOCKED STRING "1"
// Retrieval info: PRIVATE: PREEMPHASIS_SETTING STRING "0"
// Retrieval info: PRIVATE: PREEMPHASIS_SIGNAL STRING "0"
// Retrieval info: PRIVATE: PROTOCOL STRING "CUSTOM"
// Retrieval info: PRIVATE: REVERSE_LOOPBACK_MODE NUMERIC "0"
// Retrieval info: PRIVATE: RLV STRING "100"
// Retrieval info: PRIVATE: RX_A1A2 STRING "0"
// Retrieval info: PRIVATE: RX_A1A2SIZEOUT STRING "0"
// Retrieval info: PRIVATE: RX_BANDWIDTH_TYPE STRING "LOW"
// Retrieval info: PRIVATE: RX_BASE_INPUT_TYPE STRING ""
// Retrieval info: PRIVATE: RX_BISTDONE STRING "0"
// Retrieval info: PRIVATE: RX_BISTERR STRING "0"
// Retrieval info: PRIVATE: RX_BITSLIP STRING "1"
// Retrieval info: PRIVATE: RX_CLKOUT STRING "1"
// Retrieval info: PRIVATE: RX_CLR STRING "0"
// Retrieval info: PRIVATE: RX_CTRLDETECT STRING "0"
// Retrieval info: PRIVATE: RX_DATA_RATE STRING "2970"
// Retrieval info: PRIVATE: RX_DISPERR STRING "0"
// Retrieval info: PRIVATE: RX_ENACDET STRING "0"
// Retrieval info: PRIVATE: RX_ERRDETECT STRING "0"
// Retrieval info: PRIVATE: RX_FIFOALMOSTEMPTY STRING "0"
// Retrieval info: PRIVATE: RX_FIFOALMOSTFULL STRING "0"
// Retrieval info: PRIVATE: RX_FORCE_SIGNAL_DETECT STRING "1"
// Retrieval info: PRIVATE: RX_FREQLOCKED STRING "1"
// Retrieval info: PRIVATE: RX_FREQUENCY STRING "148.5000"
// Retrieval info: PRIVATE: RX_LOCKED STRING "1"
// Retrieval info: PRIVATE: RX_LOCKTODATA STRING "1"
// Retrieval info: PRIVATE: RX_LOCKTOREFCLK STRING "1"
// Retrieval info: PRIVATE: RX_PATTERNDETECT STRING "0"
// Retrieval info: PRIVATE: RX_PPM_SETTING STRING "1000"
// Retrieval info: PRIVATE: RX_SIGDET STRING "0"
// Retrieval info: PRIVATE: RX_SYNCSTATUS STRING "0"
// Retrieval info: PRIVATE: SELF_TEST_MODE NUMERIC "-1"
// Retrieval info: PRIVATE: SIGNAL_THRESHOLD_SELECT STRING "530"
// Retrieval info: PRIVATE: TX_BASE_INPUT_TYPE STRING ""
// Retrieval info: PRIVATE: TX_CLR STRING "0"
// Retrieval info: PRIVATE: TX_DATA_RATE STRING "1485"
// Retrieval info: PRIVATE: TX_FORCE_DISPARITY STRING "0"
// Retrieval info: PRIVATE: TX_FREQUENCY STRING "74.25"
// Retrieval info: PRIVATE: TX_TERMINATION STRING "100"
// Retrieval info: PRIVATE: USE_8B_10B_MODE STRING "OFF"
// Retrieval info: PRIVATE: USE_AUTO_BIT_SLIP NUMERIC "0"
// Retrieval info: PRIVATE: USE_DC_COUPLING STRING "0"
// Retrieval info: PRIVATE: USE_EQUALIZER STRING "0"
// Retrieval info: PRIVATE: USE_EXTERNAL_TX_TERMINATION STRING "0"
// Retrieval info: PRIVATE: USE_GENERIC_FIFO STRING "0"
// Retrieval info: PRIVATE: USE_RLV STRING "1"
// Retrieval info: PRIVATE: USE_RX_CORECLK STRING "1"
// Retrieval info: PRIVATE: USE_RX_CRUCLK STRING "1"
// Retrieval info: PRIVATE: USE_TX_CORECLK STRING "1"
// Retrieval info: PRIVATE: VERSION STRING "4.0"
// Retrieval info: PRIVATE: VOD_SETTING STRING "1000"
// Retrieval info: PRIVATE: VOD_SIGNAL STRING "0"
// Retrieval info: PRIVATE: XGM_RXANALOGRESET STRING "0"
// Retrieval info: LIBRARY: altgxb altgxb.all
// Retrieval info: CONSTANT: ALIGN_PATTERN STRING "P0101111100"
// Retrieval info: CONSTANT: ALIGN_PATTERN_LENGTH NUMERIC "10"
// Retrieval info: CONSTANT: ALLOW_GXB_MERGING STRING "ON"
// Retrieval info: CONSTANT: CHANNEL_WIDTH NUMERIC "20"
// Retrieval info: CONSTANT: CLK_OUT_MODE_REFERENCE STRING "ON"
// Retrieval info: CONSTANT: CONSIDER_INSTANTIATE_TRANSMITTER_PLL_PARAM STRING "ON"
// Retrieval info: CONSTANT: CRU_INCLOCK_PERIOD NUMERIC "6734"
// Retrieval info: CONSTANT: DISPARITY_MODE STRING "ON"
// Retrieval info: CONSTANT: DWIDTH_FACTOR NUMERIC "2"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: FLIP_RX_OUT STRING "OFF"
// Retrieval info: CONSTANT: FLIP_TX_IN STRING "OFF"
// Retrieval info: CONSTANT: FOR_ENGINEERING_SAMPLE_DEVICE STRING "OFF"
// Retrieval info: CONSTANT: INSTANTIATE_TRANSMITTER_PLL STRING "ON"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix GX"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altgxb"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: NUMBER_OF_QUADS NUMERIC "1"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "RX"
// Retrieval info: CONSTANT: PLL_BANDWIDTH_TYPE STRING "HIGH"
// Retrieval info: CONSTANT: PLL_INCLOCK_PERIOD NUMERIC "6734"
// Retrieval info: CONSTANT: PROTOCOL STRING "CUSTOM"
// Retrieval info: CONSTANT: RUN_LENGTH NUMERIC "100"
// Retrieval info: CONSTANT: RUN_LENGTH_ENABLE STRING "ON"
// Retrieval info: CONSTANT: RX_BANDWIDTH_TYPE STRING "NEW_LOW"
// Retrieval info: CONSTANT: RX_DATA_RATE NUMERIC "2970"
// Retrieval info: CONSTANT: RX_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: RX_ENABLE_DC_COUPLING STRING "OFF"
// Retrieval info: CONSTANT: RX_FORCE_SIGNAL_DETECT STRING "ON"
// Retrieval info: CONSTANT: RX_PPM_SETTING NUMERIC "1000"
// Retrieval info: CONSTANT: SIGNAL_THRESHOLD_SELECT NUMERIC "530"
// Retrieval info: CONSTANT: USE_8B_10B_MODE STRING "OFF"
// Retrieval info: CONSTANT: USE_AUTO_BIT_SLIP STRING "OFF"
// Retrieval info: CONSTANT: USE_CHANNEL_ALIGN STRING "OFF"
// Retrieval info: CONSTANT: USE_DOUBLE_DATA_MODE STRING "ON"
// Retrieval info: CONSTANT: USE_EQUALIZER_CTRL_SIGNAL STRING "OFF"
// Retrieval info: CONSTANT: USE_GENERIC_FIFO STRING "OFF"
// Retrieval info: CONSTANT: USE_RATE_MATCH_FIFO STRING "OFF"
// Retrieval info: CONSTANT: USE_RX_CLKOUT STRING "ON"
// Retrieval info: CONSTANT: USE_RX_CORECLK STRING "ON"
// Retrieval info: CONSTANT: USE_RX_CRUCLK STRING "ON"
// Retrieval info: CONSTANT: USE_SELF_TEST_MODE STRING "OFF"
// Retrieval info: CONSTANT: USE_SYMBOL_ALIGN STRING "ON"
// Retrieval info: USED_PORT: coreclk_out 0 0 1 0 OUTPUT_CLK_EXT NODEFVAL "coreclk_out[0..0]"
// Retrieval info: USED_PORT: inclk 0 0 1 0 INPUT_CLK_EXT GND "inclk[0..0]"
// Retrieval info: USED_PORT: pll_locked 0 0 1 0 OUTPUT NODEFVAL "pll_locked[0..0]"
// Retrieval info: USED_PORT: rx_bitslip 0 0 1 0 INPUT GND "rx_bitslip[0..0]"
// Retrieval info: USED_PORT: rx_clkout 0 0 1 0 OUTPUT_CLK_EXT NODEFVAL "rx_clkout[0..0]"
// Retrieval info: USED_PORT: rx_coreclk 0 0 1 0 INPUT_CLK_EXT NODEFVAL "rx_coreclk[0..0]"
// Retrieval info: USED_PORT: rx_cruclk 0 0 1 0 INPUT_CLK_EXT GND "rx_cruclk[0..0]"
// Retrieval info: USED_PORT: rx_freqlocked 0 0 1 0 OUTPUT NODEFVAL "rx_freqlocked[0..0]"
// Retrieval info: USED_PORT: rx_in 0 0 1 0 INPUT GND "rx_in[0..0]"
// Retrieval info: USED_PORT: rx_locked 0 0 1 0 OUTPUT NODEFVAL "rx_locked[0..0]"
// Retrieval info: USED_PORT: rx_locktodata 0 0 1 0 INPUT GND "rx_locktodata[0..0]"
// Retrieval info: USED_PORT: rx_locktorefclk 0 0 1 0 INPUT_CLK_EXT GND "rx_locktorefclk[0..0]"
// Retrieval info: USED_PORT: rx_out 0 0 20 0 OUTPUT NODEFVAL "rx_out[19..0]"
// Retrieval info: USED_PORT: rx_rlv 0 0 1 0 OUTPUT NODEFVAL "rx_rlv[0..0]"
// Retrieval info: CONNECT: @rx_locktorefclk 0 0 1 0 rx_locktorefclk 0 0 1 0
// Retrieval info: CONNECT: rx_locked 0 0 1 0 @rx_locked 0 0 1 0
// Retrieval info: CONNECT: @rx_in 0 0 1 0 rx_in 0 0 1 0
// Retrieval info: CONNECT: coreclk_out 0 0 1 0 @coreclk_out 0 0 1 0
// Retrieval info: CONNECT: @inclk 0 0 1 0 inclk 0 0 1 0
// Retrieval info: CONNECT: rx_out 0 0 20 0 @rx_out 0 0 20 0
// Retrieval info: CONNECT: rx_clkout 0 0 1 0 @rx_clkout 0 0 1 0
// Retrieval info: CONNECT: @rx_coreclk 0 0 1 0 rx_coreclk 0 0 1 0
// Retrieval info: CONNECT: @rx_cruclk 0 0 1 0 rx_cruclk 0 0 1 0
// Retrieval info: CONNECT: pll_locked 0 0 1 0 @pll_locked 0 0 1 0
// Retrieval info: CONNECT: @rx_bitslip 0 0 1 0 rx_bitslip 0 0 1 0
// Retrieval info: CONNECT: rx_rlv 0 0 1 0 @rx_rlv 0 0 1 0
// Retrieval info: CONNECT: rx_freqlocked 0 0 1 0 @rx_freqlocked 0 0 1 0
// Retrieval info: CONNECT: @rx_locktodata 0 0 1 0 rx_locktodata 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970.ppf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970.inc FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970.cmp FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970.bsf FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970_inst.v FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL gxb_rx_1port_2970_bb.v FALSE FALSE
