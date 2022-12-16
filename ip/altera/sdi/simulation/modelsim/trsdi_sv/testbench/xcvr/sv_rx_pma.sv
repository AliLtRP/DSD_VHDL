// (C) 2001-2011 Altera Corporation. All rights reserved.
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


`timescale 1ps/1ps
module sv_rx_pma #(
  parameter bonded_lanes                  = 1,
  parameter bonding_master_ch_num         = "0",
  parameter bonding_master_only           = "-1",
  parameter reserved_ch                   = "-1",
  parameter pipe_mode                     = 0,   
  parameter mode                          = 8,
  parameter serial_loopback               = "lpbkp_dis",
  parameter sdclk_enable                  = "true",
  parameter deser_enable_bit_slip         = "false",
  parameter auto_negotiation              = "false",
  parameter cdr_reference_clock_frequency = "100 Mhz",
  parameter cdr_refclk_cnt                = 1,
  parameter cdr_refclk_sel                = 0,
  parameter cdr_reconfig                  = 0,
  parameter cdr_output_clock_frequency    = "2500 Mhz",
  parameter rxpll_pd_bw_ctrl              = 300,
  parameter sd_on                         = 16,
	parameter cal_clk_sel                   = "pm_aux_iqclk_cal_clk_sel_cal_clk"	//Valid values: pm_aux_iqclk_cal_clk_sel_cal_clk|pm_aux_iqclk_cal_clk_sel_iqclk0|pm_aux_iqclk_cal_clk_sel_iqclk1|pm_aux_iqclk_cal_clk_sel_iqclk2|pm_aux_iqclk_cal_clk_sel_iqclk3|pm_aux_iqclk_cal_clk_sel_iqclk4|pm_aux_iqclk_cal_clk_sel_iqclk5|pm_aux_iqclk_cal_clk_sel_iqclk6|pm_aux_iqclk_cal_clk_sel_iqclk7|pm_aux_iqclk_cal_clk_sel_iqclk8|pm_aux_iqclk_cal_clk_sel_iqclk9|pm_aux_iqclk_cal_clk_sel_iqclk10
) ( 
  input   [bonded_lanes    - 1: 0]   calclk,
  input   [bonded_lanes*11 - 1: 0]   refiqclk,

  // Resets
  input   [bonded_lanes - 1: 0]   rstn,
  input   [bonded_lanes - 1: 0]   crurstn,

  // BUF signals
  input   [bonded_lanes - 1: 0]   datain,
  input   [bonded_lanes - 1: 0]   seriallpbkin,
  input   [bonded_lanes - 1: 0]   seriallpbken,
  input   [bonded_lanes - 1: 0]   bslip,
  input   [bonded_lanes - 1: 0]   adaptcapture,
  input   [bonded_lanes - 1: 0]   adcestandby,
  input   [bonded_lanes - 1: 0]   hardoccalen,
  input   [bonded_lanes*5-1: 0]   eyemonitor,
  output  [bonded_lanes - 1: 0]   adaptdone,
  output  [bonded_lanes - 1: 0]   hardoccaldone,
  output  [bonded_lanes - 1: 0]   sd,

  // CDR signals
  input   [bonded_lanes*cdr_refclk_cnt-1:0] cdr_ref_clk,
  input   [bonded_lanes* 2-1:0]   pciesw,
  input   [bonded_lanes - 1: 0]   ltr,
  input   [bonded_lanes - 1: 0]   ltd,
  input   [bonded_lanes - 1: 0]   freqlock,
  input   [bonded_lanes - 1: 0]   earlyeios,
  output  [bonded_lanes - 1: 0]   clklow,
  output  [bonded_lanes - 1: 0]   fref,
  output  [bonded_lanes - 1: 0]   rx_is_lockedtodata,
  output  [bonded_lanes - 1: 0]   rx_is_lockedtoref,

  // DESER signals
  output  [bonded_lanes - 1: 0]   clkdivrx,
  output  [bonded_lanes*80-1:0]   dout,
  output  [bonded_lanes - 1: 0]   clk33pcs,

  // AVMM interface signals
  input   [bonded_lanes - 1: 0]   avmmrstn,         // one for each lane
  input   [bonded_lanes - 1: 0]   avmmclk,          // one for each lane
  input   [bonded_lanes - 1: 0]   avmmwrite,        // one for each lane
  input   [bonded_lanes - 1: 0]   avmmread,         // one for each lane
  input   [bonded_lanes*2-1: 0]   avmmbyteen,       // two for each lane
  input   [bonded_lanes*11-1:0]   avmmaddress,      // 11 for each lane
  input   [bonded_lanes*16-1:0]   avmmwritedata,    // 16 for each lane
  output  [bonded_lanes*16-1:0]   avmmreaddata_ser, // SER readdata
  output  [bonded_lanes*16-1:0]   avmmreaddata_buf, // BUF readdata
  output  [bonded_lanes*16-1:0]   avmmreaddata_cdr, // CDR readdata
  output  [bonded_lanes*16-1:0]   avmmreaddata_mux, // CDR MUX readdata
  output  [bonded_lanes - 1 :0]   blockselect_ser,  // SER blockselect
  output  [bonded_lanes - 1 :0]   blockselect_buf,  // BUF blockselect
  output  [bonded_lanes - 1 :0]   blockselect_cdr,  // CDR blockselect
  output  [bonded_lanes - 1 :0]   blockselect_mux,  // CDR MUX blockselect
  
  output  [bonded_lanes - 1 :0]   rdlpbkp,
  output  [bonded_lanes - 1 :0]   rdlpbkn
);

  import altera_xcvr_functions::*;

  genvar i;
 
  localparam [MAX_XCVR_CHANNELS-1:0] int_bonding_master_only_set = map_numerical_is_in_legal_set(bonded_lanes,bonding_master_only);
  localparam [MAX_XCVR_CHANNELS-1:0] int_reserved_ch_set = map_numerical_is_in_legal_set(bonded_lanes,reserved_ch);

  localparam cdr_refclk_cnt_fnl = (cdr_refclk_cnt > 11) ? 11 : cdr_refclk_cnt; 
  localparam [MAX_CHARS*8-1:0] refclk_sel_param = cdr_refclk_sel == 10  ? "ref_iqclk10" :
                                                  cdr_refclk_sel ==  9  ? "ref_iqclk9"  :
                                                  cdr_refclk_sel ==  8  ? "ref_iqclk8"  :
                                                  cdr_refclk_sel ==  7  ? "ref_iqclk7"  :
                                                  cdr_refclk_sel ==  6  ? "ref_iqclk6"  :
                                                  cdr_refclk_sel ==  5  ? "ref_iqclk5"  :
                                                  cdr_refclk_sel ==  4  ? "ref_iqclk4"  :
                                                  cdr_refclk_sel ==  3  ? "ref_iqclk3"  :
                                                  cdr_refclk_sel ==  2  ? "ref_iqclk2"  :
                                                  cdr_refclk_sel ==  1  ? "ref_iqclk1"  :
                                                                          "ref_iqclk0"  ;

  localparam cdr_reference_clock_frequency_fnl = get_value_at_index(cdr_refclk_sel, cdr_reference_clock_frequency);

  // Set "enabled_for_reconfig" from pll_reconfig parameter
  localparam  enabled_for_reconfig  = (cdr_reconfig == 0) ? "false" : "true";
  // Use fast simulation models when reconfig is not enabled
  localparam  sim_use_fast_model    = (enabled_for_reconfig == "false") ? "true" : "false";


  generate 
  for(i = 0; i < bonded_lanes; i = i + 1) 
  begin:rx_pmas
    localparam is_master_only = (((int_bonding_master_only_set >> i) & 1'b1) == 1) ? 1 : 0;
    localparam is_reserved    = (((int_reserved_ch_set >> i) & 1'b1) == 1) ? 1 : 0;

    if (is_master_only == 0 && is_reserved == 0)
    begin:rx_pma
      wire  wire_dataout_to_cdr;
      wire  wire_refclk_to_cdr;
      wire  wire_cdr_to_deser_clk;
      wire  wire_cdr_to_deser_clk_270;
      wire  wire_pciel;
      wire  wire_pciem;
      wire  wire_dodd;
      wire  wire_deven;
      wire  wire_clkdivrxrx;
      wire  nonuserfrompmaux;
      wire  [10:0]  int_refclks;  // internal refclks

      assign  int_refclks = { {(11-cdr_refclk_cnt_fnl){1'b0}} , cdr_ref_clk[i*cdr_refclk_cnt_fnl+:cdr_refclk_cnt_fnl]};
  
      stratixv_hssi_pma_aux #(
        .cal_clk_sel  (cal_clk_sel)
       ) rx_pma_aux (
        .calpdb       (1'b1                  ),
        .calclk       (calclk            [i] ),
        .testcntl     (/*unused*/            ),
        .refiqclk     (refiqclk [i* 11+: 11] ),
        .nonusertoio  (nonuserfrompmaux      ),
        .zrxtx50      (/*unused*/            )
      ); 

      stratixv_hssi_pma_rx_buf #(
        .serial_loopback  (serial_loopback  ),
        .sd_on            (sd_on            )
      ) rx_pma_buf (
        .datain           (datain                 [i] ),
        .rstn             (rstn                   [i] ),
        .lpbkp            (seriallpbkin           [i] ),
        .slpbk            (seriallpbken           [i] ),
        .dataout          (wire_dataout_to_cdr        ),
        .sd               (sd                     [i] ),
        .ck0sigdet        (wire_clkdivrxrx            ), // the signal detect clock is supplied by the deserializer
        .nonuserfrompmaux (nonuserfrompmaux           ),
        //
        .adaptcapture     (adaptcapture           [i] ),
        .adcestandby      (adcestandby            [i] ),
        .hardoccalen      (hardoccalen            [i] ),
        //
        .adaptdone        (adaptdone              [i] ),
        .hardoccaldone    (hardoccaldone          [i] ),
        .eyemonitor       (eyemonitor      [i* 5+: 5] ),

        .avmmrstn         (avmmrstn               [i] ),
        .avmmclk          (avmmclk                [i] ),
        .avmmwrite        (avmmwrite              [i] ),
        .avmmread         (avmmread               [i] ),
        .avmmbyteen       (avmmbyteen      [i* 2+: 2] ),
        .avmmaddress      (avmmaddress     [i*11+:11] ),
        .avmmwritedata    (avmmwritedata   [i*16+:16] ),
        .avmmreaddata     (avmmreaddata_buf[i*16+:16] ),
        .blockselect      (blockselect_buf        [i] ),

        .voplp            (/*unused*/),
        .vonlp            (/*unused*/),
        .rxqpipulldn      (/*unused*/),
        .rdlpbkp          (rdlpbkp                [i]),
        .lpbkn            (/*unused*/),
        .rxrefclk         (/*unused*/),
        .rdlpbkn          (rdlpbkn                [i])
        );

      stratixv_channel_pll #(
        .reference_clock_frequency(cdr_reference_clock_frequency_fnl),
        .pcie_freq_control        ((cdr_reference_clock_frequency_fnl=="125 MHz") ? "pcie_125mhz":"pcie_100mhz"),
        .output_clock_frequency   (cdr_output_clock_frequency   ),
        .powerdown                ("false"                      ),
        .rxpll_pd_bw_ctrl         (rxpll_pd_bw_ctrl             ),
        .enabled_for_reconfig     (enabled_for_reconfig         ),
        .sim_use_fast_model       (sim_use_fast_model           )
      ) rx_cdr (
        .crurstb      (crurstn                  [i] ),  //check the correct reset signal
        .ltr          (ltr                      [i] ),  // receive_pma -> m_locktorefout
        .rxp          (wire_dataout_to_cdr          ),
        .refclk       (wire_refclk_to_cdr           ),
        .ltd          (~ltd                     [i] ),  // active low
        .rstn         (rstn                     [i] ),  //check the correct reset signal
        .sd           (sd                       [i] ),  // check 
        .clk90bdes    (wire_cdr_to_deser_clk        ),
        .clk270bdes   (wire_cdr_to_deser_clk_270    ),
        .clkcdr       (/*unused*/                   ),
        .clklow       (clklow                   [i] ),
        .fref         (fref                     [i] ),
        .dodd         (wire_dodd                    ),
        .deven        (wire_deven                   ),
        .pfdmodelock  (rx_is_lockedtoref        [i] ),
        .rxplllock    (rx_is_lockedtodata       [i] ),
        .ppmlock      (freqlock                 [i] ),
        .earlyeios    (earlyeios                [i] ),

        .pciesw       (pciesw       [(i+1)*2-1:i*2] ),
        .pciel        (wire_pciel                   ),
        .pciem        (wire_pciem                   ),

        .avmmrstn     (avmmrstn                 [i] ),
        .avmmclk      (avmmclk                  [i] ),
        .avmmwrite    (avmmwrite                [i] ),
        .avmmread     (avmmread                 [i] ),
        .avmmbyteen   (avmmbyteen        [i* 2+: 2] ),
        .avmmaddress  (avmmaddress       [i*11+:11] ),
        .avmmwritedata(avmmwritedata     [i*16+:16] ),
        .avmmreaddata (avmmreaddata_cdr  [i*16+:16] ),
        .blockselect  (blockselect_cdr          [i] ),

        .vctrloverrange (/*unused*/),
        .clk270eye    (/*unused*/),
        .clk270beyerm (/*unused*/),
        .clk90eye     (/*unused*/),
        .clk90beyerm  (/*unused*/),
        .clkindeser   (/*unused*/),
        .deeye        (/*unused*/),
        .deeyerm      (/*unused*/),
        .doeye        (/*unused*/),
        .doeyerm      (/*unused*/),
        .extclk       (/*unused*/),
        .extfbctrla   (/*unused*/),
        .extfbctrlb   (/*unused*/),
        .gpblck2refb  (/*unused*/),
        .lpbkpreen    (/*unused*/),
        .occalen      (/*unused*/),
        .ck0pd        (/*unused*/),
        .ck180pd      (/*unused*/),
        .ck270pd      (/*unused*/),
        .ck90pd       (/*unused*/),
        .clk270bcdr   (/*unused*/),
        .clk90bcdr    (/*unused*/),
        .decdr        (/*unused*/),
        .docdr        (/*unused*/),
        .pdof         (/*unused*/),
        .rxlpbdp      (/*unused*/),
        .rxlpbp       (/*unused*/),
        .txpllhclk    (/*unused*/),
        .txrlpbk      (/*unused*/)
        );
      
      stratixv_hssi_pma_rx_deser #(
        .mode             (mode             ),
        .auto_negotiation (auto_negotiation ),
        .sdclk_enable     (sdclk_enable     ),
        .enable_bit_slip  (deser_enable_bit_slip)
      ) rx_pma_deser (
        .bslip          (bslip                    [i] ),
        .clk90b         (wire_cdr_to_deser_clk        ),
        .clk270b        (wire_cdr_to_deser_clk_270    ),
        .deven          (wire_deven                   ),
        .dodd           (wire_dodd                    ),
        .pfdmodelock    (rx_is_lockedtoref        [i] ),
        .pciesw         (pciesw              [i*2+:2] ),
        .rstn           (rstn                     [i] ),
        .clkdivrx       (clkdivrx                 [i] ),
        .clkdivrxrx     (wire_clkdivrxrx              ), // clock for signal detect
        .dout           (dout              [i*80+:80] ),
        .pciel          (wire_pciel                   ),
        .pciem          (wire_pciem                   ),

        .avmmrstn       (avmmrstn                 [i] ),
        .avmmclk        (avmmclk                  [i] ),
        .avmmwrite      (avmmwrite                [i] ),
        .avmmread       (avmmread                 [i] ),
        .avmmbyteen     (avmmbyteen          [i*2+:2] ),
        .avmmaddress    (avmmaddress       [i*11+:11] ),
        .avmmwritedata  (avmmwritedata     [i*16+:16] ),
        .avmmreaddata   (avmmreaddata_ser  [i*16+:16] ),
        .blockselect    (blockselect_ser          [i] ),

        .fref           (/*unused*/),
        .clklow         (/*unused*/),
        .clk33pcs       (clk33pcs                 [i] )
        );

        // REFCLK_SELECT_MUX  
        stratixv_hssi_pma_cdr_refclk_select_mux #(
          .refclk_select              (refclk_sel_param                 ),
          .reference_clock_frequency  (cdr_reference_clock_frequency_fnl)
        ) cdr_refclk_mux0 (
          // Inputs
          .refiqclk0      (int_refclks[ 0]),
          .refiqclk1      (int_refclks[ 1]),
          .refiqclk2      (int_refclks[ 2]),
          .refiqclk3      (int_refclks[ 3]),
          .refiqclk4      (int_refclks[ 4]),
          .refiqclk5      (int_refclks[ 5]),
          .refiqclk6      (int_refclks[ 6]),
          .refiqclk7      (int_refclks[ 7]),
          .refiqclk8      (int_refclks[ 8]),
          .refiqclk9      (int_refclks[ 9]),
          .refiqclk10     (int_refclks[10]),
      
          // Outputs
          .clkout         (wire_refclk_to_cdr           ),

          .avmmclk        (avmmclk                  [i] ),
          .avmmrstn       (avmmrstn                 [i] ),
          .avmmwrite      (avmmwrite                [i] ),
          .avmmread       (avmmread                 [i] ),
          .avmmbyteen     (avmmbyteen        [i* 2+: 2] ),
          .avmmaddress    (avmmaddress       [i*11+:11] ),
          .avmmwritedata  (avmmwritedata     [i*16+:16] ),
          .avmmreaddata   (avmmreaddata_mux  [i*16+:16] ),
          .blockselect    (blockselect_mux          [i] ),
          // Unused
          .calclk         (/*unused*/),
          .ffplloutbot    (/*unused*/),
          .ffpllouttop    (/*unused*/),
          .pldclk         (/*unused*/),
          .rxiqclk0       (/*unused*/),
          .rxiqclk1       (/*unused*/),
          .rxiqclk10      (/*unused*/),
          .rxiqclk2       (/*unused*/),
          .rxiqclk3       (/*unused*/),
          .rxiqclk4       (/*unused*/),
          .rxiqclk5       (/*unused*/),
          .rxiqclk6       (/*unused*/),
          .rxiqclk7       (/*unused*/),
          .rxiqclk8       (/*unused*/),
          .rxiqclk9       (/*unused*/)
        );
    end else begin:no_rx_pma
      assign  adaptdone               [i] = 1'b0;
      assign  hardoccaldone           [i] = 1'b0;
      assign  sd                      [i] = 1'b0;
      assign  clkdivrx                [i] = 1'b0;
      assign  dout             [i*80+:80] = 80'b0;
      assign  sd                      [i] = 1'b0;
      assign  clklow                  [i] = 1'b0;
      assign  fref                    [i] = 1'b0;
      assign  rx_is_lockedtodata      [i] = 1'b0;
      assign  rx_is_lockedtoref       [i] = 1'b0;
      assign  avmmreaddata_ser [i*16+:16] = 16'b0;
      assign  avmmreaddata_buf [i*16+:16] = 16'b0;
      assign  avmmreaddata_cdr [i*16+:16] = 16'b0;
      assign  avmmreaddata_mux [i*16+:16] = 16'b0;
      assign  blockselect_ser         [i] = 1'b0;
      assign  blockselect_buf         [i] = 1'b0;
      assign  blockselect_cdr         [i] = 1'b0;
      assign  blockselect_mux         [i] = 1'b0;
    end
  end
  endgenerate

endmodule 
