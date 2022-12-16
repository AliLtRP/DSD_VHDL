# (C) 2001-2013 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


package provide altera_xcvr_10gkr_a10::interfaces 13.1

package require alt_xcvr::ip_tcl::ip_module
package require alt_xcvr::ip_tcl::messages

namespace eval ::altera_xcvr_10gkr_a10::interfaces:: {
  namespace import ::alt_xcvr::ip_tcl::ip_module::*
  namespace import ::alt_xcvr::ip_tcl::messages::*

  namespace export \
    declare_interfaces \
    elaborate

  variable interfaces

  set interfaces {\
    {NAME                         DIRECTION UI_DIRECTION  WIDTH_EXPR                ROLE                       TERMINATION                             TERMINATION_VALUE IFACE_NAME                 IFACE_TYPE        IFACE_DIRECTION  ELABORATION_CALLBACK                                                         }\
    {tx_serial_clk_10g            input     input         1                         clk                        NOVAL                                   NOVAL             tx_serial_clk_10g          hssi_serial_clock sink             NOVAL                                                                        }\
    {tx_serial_clk_1g             input     input         1                         clk                        "!SYNTH_GIGE"                           NOVAL             tx_serial_clk_1g           hssi_serial_clock sink             NOVAL                                                                        }\
    {rx_cdr_ref_clk_10g           input     input         1                         clk                        NOVAL                                   NOVAL             rx_cdr_ref_clk_10g         clock             sink             NOVAL                                                                        }\
    {rx_cdr_ref_clk_1g            input     input         1                         clk                        "!SYNTH_GIGE "                          NOVAL             rx_cdr_ref_clk_1g          clock             sink             NOVAL                                                                        }\
    {xgmii_tx_clk                 input     input         1                         clk                        NOVAL                                   NOVAL             xgmii_tx_clk               clock             sink             NOVAL                                                                        }\
    {xgmii_rx_clk                 input     input         1                         clk                        NOVAL                                   NOVAL             xgmii_rx_clk               clock             sink             NOVAL                                                                        }\
    {tx_pma_clkout                output    output        1                         clk                        "!OPTIONAL_TXPMA_CLK"                   NOVAL             tx_pma_clkout              clock             source           NOVAL                                                                        }\
    {rx_pma_clkout                output    output        1                         clk                        "!OPTIONAL_RXPMA_CLK"                   NOVAL             rx_pma_clkout              clock             source           NOVAL                                                                        }\
    {tx_clkout                    output    output        1                         clk                        "!OPTIONAL_TX_CLKOUT"                   NOVAL             tx_clkout                  clock             source           NOVAL                                                                        }\
    {rx_clkout                    output    output        1                         clk                        "!OPTIONAL_RX_CLKOUT"                   NOVAL             rx_clkout                  clock             source           NOVAL                                                                        }\
    {tx_pma_div_clkout            output    output        1                         clk                        "!OPTIONAL_TX_DIV33CLK"                 NOVAL             tx_pma_div_clkout          clock             source           NOVAL                                                                        }\
    {rx_pma_div_clkout            output    output        1                         clk                        "!OPTIONAL_RX_DIV33CLK"                 NOVAL             rx_pma_div_clkout          clock             source           NOVAL                                                                        }\
    \
    {tx_analogreset               input     input         1                         tx_analogreset             NOVAL                                   NOVAL             tx_analogreset             conduit           end              NOVAL                                                                        }\
    {tx_digitalreset              input     input         1                         tx_digitalreset            NOVAL                                   NOVAL             tx_digitalreset            conduit           end              NOVAL                                                                        }\
    {rx_analogreset               input     input         1                         rx_analogreset             NOVAL                                   NOVAL             rx_analogreset             conduit           end              NOVAL                                                                        }\
    {rx_digitalreset              input     input         1                         rx_digitalreset            NOVAL                                   NOVAL             rx_digitalreset            conduit           end              NOVAL                                                                        }\
    {usr_seq_reset                input     input         1                         usr_seq_reset              "!SYNTH_SEQ"                            NOVAL             usr_seq_reset              conduit           end              NOVAL                                                                        }\
    {rc_busy                      output    output        1                         rc_busy                    "SYNTH_SEQ"                             NOVAL             rc_busy                    conduit           end              NOVAL                                                                        }\
    {start_pcs_reconfig           input     input         1                         start_pcs_reconfig         "SYNTH_SEQ"                             NOVAL             start_pcs_reconfig         conduit           end              NOVAL                                                                        }\
    {mode_1g_10gbar               input     input         1                         export                     "SYNTH_SEQ || !SYNTH_GIGE"              NOVAL             mode_1g_10gbar             conduit           end              NOVAL                                                                        }\
    \
    {mgmt_clk                     input     input         1                         clk                        NOVAL                                   NOVAL             mgmt_clk                   clock             sink             NOVAL                                                                        }\
    {mgmt_clk_reset               input     input         1                         reset                      NOVAL                                   NOVAL             mgmt_clk_reset             reset             sink             ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    {mgmt_address                 input     input         11                        address                    NOVAL                                   NOVAL             phy_mgmt                   avalon            slave            ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    {mgmt_read                    input     input         1                         read                       NOVAL                                   NOVAL             phy_mgmt                   avalon            slave            ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    {mgmt_readdata                output    output        32                        readdata                   NOVAL                                   NOVAL             phy_mgmt                   avalon            slave            ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    {mgmt_waitrequest             output    output        1                         waitrequest                NOVAL                                   NOVAL             phy_mgmt                   avalon            slave            ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    {mgmt_write                   input     input         1                         write                      NOVAL                                   NOVAL             phy_mgmt                   avalon            slave            ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    {mgmt_writedata               input     input         32                        writedata                  NOVAL                                   NOVAL             phy_mgmt                   avalon            slave            ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock             }\
    \
    {gmii_tx_d                    input     input         8                         export                     "!SYNTH_GIGE"                           NOVAL             gmii_tx_d                  conduit           end              NOVAL                                                                        }\
    {gmii_rx_d                    output    output        8                         export                     "!SYNTH_GIGE"                           NOVAL             gmii_rx_d                  conduit           end              NOVAL                                                                        }\
    {gmii_tx_en                   input     input         1                         export                     "!SYNTH_GIGE"                           NOVAL             gmii_tx_en                 conduit           end              NOVAL                                                                        }\
    {gmii_tx_err                  input     input         1                         export                     "!SYNTH_GIGE"                           NOVAL             gmii_tx_err                conduit           end              NOVAL                                                                        }\
    {gmii_rx_err                  output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             gmii_rx_err                conduit           end              NOVAL                                                                        }\
    {gmii_rx_dv                   output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             gmii_rx_dv                 conduit           end              NOVAL                                                                        }\
    {mii_tx_clkena                output    output        1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_tx_clkena              conduit           end              NOVAL                                                                        }\
    {mii_tx_clkena_half_rate      output    output        1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_tx_clkena_half_rate    conduit           end              NOVAL                                                                        }\
    {mii_tx_d                     input     input         4                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_tx_d                   conduit           end              NOVAL                                                                        }\
    {mii_tx_en                    input     input         1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_tx_en                  conduit           end              NOVAL                                                                        }\
    {mii_tx_err                   input     input         1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_tx_err                 conduit           end              NOVAL                                                                        }\
    {mii_rx_clkena                output    output        1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_rx_clkena              conduit           end              NOVAL                                                                        }\
    {mii_rx_clkena_half_rate      output    output        1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_rx_clkena_half_rate    conduit           end              NOVAL                                                                        }\
    {mii_rx_d                     output    output        4                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_rx_d                   conduit           end              NOVAL                                                                        }\
    {mii_rx_dv                    output    output        1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_rx_en                  conduit           end              NOVAL                                                                        }\
    {mii_rx_err                   output    output        1                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_rx_err                 conduit           end              NOVAL                                                                        }\
    {mii_speed_sel                output    output        2                         export                     "!SYNTH_GIGE || !SYNTH_MII"             NOVAL             mii_speed_sel              conduit           end              NOVAL                                                                        }\
    \
    {led_an                       output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             led_an                     conduit           end              NOVAL                                                                        }\
    {led_char_err                 output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             led_char_err               conduit           end              NOVAL                                                                        }\
    {led_disp_err                 output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             led_disp_err               conduit           end              NOVAL                                                                        }\
    {led_link                     output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             led_link                   conduit           end              NOVAL                                                                        }\
    \
    {tx_pcfifo_error_1g           output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             tx_pcfifo_error_1g         conduit           end              NOVAL                                                                        }\
    {rx_pcfifo_error_1g           output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             rx_pcfifo_error_1g         conduit           end              NOVAL                                                                        }\
    {rx_syncstatus                output    output        1                         export                     "!SYNTH_GIGE"                           NOVAL             rx_syncstatus              conduit           end              NOVAL                                                                        }\
    {rx_clkslip                   input     input         1                         export                     "!SYNTH_GIGE"                           NOVAL             rx_clkslip                 conduit           end              NOVAL                                                                        }\
    \
    {xgmii_tx_dc                  input     input         72                        data                       NOVAL                                   NOVAL             xgmii_tx_dc                avalon_streaming  sink             ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock_xgmii_tx    }\
    {xgmii_rx_dc                  output    output        72                        data                       NOVAL                                   NOVAL             xgmii_rx_dc                avalon_streaming  source           ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock_xgmii_rx    }\
    {rx_is_lockedtodata           output    output        1                         export                     NOVAL                                   NOVAL             rx_is_lockedtodata         conduit           end              NOVAL                                                                        }\
    {tx_cal_busy                  output    output        1                         export                     NOVAL                                   NOVAL             tx_cal_busy                conduit           end              NOVAL                                                                        }\
    {rx_cal_busy                  output    output        1                         export                     NOVAL                                   NOVAL             rx_cal_busy                conduit           end              NOVAL                                                                        }\
    {rx_data_ready                output    output        1                         export                     NOVAL                                   NOVAL             rx_data_ready              conduit           end              NOVAL                                                                        }\
    {rx_block_lock                output    output        1                         export                     "!OPTIONAL_10G"                         NOVAL             rx_block_lock              conduit           end              NOVAL                                                                        }\
    {rx_hi_ber                    output    output        1                         export                     "!OPTIONAL_10G"                         NOVAL             rx_hi_ber                  conduit           end              NOVAL                                                                        }\
    {tx_serial_data               output    output        1                         export                     NOVAL                                   NOVAL             tx_serial_data             conduit           end              NOVAL                                                                        }\
    {rx_serial_data               input     input         1                         export                     NOVAL                                   NOVAL             rx_serial_data             conduit           end              NOVAL                                                                        }\
    {rx_latency_adj_10g           output    output        16                        data                       "!SYNTH_1588_10G"                       NOVAL             rx_latency_adj_10g         conduit           end              NOVAL                                                                        }\
    {tx_latency_adj_10g           output    output        16                        data                       "!SYNTH_1588_10G"                       NOVAL             tx_latency_adj_10g         conduit           end              NOVAL                                                                        }\
    {rx_latency_adj_1g            output    output        22                        data                       "!SYNTH_1588_1G"                        NOVAL             rx_latency_adj_1g          conduit           end              NOVAL                                                                        }\
    {tx_latency_adj_1g            output    output        22                        data                       "!SYNTH_1588_1G"                        NOVAL             tx_latency_adj_1g          conduit           end              NOVAL                                                                        }\
    {calc_clk_1g                  input     input         1                         clk                        "!SYNTH_GIGE || !SYNTH_1588_1G"         NOVAL             calc_clk_1g                clock             sink             NOVAL                                                                        }\
    \
    {lcl_rf                       input     input         1                         export                     NOVAL                                   NOVAL             lcl_rf                     conduit           end              NOVAL                                                                        }\
    \
    {en_lcl_rxeq                  output    output        1                         export                     NOVAL                                   NOVAL             en_lcl_rxeq                conduit           end              NOVAL                                                                        }\
    {rxeq_done                    input     input         1                         export                     NOVAL                                   NOVAL             rxeq_done                  conduit           end              NOVAL                                                                        }\
    \
    {dmi_mode_en                  input     input         1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_mode_en                conduit           end              NOVAL                                                                        }\
    {dmi_frame_lock               input     input         1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_frame_lock             conduit           end              NOVAL                                                                        }\
    {dmi_rmt_rx_ready             input     input         1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_rmt_rx_ready           conduit           end              NOVAL                                                                        }\
    {dmi_lcl_coefl                input     input         6                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_lcl_coefl              conduit           end              NOVAL                                                                        }\
    {dmi_lcl_coefh                input     input         2                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_lcl_coefh              conduit           end              NOVAL                                                                        }\
    {dmi_lcl_upd_new              input     input         1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_lcl_upd_new            conduit           end              NOVAL                                                                        }\
    {dmi_rx_trained               input     input         1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmi_rx_trained             conduit           end              NOVAL                                                                        }\
    \
    {dmo_frame_lock               output    output        1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmo_frame_lock             conduit           end              NOVAL                                                                        }\
    {dmo_rmt_rx_ready             output    output        1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmo_rmt_rx_ready           conduit           end              NOVAL                                                                        }\
    {dmo_lcl_coefl                output    output        6                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmo_lcl_coefl              conduit           end              NOVAL                                                                        }\
    {dmo_lcl_coefh                output    output        2                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmo_lcl_coefh              conduit           end              NOVAL                                                                        }\
    {dmo_lcl_upd_new              output    output        1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmo_lcl_upd_new            conduit           end              NOVAL                                                                        }\
    {dmo_rx_trained               output    output        1                         export                     "!OPTIONAL_DM || !SYNTH_LT"             NOVAL             dmo_rx_trained             conduit           end              NOVAL                                                                        }\
    \
    {upi_mode_en                  input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_mode_en                conduit           end              NOVAL                                                                        }\
    {upi_adj                      input     input         2                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_adj                    conduit           end              NOVAL                                                                        }\
    {upi_inc                      input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_inc                    conduit           end              NOVAL                                                                        }\
    {upi_dec                      input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_dec                    conduit           end              NOVAL                                                                        }\
    {upi_pre                      input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_pre                    conduit           end              NOVAL                                                                        }\
    {upi_init                     input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_init                   conduit           end              NOVAL                                                                        }\
    {upi_st_bert                  input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_st_bert                conduit           end              NOVAL                                                                        }\
    {upi_train_err                input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_train_err              conduit           end              NOVAL                                                                        }\
    {upi_lock_err                 input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_lock_err               conduit           end              NOVAL                                                                        }\
    {upi_rx_trained               input     input         1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upi_rx_trained             conduit           end              NOVAL                                                                        }\
    \
    {upo_enable                   output    output        1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_enable                 conduit           end              NOVAL                                                                        }\
    {upo_frame_lock               output    output        1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_frame_lock             conduit           end              NOVAL                                                                        }\
    {upo_cm_done                  output    output        1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_cm_done                conduit           end              NOVAL                                                                        }\
    {upo_bert_done                output    output        1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_bert_done              conduit           end              NOVAL                                                                        }\
    {upo_ber_cnt                  output    output        BERWIDTH                  export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_ber_cnt                conduit           end              NOVAL                                                                        }\
    {upo_ber_max                  output    output        1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_ber_max                conduit           end              NOVAL                                                                        }\
    {upo_coef_max                 output    output        1                         export                     "!OPTIONAL_UP || !SYNTH_LT"             NOVAL             upo_coef_max               conduit           end              NOVAL                                                                        }\
  }

}

proc ::altera_xcvr_10gkr_a10::interfaces::declare_interfaces {} {
  variable interfaces
  ip_declare_interfaces $interfaces
}

proc ::altera_xcvr_10gkr_a10::interfaces::elaborate {} {
  ip_elaborate_interfaces
}

proc ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock {PROP_IFACE_NAME} {
  ip_set "interface.${PROP_IFACE_NAME}.associated_clock" mgmt_clk
}

proc ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock_xgmii_tx {PROP_IFACE_NAME} {
  ip_set "interface.${PROP_IFACE_NAME}.associated_clock" xgmii_tx_clk
  set_interface_property ${PROP_IFACE_NAME} dataBitsPerSymbol 72
}

proc ::altera_xcvr_10gkr_a10::interfaces::elaborate_associated_clock_xgmii_rx {PROP_IFACE_NAME} {
  ip_set "interface.${PROP_IFACE_NAME}.associated_clock" xgmii_rx_clk
  set_interface_property ${PROP_IFACE_NAME} dataBitsPerSymbol 72
}

