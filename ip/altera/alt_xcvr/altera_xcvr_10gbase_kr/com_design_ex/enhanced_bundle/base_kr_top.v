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


// megafunction wizard: %1G/10GbE and 10GBASE-KR PHY v12.1%
// GENERATION: XML
// base_kr_top.v

// Generated using ACDS version 12.1sp1 242 at 2013.02.05.11:15:30

`timescale 1 ps / 1 ps
module base_kr_top (
		input  wire         pll_ref_clk_10g,    //    pll_ref_clk_10g.clk
		input  wire         xgmii_tx_clk,       //       xgmii_tx_clk.clk
		output wire         rx_recovered_clk,   //   rx_recovered_clk.clk
		input  wire         xgmii_rx_clk,       //       xgmii_rx_clk.clk
		input  wire         pll_powerdown_10g,  //  pll_powerdown_10g.pll_powerdown_10g
		input  wire         tx_analogreset,     //     tx_analogreset.tx_analogreset
		input  wire         tx_digitalreset,    //    tx_digitalreset.tx_digitalreset
		input  wire         rx_analogreset,     //     rx_analogreset.rx_analogreset
		input  wire         rx_digitalreset,    //    rx_digitalreset.rx_digitalreset
		input  wire         usr_an_lt_reset,    //    usr_an_lt_reset.usr_an_lt_reset
		input  wire         usr_seq_reset,      //      usr_seq_reset.usr_seq_reset
		input  wire         mgmt_clk,           //           mgmt_clk.clk
		input  wire         mgmt_clk_reset,     //     mgmt_clk_reset.reset
		input  wire [7:0]   mgmt_address,       //           phy_mgmt.address
		input  wire         mgmt_read,          //                   .read
		output wire [31:0]  mgmt_readdata,      //                   .readdata
		output wire         mgmt_waitrequest,   //                   .waitrequest
		input  wire         mgmt_write,         //                   .write
		input  wire [31:0]  mgmt_writedata,     //                   .writedata
		input  wire [71:0]  xgmii_tx_dc,        //        xgmii_tx_dc.data
		output wire [71:0]  xgmii_rx_dc,        //        xgmii_rx_dc.data
		output wire         pll_locked,         //         pll_locked.export
		output wire         rx_is_lockedtodata, // rx_is_lockedtodata.export
		output wire         tx_cal_busy,        //        tx_cal_busy.export
		output wire         rx_cal_busy,        //        rx_cal_busy.export
		output wire         rx_data_ready,      //      rx_data_ready.export
		output wire         rx_block_lock,      //      rx_block_lock.export
		output wire         rx_hi_ber,          //          rx_hi_ber.export
		output wire         tx_serial_data,     //     tx_serial_data.export
		input  wire         rx_serial_data,     //     rx_serial_data.export
		input  wire         lcl_rf,             //             lcl_rf.export
		input  wire [3:0]   tm_in_trigger,      //      tm_in_trigger.export
		output wire [3:0]   tm_out_trigger,     //     tm_out_trigger.export
		input  wire         rc_busy,            //            rc_busy.export
		output wire         lt_start_rc,        //        lt_start_rc.export
		output wire [5:0]   main_rc,            //            main_rc.export
		output wire [4:0]   post_rc,            //            post_rc.export
		output wire [3:0]   pre_rc,             //             pre_rc.export
		output wire [2:0]   tap_to_upd,         //         tap_to_upd.export
		output wire         en_lcl_rxeq,        //        en_lcl_rxeq.export
		input  wire         rxeq_done,          //          rxeq_done.export
		output wire         seq_start_rc,       //       seq_start_rc.export
		output wire [5:0]   pcs_mode_rc,        //        pcs_mode_rc.export
		input  wire [139:0] reconfig_to_xcvr,   //   reconfig_to_xcvr.reconfig_to_xcvr
		output wire [91:0]  reconfig_from_xcvr  // reconfig_from_xcvr.reconfig_from_xcvr
	);

	altera_xcvr_10gbase_kr #(
		.DEVICE_FAMILY    ("Stratix V"),
		.SYNTH_AN         (1),
		.SYNTH_LT         (1),
		.SYNTH_SEQ        (1),
		.SYNTH_GIGE       (0),
		.SYNTH_GMII       (1),
		.SYNTH_SGMII      (1),
		.SYNTH_1588_1G    (0),
		.PHY_IDENTIFIER   (0),
		.DEV_VERSION      (0),
		.SYNTH_CL37ANEG   (0),
		.REF_CLK_FREQ_1G  ("125.00 MHz"),
		.PLL_TYPE_1G      ("CMU"),
		.LFT_R_MSB        (63),
		.LFT_R_LSB        (0),
		.LFT_X_MSB        (6),
		.LFT_X_LSB        (0),
		.BERWIDTH         (4),
		.TRNWTWIDTH       (7),
		.MAINTAPWIDTH     (6),
		.POSTTAPWIDTH     (5),
		.PRETAPWIDTH      (4),
		.VMAXRULE         (60),
		.VMINRULE         (9),
		.VODMINRULE       (22),
		.VPOSTRULE        (25),
		.VPRERULE         (15),
		.PREMAINVAL       (60),
		.PREPOSTVAL       (0),
		.PREPREVAL        (0),
		.INITMAINVAL      (35),
		.INITPOSTVAL      (14),
		.INITPREVAL       (3),
		.AN_PAUSE         (0),
		.AN_TECH          (4),
		.PLL_CNT          (1),
		.SYNTH_1588_10G   (0),
		.REF_CLK_FREQ_10G ("644.53125 MHz"),
		.PLL_TYPE_10G     ("ATX")
	) base_kr_top_inst (
		.pll_ref_clk_10g    (pll_ref_clk_10g),    //    pll_ref_clk_10g.clk
		.xgmii_tx_clk       (xgmii_tx_clk),       //       xgmii_tx_clk.clk
		.rx_recovered_clk   (rx_recovered_clk),   //   rx_recovered_clk.clk
		.xgmii_rx_clk       (xgmii_rx_clk),       //       xgmii_rx_clk.clk
		.pll_powerdown_10g  (pll_powerdown_10g),  //  pll_powerdown_10g.pll_powerdown_10g
		.tx_analogreset     (tx_analogreset),     //     tx_analogreset.tx_analogreset
		.tx_digitalreset    (tx_digitalreset),    //    tx_digitalreset.tx_digitalreset
		.rx_analogreset     (rx_analogreset),     //     rx_analogreset.rx_analogreset
		.rx_digitalreset    (rx_digitalreset),    //    rx_digitalreset.rx_digitalreset
		.usr_an_lt_reset    (usr_an_lt_reset),    //    usr_an_lt_reset.usr_an_lt_reset
		.usr_seq_reset      (usr_seq_reset),      //      usr_seq_reset.usr_seq_reset
		.mgmt_clk           (mgmt_clk),           //           mgmt_clk.clk
		.mgmt_clk_reset     (mgmt_clk_reset),     //     mgmt_clk_reset.reset
		.mgmt_address       (mgmt_address),       //           phy_mgmt.address
		.mgmt_read          (mgmt_read),          //                   .read
		.mgmt_readdata      (mgmt_readdata),      //                   .readdata
		.mgmt_waitrequest   (mgmt_waitrequest),   //                   .waitrequest
		.mgmt_write         (mgmt_write),         //                   .write
		.mgmt_writedata     (mgmt_writedata),     //                   .writedata
		.xgmii_tx_dc        (xgmii_tx_dc),        //        xgmii_tx_dc.data
		.xgmii_rx_dc        (xgmii_rx_dc),        //        xgmii_rx_dc.data
		.pll_locked         (pll_locked),         //         pll_locked.export
		.rx_is_lockedtodata (rx_is_lockedtodata), // rx_is_lockedtodata.export
		.tx_cal_busy        (tx_cal_busy),        //        tx_cal_busy.export
		.rx_cal_busy        (rx_cal_busy),        //        rx_cal_busy.export
		.rx_data_ready      (rx_data_ready),      //      rx_data_ready.export
		.rx_block_lock      (rx_block_lock),      //      rx_block_lock.export
		.rx_hi_ber          (rx_hi_ber),          //          rx_hi_ber.export
		.tx_serial_data     (tx_serial_data),     //     tx_serial_data.export
		.rx_serial_data     (rx_serial_data),     //     rx_serial_data.export
		.lcl_rf             (lcl_rf),             //             lcl_rf.export
		.tm_in_trigger      (tm_in_trigger),      //      tm_in_trigger.export
		.tm_out_trigger     (tm_out_trigger),     //     tm_out_trigger.export
		.rc_busy            (rc_busy),            //            rc_busy.export
		.lt_start_rc        (lt_start_rc),        //        lt_start_rc.export
		.main_rc            (main_rc),            //            main_rc.export
		.post_rc            (post_rc),            //            post_rc.export
		.pre_rc             (pre_rc),             //             pre_rc.export
		.tap_to_upd         (tap_to_upd),         //         tap_to_upd.export
		.en_lcl_rxeq        (en_lcl_rxeq),        //        en_lcl_rxeq.export
		.rxeq_done          (rxeq_done),          //          rxeq_done.export
		.seq_start_rc       (seq_start_rc),       //       seq_start_rc.export
		.pcs_mode_rc        (pcs_mode_rc),        //        pcs_mode_rc.export
		.reconfig_to_xcvr   (reconfig_to_xcvr),   //   reconfig_to_xcvr.reconfig_to_xcvr
		.reconfig_from_xcvr (reconfig_from_xcvr), // reconfig_from_xcvr.reconfig_from_xcvr
		.pll_ref_clk_1g     (1'b0),               //        (terminated)
		.tx_coreclkin_1g    (1'b0),               //        (terminated)
		.rx_coreclkin_1g    (1'b0),               //        (terminated)
		.tx_clkout_1g       (),                   //        (terminated)
		.rx_clkout_1g       (),                   //        (terminated)
		.pll_powerdown_1g   (1'b0),               //        (terminated)
		.gmii_tx_d          (8'b00000000),        //        (terminated)
		.gmii_rx_d          (),                   //        (terminated)
		.gmii_tx_en         (1'b0),               //        (terminated)
		.gmii_tx_err        (1'b0),               //        (terminated)
		.gmii_rx_err        (),                   //        (terminated)
		.gmii_rx_dv         (),                   //        (terminated)
		.led_an             (),                   //        (terminated)
		.led_char_err       (),                   //        (terminated)
		.led_disp_err       (),                   //        (terminated)
		.led_link           (),                   //        (terminated)
		.tx_pcfifo_error_1g (),                   //        (terminated)
		.rx_pcfifo_error_1g (),                   //        (terminated)
		.rx_rlv             (),                   //        (terminated)
		.rx_syncstatus      (),                   //        (terminated)
		.rx_clkslip         (1'b0),               //        (terminated)
		.mode_1g_10gbar     (1'b0),               //        (terminated)
		.rx_latency_adj_10g (),                   //        (terminated)
		.tx_latency_adj_10g (),                   //        (terminated)
		.rx_latency_adj_1g  (),                   //        (terminated)
		.tx_latency_adj_1g  (),                   //        (terminated)
		.calc_clk_1g        (1'b0),               //        (terminated)
		.dmi_mode_en        (1'b0),               //        (terminated)
		.dmi_frame_lock     (1'b0),               //        (terminated)
		.dmi_rmt_rx_ready   (1'b0),               //        (terminated)
		.dmi_lcl_coefl      (6'b000000),          //        (terminated)
		.dmi_lcl_coefh      (2'b00),              //        (terminated)
		.dmi_lcl_upd_new    (1'b0),               //        (terminated)
		.dmi_rx_trained     (1'b0),               //        (terminated)
		.dmo_frame_lock     (),                   //        (terminated)
		.dmo_rmt_rx_ready   (),                   //        (terminated)
		.dmo_lcl_coefl      (),                   //        (terminated)
		.dmo_lcl_coefh      (),                   //        (terminated)
		.dmo_lcl_upd_new    (),                   //        (terminated)
		.dmo_rx_trained     (),                   //        (terminated)
		.upi_mode_en        (1'b0),               //        (terminated)
		.upi_adj            (2'b00),              //        (terminated)
		.upi_inc            (1'b0),               //        (terminated)
		.upi_dec            (1'b0),               //        (terminated)
		.upi_pre            (1'b0),               //        (terminated)
		.upi_init           (1'b0),               //        (terminated)
		.upi_st_bert        (1'b0),               //        (terminated)
		.upi_train_err      (1'b0),               //        (terminated)
		.upi_lock_err       (1'b0),               //        (terminated)
		.upi_rx_trained     (1'b0),               //        (terminated)
		.upo_enable         (),                   //        (terminated)
		.upo_frame_lock     (),                   //        (terminated)
		.upo_cm_done        (),                   //        (terminated)
		.upo_bert_done      (),                   //        (terminated)
		.upo_ber_cnt        (),                   //        (terminated)
		.upo_ber_max        (),                   //        (terminated)
		.upo_coef_max       ()                    //        (terminated)
	);

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
// Retrieval info: <instance entity-name="altera_xcvr_10gbase_kr" version="12.1" >
// Retrieval info: 	<generic name="DEVICE_FAMILY" value="Stratix V" />
// Retrieval info: 	<generic name="sel_backplane_lineside" value="Backplane-KR" />
// Retrieval info: 	<generic name="SYNTH_AN" value="1" />
// Retrieval info: 	<generic name="SYNTH_LT" value="1" />
// Retrieval info: 	<generic name="SYNTH_SEQ" value="1" />
// Retrieval info: 	<generic name="SYNTH_GIGE" value="0" />
// Retrieval info: 	<generic name="SYNTH_GMII_gui" value="1" />
// Retrieval info: 	<generic name="SYNTH_SGMII" value="1" />
// Retrieval info: 	<generic name="SYNTH_1588_1G" value="0" />
// Retrieval info: 	<generic name="PHY_IDENTIFIER" value="0" />
// Retrieval info: 	<generic name="DEV_VERSION" value="0" />
// Retrieval info: 	<generic name="REF_CLK_FREQ_1G" value="125.00 MHz" />
// Retrieval info: 	<generic name="PLL_TYPE_1G" value="CMU" />
// Retrieval info: 	<generic name="phy_mgmt_clk_freq" value="125.00" />
// Retrieval info: 	<generic name="LINK_TIMER_KR" value="504.00" />
// Retrieval info: 	<generic name="LINK_TIMER_KX" value="48.00" />
// Retrieval info: 	<generic name="OPTIONAL_DM" value="0" />
// Retrieval info: 	<generic name="OPTIONAL_UP" value="0" />
// Retrieval info: 	<generic name="BERWIDTH_gui" value="15" />
// Retrieval info: 	<generic name="TRNWTWIDTH_gui" value="127" />
// Retrieval info: 	<generic name="VMAXRULE" value="60" />
// Retrieval info: 	<generic name="VMINRULE" value="9" />
// Retrieval info: 	<generic name="VODMINRULE" value="22" />
// Retrieval info: 	<generic name="VPOSTRULE" value="25" />
// Retrieval info: 	<generic name="VPRERULE" value="15" />
// Retrieval info: 	<generic name="PREMAINVAL" value="60" />
// Retrieval info: 	<generic name="PREPOSTVAL" value="0" />
// Retrieval info: 	<generic name="PREPREVAL" value="0" />
// Retrieval info: 	<generic name="INITMAINVAL" value="35" />
// Retrieval info: 	<generic name="INITPOSTVAL" value="14" />
// Retrieval info: 	<generic name="INITPREVAL" value="3" />
// Retrieval info: 	<generic name="AN_XAUI" value="0" />
// Retrieval info: 	<generic name="AN_BASER" value="1" />
// Retrieval info: 	<generic name="AN_40GBP" value="0" />
// Retrieval info: 	<generic name="AN_40GCR" value="0" />
// Retrieval info: 	<generic name="AN_100G" value="0" />
// Retrieval info: 	<generic name="AN_PAUSE_C0" value="0" />
// Retrieval info: 	<generic name="AN_PAUSE_C1" value="0" />
// Retrieval info: 	<generic name="AN_FEC" value="0" />
// Retrieval info: 	<generic name="AN_SELECTOR" value="1" />
// Retrieval info: 	<generic name="SYNTH_1588_10G" value="0" />
// Retrieval info: 	<generic name="REF_CLK_FREQ_10G" value="644.53125 MHz" />
// Retrieval info: 	<generic name="PLL_TYPE_10G" value="ATX" />
// Retrieval info: 	<generic name="OPTIONAL_10G" value="1" />
// Retrieval info: 	<generic name="OPTIONAL_10G_RCVD" value="1" />
// Retrieval info: 	<generic name="OPTIONAL_PLL_LCK" value="1" />
// Retrieval info: 	<generic name="AUTO_PLL_REF_CLK_10G_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_PLL_REF_CLK_1G_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_XGMII_TX_CLK_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_XGMII_RX_CLK_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_TX_CORECLKIN_1G_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_RX_CORECLKIN_1G_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_MGMT_CLK_CLOCK_RATE" value="-1" />
// Retrieval info: 	<generic name="AUTO_CALC_CLK_1G_CLOCK_RATE" value="-1" />
// Retrieval info: </instance>
// IPFS_FILES : base_kr_top.vo
// RELATED_FILES: base_kr_top.v, altera_xcvr_functions.sv, sv_pcs.sv, sv_pcs_ch.sv, sv_pma.sv, sv_reconfig_bundle_to_xcvr.sv, sv_reconfig_bundle_to_ip.sv, sv_reconfig_bundle_merger.sv, sv_rx_pma.sv, sv_tx_pma.sv, sv_tx_pma_ch.sv, sv_xcvr_h.sv, sv_xcvr_avmm_csr.sv, sv_xcvr_avmm_dcd.sv, sv_xcvr_avmm.sv, sv_xcvr_data_adapter.sv, sv_xcvr_native.sv, sv_xcvr_plls.sv, alt_xcvr_resync.sv, sv_hssi_10g_rx_pcs_rbc.sv, sv_hssi_10g_tx_pcs_rbc.sv, sv_hssi_8g_rx_pcs_rbc.sv, sv_hssi_8g_tx_pcs_rbc.sv, sv_hssi_8g_pcs_aggregate_rbc.sv, sv_hssi_common_pcs_pma_interface_rbc.sv, sv_hssi_common_pld_pcs_interface_rbc.sv, sv_hssi_pipe_gen1_2_rbc.sv, sv_hssi_pipe_gen3_rbc.sv, sv_hssi_rx_pcs_pma_interface_rbc.sv, sv_hssi_rx_pld_pcs_interface_rbc.sv, sv_hssi_tx_pcs_pma_interface_rbc.sv, sv_hssi_tx_pld_pcs_interface_rbc.sv, altera_xcvr_native_sv_functions_h.sv, altera_xcvr_native_sv.sv, alt_xcvr_csr_common_h.sv, alt_xcvr_csr_common.sv, alt_xcvr_csr_selector.sv, altera_wait_generate.v, csr_pcs10gbaser_h.sv, csr_pcs10gbaser.sv, altera_10gbaser_phy_params.sv, altera_10gbaser_phy_clockcomp.sv, altera_10gbaser_phy_async_fifo.sv, altera_10gbaser_phy_1588_latency.sv, altera_10gbaser_phy_rx_fifo_wrap.v, altera_10gbaser_phy_rx_fifo.v, altera_10gbaser_phy_async_fifo_fpga.sv, altera_avalon_st_handshake_clock_crosser.v, altera_avalon_st_clock_crosser.v, altera_avalon_st_pipeline_stage.sv, altera_avalon_st_pipeline_base.v, csr_krtop_h.sv, csr_kran.sv, csr_krlt.sv, csr_krgige.sv, csr_krtop.sv, seq_sm.sv, altera_xcvr_10gbase_kr.sv, an_arb_sm.sv, an_decode.sv, an_rx_sm.sv, an_top.sv, an_tx_sm.sv, lt_cf_update.sv, lt_coef_mstr.sv, lt_frame_lock.sv, lt_lcl_coef.sv, lt_rmt_opt.sv, lt_rmt_txeq.sv, lt_rx_data.sv, lt_rx_gbx.sv, lt_top.sv, lt_tx_data.sv, lt_tx_gbx.sv, lt_tx_train.sv, six_two_comp.sv, kr_gige_pcs_a_fifo_24.v, kr_gige_pcs_carrier_sense.v, kr_gige_pcs_colision_detect.v, kr_gige_pcs_gray_cnt.v, kr_gige_pcs_gxb_aligned_rxsync.v, kr_gige_pcs_mdio_reg.v, kr_gige_pcs_mii_rx_if_pcs.v, kr_gige_pcs_mii_tx_if_pcs.v, kr_gige_pcs_pcs_control.v, kr_gige_pcs_pcs_host_control.v, kr_gige_pcs_reset_synchronizer.v, kr_gige_pcs_rx_converter.v, kr_gige_pcs_rx_encapsulation_strx_gx.v, kr_gige_pcs_rx_fifo_rd.v, kr_gige_pcs_sdpm_altsyncram.v, kr_gige_pcs_sgmii_clk_enable.v, kr_gige_pcs_top.sv, kr_gige_pcs_clock_crosser.v, kr_gige_pcs_ph_calculator.sv, kr_gige_pcs_top_1000_base_x_strx_gx.v, kr_gige_pcs_top_autoneg.v, kr_gige_pcs_top_pcs_strx_gx.v, kr_gige_pcs_top_rx_converter.v, kr_gige_pcs_top_sgmii_strx_gx.v, kr_gige_pcs_top_tx_converter.v, kr_gige_pcs_tx_converter.v, kr_gige_pcs_tx_encapsulation.v
