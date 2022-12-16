// ********************************************************************************
// DisplayPort Core test code RX utilities
//
// All rights reserved. Property of Bitec.
// Restricted rights to use, duplicate or disclose this code are
// granted through contract.
//
// (C) Copyright Bitec 2012
//    All rights reserved
//
// Author         : $Author: swbranch $ @ bitec-dsp.com
// Department     :
// Date           : $Date: 2013/08/11 $
// Revision       : $Revision: #1 $
// URL            : $URL: svn://10.8.0.1/share/svn/dp_sw/trunk/dp_demo/rx_utils.c $
//
// Description:
//
// ********************************************************************************

#include <stdio.h>
#include <string.h>
#include <io.h>
#include "btc_dprx_syslib.h"
#include "altera_avalon_fifo_regs.h"
#include "altera_avalon_fifo_util.h"
#include "sys/alt_irq.h"
#include "sys/alt_timestamp.h"
#include "config.h"

#define DEBUG_PRINT_ENABLED 0
#if DEBUG_PRINT_ENABLED
#define DGB_PRINTF printf
#else
#define DGB_PRINTF(format, args...) ((void)0)
#endif

#if BITEC_RX_GPUMODE

#if BITEC_EDID_800X600_AUDIO
// EDID with max resolution set to 800x600 with Audio support
// Change rx_800x600_audio_edid[0x68] and recalculate checksum to change sink number string
BYTE rx_800x600_audio_edid[256] =
{
  0x00,0xff,0xff,0xff,0xff,0xff,0xff,0x00,
  0x09,0x34,0x4e,0x40,0x4d,0x56,0x55,0x41,
  0x2d,0x15,0x01,0x04,0xa5,0x2f,0x1e,0x78,
  0xee,0xee,0x95,0xa3,0x54,0x4c,0x99,0x26,
  0x0f,0x50,0x54,0x05,0x80,0x00,0x01,0x00,
  0x01,0x00,0x01,0x00,0x01,0x01,0x01,0x01,
  0x01,0x01,0x01,0x01,0x01,0x01,0xa0,0x0f,
  0x20,0x00,0x31,0x58,0x1c,0x20,0x28,0x80,
  0x14,0x00,0x00,0x00,0x00,0x00,0x00,0x1e,
  0x00,0x00,0x00,0xff,0x00,0x30,0x30,0x30,
  0x30,0x30,0x30,0x30,0x30,0x30,0x30,0x30,
  0x30,0x30,0x00,0x00,0x00,0xfc,0x00,0x42,
  0x49,0x54,0x45,0x43,0x20,0x4d,0x53,0x54,
  0x30,0x0a,0x20,0x20,0x00,0x00,0x00,0xfd,
  0x00,0x38,0x4b,0x1e,0x53,0x08,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x01,0xd1,
  0x02,0x03,0x12,0x41,0x83,0x4f,0x00,0x00,
  0x29,0x0f,0x7f,0x07,0x15,0x06,0x55,0x3d,
  0x1f,0xc0,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x8c
};
#else
// Standard Bitec EDID
// Change rx_std_edid[0x6A] and recalculate checksum to change sink number string
BYTE rx_std_edid[]=
{
  0x00,0xff,0xff,0xff,0xff,0xff,0xff,0x00,
  0x0a,0x83,0x34,0x12,0x4c,0x34,0x32,0x30,
  0x28,0x16,0x01,0x04,0xb5,0x41,0x29,0x78,
  0x22,0x8f,0x95,0xad,0x4f,0x32,0xb2,0x25,
  0x0f,0x50,0x54,0xff,0xef,0x80,0x81,0x80,
  0xa9,0x40,0xd1,0x00,0xd1,0x40,0x71,0x4f,
  0x81,0x00,0xb3,0x00,0x01,0x01,0xe2,0x68,
  0x00,0xa0,0xa0,0x40,0x2e,0x60,0x30,0x20,
  0x36,0x00,0x81,0x90,0x21,0x00,0x00,0x1e,
  0x00,0x00,0x00,0xfe,0x00,0x42,0x49,0x54,
  0x45,0x43,0x0a,0x20,0x20,0x20,0x20,0x20,
  0x20,0x20,0x00,0x00,0x00,0xfc,0x00,0x42,
  0x54,0x43,0x20,0x44,0x50,0x20,0x53,0x49,
  0x4e,0x4b,0x31,0x0a,0x00,0x00,0x00,0xfd,
  0x00,0x31,0x56,0x1d,0x71,0x1c,0x00,0x0a,
  0x20,0x20,0x20,0x20,0x20,0x20,0x01,0xba,

  0x02,0x03,0x12,0x41,0x83,0x4f,0x00,0x00,
  0x29,0x0f,0x7f,0x07,0x15,0x06,0x55,0x3d,
  0x1f,0xc0,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x8c
};
#endif

