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


`timescale 1 ps / 1 ps
module alt_e40_top  #(
	parameter DEVICE_FAMILY = "Stratix V",
	parameter STATUS_CLK_KHZ = 100000,
	parameter ENABLE_STATISTICS_CNTR = 1,
	parameter VARIANT = 3,                    // 1=>RX, 2=>TX, 3=> RX_AND_TX
	parameter IS_CAUI4 = 1'b0, // This is non-applicable for 40gbe but the parameter exists to conform to 40g/100g hw.tcl interfaces
	parameter FROM_XCVR_WIDTH = 368,
	parameter TO_XCVR_WIDTH = 560,
	parameter HAS_PHY = 1'b1,
	parameter HAS_MAC = 1'b1,
	parameter HAS_ADAPTERS = 1'b1,
	parameter FAST_SIMULATION = 0,
	parameter en_synce_support = 0,
	// KR4 parameters
	parameter ENA_KR4 = 0, // enable KR4 pma
	parameter SYNTH_AN      = 1,            // Synthesize/include the AN logic
	parameter SYNTH_LT      = 1,            // Synthesize/include the LT logic
	parameter SYNTH_SEQ     = 1,            // Synthesize/include Sequencer logic
	parameter SYNTH_FEC     = 1,            // Synthesize/include FEC blocks
	// Sequencer parameters not used in the AN block
	parameter LINK_TIMER_KR = 504,          // Link Fail Timer for BASE-R PCS in ms
	// LT parameters
	parameter BERWIDTH      = 12,           // Width (>4) of the Bit Error counter
	parameter TRNWTWIDTH    = 7,            // Width (7,8) of Training Wait counter
	parameter MAINTAPWIDTH  = 6,            // Width of the Main Tap control
	parameter POSTTAPWIDTH  = 5,            // Width of the Post Tap control
	parameter PRETAPWIDTH   = 4,            // Width of the Pre Tap control
	parameter VMAXRULE      = 6'd60,        // VOD+Post+Pre <= Device Vmax 1200mv
	parameter VMINRULE      = 6'd9,         // VOD-Post-Pre >= Device VMin 165mv
	parameter VODMINRULE    = 6'd24,        // VOD >= IEEE VOD Vmin of 440mV
	parameter VPOSTRULE     = 5'd31,        // Post_tap <= VPOST
	parameter VPRERULE      = 4'd15,        // Pre_tap <= VPRE
	parameter PREMAINVAL    = 6'd60,        // Preset Main tap value
	parameter PREPOSTVAL    = 5'd0,         // Preset Post tap value
	parameter PREPREVAL     = 4'd0,         // Preset Pre tap value
	parameter INITMAINVAL   = 6'd52,        // Initialize Main tap value
	parameter INITPOSTVAL   = 5'd30,        // Initialize Post tap value
	parameter INITPREVAL    = 4'd5,         // Initialize Pre tap value
	// AN parameters
	parameter AN_CHAN       = 4'b0001,      // "master" channel to run AN on (one-hot)
	parameter AN_PAUSE      = 3'b011,       // Initial setting for Pause ability, depends upon MAC  
	parameter AN_TECH       = 6'b00_1000,   // Tech ability, only 40G-KR4 valid
	                                        // bit-0 = GigE, bit-1 = XAUI
	                                        // bit-2 = 10G , bit-3 = 40G BP
	                                        // bit 4 = 40G-CR4, bit 5 = 100G-CR10
	parameter AN_FEC        = 2'b11,        // Initial setting for FEC, bit1=request, bit0=ability 
	parameter AN_SELECTOR   = 5'b0_0001,    // AN selector field 802.3 = 5'd1
	parameter ERR_INDICATION = 0,           // Default state for FEC error indication enable on/off
	parameter REF_CLK_FREQ  = "644.53125 MHz", // speed for clk_ref
	parameter PHY_PLL       = "ATX",        // transmit PLL (ATX or CMU)
	parameter FEC_USE_M20K  = 0,            // Optimize FEC memory for M20K
	parameter OPTIONAL_RXEQ = 0             //  Enable RX Equalization through link training

)(
		// Reconfig IF used when PHY is required and DEV is Stratix V or Arria V GZ
		output wire [FROM_XCVR_WIDTH-1:0] reconfig_from_xcvr,    // reconfig_from_xcvr.reconfig_from_xcvr
		input  wire [TO_XCVR_WIDTH-1:0] reconfig_to_xcvr,      //   reconfig_to_xcvr.reconfig_to_xcvr
		// End Reconfig
		
		// CAUI-4 IF // Does not apply for 40gbe, added to conform to hw.tcl
		output wire [137:0] reconfig_from_xcvr0,   // reconfig_from_xcvr0.reconfig_from_xcvr
		input  wire [209:0] reconfig_to_xcvr0,     //   reconfig_to_xcvr0.reconfig_to_xcvr
		output wire [137:0] reconfig_from_xcvr1,   // reconfig_from_xcvr1.reconfig_from_xcvr
		input  wire [209:0] reconfig_to_xcvr1,     //   reconfig_to_xcvr1.reconfig_to_xcvr
		output wire [137:0] reconfig_from_xcvr2,   // reconfig_from_xcvr2.reconfig_from_xcvr
		input  wire [209:0] reconfig_to_xcvr2,     //   reconfig_to_xcvr2.reconfig_to_xcvr
		output wire [137:0] reconfig_from_xcvr3,   // reconfig_from_xcvr3.reconfig_from_xcvr
		input  wire [209:0] reconfig_to_xcvr3,     //   reconfig_to_xcvr3.reconfig_to_xcvr
		
		
		// AVMM Common
		input  wire         clk_status,            //         clk_status.clk
		input  wire [15:0]  status_addr,           //             status.address
		input  wire         status_read,           //                   .read
		input  wire         status_write,          //                   .write
		input  wire [31:0]  status_writedata,      //                   .writedata
		output wire [31:0]  status_readdata,       //                   .readdata
		output wire         status_readdata_valid, //                   .readdatavalid
		//AVMM Common end
	
	
		// MAC Signals
		output wire         rx_inc_runt,           //             rx_inc.runt
		output wire         rx_inc_64,             //                   .64
		output wire         rx_inc_127,            //                   .127
		output wire         rx_inc_255,            //                   .255
		output wire         rx_inc_511,            //                   .511
		output wire         rx_inc_1023,           //                   .1023
		output wire         rx_inc_1518,           //                   .1518
		output wire         rx_inc_max,            //                   .max
		output wire         rx_inc_over,           //                   .over
		output wire         rx_inc_mcast_data_err, //                   .mcast_data_err
		output wire         rx_inc_mcast_data_ok,  //                   .mcast_data_ok
		output wire         rx_inc_bcast_data_err, //                   .bcast_data_err
		output wire         rx_inc_bcast_data_ok,  //                   .bcast_data_ok
		output wire         rx_inc_ucast_data_err, //                   .ucast_data_err
		output wire         rx_inc_ucast_data_ok,  //                   .ucast_data_ok
		output wire         rx_inc_mcast_ctrl,     //                   .mcast_ctrl
		output wire         rx_inc_bcast_ctrl,     //                   .bcast_ctrl
		output wire         rx_inc_ucast_ctrl,     //                   .ucast_ctrl
		output wire         rx_inc_pause,          //                   .pause
		output wire         rx_inc_fcs_err,        //                   .fcs_err
		output wire         rx_inc_fragment,       //                   .fragment
		output wire         rx_inc_jabber,         //                   .jabber
		output wire         rx_inc_sizeok_fcserr,  //                   .sizeok_fcserr
		output wire         tx_inc_64,             //             tx_inc.64
		output wire         tx_inc_127,            //                   .127
		output wire         tx_inc_255,            //                   .255
		output wire         tx_inc_511,            //                   .511
		output wire         tx_inc_1023,           //                   .1023
		output wire         tx_inc_1518,           //                   .1518
		output wire         tx_inc_max,            //                   .max
		output wire         tx_inc_over,           //                   .over
		output wire         tx_inc_mcast_data_err, //                   .mcast_data_err
		output wire         tx_inc_mcast_data_ok,  //                   .mcast_data_ok
		output wire         tx_inc_bcast_data_err, //                   .bcast_data_err
		output wire         tx_inc_bcast_data_ok,  //                   .bcast_data_ok
		output wire         tx_inc_ucast_data_err, //                   .ucast_data_err
		output wire         tx_inc_ucast_data_ok,  //                   .ucast_data_ok
		output wire         tx_inc_mcast_ctrl,     //                   .mcast_ctrl
		output wire         tx_inc_bcast_ctrl,     //                   .bcast_ctrl
		output wire         tx_inc_ucast_ctrl,     //                   .ucast_ctrl
		output wire         tx_inc_pause,          //                   .pause
		output wire         tx_inc_fcs_err,        //                   .fcs_err
		output wire         tx_inc_fragment,       //                   .fragment
		output wire         tx_inc_jabber,         //                   .jabber
		output wire         tx_inc_sizeok_fcserr,  //                   .sizeok_fcserr
		
		// Pause IF
		input  wire         pause_insert_tx,       //       pause_insert.tx
		input  wire [15:0]  pause_insert_time,     //                   .time
		input  wire         pause_insert_mcast,    //                   .mcast
		input  wire [47:0]  pause_insert_dst,      //                   .dst
		input  wire [47:0]  pause_insert_src,      //                   .src
		// Pause IF end
		
		// MAC Clocking and reset
		input  wire         clk_rxmac,             //          clk_rxmac.clk
		input  wire         clk_txmac,             //          clk_txmac.clk
		input  wire         mac_rx_arst_ST,        //     mac_rx_arst_ST.reset
		input  wire         mac_tx_arst_ST,        //     mac_tx_arst_ST.reset
		// MAC Clocking and reset end
		// MAC Signals End
		
		
		// MAC+ADAPTORS IF
		
		output wire [255:0] l4_rx_data,            //              l4_rx.data
		output wire [4:0]   l4_rx_empty,           //                   .empty
		output wire         l4_rx_startofpacket,   //                   .startofpacket
		output wire         l4_rx_endofpacket,     //                   .endofpacket
		output wire         l4_rx_error,           //                   .error
		output wire         l4_rx_valid,           //                   .valid
		output wire         l4_rx_fcs_valid,       //          l4_rx_fcs.valid
		output wire         l4_rx_fcs_error,       //                   .error
		input  wire [255:0] l4_tx_data,            //              l4_tx.data
		input  wire [4:0]   l4_tx_empty,           //                   .empty
		input  wire         l4_tx_startofpacket,   //                   .startofpacket
		input  wire         l4_tx_endofpacket,     //                   .endofpacket
		output wire         l4_tx_ready,           //                   .ready
		input  wire         l4_tx_valid,            //                   .valid
		
		
		///////////////////////
		// This 512 bit interface does not apply for 40g, it is only added
		// to conform to the HW.TCL super wrapper
		///////////////////////
		output wire [511:0]  l8_rx_data,            //              l8_rx.data
		output wire [5:0]    l8_rx_empty,           //                   .empty
		output wire          l8_rx_startofpacket,   //                   .startofpacket
		output wire          l8_rx_endofpacket,     //                   .endofpacket
		output wire          l8_rx_error,           //                   .error
		output wire          l8_rx_valid,           //                   .valid
		output wire          l8_rx_fcs_valid,       //          l8_rx_fcs.valid
		output wire          l8_rx_fcs_error,       //                   .error
		input  wire [511:0]  l8_tx_data,            //              l8_tx.data
		input  wire [5:0]    l8_tx_empty,           //                   .empty
		input  wire          l8_tx_startofpacket,   //                   .startofpacket
		input  wire          l8_tx_endofpacket,     //                   .endofpacket
		output wire          l8_tx_ready,           //                   .ready
		input  wire          l8_tx_valid,            //                   .valid
		
		// END MAC+ADAPTORS IF


		// Phy Signals
		input  wire         clk_ref,               //            clk_ref.clk
		input  wire         rx_clk_ref, 
		input  wire         tx_clk_ref, 
		input  wire         pma_arst_ST,           //        pma_arst_ST.reset
		input  wire         pcs_rx_arst_ST,        //     pcs_rx_arst_ST.reset
		input  wire [3:0]   rx_serial_reg,             //          rx_serial.export
		input  wire         pcs_tx_arst_ST,        //     pcs_tx_arst_ST.reset
		output wire [3:0]    tx_serial_reg,             //          tx_serial.export
		// Night Fury Signals
		input  wire          pll_locked,
	    input  wire  [3:0]   tx_serial_clk,		
		// Night Fury Signals End
		// Phy Only IF
		output wire [0:0]    rx_mii_valid_phy,          //       rx_mii_valid.export
		output wire [127:0]  rx_mii_d_phy,              //           rx_mii_d.export
		output wire [15:0]   rx_mii_c_phy,              //           rx_mii_c.export
		output wire [0:0]    lanes_deskewed_phy,        //     lanes_deskewed.export
		input  wire [127:0]  tx_mii_d_phy,              //           tx_mii_d.export
		input  wire [15:0]   tx_mii_c_phy,              //           tx_mii_c.export
		input  wire [0:0]    tx_mii_valid_phy,          //       tx_mii_valid.export
		output wire [0:0]    tx_mii_ready_phy,          //       tx_mii_ready.export
		output wire [0:0]    tx_lanes_stable_phy,       //    tx_lanes_stable.export
		// Phy Only IF END
		// Phy Signals End
		// MAC Only MII
		output wire [127:0] tx_mii_d_mac,              //        tx_mii_d.export
		output wire [15:0]  tx_mii_c_mac,              //        tx_mii_c.export
		output wire [0:0]   tx_mii_valid_mac,          //    tx_mii_valid.export
		input  wire [0:0]   tx_mii_ready_mac,          //    tx_mii_ready.export
		input  wire [0:0]   tx_lanes_stable_mac,       // tx_lanes_stable.export
		input  wire [127:0] rx_mii_d_mac,              //        rx_mii_d.export
		input  wire [15:0]  rx_mii_c_mac,              //        rx_mii_c.export
		input  wire [0:0]   rx_mii_valid_mac,          //    rx_mii_valid.export
		input  wire [0:0]   lanes_deskewed_mac,        //  lanes_deskewed.export
		// MAC Only MII End
		
		output wire         remote_fault_status,
		output wire         local_fault_status,
				
		output wire        pause_match_from_rx,
		output wire [15:0] pause_time_from_rx,
		output wire        remote_fault_from_rx,
		output wire        local_fault_from_rx,
		
		input wire         remote_fault_to_tx,
		input wire         local_fault_to_tx,
		input wire         pause_match_to_tx,
		input wire  [15:0] pause_time_to_tx,
		
		// MAC Custom Streaming IF
		input  wire [127:0]  din,                   //                 din.export
		input  wire [1:0]    din_start,             //           din_start.export
		input  wire [15:0]   din_end_pos,           //         din_end_pos.export
		output wire          din_ack,               //             din_ack.export
		output wire [127:0]  dout_d,                //              dout_d.export
		output wire [15:0]   dout_c,                //              dout_c.export
		output wire [1:0]    dout_first_data,       //     dout_first_data.export
		output wire [15:0]   dout_last_data,        //      dout_last_data.export
		output wire [1:0]    dout_runt_last_data,   // dout_runt_last_data.export
		output wire [1:0]    dout_payload,          //        dout_payload.export
		output wire          dout_fcs_error,        //      dout_fcs_error.export
		output wire          dout_fcs_valid,        //      dout_fcs_valid.export
		output wire [1:0]    dout_dst_addr_match,   // dout_dst_addr_match.export
		output wire          dout_valid,            //          dout_valid.export
		// MAC Custom Streaming IF end
		
		input  wire          a10_reconfig_write,       //      reconfig_avmm.write
		input  wire          a10_reconfig_read,        //                   .read
		input  wire [11:0]   a10_reconfig_address,     //                   .address
		input  wire [31:0]   a10_reconfig_writedata,   //                   .writedata
		output wire [31:0]   a10_reconfig_readdata,    //                   .readdata
		output wire          a10_reconfig_waitrequest, //                   .waitrequest		
		
		// KR4 ports
		input  [3:0]       rc_busy,    // reconfig is busy servicing request
		                               // for lane [3:0] 
		output [3:0]     lt_start_rc,    // start the TX EQ reconfig for lane 3-0
		output [(4*MAINTAPWIDTH)-1:0] main_rc, // main tap value for reconfig
		output [(4*POSTTAPWIDTH)-1:0] post_rc, // post tap value for reconfig
		output [(4*PRETAPWIDTH)-1:0]  pre_rc,  // pre tap value for reconfig
		output [(4*3)-1:0]   tap_to_upd, // specific TX EQ tap to update
		                                // bit-2 = main, bit-1 = post, ...
		output [3:0]     en_lcl_rxeq,    // Enable local RX Equalization
		input  [3:0]     rxeq_done,      // Local RX Equalization is finished
		output [3:0]     seq_start_rc,   // start the PCS reconfig for lane 3-0
		output [3:0]     dfe_start_rc,   // start DFE reconfig for lane 3-0
		output [(4*2)-1:0] dfe_mode,     // DFE mode 00=disabled, 01=triggered, 10=continuous
		output [3:0]     ctle_start_rc,  // start CTLE reconfig for lane 3-0
		output [(4*4)-1:0] ctle_rc,      // CTLE manual setting for lane 3-0
		output [(4*2)-1:0] ctle_mode,    // CTLE mode 00=manual, 01=one-time, 10=continuous
		output [5:0]     pcs_mode_rc,    // PCS mode for reconfig - 1 hot
		                                // bit 0 = AN mode = low_lat, PLL LTR, 66:40
		                                // bit 1 = LT mode = low_lat, PLL LTD, 66:40
		                                // bit 2 = (N/A) 10G data mode = 10GBASE-R, 66:40
		                                // bit 3 = (N/A) GigE data mode = 8G PCS
		                                // bit 4 = (N/A) XAUI data mode = future?
		                                // bit 5 = 10G-FEC/40G data mode = low lat, 64:64
		input            reco_mif_done,  // PMA reconfiguration done (resets the PHYs)
		
		// uP Mode inputs for remote EQ Optimization
		input [3:0] upi_mode_en,    // Enable uP mode
		input [4*2-1:0] upi_adj,        // select the active tap
		input [3:0] upi_inc,        // send the increment command 
		input [3:0] upi_dec,        // send the decrement command 
		input [3:0] upi_pre,        // send the preset command 
		input [3:0] upi_init,       // send the initialize command
		input [3:0] upi_st_bert,    // start the BER timer
		input [3:0] upi_train_err,  // Training Error indication
		input [3:0] upi_lock_err,   // Training frame lock Error
		input [3:0] upi_rx_trained, // local RX is Trained
		// uP Mode outputs for remote EQ Optimization
		output [3:0] upo_enable,     // Enable uP = ~re_start & en
		output [3:0] upo_frame_lock, // Receiver has Training frame lock
		output [3:0] upo_cm_done,    // Master SM done with handshake 
		output [3:0] upo_bert_done,  // BER Timer at max count 
		output [4*BERWIDTH-1:0] upo_ber_cnt, // BER counter value 
		output [3:0] upo_ber_max,    // BER counter roll-over
		output [3:0] upo_coef_max    // Remote Coefficients at max/min

		
	);

	wire          bridge_clk_status_phy_clk;       // bridge:clk_status_phy -> phy:clk_status
	wire          bridge_clk_status_mac_clk;       // bridge:clk_status_mac -> mac:clk_status
	wire          mac_status_readdata_valid;       // mac:status_readdata_valid -> bridge:status_mac_readdata_valid
	wire   [31:0] bridge_status_mac_writedata;     // bridge:status_mac_writedata -> mac:status_writedata
	wire          bridge_status_mac_write;         // bridge:status_mac_write -> mac:status_write
	wire          bridge_status_mac_read;          // bridge:status_mac_read -> mac:status_read
	wire   [15:0] bridge_status_mac_addr;          // bridge:status_mac_addr -> mac:status_addr
	wire   [31:0] mac_status_readdata;             // mac:status_readdata -> bridge:status_mac_readdata
	wire          phy_status_readdata_valid;       // phy:status_readdata_valid -> bridge:status_phy_readdata_valid
	wire   [31:0] bridge_status_phy_writedata;     // bridge:status_phy_writedata -> phy:status_writedata
	wire          bridge_status_phy_write;         // bridge:status_phy_write -> phy:status_write
	wire          bridge_status_phy_read;          // bridge:status_phy_read -> phy:status_read
	wire   [15:0] bridge_status_phy_addr;          // bridge:status_phy_addr -> phy:status_addr
	wire   [31:0] phy_status_readdata;             // phy:status_readdata -> bridge:status_phy_readdata
	wire          bridge_pma_arst_st_out_reset;    // bridge:pma_arst_ST_out -> phy:pma_arst_ST
	wire  [127:0] phy_rx_raw_mii_d_export;         // phy:rx_raw_mii_d -> mac:rx_raw_mii_d
	wire   [15:0] phy_rx_raw_mii_c_export;         // phy:rx_raw_mii_c -> mac:rx_raw_mii_c
	wire          phy_rx_blocks_valid_export;      // phy:rx_blocks_valid -> mac:rx_blocks_valid
	wire          phy_lanes_deskewed_export;       // phy:lanes_deskewed -> mac:lanes_deskewed
	wire  [127:0] mac_miitx_rev_d_export;          // mac:miitx_rev_d -> phy:miitx_rev_d
	wire   [15:0] mac_miitx_rev_c_export;          // mac:miitx_rev_c -> phy:miitx_rev_c
	wire          mac_miitx_valid_export;          // mac:miitx_valid -> phy:miitx_valid
	wire          phy_din_ready_export;            // phy:din_ready -> mac:din_ready
	wire          phy_tx_lanes_stable_export;      // phy:tx_lanes_stable -> mac:tx_lanes_stable
	wire          mac_mac_rx_arst_sync_core_reset; // mac:mac_rx_arst_sync_core -> adapter_rx:mac_rx_arst_sync_core
	wire  [127:0] mac_dout_d_export;               // mac:dout_d -> adapter_rx:rx2l_d
	wire  [15:0]  mac_dout_c_export;
	wire   [1:0]  mac_dout_dst_addr_match_export;
	wire    [1:0] mac_dout_first_data_export;      // mac:dout_first_data -> adapter_rx:rx2l_sop
	wire   [15:0] mac_dout_last_data_export;       // mac:dout_last_data -> adapter_rx:rx2l_eop_bm
	wire          mac_dout_fcs_valid_export;       // mac:dout_fcs_valid -> adapter_rx:rx2l_fcs_valid
	wire          mac_dout_fcs_error_export;       // mac:dout_fcs_error -> adapter_rx:rx2l_fcs_error
	wire          mac_dout_valid_export;           // mac:dout_valid -> adapter_rx:rx2l_valid
	wire    [1:0] mac_dout_runt_last_data_export;  // mac:dout_runt_last_data -> adapter_rx:rx2l_runt_last_data
	wire    [1:0] mac_dout_payload_export;         // mac:dout_payload -> adapter_rx:rx2l_payload
	wire          mac_mac_tx_arst_sync_core_reset; // mac:mac_tx_arst_sync_core -> adapter_tx:mac_tx_arst_sync_core
	wire          mac_din_ack_export;              // mac:din_ack -> adapter_tx:tx2l_ack
	wire  [127:0] adapter_tx_tx2l_d_export;        // adapter_tx:tx2l_d -> mac:din
	wire    [1:0] adapter_tx_tx2l_sop_export;      // adapter_tx:tx2l_sop -> mac:din_start
	wire   [15:0] adapter_tx_tx2l_eop_bm_export;   // adapter_tx:tx2l_eop_bm -> mac:din_end_pos
	
	
	wire [367:0]    reconfig_from_xcvr_w;
	wire [559:0]    reconfig_to_xcvr_w;
	
   assign reconfig_from_xcvr0 	  = 138'b0;
   assign reconfig_from_xcvr1 	  = 138'b0;
   assign reconfig_from_xcvr2  = 138'b0;
   assign reconfig_from_xcvr3 = 138'b0;
   assign l8_rx_data = 512'b0;
   assign l8_rx_empty = 6'b0;
   assign l8_rx_startofpacket = 1'b0;
   assign l8_rx_endofpacket = 1'b0;
   assign l8_rx_error = 1'b0;
   assign l8_rx_valid = 1'b0;
   assign l8_rx_fcs_valid = 1'b0;
   assign l8_rx_fcs_error = 1'b0;
   assign l8_tx_ready = 1'b0;

				     
	generate
	
	if (HAS_MAC) begin : GEN_MAC
	
	alt_e40_mac #(
		.DEVICE_FAMILY          (DEVICE_FAMILY),
		.VARIANT                (VARIANT),
		.ENABLE_STATISTICS_CNTR (ENABLE_STATISTICS_CNTR)
	) mac (
		.rx_inc_runt           (rx_inc_runt),                     // rx_incrmt_vectors_stat_cntrs.export
		.rx_inc_64             (rx_inc_64),                       //                             .export
		.rx_inc_127            (rx_inc_127),                      //                             .export
		.rx_inc_255            (rx_inc_255),                      //                             .export
		.rx_inc_511            (rx_inc_511),                      //                             .export
		.rx_inc_1023           (rx_inc_1023),                     //                             .export
		.rx_inc_1518           (rx_inc_1518),                     //                             .export
		.rx_inc_max            (rx_inc_max),                      //                             .export
		.rx_inc_over           (rx_inc_over),                     //                             .export
		.rx_inc_mcast_data_err (rx_inc_mcast_data_err),           //                             .export
		.rx_inc_mcast_data_ok  (rx_inc_mcast_data_ok),            //                             .export
		.rx_inc_bcast_data_err (rx_inc_bcast_data_err),           //                             .export
		.rx_inc_bcast_data_ok  (rx_inc_bcast_data_ok),            //                             .export
		.rx_inc_ucast_data_err (rx_inc_ucast_data_err),           //                             .export
		.rx_inc_ucast_data_ok  (rx_inc_ucast_data_ok),            //                             .export
		.rx_inc_mcast_ctrl     (rx_inc_mcast_ctrl),               //                             .export
		.rx_inc_bcast_ctrl     (rx_inc_bcast_ctrl),               //                             .export
		.rx_inc_ucast_ctrl     (rx_inc_ucast_ctrl),               //                             .export
		.rx_inc_pause          (rx_inc_pause),                    //                             .export
		.rx_inc_fcs_err        (rx_inc_fcs_err),                  //                             .export
		.rx_inc_fragment       (rx_inc_fragment),                 //                             .export
		.rx_inc_jabber         (rx_inc_jabber),                   //                             .export
		.rx_inc_sizeok_fcserr  (rx_inc_sizeok_fcserr),            //                             .export
		.tx_inc_64             (tx_inc_64),                       // tx_incrmt_vectors_stat_cntrs.export
		.tx_inc_127            (tx_inc_127),                      //                             .export
		.tx_inc_255            (tx_inc_255),                      //                             .export
		.tx_inc_511            (tx_inc_511),                      //                             .export
		.tx_inc_1023           (tx_inc_1023),                     //                             .export
		.tx_inc_1518           (tx_inc_1518),                     //                             .export
		.tx_inc_max            (tx_inc_max),                      //                             .export
		.tx_inc_over           (tx_inc_over),                     //                             .export
		.tx_inc_mcast_data_err (tx_inc_mcast_data_err),           //                             .export
		.tx_inc_mcast_data_ok  (tx_inc_mcast_data_ok),            //                             .export
		.tx_inc_bcast_data_err (tx_inc_bcast_data_err),           //                             .export
		.tx_inc_bcast_data_ok  (tx_inc_bcast_data_ok),            //                             .export
		.tx_inc_ucast_data_err (tx_inc_ucast_data_err),           //                             .export
		.tx_inc_ucast_data_ok  (tx_inc_ucast_data_ok),            //                             .export
		.tx_inc_mcast_ctrl     (tx_inc_mcast_ctrl),               //                             .export
		.tx_inc_bcast_ctrl     (tx_inc_bcast_ctrl),               //                             .export
		.tx_inc_ucast_ctrl     (tx_inc_ucast_ctrl),               //                             .export
		.tx_inc_pause          (tx_inc_pause),                    //                             .export
		.tx_inc_fcs_err        (tx_inc_fcs_err),                  //                             .export
		.tx_inc_fragment       (tx_inc_fragment),                 //                             .export
		.tx_inc_jabber         (tx_inc_jabber),                   //                             .export
		.tx_inc_sizeok_fcserr  (tx_inc_sizeok_fcserr),            //                             .export
		.mac_rx_arst_ST        (mac_rx_arst_ST),                  //               mac_rx_arst_ST.reset
		.mac_rx_arst_sync_core (mac_mac_rx_arst_sync_core_reset), //        mac_rx_arst_sync_core.reset
		.clk_dout              (clk_rxmac),                       //                     clk_dout.clk
		.dout_d                (mac_dout_d_export),               //                       dout_d.export
		.dout_first_data       (mac_dout_first_data_export),      //              dout_first_data.export
		.dout_last_data        (mac_dout_last_data_export),       //               dout_last_data.export
		.dout_runt_last_data   (mac_dout_runt_last_data_export),  //          dout_runt_last_data.export
		.dout_payload          (mac_dout_payload_export),         //                 dout_payload.export
		.dout_fcs_error        (mac_dout_fcs_error_export),       //               dout_fcs_error.export
		.dout_fcs_valid        (mac_dout_fcs_valid_export),       //               dout_fcs_valid.export
		.dout_valid            (mac_dout_valid_export),           //                   dout_valid.export
		.rx_raw_mii_d          (phy_rx_raw_mii_d_export),         //                 rx_raw_mii_d.export
		.rx_raw_mii_c          (phy_rx_raw_mii_c_export),         //                 rx_raw_mii_c.export
		.rx_blocks_valid       (phy_rx_blocks_valid_export),      //              rx_blocks_valid.export
		.lanes_deskewed        (phy_lanes_deskewed_export),       //               lanes_deskewed.export
		.mac_tx_arst_ST        (mac_tx_arst_ST),                  //               mac_tx_arst_ST.reset
		.mac_tx_arst_sync_core (mac_mac_tx_arst_sync_core_reset), //        mac_tx_arst_sync_core.reset
		.clk_din               (clk_txmac),                       //                      clk_din.clk
		.din                   (adapter_tx_tx2l_d_export),        //                          din.export
		.din_start             (adapter_tx_tx2l_sop_export),      //                    din_start.export
		.din_end_pos           (adapter_tx_tx2l_eop_bm_export),   //                  din_end_pos.export
		.din_ack               (mac_din_ack_export),              //                      din_ack.export
		.miitx_rev_d           (mac_miitx_rev_d_export),          //                  miitx_rev_d.export
		.miitx_rev_c           (mac_miitx_rev_c_export),          //                  miitx_rev_c.export
		.miitx_valid           (mac_miitx_valid_export),          //                  miitx_valid.export
		.din_ready             (phy_din_ready_export),            //                    din_ready.export
		.tx_lanes_stable       (phy_tx_lanes_stable_export),      //              tx_lanes_stable.export
		.pause_insert_tx       (pause_insert_tx),                 //                 pause_insert.export
		.pause_insert_time     (pause_insert_time),               //                             .export
		.pause_insert_mcast    (pause_insert_mcast),              //                             .export
		.pause_insert_dst      (pause_insert_dst),                //                             .export
		.pause_insert_src      (pause_insert_src),                //                             .export
		.clk_status            (bridge_clk_status_mac_clk),       //                   clk_status.clk
		.status_addr           (bridge_status_mac_addr),          //                       status.addr
		.status_read           (bridge_status_mac_read),          //                             .read
		.status_write          (bridge_status_mac_write),         //                             .write
		.status_writedata      (bridge_status_mac_writedata),     //                             .writedata
		.status_readdata       (mac_status_readdata),             //                             .readdata
		.status_readdata_valid (mac_status_readdata_valid),       //                             .readdata_valid
		.dout_c                (mac_dout_c_export),               //                  (terminated)
		.dout_dst_addr_match   (mac_dout_dst_addr_match_export),                                //                  (terminated)
		.remote_fault_status   (remote_fault_status), 
		.local_fault_status    (local_fault_status),
		.pause_match_from_rx   (pause_match_from_rx),                                //                  (terminated)
		.pause_time_from_rx    (pause_time_from_rx),                                //                  (terminated)
		.remote_fault_from_rx  (remote_fault_from_rx),                                //                  (terminated)
		.local_fault_from_rx   (local_fault_from_rx),                                //                  (terminated)
		.pause_match_to_tx     (pause_match_to_tx),                            //                  (terminated)
		.pause_time_to_tx      (pause_time_to_tx),            //                  (terminated)
		.remote_fault_to_tx    (remote_fault_to_tx),                            //                  (terminated)
		.local_fault_to_tx     (local_fault_to_tx)                             //                  (terminated)
	);
	   if(!HAS_PHY) begin
	      assign rx_mii_valid_phy = 1'b0;
	      assign rx_mii_d_phy = 128'b0;
	      assign rx_mii_c_phy = 16'b0;
	      assign tx_mii_ready_phy = 1'b0;
	      assign tx_lanes_stable_phy = 1'b0; // bring these signals to the top level
	      assign lanes_deskewed_phy = 1'b0;
	   end
	   
	end

	
	if (HAS_PHY) begin : GEN_PHY
	alt_e40_phy #(
	.VARIANT(VARIANT),                    // 1=>RX, 2=>TX, 3=> RX_AND_TX
	.DEVICE_FAMILY(DEVICE_FAMILY),
	.STATUS_CLK_KHZ(STATUS_CLK_KHZ),
	.FAST_SIMULATION        (FAST_SIMULATION),
	.en_synce_support(en_synce_support),
	.ENA_KR4       (ENA_KR4),
	.SYNTH_AN      (SYNTH_AN),
	.SYNTH_LT      (SYNTH_LT),
	.SYNTH_SEQ     (SYNTH_SEQ),
	.SYNTH_FEC     (SYNTH_FEC),
	.LINK_TIMER_KR (LINK_TIMER_KR),
	.BERWIDTH      (BERWIDTH),
	.TRNWTWIDTH    (TRNWTWIDTH),
	.MAINTAPWIDTH  (MAINTAPWIDTH),
	.POSTTAPWIDTH  (POSTTAPWIDTH),
	.PRETAPWIDTH   (PRETAPWIDTH),
	.VMAXRULE      (VMAXRULE),
	.VMINRULE      (VMINRULE),
	.VODMINRULE    (VODMINRULE),
	.VPOSTRULE     (VPOSTRULE),
	.VPRERULE      (VPRERULE),
	.PREMAINVAL    (PREMAINVAL),
	.PREPOSTVAL    (PREPOSTVAL),
	.PREPREVAL     (PREPREVAL),
	.INITMAINVAL   (INITMAINVAL),
	.INITPOSTVAL   (INITPOSTVAL),
	.INITPREVAL    (INITPREVAL),
	.AN_CHAN       (AN_CHAN),
	.AN_PAUSE      (AN_PAUSE),
	.AN_TECH       (AN_TECH),
	.AN_FEC        (AN_FEC),
	.AN_SELECTOR   (AN_SELECTOR),
	.ERR_INDICATION(ERR_INDICATION),
	.REF_CLK_FREQ  (REF_CLK_FREQ),
	.PLL_TYPE      (PHY_PLL),
	.FEC_USE_M20K  (FEC_USE_M20K),
	.OPTIONAL_RXEQ (OPTIONAL_RXEQ)
	) phy (
		.clk_din               (clk_txmac),                    //            clk_din.clk
		.pcs_tx_arst_ST        (pcs_tx_arst_ST),               //     pcs_tx_arst_ST.reset
		.clk_dout              (clk_rxmac),                    //           clk_dout.clk
		.pcs_rx_arst_ST        (pcs_rx_arst_ST),               //     pcs_rx_arst_ST.reset
		.clk_status            (bridge_clk_status_phy_clk),    //         clk_status.clk
		.status_addr           (bridge_status_phy_addr),       //             status.addr
		.status_read           (bridge_status_phy_read),       //                   .read
		.status_write          (bridge_status_phy_write),      //                   .write
		.status_writedata      (bridge_status_phy_writedata),  //                   .writedata
		.status_readdata       (phy_status_readdata),          //                   .readdata
		.status_readdata_valid (phy_status_readdata_valid),    //                   .readdata_valid
		.pma_arst_ST           (bridge_pma_arst_st_out_reset), //        pma_arst_ST.reset
		.clk_ref               (clk_ref),                      //            clk_ref.clk
		.rx_clk_ref            (rx_clk_ref),
		.tx_clk_ref            (tx_clk_ref),
		.pll_locked            (pll_locked),
		.tx_serial_clk         (tx_serial_clk),
		.miitx_rev_d           (mac_miitx_rev_d_export),       //        miitx_rev_d.export
		.miitx_rev_c           (mac_miitx_rev_c_export),       //        miitx_rev_c.export
		.miitx_valid           (mac_miitx_valid_export),       //        miitx_valid.export
		.din_ready             (phy_din_ready_export),         //          din_ready.export
		.tx_lanes_stable       (phy_tx_lanes_stable_export),   //    tx_lanes_stable.export
		.rx_blocks_valid       (phy_rx_blocks_valid_export),   //    rx_blocks_valid.export
		.rx_raw_mii_d          (phy_rx_raw_mii_d_export),      //       rx_raw_mii_d.export
		.rx_raw_mii_c          (phy_rx_raw_mii_c_export),      //       rx_raw_mii_c.export
		.lanes_deskewed        (phy_lanes_deskewed_export),    //     lanes_deskewed.export
		.tx_dataout            (tx_serial_reg),                    //         tx_dataout.export
		.rx_datain             (rx_serial_reg),                    //          rx_datain.export
		.reconfig_from_xcvr    (reconfig_from_xcvr_w),           // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr      (reconfig_to_xcvr_w),              //   reconfig_to_xcvr.reconfig_to_xcvr
		.a10_reconfig_write(a10_reconfig_write),       //      reconfig_avmm.write
		.a10_reconfig_read(a10_reconfig_read),        //                   .read
		.a10_reconfig_address(a10_reconfig_address),     //                   .address
		.a10_reconfig_writedata(a10_reconfig_writedata),   //                   .writedata
		.a10_reconfig_readdata(a10_reconfig_readdata),    //                   .readdata
		.a10_reconfig_waitrequest(a10_reconfig_waitrequest),  //                   .waitrequest
		
		// KR4 Ports
		.rc_busy(rc_busy),    // reconfig is busy servicing request
		                      // [4] servicing req from SEQ
		                      // [3:0] from LT for channel 3 to 0
		.lt_start_rc(lt_start_rc),    // start the TX EQ reconfig
		.main_rc(main_rc), // main tap value for reconfig
		.post_rc(post_rc), // post tap value for reconfig
		.pre_rc(pre_rc),  // pre tap value for reconfig
		.tap_to_upd(tap_to_upd),     // specific TX EQ tap to update
		                             // bit-2 = main, bit-1 = post, ...
		.en_lcl_rxeq(en_lcl_rxeq),   // Enable local RX Equalization
		.rxeq_done(rxeq_done),       // Local RX Equalization is finished
		.seq_start_rc(seq_start_rc),   // start the PCS reconfig
		.dfe_start_rc(dfe_start_rc),   // start DFE reconfig for lane 3-0
		.dfe_mode(dfe_mode),           // DFE mode 00=disabled, 01=triggered, 10=continuous
		.ctle_start_rc(ctle_start_rc), // start CTLE reconfig for lane 3-0
		.ctle_rc(ctle_rc),             // CTLE manual setting for lane 3-0
		.ctle_mode(ctle_mode),         // CTLE mode 00=manual, 01=one-time, 10=continuous
		.pcs_mode_rc(pcs_mode_rc),     // PCS mode for reconfig - 1 hot
		                               // bit 0 = AN mode = low_lat, PLL LTR, 66:40
		                               // bit 1 = LT mode = low_lat, PLL LTD, 66:40
		                               // bit 2 = (N/A) 10G data mode = 10GBASE-R, 66:40
		                               // bit 3 = (N/A) GigE data mode = 8G PCS
		                               // bit 4 = (N/A) XAUI data mode = future?
		                               // bit 5 = 10G-FEC/40G data mode = low lat, 64:64
		.reco_mif_done(reco_mif_done), // PMA reconfiguration done (resets the PHYs)
		
		.upi_mode_en       (upi_mode_en),
		.upi_adj           (upi_adj),
		.upi_inc           (upi_inc),
		.upi_dec           (upi_dec),
		.upi_pre           (upi_pre),
		.upi_init          (upi_init),
		.upi_st_bert       (upi_st_bert),
		.upi_train_err     (upi_train_err),
		.upi_lock_err      (upi_lock_err),
		.upi_rx_trained    (upi_rx_trained),
		.upo_enable        (upo_enable),
		.upo_frame_lock    (upo_frame_lock),
		.upo_cm_done       (upo_cm_done),
		.upo_bert_done     (upo_bert_done),
		.upo_ber_cnt       (upo_ber_cnt),
		.upo_ber_max       (upo_ber_max),
		.upo_coef_max      (upo_coef_max)
	);
	   if(!HAS_MAC) begin
	      assign tx_mii_d_mac 		     = 128'b0;
	      assign tx_mii_c_mac 		     = 16'b0;
	      assign tx_mii_valid_mac 		     = 1'b0;
	      
	   end
	   
	end
	
	
	if (HAS_MAC && HAS_PHY) begin : GEN_AVALON_BRIDGE
	alt_e40_bridge bridge (
		.clk_status_mac            (bridge_clk_status_mac_clk),    //  clk_status_mac.clk
		.clk_status_phy            (bridge_clk_status_phy_clk),    //  clk_status_phy.clk
		.clk_status                (clk_status),                   //      clk_status.clk
		.pma_arst_ST               (pma_arst_ST),                  //     pma_arst_ST.reset
		.pma_arst_ST_out           (bridge_pma_arst_st_out_reset), // pma_arst_ST_out.reset
		.status_addr               (status_addr),                  //          status.address
		.status_read               (status_read),                  //                .read
		.status_write              (status_write),                 //                .write
		.status_writedata          (status_writedata),             //                .writedata
		.status_readdata           (status_readdata),              //                .readdata
		.status_readdata_valid     (status_readdata_valid),        //                .readdatavalid
		.status_mac_addr           (bridge_status_mac_addr),       //      status_mac.addr
		.status_mac_read           (bridge_status_mac_read),       //                .read
		.status_mac_write          (bridge_status_mac_write),      //                .write
		.status_mac_writedata      (bridge_status_mac_writedata),  //                .writedata
		.status_mac_readdata       (mac_status_readdata),          //                .readdata
		.status_mac_readdata_valid (mac_status_readdata_valid),    //                .readdata_valid
		.status_phy_addr           (bridge_status_phy_addr),       //      status_phy.addr
		.status_phy_read           (bridge_status_phy_read),       //                .read
		.status_phy_write          (bridge_status_phy_write),      //                .write
		.status_phy_writedata      (bridge_status_phy_writedata),  //                .writedata
		.status_phy_readdata       (phy_status_readdata),          //                .readdata
		.status_phy_readdata_valid (phy_status_readdata_valid)     //                .readdata_valid
	);
	
	assign tx_lanes_stable_phy = phy_tx_lanes_stable_export; // bring these signals to the top level
	   assign lanes_deskewed_phy = phy_lanes_deskewed_export;
	   assign tx_mii_d_mac = 128'b0;
	   assign tx_mii_c_mac = 16'b0;
	   assign tx_mii_valid_mac = 1'b0;	
	   assign rx_mii_valid_phy = 1'b0;
	   assign rx_mii_d_phy = 128'b0;
	   assign rx_mii_c_phy = 16'b0;
	   assign tx_mii_ready_phy = 1'b0;
	end	
	// In the case of PHY Only set the MII signals to the top level and re-route AVMM
	else if (HAS_PHY) begin : GEN_CONNECTS_PHY_ONLY
		assign bridge_clk_status_phy_clk = clk_status;
		assign bridge_status_phy_addr = status_addr;
		assign bridge_status_phy_read = status_read;
		assign bridge_status_phy_write = status_write;
		assign bridge_status_phy_writedata = status_writedata;
		assign status_readdata = phy_status_readdata;
		assign status_readdata_valid = phy_status_readdata_valid;
		assign bridge_pma_arst_st_out_reset = pma_arst_ST;
		
		assign mac_miitx_rev_d_export = tx_mii_d_phy;
		assign mac_miitx_rev_c_export = tx_mii_c_phy;
		assign mac_miitx_valid_export = tx_mii_valid_phy;
		assign tx_mii_ready_phy = phy_din_ready_export;
		assign tx_lanes_stable_phy = phy_tx_lanes_stable_export;
		assign rx_mii_d_phy = phy_rx_raw_mii_d_export;
		assign rx_mii_c_phy = phy_rx_raw_mii_c_export;
		assign rx_mii_valid_phy = phy_rx_blocks_valid_export;
		assign lanes_deskewed_phy = phy_lanes_deskewed_export;
		
		// Tie off MAC stats signals
		assign rx_inc_runt = 0;           //             rx_inc.runt
		assign rx_inc_64 = 0;             //                   .64
		assign rx_inc_127 = 0;            //                   .127
		assign rx_inc_255 = 0;            //                   .255
		assign rx_inc_511 = 0;            //                   .511
		assign rx_inc_1023 = 0;           //                   .1023
		assign rx_inc_1518 = 0;           //                   .1518
		assign rx_inc_max = 0;            //                   .max
		assign rx_inc_over = 0;           //                   .over
		assign rx_inc_mcast_data_err = 0; //                   .mcast_data_err
		assign rx_inc_mcast_data_ok = 0;  //                   .mcast_data_ok
		assign rx_inc_bcast_data_err = 0; //                   .bcast_data_err
		assign rx_inc_bcast_data_ok = 0;  //                   .bcast_data_ok
		assign rx_inc_ucast_data_err = 0; //                   .ucast_data_err
		assign rx_inc_ucast_data_ok = 0;  //                   .ucast_data_ok
		assign rx_inc_mcast_ctrl = 0;     //                   .mcast_ctrl
		assign rx_inc_bcast_ctrl = 0;     //                   .bcast_ctrl
		assign rx_inc_ucast_ctrl = 0;     //                   .ucast_ctrl
		assign rx_inc_pause = 0;          //                   .pause
		assign rx_inc_fcs_err = 0;        //                   .fcs_err
		assign rx_inc_fragment = 0;       //                   .fragment
		assign rx_inc_jabber = 0;         //                   .jabber
		assign rx_inc_sizeok_fcserr = 0;  //                   .sizeok_fcserr
		assign tx_inc_64 = 0;             //             tx_inc.64
		assign tx_inc_127 = 0;            //                   .127
		assign tx_inc_255 = 0;            //                   .255
		assign tx_inc_511 = 0;            //                   .511
		assign tx_inc_1023 = 0;           //                   .1023
		assign tx_inc_1518 = 0;           //                   .1518
		assign tx_inc_max = 0;            //                   .max
		assign tx_inc_over = 0;           //                   .over
		assign tx_inc_mcast_data_err = 0; //                   .mcast_data_err
		assign tx_inc_mcast_data_ok = 0;  //                   .mcast_data_ok
		assign tx_inc_bcast_data_err = 0; //                   .bcast_data_err
		assign tx_inc_bcast_data_ok = 0;  //                   .bcast_data_ok
		assign tx_inc_ucast_data_err = 0; //                   .ucast_data_err
		assign tx_inc_ucast_data_ok = 0;  //                   .ucast_data_ok
		assign tx_inc_mcast_ctrl = 0;     //                   .mcast_ctrl
		assign tx_inc_bcast_ctrl = 0;     //                   .bcast_ctrl
		assign tx_inc_ucast_ctrl = 0;     //                   .ucast_ctrl
		assign tx_inc_pause = 0;          //                   .pause
		assign tx_inc_fcs_err = 0;        //                   .fcs_err
		assign tx_inc_fragment = 0;       //                   .fragment
		assign tx_inc_jabber = 0;         //                   .jabber
		assign tx_inc_sizeok_fcserr = 0;  //                   .sizeok_fcserr
		
	end
	// In the case of MAC Only set the MII signals to the top level and re-route AVMM
	else if (HAS_MAC) begin : GEN_CONNECTS_MAC_ONLY
		assign bridge_clk_status_mac_clk = clk_status;
	    assign bridge_status_mac_addr = status_addr;
		assign bridge_status_mac_read = status_read;
		assign bridge_status_mac_write = status_write;
		assign bridge_status_mac_writedata = status_writedata;
		assign status_readdata = mac_status_readdata;
		assign status_readdata_valid = mac_status_readdata_valid;
		
		assign tx_mii_d_mac     = mac_miitx_rev_d_export;
		assign tx_mii_c_mac     = mac_miitx_rev_c_export;
		assign tx_mii_valid_mac = mac_miitx_valid_export;
		assign phy_din_ready_export = tx_mii_ready_mac;
		assign phy_tx_lanes_stable_export = tx_lanes_stable_mac;
		assign phy_rx_raw_mii_d_export = rx_mii_d_mac;
		assign phy_rx_raw_mii_c_export = rx_mii_c_mac;
		assign phy_rx_blocks_valid_export = rx_mii_valid_mac;
		assign phy_lanes_deskewed_export = lanes_deskewed_mac;
		
		// Tie off phy signals
		assign reconfig_from_xcvr  = 0;
		assign tx_serial_reg           = 4'b0;
		
		assign a10_reconfig_readdata = 32'b0;
		assign a10_reconfig_waitrequest = 1'b0;
		
		// KR4 ports
		
		assign lt_start_rc = 4'b0;
		assign main_rc = {(4*MAINTAPWIDTH){1'b0}};
		assign post_rc = {(4*POSTTAPWIDTH){1'b0}};		
		assign pre_rc  = {(4*PRETAPWIDTH){1'b0}};			
		assign tap_to_upd = 12'b0;
		assign en_lcl_rxeq = 4'b0;
		assign seq_start_rc = 4'b0;
		assign dfe_start_rc = 4'b0;
		assign dfe_mode = 8'b0;
		assign ctle_start_rc = 4'b0;
		assign ctle_rc = 16'b0;
		assign ctle_mode = 8'b0;
		assign pcs_mode_rc = 6'b0;
		
		assign upo_enable = 4'b0;
		assign upo_frame_lock = 4'b0;
		assign upo_cm_done = 4'b0;
		assign upo_bert_done = 4'b0;
		assign upo_ber_max = 4'b0;
		assign upo_coef_max = 4'b0;
		assign upo_ber_cnt  = {(4*BERWIDTH){1'b0}};	
		
	end
	
	if (HAS_MAC && HAS_ADAPTERS) begin : GEN_AVALON_ST

	   if(VARIANT == 1) begin
	      assign l4_tx_ready  = 1'b0;
	      
	   end

	   if(VARIANT == 2) begin
	      assign l4_rx_data = 256'b0;
	      assign l4_rx_empty = 5'b0;
	      assign l4_rx_startofpacket = 1'b0;
	      assign l4_rx_endofpacket = 1'b0;
	      assign l4_rx_error = 1'b0;
	      assign l4_rx_valid = 1'b0;
	      assign l4_rx_fcs_valid = 1'b0;
	      assign l4_rx_fcs_error = 1'b0;
	   end
	   
		if (VARIANT == 1 || VARIANT == 3) begin : GEN_AVALON_ST_RX
			alt_e40_adapter_rx #(
				.DEVICE_FAMILY (DEVICE_FAMILY)
			) adapter_rx (
				.mac_rx_arst_sync_core (mac_mac_rx_arst_sync_core_reset), // mac_rx_arst_sync_core.reset
				.l4_rx_data            (l4_rx_data),                      //   avalon_streaming_rx.data
				.l4_rx_empty           (l4_rx_empty),                     //                      .empty
				.l4_rx_startofpacket   (l4_rx_startofpacket),             //                      .startofpacket
				.l4_rx_endofpacket     (l4_rx_endofpacket),               //                      .endofpacket
				.l4_rx_error           (l4_rx_error),                     //                      .error
				.l4_rx_valid           (l4_rx_valid),                     //                      .valid
				.l4_rx_fcs_valid       (l4_rx_fcs_valid),                 //             l8_rx_fcs.valid
				.l4_rx_fcs_error       (l4_rx_fcs_error),                 //                      .error
				.clk_rxmac             (clk_rxmac),                       //             clk_rxmac.clk
				.rx2l_d                (mac_dout_d_export),               //                rx5l_d.export
				.rx2l_sop              (mac_dout_first_data_export),      //              rx5l_sop.export
				.rx2l_eop_bm           (mac_dout_last_data_export),       //           rx5l_eop_bm.export
				.rx2l_valid            (mac_dout_valid_export),           //            rx5l_valid.export
				.rx2l_runt_last_data   (mac_dout_runt_last_data_export),  //   rx5l_runt_last_data.export
				.rx2l_payload          (mac_dout_payload_export),         //          rx5l_payload.export
				.rx2l_fcs_valid        (mac_dout_fcs_valid_export),       //        rx5l_fcs_valid.export
				.rx2l_fcs_error        (mac_dout_fcs_error_export)        //        rx5l_fcs_error.export
			);
		end
	
		if (VARIANT == 2 || VARIANT == 3) begin : GEN_AVALON_ST_TX
			alt_e40_adapter_tx #(
					.DEVICE_FAMILY (DEVICE_FAMILY)
				) adapter_tx (
					.l4_tx_data            (l4_tx_data),                      //   avalon_streaming_tx.data
					.l4_tx_empty           (l4_tx_empty),                     //                      .empty
					.l4_tx_startofpacket   (l4_tx_startofpacket),             //                      .startofpacket
					.l4_tx_endofpacket     (l4_tx_endofpacket),               //                      .endofpacket
					.l4_tx_ready           (l4_tx_ready),                     //                      .ready
					.l4_tx_valid           (l4_tx_valid),                     //                      .valid
					.mac_tx_arst_sync_core (mac_mac_tx_arst_sync_core_reset), // mac_tx_arst_sync_core.reset
					.clk_txmac             (clk_txmac),                       //             clk_txmac.clk
					.tx2l_d                (adapter_tx_tx2l_d_export),        //                tx5l_d.export
					.tx2l_sop              (adapter_tx_tx2l_sop_export),      //              tx5l_sop.export
					.tx2l_eop_bm           (adapter_tx_tx2l_eop_bm_export),   //           tx5l_eop_bm.export
					.tx2l_ack              (mac_din_ack_export)               //              tx5l_ack.export
				);
		end
		
		// Tie off Custom-ST IF
		assign          din_ack = 1'b0;               //             din_ack.export
		assign          dout_d = 128'b0;                //              dout_d.export
		assign          dout_c = 16'b0;                //              dout_c.export
		assign          dout_first_data = 2'b0;       //     dout_first_data.export
		assign          dout_last_data = 16'b0;        //      dout_last_data.export
		assign          dout_runt_last_data = 2'b0;   // dout_runt_last_data.export
		assign          dout_payload = 2'b0;          //        dout_payload.export
		assign          dout_fcs_error = 1'b0;        //      dout_fcs_error.export
		assign          dout_fcs_valid = 1'b0;        //      dout_fcs_valid.export
		assign          dout_dst_addr_match = 1'b0;   // dout_dst_addr_match.export
		assign          dout_valid = 1'b0;            //          dout_valid.export
	end
	else if (HAS_MAC && !HAS_ADAPTERS) begin  : GEN_CONNECTS_CUSTOM_ST
		// Add code here to tie off any unused signals when adaptors arent enabled
		
		// Wire up the Custom-ST Interface
		assign adapter_tx_tx2l_d_export = din;
		assign adapter_tx_tx2l_sop_export = din_start;
		assign adapter_tx_tx2l_eop_bm_export = din_end_pos;
		assign din_ack = mac_din_ack_export;
		assign dout_d = mac_dout_d_export;
		assign dout_first_data = mac_dout_first_data_export;
		assign dout_last_data = mac_dout_last_data_export;
		assign dout_valid = mac_dout_valid_export;
		assign dout_runt_last_data = mac_dout_runt_last_data_export;
		assign dout_payload = mac_dout_payload_export;
		assign dout_fcs_valid = mac_dout_fcs_valid_export;
		assign dout_fcs_error = mac_dout_fcs_error_export;	
		assign dout_c = mac_dout_c_export;
		assign dout_dst_addr_match = mac_dout_dst_addr_match_export;
	
		// Tie off Avalon Streaming Interface when using Custom Streaming
		assign l4_rx_data = 256'b0;            //              l8_rx.data
		assign l4_rx_empty = 5'b0;           //                   .empty
		assign l4_rx_startofpacket = 1'b0;   //                   .startofpacket
		assign l4_rx_endofpacket = 1'b0;     //                   .endofpacket
		assign l4_rx_error = 1'b0;           //                   .error
		assign l4_rx_valid = 1'b0;           //                   .valid
		assign l4_rx_fcs_valid = 1'b0;       //          l8_rx_fcs.valid
		assign l4_rx_fcs_error = 1'b0;       //                   .error
		assign l4_tx_ready = 1'b0;           //                   .ready
	end else begin
			assign          din_ack = 1'b0;               //             din_ack.export
			assign          dout_d = 128'b0;                //              dout_d.export
			assign          dout_c = 16'b0;                //              dout_c.export
			assign          dout_first_data = 2'b0;       //     dout_first_data.export
			assign          dout_last_data = 16'b0;        //      dout_last_data.export
			assign          dout_runt_last_data = 2'b0;   // dout_runt_last_data.export
			assign          dout_payload = 2'b0;          //        dout_payload.export
			assign          dout_fcs_error = 1'b0;        //      dout_fcs_error.export
			assign          dout_fcs_valid = 1'b0;        //      dout_fcs_valid.export
			assign          dout_dst_addr_match = 1'b0;   // dout_dst_addr_match.export
			assign          dout_valid = 1'b0;            //          dout_valid.export
			assign l4_rx_data = 256'b0;            //              l8_rx.data
			assign l4_rx_empty = 5'b0;           //                   .empty
			assign l4_rx_startofpacket = 1'b0;   //                   .startofpacket
			assign l4_rx_endofpacket = 1'b0;     //                   .endofpacket
			assign l4_rx_error = 1'b0;           //                   .error
			assign l4_rx_valid = 1'b0;           //                   .valid
			assign l4_rx_fcs_valid = 1'b0;       //          l8_rx_fcs.valid
			assign l4_rx_fcs_error = 1'b0;       //                   .error
			assign l4_tx_ready = 1'b0;           //                   .ready	
			assign        remote_fault_status = 1'b0;
			assign        local_fault_status = 1'b0;
			assign        pause_match_from_rx = 1'b0;
			assign        pause_time_from_rx = 1'b0;
			assign        remote_fault_from_rx = 1'b0;
			assign        local_fault_from_rx = 1'b0;
	end
	
	if (HAS_PHY && VARIANT == 1) begin
		assign reconfig_from_xcvr = reconfig_from_xcvr_w[183:0];
		assign reconfig_to_xcvr_w = {280'b0,reconfig_to_xcvr[279:0]};	
	end
	else if (HAS_PHY) begin
		assign reconfig_from_xcvr = reconfig_from_xcvr_w;
		assign reconfig_to_xcvr_w = reconfig_to_xcvr;		
	end
	else begin
		assign reconfig_from_xcvr = {FROM_XCVR_WIDTH{1'b0}};
	end
	
	
	endgenerate
endmodule
