// megafunction wizard: %SDI v12.0%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			sdi_megacore_top
// ============================================================
// Generated by SDI 12.0 [Altera, IP Toolbench 1.3.0 Build 129]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2012 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.


module trsdi_rx (
	rst_rx,
	rx_serial_refclk,
	refclk_rate,
	sdi_rx,
	en_sync_switch,
	enable_hd_search,
	enable_sd_search,
	gxb4_cal_clk,
	sdi_reconfig_clk,
	sdi_reconfig_togxb,
	sdi_gxb_powerdown,
	enable_3g_search,
	sdi_reconfig_done,
	detected_rate,
	rx_xyz,
	xyz_valid,
	rx_eav,
	rx_trs,
	rx_std_flag_hd_sdn,
	rxdata,
	rx_F,
	rx_V,
	rx_H,
	rx_AP,
	rx_ln,
	rx_video_format,
	crc_error_y,
	crc_error_c,
	rx_anc_data,
	rx_anc_valid,
	rx_anc_error,
	rx_status,
	rx_data_valid_out,
	rx_clk,
	sdi_reconfig_fromgxb,
	rx_std,
	sdi_start_reconfig);

	parameter QTB = "on";
	parameter QTB_direction = "Rx";
	parameter QTB_test_pattern = "false";
	parameter QTB_num_channels = "1";
	parameter QTB_standard = "MR";
	parameter QTB_rate_flag = "true";
	parameter QTB_crc_flag = "true";
	parameter QTB_enable_soft_serdes = "false";
	parameter QTB_tx_clk_option = "no_pll";
	parameter QTB_rx_clk_option = "no_pll";
	parameter QTB_fvh_flag = "true";
	parameter QTB_os_mode = "false";
	parameter QTB_serdes_type = "0";
	parameter QTB_tcvr_protocol_select = "tcvr_protocol";
	parameter QTB_starting_channel_number = "0";
	parameter QTB_tolerate_missed_eav = "1";
	parameter QTB_debugMode = "true";
	parameter QTB_enable_pll_reconfig = "false";
	parameter QTB_enable_tx_clk_mux = "false";
	parameter QTB_rx = "true";
	parameter QTB_mrparam = "true";
	parameter QTB_device = "5AGXFB1H4F40C5";
	parameter QTB_devicefamily = "Arria V";
	parameter QTB_dlparam = "false";
	parameter QTB_dsparam = "false";
	parameter QTB_duplex = "false";
	parameter QTB_hdparam = "false";
	parameter QTB_multiXcvrText0 = "Device Behavior for Multiple Transceivers";
	parameter QTB_multiXcvrText1 = "Arria V devices have two transmit PLLs per quad allowing each";
	parameter QTB_multiXcvrText2 = "transmitter to run at one of two independent rates.";
	parameter QTB_multiXcvrText3 = "Receivers in a quad share a common training clock, but have independent";
	parameter QTB_multiXcvrText4 = "receiver PLLs. Because the same training clock is used for SD and HD SDI,";
	parameter QTB_multiXcvrText5 = "receivers can accommodate the different standards within a single quad.";
	parameter QTB_multiXcvrText6 = " ";
	parameter QTB_multiXcvrText7 = " ";
	parameter QTB_sdparam = "false";
	parameter QTB_starting_channel_text_0 = "Each SDI core must have a unique starting channel number.";
	parameter QTB_starting_channel_text_1 = "See ALTERA GXB or SDI user guide for more info.";
	parameter QTB_threegparam = "false";
	parameter QTB_tx = "false";

	input		rst_rx;
	input		rx_serial_refclk;
	input		refclk_rate;
	input	[0:0]	sdi_rx;
	input		en_sync_switch;
	input		enable_hd_search;
	input		enable_sd_search;
	input		gxb4_cal_clk;
	input		sdi_reconfig_clk;
	input	[69:0]	sdi_reconfig_togxb;
	input		sdi_gxb_powerdown;
	input		enable_3g_search;
	input		sdi_reconfig_done;
	output		detected_rate;
	output		rx_xyz;
	output		xyz_valid;
	output		rx_eav;
	output		rx_trs;
	output	[0:0]	rx_std_flag_hd_sdn;
	output	[19:0]	rxdata;
	output	[1:0]	rx_F;
	output	[1:0]	rx_V;
	output	[1:0]	rx_H;
	output	[1:0]	rx_AP;
	output	[21:0]	rx_ln;
	output	[7:0]	rx_video_format;
	output	[1:0]	crc_error_y;
	output	[1:0]	crc_error_c;
	output	[19:0]	rx_anc_data;
	output	[3:0]	rx_anc_valid;
	output	[3:0]	rx_anc_error;
	output	[10:0]	rx_status;
	output	[1:0]	rx_data_valid_out;
	output		rx_clk;
	output	[45:0]	sdi_reconfig_fromgxb;
	output	[1:0]	rx_std;
	output		sdi_start_reconfig;


	sdi_megacore_top	sdi_megacore_top_inst(
		.rst_rx(rst_rx),
		.rx_serial_refclk(rx_serial_refclk),
		.refclk_rate(refclk_rate),
		.sdi_rx(sdi_rx),
		.en_sync_switch(en_sync_switch),
		.enable_hd_search(enable_hd_search),
		.enable_sd_search(enable_sd_search),
		.gxb4_cal_clk(gxb4_cal_clk),
		.sdi_reconfig_clk(sdi_reconfig_clk),
		.sdi_reconfig_togxb(sdi_reconfig_togxb),
		.sdi_gxb_powerdown(sdi_gxb_powerdown),
		.enable_3g_search(enable_3g_search),
		.sdi_reconfig_done(sdi_reconfig_done),
		.detected_rate(detected_rate),
		.rx_xyz(rx_xyz),
		.xyz_valid(xyz_valid),
		.rx_eav(rx_eav),
		.rx_trs(rx_trs),
		.rx_std_flag_hd_sdn(rx_std_flag_hd_sdn),
		.rxdata(rxdata),
		.rx_F(rx_F),
		.rx_V(rx_V),
		.rx_H(rx_H),
		.rx_AP(rx_AP),
		.rx_ln(rx_ln),
		.rx_video_format(rx_video_format),
		.crc_error_y(crc_error_y),
		.crc_error_c(crc_error_c),
		.rx_anc_data(rx_anc_data),
		.rx_anc_valid(rx_anc_valid),
		.rx_anc_error(rx_anc_error),
		.rx_status(rx_status),
		.rx_data_valid_out(rx_data_valid_out),
		.rx_clk(rx_clk),
		.sdi_reconfig_fromgxb(sdi_reconfig_fromgxb),
		.rx_std(rx_std),
		.sdi_start_reconfig(sdi_start_reconfig));

	defparam
		sdi_megacore_top_inst.ENABLE_TX_LOGIC = 1'b0,
		sdi_megacore_top_inst.ENABLE_RX_LOGIC = 1'b1,
		sdi_megacore_top_inst.enable_pattern_generator = 1'b0,
		sdi_megacore_top_inst.num_chs = 1,
		sdi_megacore_top_inst.enable_rate_flags = 1'b1,
		sdi_megacore_top_inst.generate_hd_blocks = 1'b1,
		sdi_megacore_top_inst.generate_sd_blocks = 1'b1,
		sdi_megacore_top_inst.enable_hard_serdes = 1'b1,
		sdi_megacore_top_inst.enable_crc_flag_port = 1'b1,
		sdi_megacore_top_inst.enable_soft_serdes = 1'b0,
		sdi_megacore_top_inst.INCLUDE_TX_PLL = 1'b0,
		sdi_megacore_top_inst.INCLUDE_RX_PLL = 1'b0,
		sdi_megacore_top_inst.enable_fvh_flag_port = 1'b1,
		sdi_megacore_top_inst.ENABLE_RX_GXB = 1'b1,
		sdi_megacore_top_inst.ENABLE_TX_GXB = 1'b0,
		sdi_megacore_top_inst.ENABLE_HD_DUAL_LINK = 1'b0,
		sdi_megacore_top_inst.ENABLE_2X_HD_TX = 1'b0,
		sdi_megacore_top_inst.ENABLE_3G = 1'b1,
		sdi_megacore_top_inst.ENABLE_RX_SS = 1'b1,
		sdi_megacore_top_inst.ENABLE_TX_SS = 1'b0,
		sdi_megacore_top_inst.USE_CYCLONE_CLOCKING = 1'b0,
		sdi_megacore_top_inst.SELECT_ALT2GXB = 1'b0,
		sdi_megacore_top_inst.SELECT_ALT4GXB = 1'b0,
		sdi_megacore_top_inst.SELECT_ALT_C4GXB = 1'b0,
		sdi_megacore_top_inst.SELECT_CUSTOMPHY = 1'b1,
		sdi_megacore_top_inst.ENABLE_PLL_RECONFIG = 1'b0,
		sdi_megacore_top_inst.ENABLE_TX_CLK_MUX = 1'b0,
		sdi_megacore_top_inst.ENABLE_SSC = 1'b0,
		sdi_megacore_top_inst.STARTING_CHANNEL_NUMBER = 0,
		sdi_megacore_top_inst.STARTING_CHANNEL_NUMBER_LINK_B = 4,
		sdi_megacore_top_inst.SELECT_FAMILY = "Arria V",
		sdi_megacore_top_inst.TOLERATE_CONSECUTIVE_MISSED_EAV = 1;
