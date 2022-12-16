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


//-----------------------------------------------------------------------------
//
// Description: hxaui static verilog for Stratix IV
//
// Authors:     bauyeung    7-Sep-2010
//
//              Copyright (c) Altera Corporation 1997 - 2010
//              All rights reserved.
//
//-----------------------------------------------------------------------------
 /*ALTERA_ATTRIBUTE = "-name SDC_STATEMENT \"set_false_path -from [get_registers *hxaui_0*hxaui_alt4gxb*hxaui_alt4gxb_alt4gxb_dksa_component*] -to [get_registers *xaui_phy*hxaui_csr*tx_phase_comp_fifo_error_c[*]]\" " */
`timescale 1ps/1ps
module siv_xcvr_xaui #(
  parameter device_family                = "Stratix IV",
  parameter starting_channel_number      = 0,
  parameter interface_type               = "Hard XAUI",
  parameter number_of_interfaces         = 1,
  parameter sys_clk_in_mhz               = 50,
  parameter xaui_pll_type                = "CMU",
  parameter reconfig_interfaces         = 1,
  parameter use_control_and_status_ports = 0,
  parameter external_pma_ctrl_reconf     = 0,
  parameter tx_termination               = "OCT_150_OHMS",
  parameter tx_vod_selection             = 1,
  parameter tx_preemp_pretap             = 0,
  parameter tx_preemp_pretap_inv         = 0,
  parameter tx_preemp_tap_1              = 5,
  parameter tx_preemp_tap_2              = 0,
  parameter tx_preemp_tap_2_inv          = 0,
  parameter rx_common_mode               = "0.82v",
  parameter rx_termination               = "OCT_150_OHMS",
  parameter rx_eq_dc_gain                = 0,
  parameter rx_eq_ctrl                   = 14
) (
  input  wire        pll_ref_clk,           //   refclk.clk
  input  wire        xgmii_tx_clk,          //   xgmii_tx_clk.clk
  output wire        xgmii_rx_clk,          //   xgmii_rx_clk.clk
  input  wire        phy_mgmt_clk,          //   mgmt_clk.clk
  input  wire        phy_mgmt_clk_reset,    //   mgmt_clk_rst.reset_n
  input  wire  [7:0] phy_mgmt_address,      //   phy_mgmt.address
  output wire        phy_mgmt_waitrequest,  //   .waitrequest
  input  wire        phy_mgmt_read,         //   .read
  output wire [31:0] phy_mgmt_readdata,     //   .readdata
  input  wire        phy_mgmt_write,        //   .write
  input  wire [31:0] phy_mgmt_writedata,    //   .writedata
  input  wire [71:0] xgmii_tx_dc,           //   xgmii_tx_dc.data
  output wire [71:0] xgmii_rx_dc,           //   xgmii_rx_dc.data
  output wire [3:0]  xaui_tx_serial_data,   //   xaui_tx_serial.export
  input  wire [3:0]  xaui_rx_serial_data,   //   xaui_rx_serial.export
  output wire        rx_ready,              //   rx_pma_ready.data
  output wire        tx_ready,              //   tx_pma_ready.data
  output tri0 [altera_xcvr_functions::get_reconfig_from_width(device_family,reconfig_interfaces)-1:0] reconfig_from_xcvr,
  input  tri0 [altera_xcvr_functions::get_reconfig_to_width(device_family,reconfig_interfaces)  -1:0] reconfig_to_xcvr,

  output wire [3:0]  rx_recovered_clk,      //   rx recovered clock from cdr
// optional control and status ports
  input  wire        rx_analogreset,
  input  wire        rx_digitalreset,
  input  wire        tx_digitalreset,
  output wire        rx_channelaligned,
  input  wire [3:0]  rx_invpolarity,
  input  wire [3:0]  rx_set_locktodata,
  input  wire [3:0]  rx_set_locktoref,
  input  wire [3:0]  rx_seriallpbken,
  input  wire [3:0]  tx_invpolarity,
  output wire [3:0]  rx_is_lockedtodata,
  output wire [3:0]  rx_phase_comp_fifo_error,
  output wire [3:0]  rx_is_lockedtoref,
  output wire [3:0]  rx_rlv,
  output wire [3:0]  rx_rmfifoempty,
  output wire [3:0]  rx_rmfifofull,
  output wire [3:0]  tx_phase_comp_fifo_error,
  output wire [7:0]  rx_disperr,
  output wire [7:0]  rx_errdetect,
  output wire [7:0]  rx_patterndetect,
  output wire [7:0]  rx_rmfifodatadeleted,
  output wire [7:0]  rx_rmfifodatainserted,
  output wire [7:0]  rx_runningdisp,
  output wire [7:0]  rx_syncstatus,

// external_pma_ctrl_reconf
  output wire        pll_locked,
  input  wire        cal_blk_powerdown,
  input  wire        gxb_powerdown,
  input  wire        pll_powerdown
);

import altera_xcvr_functions::*;

  wire         alt_pma_controller_0_cal_blk_pdn_data;
  wire         alt_pma_controller_0_pll_pdn0_data;
  wire         alt_pma_controller_0_gx_pdn_data;
  wire         pll_locked_data;
  wire  [7:0]  rx_disperr_data;
  wire  [7:0] rx_errdetect_data;
  wire  [7:0] rx_patterndetect_data;
  wire  [3:0] rx_phase_comp_fifo_error_data;
  wire  [3:0] rx_rlv_data;
  wire  [7:0] rx_rmfifodatadeleted_data;
  wire  [7:0] rx_rmfifodatainserted_data;
  wire  [3:0] rx_rmfifoempty_data;
  wire  [3:0] rx_rmfifofull_data;
  wire  [7:0] rx_runningdisp_data;
  wire  [7:0] rx_syncstatus_data;
  wire  [3:0] tx_phase_comp_fifo_error_data;
  wire  [3:0] alt_pma_ch_controller_0_rx_set_locktodata_data;
  wire  [3:0] alt_pma_ch_controller_0_rx_set_locktoref_data;
  wire  [3:0] alt_pma_ch_controller_0_rx_seriallpbken_data;
  wire  [3:0] alt_pma_ch_controller_0_rx_analog_rst_data;
  wire  [3:0] rx_is_lockedtodata_data;
  wire  [3:0] rx_is_lockedtoref_data;
  wire  [3:0] alt_pma_ch_controller_0_tx_digital_rst_data;
  wire  [3:0] alt_pma_ch_controller_0_rx_digital_rst_data;
  wire        hxaui_csr_r_rx_digitalreset_data;
  wire  [3:0] hxaui_csr_r_rx_invpolarity_data;
  wire        hxaui_csr_r_tx_digitalreset_data;
  wire  [3:0] hxaui_csr_r_tx_invpolarity_data;
  wire        hxaui_csr_simulation_flag_data;
  wire        alt_pma_controller_0_pll_pdn;
  wire  [3:0] alt_pma_0_tx_out_clk_clk;
  wire  [3:0] alt_pma_0_rx_recovered_clk_clk;
  wire [79:0] sxaui_0_tx_parallel_data_data;
  wire [79:0] alt_pma_0_rx_parallel_data_data;
  wire  [3:0] alt_pma_0_rx_is_lockedtodata_data;
  wire        rx_pma_ready;
  wire        sxaui_rst_done;


  wire [5:0]  sc_pma_ch_controller_address;
  wire        sc_pma_ch_controller_read;
  wire [31:0] sc_pma_ch_controller_readdata;
  wire        sc_pma_ch_controller_waitrequest;
  wire        sc_pma_ch_controller_write;


  wire [1:0]  sc_pma_controller_address;
  wire        sc_pma_controller_read;
  wire [31:0] sc_pma_controller_readdata;
  wire        sc_pma_controller_waitrequest;
  wire        sc_pma_controller_write;

  wire [4:0]  sc_csr_address;
  wire        sc_csr_read;
  wire [31:0] sc_csr_readdata;
  wire        sc_csr_write;

// assign output wires for status ports - whether or not they are used will be decided by the top level
  assign rx_is_lockedtodata       = rx_is_lockedtodata_data;
  assign rx_phase_comp_fifo_error = rx_phase_comp_fifo_error_data;
  assign rx_is_lockedtoref        = rx_is_lockedtoref_data;
  assign rx_rlv                   = rx_rlv_data;
  assign rx_rmfifoempty           = rx_rmfifoempty_data;
  assign rx_rmfifofull            = rx_rmfifofull_data;
  assign tx_phase_comp_fifo_error = tx_phase_comp_fifo_error_data;
  assign rx_disperr               = rx_disperr_data;
  assign rx_errdetect             = rx_errdetect_data; 
  assign rx_patterndetect         = rx_patterndetect_data;
  assign rx_rmfifodatadeleted     = rx_rmfifodatadeleted_data;
  assign rx_rmfifodatainserted    = rx_rmfifodatainserted_data;
  assign rx_runningdisp           = rx_runningdisp_data;
  assign rx_syncstatus            = rx_syncstatus_data;
  assign rx_recovered_clk         = alt_pma_0_rx_recovered_clk_clk;

  // assign output wires for external pma_ctrl - whether or not they are used will be decided by the top level
  assign pll_locked = pll_locked_data;
  assign rx_ready = rx_pma_ready & sxaui_rst_done; // pma and PCS must be both ready

  ///////////////////////////////////////////////////////////////////////
  // Decoder for multiple slaves of pma_ch_control,pma_control,hxaui i/f
  ///////////////////////////////////////////////////////////////////////
  alt_xcvr_mgmt2dec_xaui mgmtdec_xaui (
    .mgmt_clk_reset                   (phy_mgmt_clk_reset),
    .mgmt_clk                         (phy_mgmt_clk),
    .mgmt_address                     (phy_mgmt_address),
    .mgmt_read                        (phy_mgmt_read),
    .mgmt_write                       (phy_mgmt_write),
    .mgmt_readdata                    (phy_mgmt_readdata),
    .mgmt_waitrequest                 (phy_mgmt_waitrequest),

    // internal interface to 'top' pma ch controller block
    .sc_pma_ch_controller_readdata    (sc_pma_ch_controller_readdata),
    .sc_pma_ch_controller_waitrequest (sc_pma_ch_controller_waitrequest),
    .sc_pma_ch_controller_address     (sc_pma_ch_controller_address),  //6 bit wide
    .sc_pma_ch_controller_read        (sc_pma_ch_controller_read),
    .sc_pma_ch_controller_write       (sc_pma_ch_controller_write),

    // internal interface to 'top' pma controller block
    .sc_pma_controller_readdata       (sc_pma_controller_readdata),
    .sc_pma_controller_waitrequest    (sc_pma_controller_waitrequest),
    .sc_pma_controller_address        (sc_pma_controller_address), //2 bit wide
    .sc_pma_controller_read           (sc_pma_controller_read),
    .sc_pma_controller_write          (sc_pma_controller_write),
  
    // internal interface to 'top' hxaui csr block
    .sc_csr_readdata                  (sc_csr_readdata),
    .sc_csr_waitrequest               (1'b0), // PCS CSR is always ready
    .sc_csr_address                   (sc_csr_address),    //5 bit wide
    .sc_csr_read                      (sc_csr_read),
    .sc_csr_write                     (sc_csr_write)
  );

  ///////////////////////////////////////////////////////////////////////
  // PMA Channel Controller - only for HXAUI
  ///////////////////////////////////////////////////////////////////////
// add generate for hxaui/sxaui - only use ch_controller for hxaui
  generate
    if (interface_type == "Hard XAUI") begin
      alt_pma_ch_controller_tgx #(
        .number_of_channels  (4),
        .sync_depth          (2),
        .sys_clk_in_mhz      (sys_clk_in_mhz)
      ) alt_pma_ch_controller_0 (
        .clk                 (phy_mgmt_clk),
        .rst                 (phy_mgmt_clk_reset),
        .ch_mgmt_address     (sc_pma_ch_controller_address),
        .ch_mgmt_read        (sc_pma_ch_controller_read),
        .ch_mgmt_readdata    (sc_pma_ch_controller_readdata),
        .ch_mgmt_write       (sc_pma_ch_controller_write),
        .ch_mgmt_writedata   (phy_mgmt_writedata),
        .ch_mgmt_waitrequest (sc_pma_ch_controller_waitrequest),
        .rx_pma_ready        (rx_pma_ready),
        .tx_pma_ready        (tx_ready),
        .rx_is_lockedtodata  (rx_is_lockedtodata_data),
        .rx_is_lockedtoref   (rx_is_lockedtoref_data),
        .rx_set_locktodata   (alt_pma_ch_controller_0_rx_set_locktodata_data),
        .rx_set_locktoref    (alt_pma_ch_controller_0_rx_set_locktoref_data),
        .rx_seriallpbken     (alt_pma_ch_controller_0_rx_seriallpbken_data),
        .rx_analog_rst       (alt_pma_ch_controller_0_rx_analog_rst_data),
        .tx_digital_rst      (alt_pma_ch_controller_0_tx_digital_rst_data),
        .rx_digital_rst      (alt_pma_ch_controller_0_rx_digital_rst_data),
        .rx_rst_digital      (rx_digitalreset), // optional user triggered rx_digitalreset
        .tx_rst_digital      (tx_digitalreset), // optional user triggered tx_digitalreset
        //reconfig_to_xcvr bit configuration
        //Bit    |  Value
        //-------------------------------------------
        //3    |  offset_cancellation_is_busy  |
        //2   |  dprio_load         |
        //1   |  dprio_disable         |
        //0   |  dprio_in         |
        //-------------------------------------------
       // .rx_oc_busy          (reconfig_to_xcvr[3]), //     rx_oc_busy.data
        .rx_cal_busy         (reconfig_to_xcvr[3]), //     rx_oc_busy.data
        .tx_cal_busy         (1'b0), //     rx_oc_busy.data
        .pll_locked          (pll_locked_data)           
      );
    end else if (interface_type == "Soft XAUI") begin
      siv_xcvr_low_latency_phy_nr #(
        .device_family                (device_family),
        .intended_device_variant      ("ANY"),
        .number_of_channels           (4),
        .number_of_reconfig_interface (reconfig_interfaces),
        .operation_mode               ("DUPLEX"),
        .phase_comp_fifo_mode         ("NONE"),
        .serialization_factor         (20),
        .data_rate                    ("3125 Mbps"),
        .pll_input_frequency          ("156.25 MHz"),
        .number_pll_inclks            (1),
        .pll_inclk_select             (0),
        .pll_type                     (xaui_pll_type),
        .starting_channel_number      (starting_channel_number),
        .bonded_mode                  ("TRUE"),
        .sys_clk_in_mhz               (sys_clk_in_mhz),
        //.rx_bitslip_en                (0),
        //.tx_bitslip_en                (0),
        //.select_10g_pcs               (0),
        //.tx_use_coreclk               (0),
        //.rx_use_coreclk               (0),
        .gx_analog_power              ("AUTO"),
        .pll_lock_speed               ("AUTO"),
        .tx_analog_power              ("AUTO"),
        .tx_slew_rate                 ("OFF"),
        .tx_termination               (tx_termination),
        .tx_common_mode               ("0.65V"),
        .rx_pll_lock_speed            ("AUTO"),
        .rx_common_mode               (rx_common_mode),
        .rx_signal_detect_threshold   (2),
        .rx_ppmselect                 (32),
        .rx_termination               (rx_termination),
        .tx_preemp_pretap             (tx_preemp_pretap),
        .tx_preemp_pretap_inv         ((tx_preemp_pretap_inv==1)? "TRUE" : "FALSE"),
        .tx_preemp_tap_1              (tx_preemp_tap_1),
        .tx_preemp_tap_2              (tx_preemp_tap_2),
        .tx_preemp_tap_2_inv          ((tx_preemp_tap_2_inv==1)? "TRUE" : "FALSE"),
        .tx_vod_selection             (tx_vod_selection),
        .rx_eq_dc_gain                (rx_eq_dc_gain),
        .rx_eq_ctrl                   (rx_eq_ctrl),
        .rx_use_cruclk                ("FALSE"),
        .loopback_mode                ("SLB")
      ) alt_pma_0 (
        .clk                         (phy_mgmt_clk),
        .rst                         (phy_mgmt_clk_reset),
        .gx_pdn                      (alt_pma_controller_0_gx_pdn_data),
        .ch_mgmt_address             (sc_pma_ch_controller_address),
        .ch_mgmt_read                (sc_pma_ch_controller_read),
        .ch_mgmt_readdata            (sc_pma_ch_controller_readdata),
        .ch_mgmt_write               (sc_pma_ch_controller_write),
        .ch_mgmt_writedata           (phy_mgmt_writedata),
        .ch_mgmt_waitrequest         (sc_pma_ch_controller_waitrequest),
        .cal_blk_clk                 (phy_mgmt_clk),
        .cal_blk_pdn                 (alt_pma_controller_0_cal_blk_pdn_data),
        .pll_ref_clk                 (pll_ref_clk),
        .tx_out_clk                  (alt_pma_0_tx_out_clk_clk),
        .tx_parallel_data            (sxaui_0_tx_parallel_data_data),
        .tx_serial_data              (xaui_tx_serial_data),
        .tx_pma_ready                (tx_ready),
        .pll_pdn                     (alt_pma_controller_0_pll_pdn0_data),
        .pll_locked                  (pll_locked_data),
        .rx_is_lockedtodata          (alt_pma_0_rx_is_lockedtodata_data),
        .rx_is_lockedtoref           (),
        .rx_recovered_clk            (alt_pma_0_rx_recovered_clk_clk),
        .rx_serial_data              (xaui_rx_serial_data),
        .rx_parallel_data            (alt_pma_0_rx_parallel_data_data),
        .rx_cdr_ref_clk              (),
        .rx_pma_ready                (rx_pma_ready),
        .reconfig_clk                (phy_mgmt_clk),
        .reconfig_to_gxb             (reconfig_to_xcvr),
        .reconfig_from_gxb           (reconfig_from_xcvr),
        .rx_rst_digital              (rx_digitalreset), //optional user triggered rx_digitalreset
        .tx_rst_digital              (tx_digitalreset),  //optional user triggered tx_digitalreset
        //.tx_bitslip                  (28'b0),
        //.tx_coreclk                  (4'b0),
        //.rx_offset_cancellation_done (1'b1),
        //.rx_bitslip                  (4'b0),
        //.rx_parallel_data_read       (4'b0),
        //.rx_coreclk                  (4'b0),
        //.aeq_to_gxb                  (96'b0),
        //.aeq_from_gxb                (),
        .tx_digital_rst      (alt_pma_ch_controller_0_tx_digital_rst_data),
        .rx_digital_rst      (alt_pma_ch_controller_0_rx_digital_rst_data)
      );
    end
    // don't instantiate anything if the interface type is invalid
  endgenerate

  ///////////////////////////////////////////////////////////////////////
  // PMA Controller
  ///////////////////////////////////////////////////////////////////////
  generate 
    if (external_pma_ctrl_reconf == 0) begin
      alt_pma_controller_tgx #(
        .number_of_plls         (1),
        .sync_depth             (2),
        .tx_pll_reset_hold_time (20)
      ) alt_pma_controller_0 (
        .clk                  (phy_mgmt_clk),                          
        .rst                  (phy_mgmt_clk_reset),                        
        .pma_mgmt_address     (sc_pma_controller_address),   
        .pma_mgmt_read        (sc_pma_controller_read),   
        .pma_mgmt_readdata    (sc_pma_controller_readdata),   
        .pma_mgmt_write       (sc_pma_controller_write),   
        .pma_mgmt_writedata   (phy_mgmt_writedata),     
        .pma_mgmt_waitrequest (sc_pma_controller_waitrequest),   
        .cal_blk_clk          (phy_mgmt_clk),                    
        .cal_blk_pdn          (alt_pma_controller_0_cal_blk_pdn_data),
        .tx_pll_ready         (),                                     
        .gx_pdn               (alt_pma_controller_0_gx_pdn_data),     
        .pll_pdn              (alt_pma_controller_0_pll_pdn0_data),
        .pll_locked           (pll_locked_data)                  
      );
    end else begin
      assign alt_pma_controller_0_cal_blk_pdn_data = cal_blk_powerdown;
      assign alt_pma_controller_0_gx_pdn_data      = gxb_powerdown;
      assign alt_pma_controller_0_pll_pdn0_data    = pll_powerdown;
    end
  endgenerate


  ///////////////////////////////////////////////////////////////////////
  // HXAUI CSR
  ///////////////////////////////////////////////////////////////////////
// should be consistent across all device families and interface types
// -might need a generate statement for some of the connections that don't exist between hxaui/sxaui
  hxaui_csr hxaui_csr (
    .clk                      (phy_mgmt_clk),
    .reset                    (phy_mgmt_clk_reset),
    .address                  (sc_csr_address),
    .byteenable               (4'b1111),   // .byteenable (Tie byteenable to all 1s)
    .read                     (sc_csr_read),
    .readdata                 (sc_csr_readdata),
    .write                    (sc_csr_write),
    .writedata                (phy_mgmt_writedata),
    .rx_patterndetect         (rx_patterndetect_data),
    .rx_syncstatus            (rx_syncstatus_data),
    .rx_runningdisp           (rx_runningdisp_data),
    .rx_errdetect             (rx_errdetect_data),
    .rx_disperr               (rx_disperr_data),
    .rx_phase_comp_fifo_error (rx_phase_comp_fifo_error_data),
    .rx_rlv                   (rx_rlv_data),
    .rx_rmfifodatadeleted     (rx_rmfifodatadeleted_data),
    .rx_rmfifodatainserted    (rx_rmfifodatainserted_data),
    .rx_rmfifoempty           (rx_rmfifoempty_data),
    .rx_rmfifofull            (rx_rmfifofull_data),
    .tx_phase_comp_fifo_error (tx_phase_comp_fifo_error_data),
    .r_rx_invpolarity         (hxaui_csr_r_rx_invpolarity_data),
    .r_tx_invpolarity         (hxaui_csr_r_tx_invpolarity_data),
    .r_rx_digitalreset        (hxaui_csr_r_rx_digitalreset_data),
    .r_tx_digitalreset        (hxaui_csr_r_tx_digitalreset_data),
    .simulation_flag          (hxaui_csr_simulation_flag_data) // only for soft_xaui
  );


  ///////////////////////////////////////////////////////////////////////
  // HXAUI - Interface to alt4gxb megafunction block
  ///////////////////////////////////////////////////////////////////////
// need to add generate to pick between sxaui and hxaui
  generate
    if (interface_type == "Hard XAUI") begin
      (* ALTERA_ATTRIBUTE = {"-name SDC_STATEMENT \"set_false_path -from [get_registers *hxaui_0*hxaui_alt4gxb*hxaui_alt4gxb_alt4gxb_dksa_component*fifo*flow] -to [get_registers *xaui_phy*hxaui_csr*tx_phase_comp_fifo_error_c[*]]\" ;-name SDC_STATEMENT \"set_false_path -from [get_registers *hxaui_0*hxaui_alt4gxb*hxaui_alt4gxb_alt4gxb_dksa_component*] -to [get_registers *xaui_phy*hxaui_csr*rx*_c[*]]\" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*siv_xcvr_xaui*hxaui_csr*hxaui_csr_reset0q[*]}] -to  [get_registers {*xaui_phy*hxaui_0*hxaui_alt4gxb*hxaui_alt4gxb_alt4gxb_dksa_component|*digitalreset*}]\" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*siv_xcvr_xaui*alt_pma_ch_controller_0*rc*}] -to  [get_registers {*xaui_phy*hxaui_0*hxaui_alt4gxb*hxaui_alt4gxb_alt4gxb_dksa_component|*digitalreset*}]\""} *)
      hxaui #(
        .device_family                (device_family),
        .starting_channel_number      (starting_channel_number),
        .xaui_pll_type                (xaui_pll_type),
        .use_control_and_status_ports (use_control_and_status_ports),
        .external_pma_ctrl_reconf     (external_pma_ctrl_reconf),
        .tx_termination               (tx_termination),
        .rx_termination               (rx_termination),
        .tx_preemp_pretap             (tx_preemp_pretap),
        .tx_preemp_pretap_inv         (tx_preemp_pretap_inv),
        .tx_preemp_tap_1              (tx_preemp_tap_1),
        .tx_preemp_tap_2              (tx_preemp_tap_2),
        .tx_preemp_tap_2_inv          (tx_preemp_tap_2_inv),
        .tx_vod_selection             (tx_vod_selection),
        .rx_eq_dc_gain                (rx_eq_dc_gain),
        .rx_eq_ctrl                   (rx_eq_ctrl),
        .rx_common_mode               (rx_common_mode)
      ) hxaui_0 (
        .xgmii_tx_clk                 (xgmii_tx_clk),
        .xgmii_tx_dc                  (xgmii_tx_dc),
        .xgmii_rx_clk                 (xgmii_rx_clk),
        .xgmii_rx_dc                  (xgmii_rx_dc),
        .refclk                       (pll_ref_clk),
        .xaui_tx_serial               (xaui_tx_serial_data),
        .xaui_rx_serial               (xaui_rx_serial_data),
        .rx_analogreset               (rx_analogreset),                // use_cs_ports, input
        .rx_digitalreset              (alt_pma_ch_controller_0_rx_digital_rst_data),
        .tx_digitalreset              (alt_pma_ch_controller_0_tx_digital_rst_data),
        .rx_channelaligned            (rx_channelaligned),             // use_cs_ports, output
        .rx_invpolarity               (rx_invpolarity),                // use_cs_ports, input
        .rx_set_locktodata            (rx_set_locktodata),             // use_cs_ports, input
        .rx_set_locktoref             (rx_set_locktoref),              // use_cs_ports, input
        .rx_seriallpbken              (rx_seriallpbken),               // use_cs_ports, input
        .tx_invpolarity               (tx_invpolarity),                // use_cs_ports, input
        .rx_is_lockedtodata           (rx_is_lockedtodata_data),       // use_cs_ports, output  
        .rx_phase_comp_fifo_error     (rx_phase_comp_fifo_error_data), // use_cs_ports, output
        .rx_is_lockedtoref            (rx_is_lockedtoref_data),        // use_cs_ports, output
        .rx_rlv                       (rx_rlv_data),                   // use_cs_ports, output
        .rx_rmfifoempty               (rx_rmfifoempty_data),           // use_cs_ports, output
        .rx_rmfifofull                (rx_rmfifofull_data),            // use_cs_ports, output
        .tx_phase_comp_fifo_error     (tx_phase_comp_fifo_error_data), // use_cs_ports, output
        .rx_disperr                   (rx_disperr_data),               // use_cs_ports, output
        .rx_errdetect                 (rx_errdetect_data),             // use_cs_ports, output
        .rx_patterndetect             (rx_patterndetect_data),         // use_cs_ports, output
        .rx_rmfifodatadeleted         (rx_rmfifodatadeleted_data),     // use_cs_ports, output
        .rx_rmfifodatainserted        (rx_rmfifodatainserted_data),    // use_cs_ports, output
        .rx_runningdisp               (rx_runningdisp_data),           // use_cs_ports, output
        .rx_syncstatus                (rx_syncstatus_data),            // use_cs_ports, output
        .reconfig_clk                 (phy_mgmt_clk),
        .reconfig_togxb               (reconfig_to_xcvr),  // external_pma_ctrl_reconf
        .reconfig_fromgxb             (reconfig_from_xcvr[16:0]), // external_pma_ctrl_reconf
        .rx_recovered_clk            (alt_pma_0_rx_recovered_clk_clk),
        .cal_blk_clk                  (phy_mgmt_clk),
        .cal_blk_powerdown            (1'b0), // not used, should remove
        .gxb_powerdown                (1'b0), // not used, should remove
        .pll_powerdown                (1'b0), // not used, should remove
        .pll_locked                   (pll_locked_data),
        .r_cal_blk_powerdown          (alt_pma_controller_0_cal_blk_pdn_data),
        .r_gxb_powerdown              (alt_pma_controller_0_gx_pdn_data),
        .r_pll_powerdown              (alt_pma_controller_0_pll_pdn0_data),
        .r_rx_set_locktodata          (alt_pma_ch_controller_0_rx_set_locktodata_data),
        .r_rx_set_locktoref           (alt_pma_ch_controller_0_rx_set_locktoref_data),
        .r_rx_seriallpbken            (alt_pma_ch_controller_0_rx_seriallpbken_data),
        .r_rx_analogreset             (alt_pma_ch_controller_0_rx_analog_rst_data),
        .r_rx_digitalreset            (hxaui_csr_r_rx_digitalreset_data), 
        .r_tx_digitalreset            (hxaui_csr_r_tx_digitalreset_data),
        .r_rx_invpolarity             (hxaui_csr_r_rx_invpolarity_data),
        .r_tx_invpolarity             (hxaui_csr_r_tx_invpolarity_data)
      );
      assign sxaui_rst_done = 1'b1; // if using hard xaui, assign this to 1 to always be ready
    end else if (interface_type == "Soft XAUI") begin
  (* ALTERA_ATTRIBUTE = {" -name SDC_STATEMENT \"set_false_path -from [get_registers {*sxaui_0*alt_soft_xaui_pcs*xaui_rx*disp_err_delay[*]}] -to  [get_registers *xaui_phy*hxaui_csr*rx*_c[*]]\" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*sxaui_0*alt_soft_xaui_pcs*xaui_rx*pcs_rx_syncstatus[*]}] -to  [get_registers *xaui_phy*hxaui_csr*rx*_c[*]]\" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*sxaui_0*alt_soft_xaui_pcs*xaui_rx*channel_align_synchclk[*]}] -to  [get_registers *xaui_phy*hxaui_csr*rx*_c[*]]\" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*siv_xcvr_xaui*hxaui_csr*hxaui_csr_reset0q[1]}] -to  [get_registers *sxaui_0*alt_soft_xaui_pcs*tx_reset*] \" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*siv_xcvr_xaui*hxaui_csr*hxaui_csr_reset0q[1]}] -to  [get_registers *sxaui_0*alt_soft_xaui_pcs*rx_reset*]  \" ;-name SDC_STATEMENT \"set_false_path -from [get_registers {*sxaui_0*alt_soft_xaui_pcs*xaui_rx*rd_ptr_latched_del[*]}] -to  [get_registers *sxaui_0*alt_soft_xaui_pcs*xaui_rx*rd_ptr_wr[*]]\""} *)     
      sxaui #(
        .starting_channel_number      (starting_channel_number),
        .xaui_pll_type                (xaui_pll_type),
        .use_control_and_status_ports (use_control_and_status_ports)
      ) sxaui_0 (
        .xgmii_tx_clk       (xgmii_tx_clk),                      // xgmii_tx_clk.clk
        .xgmii_tx_dc        (xgmii_tx_dc),                       // xgmii_tx_dc.data
        .xgmii_rx_clk       (xgmii_rx_clk),                      // xgmii_rx_clk.clk
        .xgmii_rx_dc        (xgmii_rx_dc),                       // xgmii_rx_dc.data
        .refclk             (pll_ref_clk),                       // refclk.clk
        .mgmt_clk           (phy_mgmt_clk),                          // mgmt_clk.clk
        .tx_out_clk         (alt_pma_0_tx_out_clk_clk),          // tx_out_clk.clk
        .rx_recovered_clk   (alt_pma_0_rx_recovered_clk_clk),    // rx_recovered_clk.clk
        .tx_parallel_data   (sxaui_0_tx_parallel_data_data),     // tx_parallel_data.data
        .rx_parallel_data   (alt_pma_0_rx_parallel_data_data),   // rx_parallel_data.data
        .rx_is_lockedtodata (alt_pma_0_rx_is_lockedtodata_data), // rx_is_lockedtodata.data
        .rx_digitalreset    (alt_pma_ch_controller_0_rx_digital_rst_data[0] ),                   // rx_digitalreset from cahnnel controller in alt_pma
        .tx_digitalreset    (alt_pma_ch_controller_0_tx_digital_rst_data[0] ),                   // tx_digitalreset from cahnnel controller in alt_pma
        .pll_locked         (pll_locked_data),                   // pll_locked.data
        .rx_syncstatus      (rx_syncstatus_data),                // rx_syncstatus.data
        .rx_channelaligned  (rx_channelaligned),                 // rx_channelaligned.data
        .rx_disperr         (rx_disperr_data),                   // rx_disperr.data
        .rx_errdetect       (rx_errdetect_data),                 // rx_errdetect.data
        .r_rx_digitalreset  (hxaui_csr_r_rx_digitalreset_data),  // r_rx_digitalreset.data
        .r_tx_digitalreset  (hxaui_csr_r_tx_digitalreset_data),  // r_tx_digitalreset.data
        .pma_stat_rst_done  (sxaui_rst_done),                    // soft reset done
        .simulation_flag    (hxaui_csr_simulation_flag_data)     // simulation_flag.data
      );
      assign rx_patterndetect_data           = 8'b0; // not supported by soft PCS
      assign rx_runningdisp_data             = 8'b0; // not supported by soft PCS
      assign rx_phase_comp_fifo_error_data   = 4'b0; // not supported by soft PCS
      assign rx_rlv_data                     = 4'b0; // not supported by soft PCS
      assign rx_rmfifodatadeleted_data       = 8'b0; // not supported by soft PCS
      assign rx_rmfifodatainserted_data      = 8'b0; // not supported by soft PCS
      assign rx_rmfifoempty_data             = 4'b0; // not supported by soft PCS
      assign rx_rmfifofull_data              = 4'b0; // not supported by soft PCS
      assign tx_phase_comp_fifo_error_data   = 4'b0; // not supported by soft PCS
      assign hxaui_csr_r_rx_invpolarity_data = 4'b0; // not supported by soft PCS
      assign hxaui_csr_r_tx_invpolarity_data = 4'b0; // not supported by soft PCS
      assign rx_is_lockedtodata_data         = 4'b0; // not supported by soft PCS
      assign rx_is_lockedtoref_data          = 4'b0; // not supported by soft PCS
    end
    // don't instantiate anything if the interface type is invalid
  endgenerate

endmodule
