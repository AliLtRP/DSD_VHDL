// megafunction wizard: %ALTGX%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt4gxb 

// ============================================================
// File Name: rc_s4gxb_duplex_2pll.v
// Megafunction Name(s):
// 			alt4gxb
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 11.0 Build 157 04/27/2011 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2011 Altera Corporation
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


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module rc_s4gxb_duplex_2pll (
	cal_blk_clk,
	gxb_powerdown,
	pll_inclk_rx_cruclk,
	reconfig_clk,
	reconfig_togxb,
	rx_analogreset,
	rx_bitslip,
	rx_datain,
	rx_digitalreset,
	rx_locktodata,
	rx_locktorefclk,
	tx_datain,
	tx_digitalreset,
	pll_locked,
	pll_locked_alt,
	reconfig_fromgxb,
	rx_clkout,
	rx_dataout,
	rx_pll_locked,
	tx_clkout,
	tx_dataout);

	input	  cal_blk_clk;
	input	[0:0]  gxb_powerdown;
	input	[1:0]  pll_inclk_rx_cruclk;
	input	  reconfig_clk;
	input	[3:0]  reconfig_togxb;
	input	[0:0]  rx_analogreset;
	input	[0:0]  rx_bitslip;
	input	[0:0]  rx_datain;
	input	[0:0]  rx_digitalreset;
	input	[0:0]  rx_locktodata;
	input	[0:0]  rx_locktorefclk;
	input	[19:0]  tx_datain;
	input	[0:0]  tx_digitalreset;
	output	[0:0]  pll_locked;
	output	[0:0]  pll_locked_alt;
	output	[16:0]  reconfig_fromgxb;
	output	[0:0]  rx_clkout;
	output	[19:0]  rx_dataout;
	output	[0:0]  rx_pll_locked;
	output	[0:0]  tx_clkout;
	output	[0:0]  tx_dataout;

	parameter		starting_channel_number = 4;

	//for MAIN PLL - 148.5MHz
	parameter		tx_pll_inclk0_period = 6734;
	parameter		tx_data_rate = 1485;
	parameter		effective_data_rate = "1485 Mbps";
	parameter		input_clock_frequency = "148.50MHz";
	
	//for second PLL - 148.35MHz
	parameter		tx_pll_inclk1_period = 6741;
	parameter		reconfig_data_rate = 1483;
	parameter		reconfig_effective_data_rate = "1483.5 Mbps";
	parameter		reconfig_input_clock_frequency = "148.35MHz";

	wire [0:0] sub_wire0;
	wire [0:0] sub_wire1;
	wire [16:0] sub_wire2;
	wire [0:0] sub_wire3;
	wire [0:0] sub_wire4;
	wire [19:0] sub_wire5;
	wire [0:0] sub_wire6;
	wire [0:0] sub_wire7;
	wire [0:0] pll_locked = sub_wire0[0:0];
	wire [0:0] pll_locked_alt = sub_wire1[0:0];
	wire [16:0] reconfig_fromgxb = sub_wire2[16:0];
	wire [0:0] rx_pll_locked = sub_wire3[0:0];
	wire [0:0] rx_clkout = sub_wire4[0:0];
	wire [19:0] rx_dataout = sub_wire5[19:0];
	wire [0:0] tx_clkout = sub_wire6[0:0];
	wire [0:0] tx_dataout = sub_wire7[0:0];

	alt4gxb	alt4gxb_component (
				.reconfig_togxb (reconfig_togxb),
				.rx_bitslip (rx_bitslip),
				.cal_blk_clk (cal_blk_clk),
				.reconfig_clk (reconfig_clk),
				.rx_analogreset (rx_analogreset),
				.rx_datain (rx_datain),
				.rx_digitalreset (rx_digitalreset),
				.rx_locktodata (rx_locktodata),
				.pll_inclk_rx_cruclk (pll_inclk_rx_cruclk),
				.rx_locktorefclk (rx_locktorefclk),
				.tx_datain (tx_datain),
				.tx_digitalreset (tx_digitalreset),
				.gxb_powerdown (gxb_powerdown),
				.pll_locked (sub_wire0),
				.pll_locked_alt (sub_wire1),
				.reconfig_fromgxb (sub_wire2),
				.rx_pll_locked (sub_wire3),
				.rx_clkout (sub_wire4),
				.rx_dataout (sub_wire5),
				.tx_clkout (sub_wire6),
				.tx_dataout (sub_wire7)
				// synopsys translate_off
				,
				.aeq_fromgxb (),
				.aeq_togxb (),
				.cal_blk_calibrationstatus (),
				.cal_blk_powerdown (),
				.cmu_rateswitchin (),
				.coreclkout (),
				.fixedclk (),
				.fixedclk_fast (),
				.hip_tx_clkout (),
				.pcie_sw (),
				.pipe8b10binvpolarity (),
				.pipedatavalid (),
				.pipeelecidle (),
				.pipephydonestatus (),
				.pipestatus (),
				.pll1_locked (),
				.pll1_powerdown (),
				.pll2_locked (),
				.pll2_powerdown (),
				.pll3_locked (),
				.pll3_powerdown (),
				.pll_inclk (),
				.pll_inclk_slave (),
				.pll_powerdown (),
				.pll_powerdown_alt (),
				.powerdn (),
				.rateswitch (),
				.rateswitchbaseclock (),
				.reconfig_fromgxb_oe (),
				.rx_a1a2size (),
				.rx_a1a2sizeout (),
				.rx_a1detect (),
				.rx_a2detect (),
				.rx_bistdone (),
				.rx_bisterr (),
				.rx_bitslipboundaryselectout (),
				.rx_byteorderalignstatus (),
				.rx_channelaligned (),
				.rx_coreclk (),
				.rx_cruclk (),
				.rx_ctrldetect (),
				.rx_dataoutfull (),
				.rx_disperr (),
				.rx_elecidleinfersel (),
				.rx_enabyteord (),
				.rx_enapatternalign (),
				.rx_errdetect (),
				.rx_freqlocked (),
				.rx_invpolarity (),
				.rx_k1detect (),
				.rx_k2detect (),
				.rx_patterndetect (),
				.rx_phase_comp_fifo_error (),
				.rx_phfifooverflow (),
				.rx_phfifordenable (),
				.rx_phfiforeset (),
				.rx_phfifounderflow (),
				.rx_phfifowrdisable (),
				.rx_pipebufferstat (),
				.rx_powerdown (),
				.rx_prbscidenable (),
				.rx_recovclkout (),
				.rx_revbitorderwa (),
				.rx_revbyteorderwa (),
				.rx_revseriallpbkout (),
				.rx_rlv (),
				.rx_rmfifoalmostempty (),
				.rx_rmfifoalmostfull (),
				.rx_rmfifodatadeleted (),
				.rx_rmfifodatainserted (),
				.rx_rmfifoempty (),
				.rx_rmfifofull (),
				.rx_rmfifordena (),
				.rx_rmfiforeset (),
				.rx_rmfifowrena (),
				.rx_runningdisp (),
				.rx_seriallpbken (),
				.rx_seriallpbkin (),
				.rx_signaldetect (),
				.rx_syncstatus (),
				.scanclk (),
				.scanin (),
				.scanmode (),
				.scanshift (),
				.testin (),
				.tx_bitslipboundaryselect (),
				.tx_coreclk (),
				.tx_ctrlenable (),
				.tx_datainfull (),
				.tx_detectrxloop (),
				.tx_dispval (),
				.tx_forcedisp (),
				.tx_forcedispcompliance (),
				.tx_forceelecidle (),
				.tx_invpolarity (),
				.tx_phase_comp_fifo_error (),
				.tx_phfifooverflow (),
				.tx_phfiforeset (),
				.tx_phfifounderflow (),
				.tx_pipedeemph (),
				.tx_pipemargin (),
				.tx_pipeswing (),
				.tx_pllreset (),
				.tx_revparallellpbken (),
				.tx_revseriallpbkin (),
				.tx_seriallpbkout ()
				// synopsys translate_on
				);
	defparam
		alt4gxb_component.starting_channel_number = starting_channel_number,
		alt4gxb_component.base_data_rate = effective_data_rate,
		alt4gxb_component.cmu_pll_inclk_log_index = 0,
		alt4gxb_component.cmu_pll_log_index = 0,
		alt4gxb_component.cmu_pll_reconfig_inclk_log_index = 1,
		alt4gxb_component.cmu_pll_reconfig_inclock_period = tx_pll_inclk1_period,
		alt4gxb_component.cmu_pll_reconfig_log_index = 1,
		alt4gxb_component.effective_data_rate = effective_data_rate,
		alt4gxb_component.enable_lc_tx_pll = "false",
		alt4gxb_component.enable_pll_inclk_drive_rx_cru = "true",
		alt4gxb_component.equalizer_ctrl_a_setting = 0,
		alt4gxb_component.equalizer_ctrl_b_setting = 0,
		alt4gxb_component.equalizer_ctrl_c_setting = 0,
		alt4gxb_component.equalizer_ctrl_d_setting = 0,
		alt4gxb_component.equalizer_ctrl_v_setting = 0,
		alt4gxb_component.equalizer_dcgain_setting = 0,
		alt4gxb_component.gen_reconfig_pll = "true",
		alt4gxb_component.gxb_analog_power = "AUTO",
		alt4gxb_component.gx_channel_type = "AUTO",
		alt4gxb_component.input_clock_frequency = input_clock_frequency,
		alt4gxb_component.intended_device_family = "Stratix IV",
		alt4gxb_component.intended_device_speed_grade = "2",
		alt4gxb_component.intended_device_variant = "GX",
		alt4gxb_component.loopback_mode = "none",
		alt4gxb_component.lpm_hint = "CBX_HDL_LANGUAGE=Verilog",
		alt4gxb_component.lpm_type = "alt4gxb",
		alt4gxb_component.number_of_channels = 1,
		alt4gxb_component.operation_mode = "duplex",
		alt4gxb_component.pll_control_width = 1,
		alt4gxb_component.pll_pfd_fb_mode = "internal",
		alt4gxb_component.preemphasis_ctrl_1stposttap_setting = 0,
		alt4gxb_component.preemphasis_ctrl_2ndposttap_inv_setting = "false",
		alt4gxb_component.preemphasis_ctrl_2ndposttap_setting = 0,
		alt4gxb_component.preemphasis_ctrl_pretap_inv_setting = "false",
		alt4gxb_component.preemphasis_ctrl_pretap_setting = 0,
		alt4gxb_component.protocol = "basic",
		alt4gxb_component.receiver_termination = "oct_100_ohms",
		alt4gxb_component.reconfig_base_data_rate = reconfig_effective_data_rate,
		alt4gxb_component.reconfig_dprio_mode = 18,
		alt4gxb_component.reconfig_input_clock_frequency = reconfig_input_clock_frequency,
		alt4gxb_component.reconfig_pll_inclk_width = 2,
		alt4gxb_component.reconfig_protocol = "basic",
		alt4gxb_component.rx_8b_10b_mode = "none",
		alt4gxb_component.rx_align_pattern = "0101111100",
		alt4gxb_component.rx_align_pattern_length = 10,
		alt4gxb_component.rx_allow_align_polarity_inversion = "false",
		alt4gxb_component.rx_allow_pipe_polarity_inversion = "false",
		alt4gxb_component.rx_bitslip_enable = "true",
		alt4gxb_component.rx_byte_ordering_mode = "NONE",
		alt4gxb_component.rx_channel_width = 20,
		alt4gxb_component.rx_common_mode = "0.82v",
		alt4gxb_component.rx_cru_bandwidth_type = "Auto",
		alt4gxb_component.rx_cru_inclk_log_index = 0,
		alt4gxb_component.rx_cru_inclock0_period = tx_pll_inclk0_period,
		alt4gxb_component.rx_datapath_low_latency_mode = "false",
		alt4gxb_component.rx_datapath_protocol = "basic",
		alt4gxb_component.rx_data_rate = tx_data_rate,
		alt4gxb_component.rx_data_rate_remainder = 0,
		alt4gxb_component.rx_digitalreset_port_width = 1,
		alt4gxb_component.rx_enable_bit_reversal = "false",
		alt4gxb_component.rx_enable_deep_align_byte_swap = "false",
		alt4gxb_component.rx_enable_lock_to_data_sig = "true",
		alt4gxb_component.rx_enable_lock_to_refclk_sig = "true",
		alt4gxb_component.rx_enable_self_test_mode = "false",
		alt4gxb_component.rx_flip_rx_out = "false",
		alt4gxb_component.rx_force_signal_detect = "true",
		alt4gxb_component.rx_phfiforegmode = "false",
		alt4gxb_component.rx_ppmselect = 32,
		alt4gxb_component.rx_rate_match_fifo_mode = "none",
		alt4gxb_component.rx_reconfig_clk_scheme = "indv_clk_source",
		alt4gxb_component.rx_run_length = 40,
		alt4gxb_component.rx_run_length_enable = "true",
		alt4gxb_component.rx_signal_detect_threshold = 2,
		alt4gxb_component.rx_use_align_state_machine = "false",
		alt4gxb_component.rx_use_clkout = "true",
		alt4gxb_component.rx_use_coreclk = "false",
		alt4gxb_component.rx_use_deserializer_double_data_mode = "false",
		alt4gxb_component.rx_use_deskew_fifo = "false",
		alt4gxb_component.rx_use_double_data_mode = "true",
		alt4gxb_component.transmitter_termination = "oct_100_ohms",
		alt4gxb_component.tx_8b_10b_mode = "none",
		alt4gxb_component.tx_allow_polarity_inversion = "false",
		alt4gxb_component.tx_analog_power = "1.5v",
		alt4gxb_component.tx_channel_width = 20,
		alt4gxb_component.tx_clkout_width = 1,
		alt4gxb_component.tx_common_mode = "0.65v",
		alt4gxb_component.tx_datapath_low_latency_mode = "false",
		alt4gxb_component.tx_data_rate = tx_data_rate,
		alt4gxb_component.tx_data_rate_remainder = 0,
		alt4gxb_component.tx_digitalreset_port_width = 1,
		alt4gxb_component.tx_enable_bit_reversal = "false",
		alt4gxb_component.tx_enable_self_test_mode = "false",
		alt4gxb_component.tx_flip_tx_in = "false",
		alt4gxb_component.tx_force_disparity_mode = "false",
		alt4gxb_component.tx_pll_bandwidth_type = "Auto",
		alt4gxb_component.tx_pll_inclk0_period = tx_pll_inclk0_period,
		alt4gxb_component.tx_pll_inclk1_period = tx_pll_inclk1_period,
		alt4gxb_component.tx_pll_type = "CMU",
		alt4gxb_component.tx_reconfig_clk_scheme = "tx_ch0_clk_source",
		alt4gxb_component.tx_reconfig_data_rate = reconfig_data_rate,
		alt4gxb_component.tx_reconfig_data_rate_remainder = 0,
		alt4gxb_component.tx_reconfig_pll_bandwidth_type = "Auto",
		alt4gxb_component.tx_slew_rate = "off",
		alt4gxb_component.tx_transmit_protocol = "basic",
		alt4gxb_component.tx_use_coreclk = "false",
		alt4gxb_component.tx_use_double_data_mode = "true",
		alt4gxb_component.tx_use_serializer_double_data_mode = "false",
		alt4gxb_component.use_calibration_block = "true",
		alt4gxb_component.vod_ctrl_setting = 4,
		alt4gxb_component.gxb_powerdown_width = 1,
		alt4gxb_component.number_of_quads = 1,
		alt4gxb_component.reconfig_calibration = "true",
		alt4gxb_component.reconfig_fromgxb_port_width = 17,
		alt4gxb_component.reconfig_togxb_port_width = 4,
		alt4gxb_component.rx_cru_m_divider = 10,
		alt4gxb_component.rx_cru_n_divider = 1,
		alt4gxb_component.rx_cru_vco_post_scale_divider = 2,
		alt4gxb_component.rx_dwidth_factor = 2,
		alt4gxb_component.rx_enable_local_divider = "false",
		alt4gxb_component.rx_signal_detect_loss_threshold = "1",
		alt4gxb_component.rx_signal_detect_valid_threshold = "1",
		alt4gxb_component.rx_use_external_termination = "false",
		alt4gxb_component.rx_word_aligner_num_byte = 1,
		alt4gxb_component.tx_dwidth_factor = 2,
		alt4gxb_component.tx_pll_clock_post_divider = 1,
		alt4gxb_component.tx_pll_m_divider = 10,
		alt4gxb_component.tx_pll_n_divider = 1,
		alt4gxb_component.tx_pll_vco_post_scale_divider = 2,
		alt4gxb_component.tx_reconfig_pll_m_divider = 10,
		alt4gxb_component.tx_reconfig_pll_n_divider = 1,
		alt4gxb_component.tx_reconfig_pll_vco_post_scale_divider = 2,
		alt4gxb_component.tx_use_external_termination = "false";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: PRIVATE: NUM_KEYS NUMERIC "0"
