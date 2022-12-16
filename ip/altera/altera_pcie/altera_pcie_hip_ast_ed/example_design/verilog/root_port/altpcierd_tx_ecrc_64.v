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


// megafunction wizard: %CRC Compiler v10.1%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			altpcierd_tx_ecrc_64_altcrc
// ============================================================
// Generated by CRC Compiler 10.1 [Altera, IP Toolbench 1.3.0 Build 95]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2010 Altera Corporation
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


module altpcierd_tx_ecrc_64 (
	clk,
	data,
	datavalid,
	empty,
	endofpacket,
	reset_n,
	startofpacket,
	checksum,
	crcvalid);


	input		clk;
	input	[63:0]	data;
	input		datavalid;
	input	[2:0]	empty;
	input		endofpacket;
	input		reset_n;
	input		startofpacket;
	output	[31:0]	checksum;
	output		crcvalid;


	altpcierd_tx_ecrc_64_altcrc	altpcierd_tx_ecrc_64_altcrc_inst(
		.clk(clk),
		.data(data),
		.datavalid(datavalid),
		.empty(empty),
		.endofpacket(endofpacket),
		.reset_n(reset_n),
		.startofpacket(startofpacket),
		.checksum(checksum),
		.crcvalid(crcvalid));
endmodule

// =========================================================
// CRC Compiler Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, CRC Compiler Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="CRC Compiler"  version="10.1"  build="95"  iptb_version="1.3.0 Build 95"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION class="altera.ipbu.flowbase.netlist.model.MVCModel"  active_core="altpcierd_tx_ecrc_64_altcrc" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "p_wordsize" value="64"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_crccheck" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_inbuff" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_outbuff" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_lanes" value="8"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_fwdpipe" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_initvalue" value="0xFFFFFFFF"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_bckpipe" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_generator" value="1_0000_0100_1100_0001_0001_1101_1011_0111"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_lsb" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_symbol_lsb" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_true_output" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_reverse" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_start_offset" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_channels" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "g_optimize" value="speed"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "g_use_all_ones" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "g_datapath" value="64 bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "g_genname" value="CRC-32"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "g_negate_checksum" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_cbx_hdl_language" value="verilog"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="VERILOG"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="1"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "gb_enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "filename" value="altpcierd_tx_ecrc_64_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="altpcierd_tx_ecrc_64.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:     <NAMESPACE name = "settings">
// Retrieval info:      <PRIVATE name = "DEVICE" value="AUTO"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Stratix IV"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "quartus_settings">
// Retrieval info:      <PRIVATE name = "DEVICE" value="AUTO"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Stratix IV"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <PORTS/>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
// RELATED_FILES: altpcierd_tx_ecrc_64.v, altpcierd_tx_ecrc_64_altcrc.v;
// IPFS_FILES: altpcierd_tx_ecrc_64.vo;
// =========================================================