void bitec_dprx_isr(void* context);
void bitec_edid_set_stream(BYTE port, BYTE offset, BYTE *edid);

//******************************************************
// Initialize the RX
//******************************************************
void bitec_dprx_init()
{
  BYTE data[256];
  unsigned int rx_link_rate, rx_lane_count, i;

  // Get the core capabilities (defined in QSYS and ported to system.h)
  rx_link_rate = BITEC_DP_0_AV_RX_CONTROL_BITEC_CFG_RX_MAX_LINK_RATE;
  rx_lane_count = BITEC_DP_0_AV_RX_CONTROL_BITEC_CFG_RX_MAX_LANE_COUNT;

  // Init the DPCD

  // Set the capabilities
  data[0]  = 0x12; // DPCP_ADDR_DPCD_REV
  data[1]  = rx_link_rate; // DPCP_ADDR_MAX_LINK_RATE
  data[2]  = 0x80 | rx_lane_count; // DPCP_ADDR_MAX_LANE_COUNT
  if(rx_link_rate == 0x14)
    data[2]  |= 0x40; // Set TPS3_SUPPORTED
  data[3]  = 0x01 | (BITEC_FAST_LT_SUPPORT << 6); // DPCP_ADDR_MAX_DOWNSPREAD
  data[4]  = 0x01; // DPCP_ADDR_NORP
  data[5]  = 0x01; // DPCP_ADDR_DOWNSTREAMPORT_PRESENT
  data[6]  = 0x01; // DPCP_ADDR_MAIN_LINK_CHANNEL_CODING
  data[7]  = 0x80; // DPCP_ADDR_DOWN_STREAM_PORT_COUNT or 0x81?
#if BITEC_RX_CAPAB_MST && BITEC_DP_0_AV_RX_CONTROL_BITEC_CFG_RX_SUPPORT_MST
  data[8]  = 0x00; // DPCP_ADDR_RECEIVE_PORT0_CAP_0
#else
  data[8]  = 0x02; // DPCP_ADDR_RECEIVE_PORT0_CAP_0
#endif
  data[9]  = 0x00; // DPCP_ADDR_RECEIVE_PORT0_CAP_1
  data[10] = 0x00; // DPCP_ADDR_RECEIVE_PORT1_CAP_0
  data[11] = 0x00; // DPCP_ADDR_RECEIVE_PORT1_CAP_1
  data[12] = 0x00; // DPCP_ADDR_I2C_SPEED
  data[13] = 0x00; // DPCP_ADDR_EDP_CONFIGURATION_CAP
  data[14] = 0x00; // DPCP_ADDR_TRAINING_AUX_RD_INTERVAL
  data[15] = 0x00; // DPCP_ADDR_ADAPTER_CAP
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_DPCD_REV,16,data);

  data[0]  = 0x00; // DPCP_ADDR_FAUX_CAP
#if BITEC_RX_CAPAB_MST && BITEC_DP_0_AV_RX_CONTROL_BITEC_CFG_RX_SUPPORT_MST
  data[1]  = 0x01; // DPCP_ADDR_MST_CAP
#else
  data[1]  = 0x00; // DPCP_ADDR_MST_CAP