// Retrieval info: PRIVATE: RECONFIG_PROTOCOL STRING "BASIC"
// Retrieval info: PRIVATE: RECONFIG_SUBPROTOCOL STRING "none"
// Retrieval info: PRIVATE: RX_ENABLE_DC_COUPLING STRING "false"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIZ_BASE_DATA_RATE STRING "2970.0"
// Retrieval info: PRIVATE: WIZ_BASE_DATA_RATE_ENABLE STRING "1"
// Retrieval info: PRIVATE: WIZ_DATA_RATE STRING "2970"
// Retrieval info: PRIVATE: WIZ_DPRIO_DATA_RATE STRING "2967"
// Retrieval info: PRIVATE: WIZ_DPRIO_INCLK_FREQ STRING "148.35"
// Retrieval info: PRIVATE: WIZ_DPRIO_INCLK_FREQ_ARRAY STRING "27.0                   "
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A STRING "2967"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B STRING "148.35"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_DPRIO_PROTOCOL STRING "BASIC"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK0_FREQ STRING "59.4"
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
// Retrieval info: PRIVATE: WIZ_DPRIO_SUBPROTOCOL STRING "none"
// Retrieval info: PRIVATE: WIZ_ENABLE_EQUALIZER_CTRL NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_EQUALIZER_CTRL_SETTING NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_FORCE_DEFAULT_SETTINGS NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_INCLK_FREQ STRING "148.5"
// Retrieval info: PRIVATE: WIZ_INCLK_FREQ_ARRAY STRING "27.0                   "
// Retrieval info: PRIVATE: WIZ_INPUT_A STRING "2970"
// Retrieval info: PRIVATE: WIZ_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_INPUT_B STRING "148.5"
// Retrieval info: PRIVATE: WIZ_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_SUBPROTOCOL STRING "None"
// Retrieval info: PRIVATE: WIZ_WORD_ALIGN_FLIP_PATTERN STRING "0"
// Retrieval info: PARAMETER: STARTING_CHANNEL_NUMBER NUMERIC "4"
// Retrieval info: CONSTANT: BASE_DATA_RATE STRING "2970.0 Mbps"
// Retrieval info: CONSTANT: CMU_PLL_INCLK_LOG_INDEX NUMERIC "0"
// Retrieval info: CONSTANT: CMU_PLL_LOG_INDEX NUMERIC "0"
// Retrieval info: CONSTANT: CMU_PLL_RECONFIG_INCLK_LOG_INDEX NUMERIC "1"
// Retrieval info: CONSTANT: CMU_PLL_RECONFIG_INCLOCK_PERIOD NUMERIC "6741"
// Retrieval info: CONSTANT: CMU_PLL_RECONFIG_LOG_INDEX NUMERIC "1"
// Retrieval info: CONSTANT: EFFECTIVE_DATA_RATE STRING "2970 Mbps"
// Retrieval info: CONSTANT: ENABLE_LC_TX_PLL STRING "false"
// Retrieval info: CONSTANT: ENABLE_PLL_INCLK_DRIVE_RX_CRU STRING "true"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_A_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_B_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_C_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_D_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_V_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_DCGAIN_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: GEN_RECONFIG_PLL STRING "true"
// Retrieval info: CONSTANT: GXB_ANALOG_POWER STRING "AUTO"
// Retrieval info: CONSTANT: GX_CHANNEL_TYPE STRING "AUTO"
// Retrieval info: CONSTANT: INPUT_CLOCK_FREQUENCY STRING "148.5 MHz"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: CONSTANT: INTENDED_DEVICE_SPEED_GRADE STRING "2"
// Retrieval info: CONSTANT: INTENDED_DEVICE_VARIANT STRING "GX"
// Retrieval info: CONSTANT: LOOPBACK_MODE STRING "none"
// Retrieval info: CONSTANT: LPM_TYPE STRING "alt4gxb"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "duplex"
// Retrieval info: CONSTANT: PLL_CONTROL_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: PLL_PFD_FB_MODE STRING "internal"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_1STPOSTTAP_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_2NDPOSTTAP_INV_SETTING STRING "false"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_2NDPOSTTAP_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_PRETAP_INV_SETTING STRING "false"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_PRETAP_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RECEIVER_TERMINATION STRING "oct_100_ohms"
// Retrieval info: CONSTANT: RECONFIG_BASE_DATA_RATE STRING "2967 Mbps"
// Retrieval info: CONSTANT: RECONFIG_DPRIO_MODE NUMERIC "18"
// Retrieval info: CONSTANT: RECONFIG_INPUT_CLOCK_FREQUENCY STRING "148.35 MHz"
// Retrieval info: CONSTANT: RECONFIG_PLL_INCLK_WIDTH NUMERIC "2"
// Retrieval info: CONSTANT: RECONFIG_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RX_8B_10B_MODE STRING "none"
// Retrieval info: CONSTANT: RX_ALIGN_PATTERN STRING "0101111100"
// Retrieval info: CONSTANT: RX_ALIGN_PATTERN_LENGTH NUMERIC "10"
// Retrieval info: CONSTANT: RX_ALLOW_ALIGN_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_ALLOW_PIPE_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_BITSLIP_ENABLE STRING "true"
// Retrieval info: CONSTANT: RX_BYTE_ORDERING_MODE STRING "NONE"
// Retrieval info: CONSTANT: RX_CHANNEL_WIDTH NUMERIC "20"
// Retrieval info: CONSTANT: RX_COMMON_MODE STRING "0.82v"
// Retrieval info: CONSTANT: RX_CRU_BANDWIDTH_TYPE STRING "Auto"
// Retrieval info: CONSTANT: RX_CRU_INCLK_LOG_INDEX NUMERIC "0"
// Retrieval info: CONSTANT: RX_CRU_INCLOCK0_PERIOD NUMERIC "6734"
// Retrieval info: CONSTANT: RX_DATAPATH_LOW_LATENCY_MODE STRING "false"
// Retrieval info: CONSTANT: RX_DATAPATH_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RX_DATA_RATE NUMERIC "2970"
// Retrieval info: CONSTANT: RX_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: RX_DIGITALRESET_PORT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: RX_ENABLE_BIT_REVERSAL STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_DEEP_ALIGN_BYTE_SWAP STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_DATA_SIG STRING "true"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_REFCLK_SIG STRING "true"
// Retrieval info: CONSTANT: RX_ENABLE_SELF_TEST_MODE STRING "false"
// Retrieval info: CONSTANT: RX_FLIP_RX_OUT STRING "false"
// Retrieval info: CONSTANT: RX_FORCE_SIGNAL_DETECT STRING "true"
// Retrieval info: CONSTANT: RX_PHFIFOREGMODE STRING "false"
// Retrieval info: CONSTANT: RX_PPMSELECT NUMERIC "32"
// Retrieval info: CONSTANT: RX_RATE_MATCH_FIFO_MODE STRING "none"
// Retrieval info: CONSTANT: RX_RECONFIG_CLK_SCHEME STRING "indv_clk_source"
// Retrieval info: CONSTANT: RX_RUN_LENGTH NUMERIC "40"
// Retrieval info: CONSTANT: RX_RUN_LENGTH_ENABLE STRING "true"
// Retrieval info: CONSTANT: RX_SIGNAL_DETECT_THRESHOLD NUMERIC "2"
// Retrieval info: CONSTANT: RX_USE_ALIGN_STATE_MACHINE STRING "false"
// Retrieval info: CONSTANT: RX_USE_CLKOUT STRING "true"
// Retrieval info: CONSTANT: RX_USE_CORECLK STRING "false"
// Retrieval info: CONSTANT: RX_USE_DESERIALIZER_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: RX_USE_DESKEW_FIFO STRING "false"
// Retrieval info: CONSTANT: RX_USE_DOUBLE_DATA_MODE STRING "true"
// Retrieval info: CONSTANT: TRANSMITTER_TERMINATION STRING "oct_100_ohms"
// Retrieval info: CONSTANT: TX_8B_10B_MODE STRING "none"
// Retrieval info: CONSTANT: TX_ALLOW_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: TX_ANALOG_POWER STRING "1.5v"
// Retrieval info: CONSTANT: TX_CHANNEL_WIDTH NUMERIC "20"
// Retrieval info: CONSTANT: TX_CLKOUT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: TX_COMMON_MODE STRING "0.65v"
// Retrieval info: CONSTANT: TX_DATAPATH_LOW_LATENCY_MODE STRING "false"
// Retrieval info: CONSTANT: TX_DATA_RATE NUMERIC "2970"
// Retrieval info: CONSTANT: TX_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: TX_DIGITALRESET_PORT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: TX_ENABLE_BIT_REVERSAL STRING "false"
// Retrieval info: CONSTANT: TX_ENABLE_SELF_TEST_MODE STRING "false"
// Retrieval info: CONSTANT: TX_FLIP_TX_IN STRING "false"
// Retrieval info: CONSTANT: TX_FORCE_DISPARITY_MODE STRING "false"
// Retrieval info: CONSTANT: TX_PLL_BANDWIDTH_TYPE STRING "Auto"
// Retrieval info: CONSTANT: TX_PLL_INCLK0_PERIOD NUMERIC "6734"
// Retrieval info: CONSTANT: TX_PLL_INCLK1_PERIOD NUMERIC "6741"
// Retrieval info: CONSTANT: TX_PLL_TYPE STRING "CMU"
// Retrieval info: CONSTANT: TX_RECONFIG_CLK_SCHEME STRING "tx_ch0_clk_source"
// Retrieval info: CONSTANT: TX_RECONFIG_DATA_RATE NUMERIC "2967"
// Retrieval info: CONSTANT: TX_RECONFIG_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: TX_RECONFIG_PLL_BANDWIDTH_TYPE STRING "Auto"
// Retrieval info: CONSTANT: TX_SLEW_RATE STRING "off"
// Retrieval info: CONSTANT: TX_TRANSMIT_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: TX_USE_CORECLK STRING "false"
// Retrieval info: CONSTANT: TX_USE_DOUBLE_DATA_MODE STRING "true"
// Retrieval info: CONSTANT: TX_USE_SERIALIZER_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: USE_CALIBRATION_BLOCK STRING "true"
// Retrieval info: CONSTANT: VOD_CTRL_SETTING NUMERIC "4"
// Retrieval info: CONSTANT: gxb_powerdown_width NUMERIC "1"
// Retrieval info: CONSTANT: number_of_quads NUMERIC "1"
// Retrieval info: CONSTANT: reconfig_calibration STRING "true"
// Retrieval info: CONSTANT: reconfig_fromgxb_port_width NUMERIC "17"
// Retrieval info: CONSTANT: reconfig_togxb_port_width NUMERIC "4"
// Retrieval info: CONSTANT: rx_cru_m_divider NUMERIC "10"
// Retrieval info: CONSTANT: rx_cru_n_divider NUMERIC "1"
// Retrieval info: CONSTANT: rx_cru_vco_post_scale_divider NUMERIC "2"
// Retrieval info: CONSTANT: rx_dwidth_factor NUMERIC "2"
// Retrieval info: CONSTANT: rx_enable_local_divider STRING "false"
// Retrieval info: CONSTANT: rx_signal_detect_loss_threshold STRING "1"
// Retrieval info: CONSTANT: rx_signal_detect_valid_threshold STRING "1"
// Retrieval info: CONSTANT: rx_use_external_termination STRING "false"
// Retrieval info: CONSTANT: rx_word_aligner_num_byte NUMERIC "1"
// Retrieval info: CONSTANT: tx_dwidth_factor NUMERIC "2"
// Retrieval info: CONSTANT: tx_pll_clock_post_divider NUMERIC "1"
// Retrieval info: CONSTANT: tx_pll_m_divider NUMERIC "10"
// Retrieval info: CONSTANT: tx_pll_n_divider NUMERIC "1"
// Retrieval info: CONSTANT: tx_pll_vco_post_scale_divider NUMERIC "2"
// Retrieval info: CONSTANT: tx_reconfig_pll_m_divider NUMERIC "10"
// Retrieval info: CONSTANT: tx_reconfig_pll_n_divider NUMERIC "1"
// Retrieval info: CONSTANT: tx_reconfig_pll_vco_post_scale_divider NUMERIC "2"
// Retrieval info: CONSTANT: tx_use_external_termination STRING "false"
// Retrieval info: USED_PORT: cal_blk_clk 0 0 0 0 INPUT NODEFVAL "cal_blk_clk"
// Retrieval info: USED_PORT: gxb_powerdown 0 0 1 0 INPUT NODEFVAL "gxb_powerdown[0..0]"
// Retrieval info: USED_PORT: pll_inclk_rx_cruclk 0 0 2 0 INPUT NODEFVAL "pll_inclk_rx_cruclk[1..0]"
// Retrieval info: USED_PORT: pll_locked 0 0 1 0 OUTPUT NODEFVAL "pll_locked[0..0]"
// Retrieval info: USED_PORT: pll_locked_alt 0 0 1 0 OUTPUT NODEFVAL "pll_locked_alt[0..0]"
// Retrieval info: USED_PORT: reconfig_clk 0 0 0 0 INPUT NODEFVAL "reconfig_clk"
// Retrieval info: USED_PORT: reconfig_fromgxb 0 0 17 0 OUTPUT NODEFVAL "reconfig_fromgxb[16..0]"
// Retrieval info: USED_PORT: reconfig_togxb 0 0 4 0 INPUT NODEFVAL "reconfig_togxb[3..0]"
// Retrieval info: USED_PORT: rx_analogreset 0 0 1 0 INPUT NODEFVAL "rx_analogreset[0..0]"
// Retrieval info: USED_PORT: rx_bitslip 0 0 1 0 INPUT NODEFVAL "rx_bitslip[0..0]"
// Retrieval info: USED_PORT: rx_clkout 0 0 1 0 OUTPUT NODEFVAL "rx_clkout[0..0]"
// Retrieval info: USED_PORT: rx_datain 0 0 1 0 INPUT NODEFVAL "rx_datain[0..0]"
// Retrieval info: USED_PORT: rx_dataout 0 0 20 0 OUTPUT NODEFVAL "rx_dataout[19..0]"
// Retrieval info: USED_PORT: rx_digitalreset 0 0 1 0 INPUT NODEFVAL "rx_digitalreset[0..0]"
// Retrieval info: USED_PORT: rx_locktodata 0 0 1 0 INPUT NODEFVAL "rx_locktodata[0..0]"
// Retrieval info: USED_PORT: rx_locktorefclk 0 0 1 0 INPUT NODEFVAL "rx_locktorefclk[0..0]"
// Retrieval info: USED_PORT: rx_pll_locked 0 0 1 0 OUTPUT NODEFVAL "rx_pll_locked[0..0]"
// Retrieval info: USED_PORT: tx_clkout 0 0 1 0 OUTPUT NODEFVAL "tx_clkout[0..0]"
// Retrieval info: USED_PORT: tx_datain 0 0 20 0 INPUT NODEFVAL "tx_datain[19..0]"
// Retrieval info: USED_PORT: tx_dataout 0 0 1 0 OUTPUT NODEFVAL "tx_dataout[0..0]"
// Retrieval info: USED_PORT: tx_digitalreset 0 0 1 0 INPUT NODEFVAL "tx_digitalreset[0..0]"
// Retrieval info: CONNECT: @cal_blk_clk 0 0 0 0 cal_blk_clk 0 0 0 0
// Retrieval info: CONNECT: @gxb_powerdown 0 0 1 0 gxb_powerdown 0 0 1 0
// Retrieval info: CONNECT: @pll_inclk_rx_cruclk 0 0 2 0 pll_inclk_rx_cruclk 0 0 2 0
// Retrieval info: CONNECT: @reconfig_clk 0 0 0 0 reconfig_clk 0 0 0 0
// Retrieval info: CONNECT: @reconfig_togxb 0 0 4 0 reconfig_togxb 0 0 4 0
// Retrieval info: CONNECT: @rx_analogreset 0 0 1 0 rx_analogreset 0 0 1 0
// Retrieval info: CONNECT: @rx_bitslip 0 0 1 0 rx_bitslip 0 0 1 0
// Retrieval info: CONNECT: @rx_datain 0 0 1 0 rx_datain 0 0 1 0
// Retrieval info: CONNECT: @rx_digitalreset 0 0 1 0 rx_digitalreset 0 0 1 0
// Retrieval info: CONNECT: @rx_locktodata 0 0 1 0 rx_locktodata 0 0 1 0
// Retrieval info: CONNECT: @rx_locktorefclk 0 0 1 0 rx_locktorefclk 0 0 1 0
// Retrieval info: CONNECT: @tx_datain 0 0 20 0 tx_datain 0 0 20 0
// Retrieval info: CONNECT: @tx_digitalreset 0 0 1 0 tx_digitalreset 0 0 1 0
// Retrieval info: CONNECT: pll_locked 0 0 1 0 @pll_locked 0 0 1 0
// Retrieval info: CONNECT: pll_locked_alt 0 0 1 0 @pll_locked_alt 0 0 1 0
// Retrieval info: CONNECT: reconfig_fromgxb 0 0 17 0 @reconfig_fromgxb 0 0 17 0
// Retrieval info: CONNECT: rx_clkout 0 0 1 0 @rx_clkout 0 0 1 0
// Retrieval info: CONNECT: rx_dataout 0 0 20 0 @rx_dataout 0 0 20 0
// Retrieval info: CONNECT: rx_pll_locked 0 0 1 0 @rx_pll_locked 0 0 1 0
// Retrieval info: CONNECT: tx_clkout 0 0 1 0 @tx_clkout 0 0 1 0
// Retrieval info: CONNECT: tx_dataout 0 0 1 0 @tx_dataout 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll.ppf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_s4gxb_duplex_2pll_bb.v TRUE
// Retrieval info: CBX_MODULE_PREFIX: ON