endmodule

// =========================================================
// SDI Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, SDI Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="SDI MegaCore Function"  version="12.0"  build="129"  iptb_version="1.3.0 Build 129"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION active_core="sdi_megacore_top" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "direction" value="Rx"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "test_pattern" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "num_channels" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "standard" value="MR"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "rate_flag" value="true"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "crc_flag" value="true"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_soft_serdes" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "tx_clk_option" value="no_pll"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "rx_clk_option" value="no_pll"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "fvh_flag" value="true"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "os_mode" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "serdes_type" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "tcvr_protocol_select" value="tcvr_protocol"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_number" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "tolerate_missed_eav" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "debugMode" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_pll_reconfig" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_tx_clk_mux" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "rx" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "mrparam" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "device" value="5AGXFB1H4F40C5"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "devicefamily" value="Arria V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "dlparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "dsparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "duplex" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "hdparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText0" value="Device Behavior for Multiple Transceivers"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText1" value="Arria V devices have two transmit PLLs per quad allowing each"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText2" value="transmitter to run at one of two independent rates."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText3" value="Receivers in a quad share a common training clock, but have independent"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText4" value="receiver PLLs. Because the same training clock is used for SD and HD SDI,"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText5" value="receivers can accommodate the different standards within a single quad."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText6" value=" "  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText7" value=" "  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "sdparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_text_0" value="Each SDI core must have a unique starting channel number."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_text_1" value="See ALTERA GXB or SDI user guide for more info."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "threegparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "tx" value="false"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="VERILOG"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "gb_enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "filename" value="t_RT_458_rx_1of1_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="t_RT_458_rx_1of1.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <CONSTANTS>
// Retrieval info:     <CONSTANT name = "ENABLE_TX_LOGIC" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_RX_LOGIC" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_pattern_generator" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "num_chs" value="1"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "enable_rate_flags" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "generate_hd_blocks" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "generate_sd_blocks" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_hard_serdes" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_crc_flag_port" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_soft_serdes" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "INCLUDE_TX_PLL" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "INCLUDE_RX_PLL" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_fvh_flag_port" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_RX_GXB" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_TX_GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_HD_DUAL_LINK" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_2X_HD_TX" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_3G" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_RX_SS" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_TX_SS" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "USE_CYCLONE_CLOCKING" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_ALT2GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_ALT4GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_ALT_C4GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_CUSTOMPHY" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_PLL_RECONFIG" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_TX_CLK_MUX" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_SSC" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "STARTING_CHANNEL_NUMBER" value="0"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "STARTING_CHANNEL_NUMBER_LINK_B" value="4"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "SELECT_FAMILY" value="Arria V"  type="STRING" />
// Retrieval info:     <CONSTANT name = "TOLERATE_CONSECUTIVE_MISSED_EAV" value="1"  type="INTEGER" />
// Retrieval info:    </CONSTANTS>
// Retrieval info:    <PORTS>
// Retrieval info:     <PORT name = "rst_rx" direction="INPUT"  connect_to="rst_rx"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rx_serial_refclk" direction="INPUT"  connect_to="rx_serial_refclk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "refclk_rate" direction="INPUT"  connect_to="refclk_rate"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "detected_rate" direction="OUTPUT"  connect_to="detected_rate"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_rx" direction="INPUT"  connect_to="sdi_rx"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "en_sync_switch" direction="INPUT"  connect_to="en_sync_switch"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rx_xyz" direction="OUTPUT"  connect_to="rx_xyz"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "xyz_valid" direction="OUTPUT"  connect_to="xyz_valid"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rx_eav" direction="OUTPUT"  connect_to="rx_eav"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rx_trs" direction="OUTPUT"  connect_to="rx_trs"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rx_std_flag_hd_sdn" direction="OUTPUT"  connect_to="rx_std_flag_hd_sdn"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "enable_hd_search" direction="INPUT"  connect_to="enable_hd_search"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "enable_sd_search" direction="INPUT"  connect_to="enable_sd_search"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rxdata" direction="OUTPUT"  connect_to="rxdata"  default="NODEFVAL"  high_width="19"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_F" direction="OUTPUT"  connect_to="rx_F"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_V" direction="OUTPUT"  connect_to="rx_V"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_H" direction="OUTPUT"  connect_to="rx_H"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_AP" direction="OUTPUT"  connect_to="rx_AP"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_ln" direction="OUTPUT"  connect_to="rx_ln"  default="NODEFVAL"  high_width="21"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_video_format" direction="OUTPUT"  connect_to="rx_video_format"  default="NODEFVAL"  high_width="7"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "crc_error_y" direction="OUTPUT"  connect_to="crc_error_y"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "crc_error_c" direction="OUTPUT"  connect_to="crc_error_c"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_anc_data" direction="OUTPUT"  connect_to="rx_anc_data"  default="NODEFVAL"  high_width="19"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_anc_valid" direction="OUTPUT"  connect_to="rx_anc_valid"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_anc_error" direction="OUTPUT"  connect_to="rx_anc_error"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_status" direction="OUTPUT"  connect_to="rx_status"  default="NODEFVAL"  high_width="10"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_data_valid_out" direction="OUTPUT"  connect_to="rx_data_valid_out"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "rx_clk" direction="OUTPUT"  connect_to="rx_clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "gxb4_cal_clk" direction="INPUT"  connect_to="gxb4_cal_clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_clk" direction="INPUT"  connect_to="sdi_reconfig_clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_fromgxb" direction="OUTPUT"  connect_to="sdi_reconfig_fromgxb"  default="NODEFVAL"  high_width="45"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_togxb" direction="INPUT"  connect_to="sdi_reconfig_togxb"  default="NODEFVAL"  high_width="69"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "sdi_gxb_powerdown" direction="INPUT"  connect_to="sdi_gxb_powerdown"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "enable_3g_search" direction="INPUT"  connect_to="enable_3g_search"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rx_std" direction="OUTPUT"  connect_to="rx_std"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "sdi_start_reconfig" direction="OUTPUT"  connect_to="sdi_start_reconfig"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_done" direction="INPUT"  connect_to="sdi_reconfig_done"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:    </PORTS>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
// RELATED_FILES: t_RT_458_rx_1of1.v;
// IPFS_FILES: t_RT_458_rx_1of1.vo;
// =========================================================
