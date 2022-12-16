// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// megafunction wizard: %10GBASE-R PHY v12.1%
// GENERATION: XML
// baser.v

// Generated using ACDS version 12.1sp1 243 at 2013.03.22.13:26:54

`timescale 1 ps / 1 ps
module baser (
		input  wire         pll_ref_clk,          //        pll_ref_clk.clk
		output wire         xgmii_rx_clk,         //       xgmii_rx_clk.clk
		output wire         tx_ready,             //           tx_ready.export
		input  wire         xgmii_tx_clk,         //       xgmii_tx_clk.clk
		output wire         rx_ready,             //           rx_ready.export
		output wire [0:0]   rx_data_ready,        //      rx_data_ready.export
		output wire [71:0]  xgmii_rx_dc_0,        //      xgmii_rx_dc_0.data
		input  wire         rx_serial_data_0,     //   rx_serial_data_0.export
		input  wire [71:0]  xgmii_tx_dc_0,        //      xgmii_tx_dc_0.data
		output wire [0:0]   tx_serial_data_0,     //   tx_serial_data_0.export
		output wire [91:0]  reconfig_from_xcvr,   // reconfig_from_xcvr.reconfig_from_xcvr
		input  wire [139:0] reconfig_to_xcvr,     //   reconfig_to_xcvr.reconfig_to_xcvr
		input  wire         phy_mgmt_clk,         //       phy_mgmt_clk.clk
		input  wire         phy_mgmt_clk_reset,   // phy_mgmt_clk_reset.reset
		input  wire [8:0]   phy_mgmt_address,     //           phy_mgmt.address
		input  wire         phy_mgmt_read,        //                   .read
		output wire [31:0]  phy_mgmt_readdata,    //                   .readdata
		input  wire         phy_mgmt_write,       //                   .write
		input  wire [31:0]  phy_mgmt_writedata,   //                   .writedata
		output wire         phy_mgmt_waitrequest  //                   .waitrequest
	);

	wire   [0:0] baser_inst_tx_serial_data; // port fragment
	wire  [71:0] baser_inst_xgmii_rx_dc;    // port fragment

	altera_xcvr_10gbaser #(
		.device_family            ("Stratix V"),
		.num_channels             (1),
		.operation_mode           ("duplex"),
		.external_pma_ctrl_config (0),
		.control_pin_out          (0),
		.recovered_clk_out        (0),
		.pll_locked_out           (0),
		.ref_clk_freq             ("644.53125 MHz"),
		.pll_type                 ("ATX"),
		.starting_channel_number  (0),
		.reconfig_interfaces      (2),
		.rx_use_coreclk           (0),
		.latadj                   (0),
		.tx_termination           ("OCT_100_OHMS"),
		.tx_vod_selection         (7),
		.tx_preemp_pretap         (0),
		.tx_preemp_pretap_inv     (0),
		.tx_preemp_tap_1          (15),
		.tx_preemp_tap_2          (0),
		.tx_preemp_tap_2_inv      (0),
		.rx_common_mode           ("0.82v"),
		.rx_termination           ("OCT_100_OHMS"),
		.rx_eq_dc_gain            (0),
		.rx_eq_ctrl               (0),
		.mgmt_clk_in_mhz          (150)
	) baser_inst (
		.pll_ref_clk          (pll_ref_clk),               //        pll_ref_clk.clk
		.xgmii_rx_clk         (xgmii_rx_clk),              //       xgmii_rx_clk.clk
		.tx_ready             (tx_ready),                  //           tx_ready.export
		.xgmii_tx_clk         (xgmii_tx_clk),              //       xgmii_tx_clk.clk
		.rx_ready             (rx_ready),                  //           rx_ready.export
		.rx_data_ready        (rx_data_ready),             //      rx_data_ready.export
		.xgmii_rx_dc          (baser_inst_xgmii_rx_dc),    //      xgmii_rx_dc_0.data
		.rx_serial_data       ({rx_serial_data_0}),        //   rx_serial_data_0.export
		.xgmii_tx_dc          ({xgmii_tx_dc_0[71:0]}),     //      xgmii_tx_dc_0.data
		.tx_serial_data       (baser_inst_tx_serial_data), //   tx_serial_data_0.export
		.reconfig_from_xcvr   (reconfig_from_xcvr),        // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr     (reconfig_to_xcvr),          //   reconfig_to_xcvr.reconfig_to_xcvr
		.phy_mgmt_clk         (phy_mgmt_clk),              //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset   (phy_mgmt_clk_reset),        // phy_mgmt_clk_reset.reset
		.phy_mgmt_address     (phy_mgmt_address),          //           phy_mgmt.address
		.phy_mgmt_read        (phy_mgmt_read),             //                   .read
		.phy_mgmt_readdata    (phy_mgmt_readdata),         //                   .readdata
		.phy_mgmt_write       (phy_mgmt_write),            //                   .write
		.phy_mgmt_writedata   (phy_mgmt_writedata),        //                   .writedata
		.phy_mgmt_waitrequest (phy_mgmt_waitrequest),      //                   .waitrequest
		.rx_block_lock        (),                          //        (terminated)
		.rx_hi_ber            (),                          //        (terminated)
		.rx_recovered_clk     (),                          //        (terminated)
		.rx_coreclkin         (1'b0),                      //        (terminated)
		.pll_locked           (),                          //        (terminated)
		.gxb_pdn              (1'b0),                      //        (terminated)
		.pll_pdn              (1'b0),                      //        (terminated)
		.cal_blk_pdn          (1'b0),                      //        (terminated)
		.cal_blk_clk          (1'b0),                      //        (terminated)
		.rx_latency_adj       (),                          //        (terminated)
		.tx_latency_adj       ()                           //        (terminated)
	);

	assign tx_serial_data_0 = { baser_inst_tx_serial_data[0:0] };

	assign xgmii_rx_dc_0 = { baser_inst_xgmii_rx_dc[71:0] };

endmodule
// Retrieval info: <?xml version="1.0"?>
//<!--
//	Generated by Altera MegaWizard Launcher Utility version 1.0
//	************************************************************
//	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//	************************************************************
//	Copyright (C) 1991-2013 Altera Corporation
//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.
//-->
// Retrieval info: <instance entity-name="altera_xcvr_10gbaser" version="12.1" >
// Retrieval info: 	<generic name="device_family" value="Stratix V" />
// Retrieval info: 	<generic name="num_channels" value="1" />
// Retrieval info: 	<generic name="operation_mode" value="duplex" />
// Retrieval info: 	<generic name="external_pma_ctrl_config" value="0" />
// Retrieval info: 	<generic name="control_pin_out" value="0" />
// Retrieval info: 	<generic name="recovered_clk_out" value="0" />
// Retrieval info: 	<generic name="pll_locked_out" value="0" />
// Retrieval info: 	<generic name="gui_pll_type" value="ATX" />
// Retrieval info: 	<generic name="ref_clk_freq" value="644.53125 MHz" />
// Retrieval info: 	<generic name="starting_channel_number" value="0" />
// Retrieval info: 	<generic name="sys_clk_in_hz" value="150000000" />
// Retrieval info: 	<generic name="rx_use_coreclk" value="0" />
// Retrieval info: 	<generic name="latadj" value="0" />
// Retrieval info: 	<generic name="tx_termination" value="OCT_100_OHMS" />
// Retrieval info: 	<generic name="tx_vod_selection" value="7" />
// Retrieval info: 	<generic name="tx_preemp_pretap" value="0" />
// Retrieval info: 	<generic name="tx_preemp_pretap_inv" value="0" />
// Retrieval info: 	<generic name="tx_preemp_tap_1" value="15" />
// Retrieval info: 	<generic name="tx_preemp_tap_2" value="0" />
// Retrieval info: 	<generic name="tx_preemp_tap_2_inv" value="0" />
// Retrieval info: 	<generic name="rx_common_mode" value="0.82v" />
// Retrieval info: 	<generic name="rx_termination" value="OCT_100_OHMS" />
// Retrieval info: 	<generic name="rx_eq_dc_gain" value="0" />
// Retrieval info: 	<generic name="rx_eq_ctrl" value="0" />
// Retrieval info: 	<generic name="mgmt_clk_in_hz" value="150000000" />
// Retrieval info: </instance>
// IPFS_FILES : baser.vo
// RELATED_FILES: baser.v, altera_xcvr_functions.sv, alt_reset_ctrl_lego.sv, alt_reset_ctrl_tgx_cdrauto.sv, alt_xcvr_resync.sv, alt_xcvr_csr_common_h.sv, alt_xcvr_csr_common.sv, alt_xcvr_csr_pcs8g_h.sv, alt_xcvr_csr_pcs8g.sv, alt_xcvr_csr_selector.sv, alt_xcvr_mgmt2dec.sv, altera_wait_generate.v, altera_avalon_st_handshake_clock_crosser.v, altera_avalon_st_clock_crosser.v, altera_avalon_st_pipeline_stage.sv, altera_avalon_st_pipeline_base.v, csr_pcs10gbaser_h.sv, csr_pcs10gbaser.sv, sv_pcs.sv, sv_pcs_ch.sv, sv_pma.sv, sv_reconfig_bundle_to_xcvr.sv, sv_reconfig_bundle_to_ip.sv, sv_reconfig_bundle_merger.sv, sv_rx_pma.sv, sv_tx_pma.sv, sv_tx_pma_ch.sv, sv_xcvr_h.sv, sv_xcvr_avmm_csr.sv, sv_xcvr_avmm_dcd.sv, sv_xcvr_avmm.sv, sv_xcvr_data_adapter.sv, sv_xcvr_native.sv, sv_xcvr_plls.sv, sv_hssi_10g_rx_pcs_rbc.sv, sv_hssi_10g_tx_pcs_rbc.sv, sv_hssi_8g_rx_pcs_rbc.sv, sv_hssi_8g_tx_pcs_rbc.sv, sv_hssi_8g_pcs_aggregate_rbc.sv, sv_hssi_common_pcs_pma_interface_rbc.sv, sv_hssi_common_pld_pcs_interface_rbc.sv, sv_hssi_pipe_gen1_2_rbc.sv, sv_hssi_pipe_gen3_rbc.sv, sv_hssi_rx_pcs_pma_interface_rbc.sv, sv_hssi_rx_pld_pcs_interface_rbc.sv, sv_hssi_tx_pcs_pma_interface_rbc.sv, sv_hssi_tx_pld_pcs_interface_rbc.sv, sv_xcvr_10gbaser_nr.sv, sv_xcvr_10gbaser_native.sv, altera_xcvr_10gbaser.sv, altera_xcvr_reset_control.sv, alt_xcvr_reset_counter.sv, alt_xcvr_arbiter.sv, alt_xcvr_m2s.sv
