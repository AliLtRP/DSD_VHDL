// megafunction wizard: %RAM: 1-PORT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: lpm_ram_32.v
// Megafunction Name(s):
//          altsyncram
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 4.0 Build 184 12/18/2003 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2004 Altera Corporation
//Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
//support information,  device programming or simulation file,  and any other
//associated  documentation or information  provided by  Altera  or a partner
//under  Altera's   Megafunction   Partnership   Program  may  be  used  only
//to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
//other  use  of such  megafunction  design,  netlist,  support  information,
//device programming or simulation file,  or any other  related documentation
//or information  is prohibited  for  any  other purpose,  including, but not
//limited to  modification,  reverse engineering,  de-compiling, or use  with
//any other  silicon devices,  unless such use is  explicitly  licensed under
//a separate agreement with  Altera  or a megafunction partner.  Title to the
//intellectual property,  including patents,  copyrights,  trademarks,  trade
//secrets,  or maskworks,  embodied in any such megafunction design, netlist,
//support  information,  device programming or simulation file,  or any other
//related documentation or information provided by  Altera  or a megafunction
//partner, remains with Altera, the megafunction partner, or their respective
//licensors. No other licenses, including any licenses needed under any third
//party's intellectual property, are provided herein.


// synopsys translate_off
`timescale 1 ns / 1 ns
// synopsys translate_on
module lpm_ram_32 (
    address,
    clock,
    data,
    wren,
    q);

    input   [7:0]  address;
    input     clock;
    input   [31:0]  data;
    input     wren;
    output  [31:0]  q;

    wire [31:0] sub_wire0;
    wire [31:0] q = sub_wire0[31:0];

    altsyncram  altsyncram_component (
                .wren_a (wren),
                .clock0 (clock),
                .address_a (address),
                .data_a (data),
                .q_a (sub_wire0)
                // synopsys translate_off
,
                .wren_b (),
                .rden_b (),
                .data_b (),
                .address_b (),
                .clock1 (),
                .clocken0 (),
                .clocken1 (),
                .aclr0 (),
                .aclr1 (),
                .byteena_a (),
                .byteena_b (),
                .addressstall_a (),
                .addressstall_b (),
                .q_b ()
                // synopsys translate_on

);
    defparam
        altsyncram_component.intended_device_family = "Stratix",
        altsyncram_component.width_a = 32,
        altsyncram_component.widthad_a = 8,
        altsyncram_component.numwords_a = 256,
        altsyncram_component.operation_mode = "SINGLE_PORT",
        altsyncram_component.outdata_reg_a = "UNREGISTERED",
        altsyncram_component.indata_aclr_a = "NONE",
        altsyncram_component.wrcontrol_aclr_a = "NONE",
        altsyncram_component.address_aclr_a = "NONE",
        altsyncram_component.outdata_aclr_a = "NONE",
        altsyncram_component.width_byteena_a = 1,
        altsyncram_component.ram_block_type = "AUTO",
        altsyncram_component.lpm_type = "altsyncram";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: WidthData NUMERIC "32"
// Retrieval info: PRIVATE: WidthAddr NUMERIC "8"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: PRIVATE: SingleClock NUMERIC "1"
// Retrieval info: PRIVATE: UseDQRAM NUMERIC "1"
// Retrieval info: PRIVATE: RegData NUMERIC "1"
// Retrieval info: PRIVATE: RegAddr NUMERIC "1"
// Retrieval info: PRIVATE: RegOutput NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: AclrByte NUMERIC "0"
// Retrieval info: PRIVATE: AclrData NUMERIC "0"
// Retrieval info: PRIVATE: WRCONTROL_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: AclrAddr NUMERIC "0"
// Retrieval info: PRIVATE: AclrOutput NUMERIC "0"
// Retrieval info: PRIVATE: Clken NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: UseLCs NUMERIC "0"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
// Retrieval info: PRIVATE: DataBusSeparated NUMERIC "1"
// Retrieval info: PRIVATE: MEGAFN_PORT_INFO_0 STRING "wren_a;wren_b;rden_b;data_a;data_b"
// Retrieval info: PRIVATE: MEGAFN_PORT_INFO_1 STRING "address_a;address_b;clock0;clock1;clocken0"
// Retrieval info: PRIVATE: MEGAFN_PORT_INFO_2 STRING "clocken1;aclr0;aclr1;byteena_a;byteena_b"
// Retrieval info: PRIVATE: MEGAFN_PORT_INFO_3 STRING "addressstall_a;addressstall_b;q_a;q_b"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "32"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "8"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "256"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "SINGLE_PORT"
// Retrieval info: CONSTANT: OUTDATA_REG_A STRING "UNREGISTERED"
// Retrieval info: CONSTANT: INDATA_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: WRCONTROL_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: ADDRESS_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
// Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "AUTO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: USED_PORT: address 0 0 8 0 INPUT NODEFVAL address[7..0]
// Retrieval info: USED_PORT: q 0 0 32 0 OUTPUT NODEFVAL q[31..0]
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: USED_PORT: data 0 0 32 0 INPUT NODEFVAL data[31..0]
// Retrieval info: USED_PORT: wren 0 0 0 0 INPUT NODEFVAL wren
// Retrieval info: CONNECT: @address_a 0 0 8 0 address 0 0 8 0
// Retrieval info: CONNECT: q 0 0 32 0 @q_a 0 0 32 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @data_a 0 0 32 0 data 0 0 32 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 wren 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_32_wave*.jpg FALSE