#endif
  data[2]  = 0x00; // DPCP_ADDR_N_OF_AUDIO_ENDPOINTS or 0x01?
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_FAUX_CAP,3,data);

  // Set GUID (all zeros)
  memset(data,0x00,16);
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_GUID,16,data);

  // Set Link Configuration
  data[0]  = 0x06; // DPCP_ADDR_LINK_BW_SET
  data[1]  = 0x01; // DPCP_ADDR_LANE_COUNT_SET
  data[2]  = 0x00; // DPCP_ADDR_TRAINING_PATTERN_SET
  data[3]  = 0x00; // DPCP_ADDR_TRAINING_LANE0_SET
  data[4]  = 0x00; // DPCP_ADDR_TRAINING_LANE1_SET
  data[5]  = 0x00; // DPCP_ADDR_TRAINING_LANE2_SET
  data[6]  = 0x00; // DPCP_ADDR_TRAINING_LANE3_SET
  data[7]  = 0x00; // DPCP_ADDR_DOWNSPREAD_CTRL
  data[8]  = 0x01; // DPCP_ADDR_MAIN_LINK_CHANNEL_CODING_SET
  data[9]  = 0x00; // DPCP_ADDR_I2C_SPEED1
  data[10] = 0x00; // DPCP_ADDR_EDP_CONFIGURATION_SET
  data[11] = 0x00; // DPCP_ADDR_LINK_QUAL_LANE0_SET
  data[12] = 0x00; // DPCP_ADDR_LINK_QUAL_LANE1_SET
  data[13] = 0x00; // DPCP_ADDR_LINK_QUAL_LANE2_SET
  data[14] = 0x00; // DPCP_ADDR_LINK_QUAL_LANE3_SET
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_LINK_BW_SET,15,data);
  data[0]  = 0x00; // DPCP_ADDR_TRAINING_LANE0_1_SET2
  data[1]  = 0x00; // DPCP_ADDR_TRAINING_LANE2_3_SET2
  data[2]  = 0x00; // DPCP_ADDR_MSTM_CTRL
  data[3]  = 0x00; // DPCP_ADDR_AUDIO_DELAY0
  data[4]  = 0x00; // DPCP_ADDR_AUDIO_DELAY1
  data[5]  = 0x00; // DPCP_ADDR_AUDIO_DELAY2
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_TRAINING_LANE0_1_SET2,6,data);

  // Set payload allocate
  data[0]  = 0x00; // DPCP_ADDR_PAYLOAD_ALLOCATE_SET
  data[1]  = 0x00; // DPCP_ADDR_PAYLOAD_ALLOCATE_START_TSLOT
  data[2]  = 0x00; // DPCP_ADDR_PAYLOAD_ALLOCATE_TSLOT_COUNT
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_PAYLOAD_TABLE_UPDATE_STATUS,3,data);

  // Set Link Status
  data[0]  = 0x01; // DPCP_ADDR_SINK_COUNT
  data[1]  = 0x00; // DPCP_ADDR_DEVICE_SERVICE_IRQ_VECTOR
  data[2]  = 0x00; // DPCP_ADDR_LANE0_1_STATUS
  data[3]  = 0x00; // DPCP_ADDR_LANE2_3_STATUS
  data[4]  = 0x00; // DPCP_ADDR_LANE_ALIGN_STATUS_UPDATED
  data[5]  = 0x00; // DPCP_ADDR_SINK_STATUS
  data[6]  = 0x00; // DPCP_ADDR_ADJUST_REQUEST_LANE0_1
  data[7]  = 0x00; // DPCP_ADDR_ADJUST_REQUEST_LANE2_3
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_SINK_COUNT,8,data);

  // Set VC payload table
  data[0]  = 0x00;
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_PAYLOAD_TABLE_UPDATE_STATUS,1,data);
  memset(data,0x00,63);
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_VC_PAYLOAD_ID_SLOT_1,63,data);

  // Set Source-specific locations
  memset(data,0x00,16);
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_SOURCE_IEEE_OUI_0,16,data);

  // Set Sink-specific locations
  data[0]  = 0x00; // DPCP_ADDR_SINK_IEEE_OUI_0
  data[1]  = 0x1B; // DPCP_ADDR_SINK_IEEE_OUI_1
  data[2]  = 0xC5; // DPCP_ADDR_SINK_IEEE_OUI_2
  data[3]  = 'B'; // Device identification string
  data[4]  = 'I';
  data[5]  = 'T';
  data[6]  = 'E';
  data[7]  = 'C';
  data[8]  = 0x00;
  data[9]  = 0x12; // HW revision
  data[10] = 0x01; // SW major revision
  data[11] = 0x02; // SW minor revision
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_SINK_IEEE_OUI_0,12,data);

  // Set Branch-specific locations
  data[0]  = 0x00; // DPCP_ADDR_BRANCH_IEEE_OUI_0
  data[1]  = 0x00; // DPCP_ADDR_BRANCH_IEEE_OUI_0
  data[2]  = 0x00; // DPCP_ADDR_BRANCH_IEEE_OUI_0
  data[3]  = 0x00; // Device identification string
  data[4]  = 0x00;
  data[5]  = 0x00;
  data[6]  = 0x00;
  data[7]  = 0x00;
  data[8]  = 0x00;
  data[9]  = 0x00; // HW revision
  data[10] = 0x00; // SW major revision
  data[11] = 0x00; // SW minor revision
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_BRANCH_IEEE_OUI_0,12,data);

  // Set ESI
  data[0]  = 0x01; // DPCP_ADDR_SINK_COUNT_ESI
  data[1]  = 0x00; // DPCP_ADDR_DEVICE_SERVICE_IRQ_VECTOR_ESI0
  data[2]  = 0x00; // DPCP_ADDR_DEVICE_SERVICE_IRQ_VECTOR_ESI1
  data[3]  = 0x00; // DPCP_ADDR_LINK_SERVICE_IRQ_VECTOR_ESI0
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_SINK_COUNT_ESI,4,data);

  // Set various locations
  data[0]  = 0x01; // DPCP_ADDR_SET_POWER_STATE
  btc_dprx_dpcd_gpu_access(0,1,DPCP_ADDR_SET_POWER_STATE,1,data);

  // Init the EDID(s)
  for(i=0; i< BITEC_DP_0_AV_RX_CONTROL_BITEC_CFG_RX_MAX_NUM_OF_STREAMS; i++)
  {
#if BITEC_EDID_800X600_AUDIO
    bitec_edid_set_stream(i,0x68,rx_800x600_audio_edid);
    btc_dprx_edid_set(0,i,rx_800x600_audio_edid,sizeof(rx_800x600_audio_edid)/128);
#else
    bitec_edid_set_stream(i,0x6A,rx_std_edid);
    btc_dprx_edid_set(0,i,rx_std_edid,sizeof(rx_std_edid)/128);
#endif
  }

  // Register the interrupt handler
  alt_ic_isr_register(BITEC_DP_0_AV_RX_CONTROL_IRQ_INTERRUPT_CONTROLLER_ID,
                      BITEC_DP_0_AV_RX_CONTROL_IRQ,
                      bitec_dprx_isr,
                      NULL,
                      0x0);
}

//******************************************************
// RX IRQ service routine
//******************************************************
void bitec_dprx_isr(void* context)
{
  BYTE cmd,length,data[16];
  unsigned int address;

  // Use RX port 0
  if(btc_dprx_aux_get_request(0,&cmd,&address,&length,data))
    return; // No Source AUX Request?!

  btc_dprx_aux_handler(0,cmd,address,length,data);
}

//******************************************************
// Modify the EDID to get a different product name
// for each port number
//
// Input:   port    port number (0-7)
//          offset  offset of ASCII port number
//          edid    pntr. to edid to modify
//******************************************************
void bitec_edid_set_stream(BYTE port, BYTE offset, BYTE *edid)
{
  BYTE chksum = 0;
  int i;

  *(edid + offset) = 0x31 + port; // Set the product name

  // Recalculate block 0 checksum
  for(i = 0; i < 127; i++)
    chksum += edid[i];
  edid[127] = ~chksum + 1;
}

#endif // BITEC_RX_GPUMODE
